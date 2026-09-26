CREATE DATABASE IF NOT EXISTS food_delivery;
USE food_delivery;
CREATE TABLE users(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(120) NOT NULL,email VARCHAR(150) UNIQUE NOT NULL,password VARCHAR(255) NOT NULL,created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE restaurants(id INT AUTO_INCREMENT PRIMARY KEY,name VARCHAR(150) NOT NULL,cuisine VARCHAR(100),location VARCHAR(100));
CREATE TABLE menu_items(id INT AUTO_INCREMENT PRIMARY KEY,restaurant_id INT NOT NULL,name VARCHAR(150) NOT NULL,description TEXT,price DECIMAL(10,2) NOT NULL,FOREIGN KEY(restaurant_id) REFERENCES restaurants(id));
CREATE TABLE orders(id INT AUTO_INCREMENT PRIMARY KEY,user_id INT NOT NULL,item_id INT NOT NULL,quantity INT NOT NULL,total DECIMAL(10,2) NOT NULL,address TEXT NOT NULL,status VARCHAR(50) DEFAULT 'Preparing',created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,FOREIGN KEY(user_id) REFERENCES users(id),FOREIGN KEY(item_id) REFERENCES menu_items(id));
INSERT INTO restaurants(name,cuisine,location) VALUES('Spice Garden','Indian','Pune'),('Pizza Hub','Italian','Pune'),('Burger Point','Fast Food','Pune');
INSERT INTO menu_items(restaurant_id,name,description,price) VALUES
(1,'Paneer Butter Masala','Creamy paneer curry with spices',220),(1,'Veg Biryani','Aromatic vegetable biryani',180),
(2,'Margherita Pizza','Classic cheese and tomato pizza',250),(2,'Farmhouse Pizza','Veggie loaded pizza',320),
(3,'Classic Burger','Crispy veg burger with fries',160),(3,'Cheese Burger','Cheesy burger with fresh veggies',190);
