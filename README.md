# Fitness Platform Deployment Guide

## Introduction

This document provides a detailed description of the deployment process for the platform based on the GitHub repository.

## Prerequisites

Before starting the deployment, ensure that the following components are installed on the target server:

- **Node.js**: version 14 or higher
- **MySQL**: version 5.7 or higher
- **Git**: for cloning the repository from GitHub

## Deployment Steps

### 1. Clone the Repository

Once you have verified the availability of the required components, you need to clone the repository from GitHub. Navigate to any directory where you want to place the project and execute the following command:

```bash
git clone https://github.com/EDIKODESU/fitness-platform.git

### 2. Configure the MySQL Database
Next, you need to set up the database in MySQL. Create a new database and import the schema files included in the repository.

### 3. Configure the Server Environment
Create a .env file in the root directory of the server project and add the necessary environment variables: 

plaintext
Копировать код
DB_HOST=your_database_host
DB_USER=your_database_user
DB_PASSWORD=your_database_password
DB_NAME=your_database_name
PORT=your_server_port
JWT_SECRET=your_jwt_secret

example:
DB_HOST=localhost DB_PORT=3306
DB_USER=yourusername
DB_PASSWORD=yourpassword
DB_NAME=fitness_platform
JWT_SECRET=yourjwtsecret|

### 4. Install Dependencies
To install the necessary dependencies, execute the following commands in the frontend and backend directories:

bash
Копировать код
# In frontend directory
npm install
npm run build

# In backend directory
npm install

### 5. Start the Project
Finally, to start the project, ensure that the MySQL server is running. Then, execute the following commands:

bash
Копировать код
# In backend directory
npm run start:dev

# In frontend directory
npm run dev
Now, your fitness platform should be up and running, accessible from the specified server address.

Conclusion
Following these steps will help you deploy the fitness platform efficiently while maintaining high-security standards to protect user data and ensure reliable access. If you encounter any issues during the deployment process, refer to the project's documentation or seek support from the community.
