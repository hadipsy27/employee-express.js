SELECT
  e.id AS employee_id,
  e.nik,
  e.name,
  CASE WHEN e.is_active THEN 'true' ELSE 'false' END AS is_active,
  ep.gender,
  EXTRACT(YEAR FROM AGE(ep.date_of_birth)) || ' Years Old' AS age,
  ed."name" AS school_name,
  ed.level as level,
  COALESCE(
      (CASE WHEN ef.suami > 0 THEN ef.suami || ' Suami & ' ELSE '' END) ||
      (CASE WHEN ef.istri > 0 THEN ef.istri || ' Istri & ' ELSE '' END) ||
      (CASE WHEN ef.anak > 0 THEN ef.anak || ' Anak ' ELSE '' END) ||
      (CASE WHEN ef.anak_sambung > 0 THEN ef.anak_sambung || ' & Anak Sambung' ELSE '' END),
      '-'
  ) AS family_data
FROM employee e
LEFT JOIN employee_profile ep ON e.id = ep.employee_id
LEFT JOIN education ed ON e.id = ed.employee_id
LEFT JOIN (
  SELECT employee_id,
         COUNT(CASE WHEN relation_status = 'Suami' THEN 1 ELSE NULL END) AS suami,
         COUNT(CASE WHEN relation_status = 'Istri' THEN 1 ELSE NULL END) AS istri,
         COUNT(CASE WHEN relation_status = 'Anak' THEN 1 ELSE NULL END) AS anak,
         COUNT(CASE WHEN relation_status = 'Anak Sambung' THEN 1 ELSE NULL END) AS anak_sambung
  FROM employee_family
  WHERE employee_id IS NOT NULL
  GROUP BY employee_id
) ef ON e.id = ef.employee_id;