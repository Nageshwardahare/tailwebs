Ruby Version: 3.0.0
Rails version: 7.1.4
System Dependencies
PostgreSQL database
Configuration
No additional configuration required
Run "bundle install"
Before database creation set up database configuration for username, password, host.
Database Creation
Run "rails db:create" to create the database
Database Initialization
Run "rails db:migrate" to initialize the database
Run "rails db:seed" to load seed data (includes a default teacher account)
Services
No additional services required
Deployment Instructions
No deployment instructions provided
Additional Information
This application uses PostgreSQL as the database
A default teacher account is created with the email "mailto:nagesh@gmail.com" and password "123456" when running rails db:seed
