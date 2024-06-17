CREATE TABLE IF NOT EXISTS countries (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender CHAR(1),
    age INT NOT NULL,
    phone_number CHAR(10) NOT NULL,
    country_id INT NOT NULL,

    CONSTRAINT ck_gender
        CHECK ( gender IN ('M', 'F') ),

    CONSTRAINT ck_age
        CHECK ( age > 0 ),

    CONSTRAINT fk_customers_countries
        FOREIGN KEY (country_id)
        REFERENCES countries (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(250),
    recipe TEXT,
    price NUMERIC(10, 2) NOT NULL,

    CONSTRAINT ck_price
        CHECK ( price > 0 )
);

CREATE TABLE IF NOT EXISTS feedbacks (
    id SERIAL PRIMARY KEY,
    description VARCHAR(255),
    rate NUMERIC(4, 2),
    product_id INT NOT NULL,
    customer_id INT NOT NULL,

    CONSTRAINT ck_rate
        CHECK ( rate BETWEEN 0 AND 10),

    CONSTRAINT fk_feedback_products
        FOREIGN KEY (product_id)
        REFERENCES products(id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_feedback_customers
        FOREIGN KEY (customer_id)
        REFERENCES customers (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS distributors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(25) UNIQUE NOT NULL,
    address VARCHAR(30) NOT NULL,
    summary VARCHAR(200) NOT NULL,
    country_id INT NOT NULL,

    CONSTRAINT fk_distributors_countries
        FOREIGN KEY (country_id)
        REFERENCES countries (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30) NOT NULL,
    description VARCHAR(200),
    country_id INT NOT NULL,
    distributor_id INT NOT NULL,

    CONSTRAINT fk_ingredients_countries
        FOREIGN KEY (country_id)
        REFERENCES countries (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_ingredients_distributors
        FOREIGN KEY (distributor_id)
        REFERENCES distributors (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS products_ingredients (
    product_id INT NOT NULL,
    ingredient_id INT NOT NULL,

    CONSTRAINT fk_products_product_id
        FOREIGN KEY (product_id)
        REFERENCES products (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,

    CONSTRAINT fk_ingredients_ingredient_id
        FOREIGN KEY (ingredient_id)
        REFERENCES ingredients (id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);