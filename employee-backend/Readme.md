## How to Install and Run the Service

Follow these steps to set up and run the service on your local machine:

### 1. Start Docker Service
Ensure you have Docker installed on your machine. Start the required Docker services by running:
```sh
docker compose up --build -d
```

### 2. Install Dependencies
Open your terminal and navigate to the project directory. Then, run the following command to install all necessary dependencies:
```sh
npm install
```

### 3. Run seeder
Finally, start the seeder by executing:
```sh
npx sequelize-cli db:seed:all
```