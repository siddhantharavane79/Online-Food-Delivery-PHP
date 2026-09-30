# Online Food Delivery System

A PHP and MySQL based web application for managing an online food ordering system. The application can be deployed on AWS EC2 with Amazon RDS as the database.

## Project Overview

The Online Food Delivery System allows users to browse food items, register/login, place orders, and manage their orders. An admin can manage food/menu and orders.

## Features

### User
- User registration
- User login/logout
- Browse food menu
- Place food orders
- View order details
- Track order status

### Admin
- Admin login
- Manage food items
- Manage menu
- View customer orders
- Update order status

## Technologies

| Technology | Purpose |
|---|---|
| PHP | Backend |
| MySQL | Database |
| HTML5 | Frontend |
| CSS3 | Styling |
| Bootstrap | Responsive UI |
| Apache | Web Server |
| AWS EC2 | Application Server |
| Amazon RDS | MySQL Database |

## Project Structure

```text
Online_Food_Delivery_PHP_MySQL/
├── index.php
├── db.php
├── login.php
├── register.php
├── logout.php
├── order.php
├── admin/
├── css/
├── images/
└── database/
    └── food_delivery.sql
```

## AWS Architecture

```text
                Internet
                   |
                   v
             AWS EC2 Instance
          Apache + PHP Application
                   |
                   | MySQL : 3306
                   v
             Amazon RDS
             MySQL Database
```

## AWS Requirements

- AWS Account
- EC2 Instance
- Amazon RDS MySQL
- Security Groups
- SSH key pair
- Apache
- PHP
- MySQL/MariaDB client

## EC2 Setup

Connect to your EC2 instance:

```bash
ssh -i "your-key.pem" ec2-user@YOUR_EC2_PUBLIC_IP
```

Update the system:

```bash
sudo dnf update -y
```

Install Apache, PHP and MySQL client:

```bash
sudo dnf install httpd php php-mysqli mariadb105 -y
```

Start Apache:

```bash
sudo systemctl enable httpd
sudo systemctl start httpd
```

Check Apache:

```bash
sudo systemctl status httpd
```

## Deploy Application

Copy the project to Apache document root:

```bash
sudo cp -r Online_Food_Delivery_PHP_MySQL/* /var/www/html/
```

Set permissions:

```bash
sudo chown -R apache:apache /var/www/html/
```

Restart Apache:

```bash
sudo systemctl restart httpd
```

## RDS Database Configuration

Create an Amazon RDS MySQL database.

Use a database name such as:

```text
food_delivery
```

Configure the RDS Security Group to allow MySQL traffic from the EC2 Security Group.

Do not open port 3306 to the entire internet unless required for a temporary test.

## Database Connection

Edit the database configuration file:

```bash
sudo nano /var/www/html/db.php
```

Configure:

```php
$host = "YOUR_RDS_ENDPOINT";
$user = "admin";
$pass = "YOUR_RDS_PASSWORD";
$db   = "food_delivery";
```

Save the file and restart Apache:

```bash
sudo systemctl restart httpd
```

## Import Database

Copy the SQL file to the EC2 server if required, then import it:

```bash
mysql -h YOUR_RDS_ENDPOINT -u admin -p food_delivery < /var/www/html/database/food_delivery.sql
```

Verify the database connection:

```bash
mysql -h YOUR_RDS_ENDPOINT -u admin -p
```

Then:

```sql
SHOW DATABASES;
USE food_delivery;
SHOW TABLES;
```

## Security Group

### EC2 Security Group

Allow:

| Type | Port | Source |
|---|---:|---|
| SSH | 22 | Your IP |
| HTTP | 80 | 0.0.0.0/0 |

### RDS Security Group

Allow:

| Type | Port | Source |
|---|---:|---|
| MySQL/Aurora | 3306 | EC2 Security Group |

Using the EC2 Security Group as the RDS source is preferred over opening MySQL to everyone.

## Run the Application

After deployment, open:

```text
http://YOUR_EC2_PUBLIC_IP/
```

Example:

```text
http://12.34.56.78/
```

## Troubleshooting

Check Apache:

```bash
sudo systemctl status httpd
```

Check Apache logs:

```bash
sudo tail -f /var/log/httpd/error_log
```

Check PHP version:

```bash
php -v
```

Check RDS connectivity:

```bash
nc -zv YOUR_RDS_ENDPOINT 3306
```

Check MySQL connection:

```bash
mysql -h YOUR_RDS_ENDPOINT -u admin -p
```

Check Apache port:

```bash
sudo ss -lntp | grep :80
```

## GitHub

Initialize Git:

```bash
git init
```

Add files:

```bash
git add .
```

Commit:

```bash
git commit -m "Add Online Food Delivery System"
```

Add GitHub repository:

```bash
git remote add origin YOUR_GITHUB_REPOSITORY_URL
```

Push:

```bash
git branch -M main
git push -u origin main
```

## Screenshots

Add project screenshots to the repository and update this section:

```text
screenshots/
├── home.png
├── login.png
├── menu.png
├── order.png
└── admin.png
```

Example Markdown:

```markdown
![Home Page](screenshots/home.png)
![Login Page](screenshots/login.png)
![Food Menu](screenshots/menu.png)
![Order Page](screenshots/order.png)
![Admin Panel](screenshots/admin.png)
```

## Important Security Notes

- Never upload passwords, private keys, `.pem` files, or AWS credentials to GitHub.
- Use environment variables or a secure configuration method for production credentials.
- Keep RDS private when possible.
- Restrict SSH access to your own IP address.
- Do not commit database passwords to the repository.

## Project Status

- PHP application ready for AWS deployment
- MySQL database support
- EC2 + Apache deployment
- Amazon RDS integration
- GitHub ready
