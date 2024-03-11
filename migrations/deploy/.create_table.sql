BEGIN;

CREATE TABLE "user" (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email TEXT NOT NULL UNIQUE,
    firstname TEXT NOT NULL,
    lastname TEXT NOT NULL,
    password TEXT NOT NULL,
    telephone VARCHAR(10), 
    birthday_date DATE,
    isAdmin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE category (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE article (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    description TEXT NOT NULL,
    price int NOT NULL,
    category_id INT REFERENCES category(id),
    quantity INT,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE cart (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_value int NOT NULL,
    article_id INT REFERENCES article(id),
    user_id INT REFERENCES "user"(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE customer_order (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    payment TEXT NOT NULL UNIQUE,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE delivery_address (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    street TEXT NOT NULL,
    numero INT NOT NULL,
    city TEXT NOT NULL,
    zip_code INT NOT NULL,
    user_id INT REFERENCES "user"(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE order_address (
    id int GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    street TEXT NOT NULL,
    numero INT NOT NULL,
    city TEXT NOT NULL,
    zip_code INT NOT NULL,
    user_id INT REFERENCES "user"(id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE order_has_delivery_address (
    order_id int REFERENCES customer_order(id),
    address_id int REFERENCES delivery_address(id),
    PRIMARY KEY (order_id, address_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

CREATE TABLE order_has_order_address (
    order_id int REFERENCES customer_order(id),
    address_id int REFERENCES order_address(id),
    PRIMARY KEY (order_id, address_id),
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ
);

COMMIT;