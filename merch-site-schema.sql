-- ADMINS
CREATE TABLE admins (
    admin_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT UNIQUE,
    role TEXT
);

-- MEMBERS
CREATE TABLE members (
    member_id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT UNIQUE,
    password_hash TEXT,
    created_at TIMESTAMP
);

-- PRODUCTS
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    name TEXT,
    description TEXT,
    price NUMERIC(10,2),
    image_url TEXT,
    active BOOLEAN
);

-- PRODUCT VARIANTS
CREATE TABLE product_variants (
    variant_id SERIAL PRIMARY KEY,
    product_id INTEGER,
    size VARCHAR(20),
    color VARCHAR(50),
    stock INTEGER,
    price NUMERIC(10,2),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- SHOPPING CARTS
CREATE TABLE shopping_carts (
    cart_id SERIAL PRIMARY KEY,
    member_id INTEGER,
    created_at TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- CART ITEMS
CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INTEGER,
    variant_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (cart_id) REFERENCES shopping_carts(cart_id),
    FOREIGN KEY (variant_id) REFERENCES product_variants(variant_id)
);

-- FAVORITES
CREATE TABLE favorites (
    favorite_id SERIAL PRIMARY KEY,
    member_id INTEGER,
    product_id INTEGER,
    created_at TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- NOTIFICATIONS
CREATE TABLE notifications (
    notification_id SERIAL PRIMARY KEY,
    member_id INTEGER,
    message TEXT,
    is_read BOOLEAN,
    created_at TIMESTAMP,
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- ORDERING PERIODS
CREATE TABLE ordering_periods (
    ordering_period_id SERIAL PRIMARY KEY,
    start_date TIMESTAMP,
    end_date TIMESTAMP,
    payment_deadline TIMESTAMP,
    active BOOLEAN
);

-- ORDERS
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    member_id INTEGER,
    order_date TIMESTAMP,
    status TEXT,
    total NUMERIC(10,2),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

-- ORDER ITEMS
CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    product_id INTEGER,
    quantity INTEGER,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- PAYMENTS
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INTEGER,
    payment_status TEXT,
    payment_date TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);