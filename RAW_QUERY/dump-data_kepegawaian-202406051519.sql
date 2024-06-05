PGDMP                         |            data_kepegawaian     13.14 (Debian 13.14-1.pgdg120+2)    15.3 ,    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                        1262    16384    data_kepegawaian    DATABASE     {   CREATE DATABASE data_kepegawaian WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
     DROP DATABASE data_kepegawaian;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                postgres    false                       0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   postgres    false    4                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            �           1247    16966    enum_education_level    TYPE     �   CREATE TYPE public.enum_education_level AS ENUM (
    'Tk',
    'Sd',
    'Smp',
    'Sma',
    'Strata 1',
    'Strata 2',
    'Doktor',
    'Profesor'
);
 '   DROP TYPE public.enum_education_level;
       public          postgres    false    4            �           1247    17012 $   enum_employee_family_relation_status    TYPE     ~   CREATE TYPE public.enum_employee_family_relation_status AS ENUM (
    'Suami',
    'Istri',
    'Anak',
    'Anak Sambung'
);
 7   DROP TYPE public.enum_employee_family_relation_status;
       public          postgres    false    4            �           1247    17000    enum_employee_family_religion    TYPE     �   CREATE TYPE public.enum_employee_family_religion AS ENUM (
    'Islam',
    'Katolik',
    'Buda',
    'Protestan',
    'Konghucu'
);
 0   DROP TYPE public.enum_employee_family_religion;
       public          postgres    false    4            {           1247    16943    enum_employee_profile_gender    TYPE     ^   CREATE TYPE public.enum_employee_profile_gender AS ENUM (
    'Laki-laki',
    'perempuan'
);
 /   DROP TYPE public.enum_employee_profile_gender;
       public          postgres    false    4            �            1259    16985 	   education    TABLE       CREATE TABLE public.education (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255),
    level public.enum_education_level NOT NULL,
    description character varying(255) NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.education;
       public         heap    postgres    false    643    4            �            1259    16983    education_id_seq    SEQUENCE     �   CREATE SEQUENCE public.education_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.education_id_seq;
       public          postgres    false    4    205                       0    0    education_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.education_id_seq OWNED BY public.education.id;
          public          postgres    false    204            �            1259    16931    employee    TABLE     �  CREATE TABLE public.employee (
    id integer NOT NULL,
    nik character varying(255),
    name character varying(255),
    is_active boolean,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.employee;
       public         heap    postgres    false    4            �            1259    17023    employee_family    TABLE       CREATE TABLE public.employee_family (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    name character varying(255),
    identifier character varying(255),
    job character varying(255),
    place_of_birth character varying(255) NOT NULL,
    date_of_birth timestamp with time zone NOT NULL,
    religion public.enum_employee_family_religion,
    is_life boolean,
    is_divorced boolean,
    relation_status public.enum_employee_family_relation_status NOT NULL,
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 #   DROP TABLE public.employee_family;
       public         heap    postgres    false    651    4    654            �            1259    17021    employee_family_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_family_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.employee_family_id_seq;
       public          postgres    false    207    4                       0    0    employee_family_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.employee_family_id_seq OWNED BY public.employee_family.id;
          public          postgres    false    206            �            1259    16929    employee_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.employee_id_seq;
       public          postgres    false    4    201                       0    0    employee_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;
          public          postgres    false    200            �            1259    16949    employee_profile    TABLE     �  CREATE TABLE public.employee_profile (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    place_of_birth character varying(255) NOT NULL,
    date_of_birth timestamp with time zone NOT NULL,
    gender public.enum_employee_profile_gender NOT NULL,
    is_married boolean,
    prof_pict character varying(255),
    created_by character varying(255),
    updated_by character varying(255),
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 $   DROP TABLE public.employee_profile;
       public         heap    postgres    false    635    4            �            1259    16947    employee_profile_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employee_profile_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.employee_profile_id_seq;
       public          postgres    false    203    4                       0    0    employee_profile_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.employee_profile_id_seq OWNED BY public.employee_profile.id;
          public          postgres    false    202            `           2604    16988    education id    DEFAULT     l   ALTER TABLE ONLY public.education ALTER COLUMN id SET DEFAULT nextval('public.education_id_seq'::regclass);
 ;   ALTER TABLE public.education ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    205    204    205            ^           2604    16934    employee id    DEFAULT     j   ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);
 :   ALTER TABLE public.employee ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    200    201    201            a           2604    17026    employee_family id    DEFAULT     x   ALTER TABLE ONLY public.employee_family ALTER COLUMN id SET DEFAULT nextval('public.employee_family_id_seq'::regclass);
 A   ALTER TABLE public.employee_family ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    207    206    207            _           2604    16952    employee_profile id    DEFAULT     z   ALTER TABLE ONLY public.employee_profile ALTER COLUMN id SET DEFAULT nextval('public.employee_profile_id_seq'::regclass);
 B   ALTER TABLE public.employee_profile ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    202    203    203            �          0    16985 	   education 
   TABLE DATA                 public          postgres    false    205   ?6       �          0    16931    employee 
   TABLE DATA                 public          postgres    false    201   7       �          0    17023    employee_family 
   TABLE DATA                 public          postgres    false    207   �7       �          0    16949    employee_profile 
   TABLE DATA                 public          postgres    false    203   �8                  0    0    education_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.education_id_seq', 2, true);
          public          postgres    false    204                       0    0    employee_family_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.employee_family_id_seq', 3, true);
          public          postgres    false    206            	           0    0    employee_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.employee_id_seq', 8, true);
          public          postgres    false    200            
           0    0    employee_profile_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.employee_profile_id_seq', 2, true);
          public          postgres    false    202            k           2606    16993    education education_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.education DROP CONSTRAINT education_pkey;
       public            postgres    false    205            m           2606    17031 $   employee_family employee_family_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.employee_family DROP CONSTRAINT employee_family_pkey;
       public            postgres    false    207            c           2606    16941    employee employee_nik_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_nik_key UNIQUE (nik);
 C   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_nik_key;
       public            postgres    false    201            e           2606    16939    employee employee_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.employee DROP CONSTRAINT employee_pkey;
       public            postgres    false    201            g           2606    16959 1   employee_profile employee_profile_employee_id_key 
   CONSTRAINT     s   ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_employee_id_key UNIQUE (employee_id);
 [   ALTER TABLE ONLY public.employee_profile DROP CONSTRAINT employee_profile_employee_id_key;
       public            postgres    false    203            i           2606    16957 &   employee_profile employee_profile_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.employee_profile DROP CONSTRAINT employee_profile_pkey;
       public            postgres    false    203            o           2606    16994 $   education education_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.education
    ADD CONSTRAINT education_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.education DROP CONSTRAINT education_employee_id_fkey;
       public          postgres    false    201    205    2917            p           2606    17032 0   employee_family employee_family_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_family
    ADD CONSTRAINT employee_family_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.employee_family DROP CONSTRAINT employee_family_employee_id_fkey;
       public          postgres    false    207    201    2917            n           2606    16960 2   employee_profile employee_profile_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.employee_profile
    ADD CONSTRAINT employee_profile_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES public.employee(id) ON UPDATE CASCADE ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.employee_profile DROP CONSTRAINT employee_profile_employee_id_fkey;
       public          postgres    false    2917    203    201            �   �   x���1o�0�����(* 'MQS@4������&�3J��A�Хb@zҝ�n��,��GY�o8�ok�B7QQ0��U>w�.7�<b@���o6�M�vri��S ��ߐ��=�*e4+��zw�A���8���c2��s���g����e��G!�i��D��F6C6���QƁF�v�+����.�]s�u��%w?�$9\d�      �   �   x���v
Q���W((M��L�K�-�ɯLMUs�	uV�0�QP7447�4P���3�\�Ss�����T��������!)X���X1P�D��L��]&1%73�����������)�2��\�D8��|C�YN�)�
�9��y)�E��\\ ��Z�      �   �   x�őKO�0����D�6qޜ*�!�jZ8�m�J�v9Ρ�;)���F3��~ڢ��%)��i���k�Z�8ۡ�@^f��yE.�)��T��XR�V��~��(N�碻fc��=�Q�q.�"
1�� 䃮 \St�5F�|Jv(;>�FW�V���	 ���0gi~�������I��tѬ�6�UH������K|���F!�:�uV��,�lD����<�
�/?M�M)��9@=�<��      �   �   x���v
Q���W((M��L�K�-�ɯLM�/(�O��IUs�	uV�0�Q "u���Ģ�Du ����@�����H�� $㓘���$�����T�Ը����ҢT���t��Ĕ��<������������������	�T2��\�$��HG�ԃK��Js3�1%쑴Ĝb�Oh�.. ��jx     