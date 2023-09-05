CREATE DATABASE c2108g2 IF NOT EXISTS;
USE c2108g2;
CREATE TABLE categories(
	ID INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(150) NOT NULL DEFAULT '' UNIQUE,
	description VARCHAR(200) DEFAULT ''
);

INSERT INTO categories (name, description) VALUES
    ('Shop Drinks', 'Explore our refreshing beverage selection.'),
    ('Coffee & Tea', 'Savor the aroma of our premium coffee and tea.'),
    ('Seafood Delights', 'Dive into the ocean of flavors with our seafood options.'),
    ('Electronics Gadgets', 'Discover the latest in cutting-edge technology.'),
    ('Fashion Trends', 'Stay stylish with our fashionable clothing and accessories.'),
    ('Home Decor', 'Transform your living space with our decorative items.'),
    ('Books & Literature', 'Get lost in the world of books and literature.'),
    ('Outdoor Adventures', 'Embark on thrilling outdoor experiences.'),
    ('Health & Fitness', 'Achieve your fitness goals with our wellness products.'),
    ('Home Appliances', 'Make life easier with our range of home appliances.');
