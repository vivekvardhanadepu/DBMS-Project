# 1. User data
CREATE TABLE user (
        user_id         VARCHAR(10),
        email_id        VARCHAR(40) NOT NULL,
        phone_no        BIGINT NOT NULL,
        firstname       VARCHAR(10) NOT NULL,
        middlename      VARCHAR(10),
        lastname        VARCHAR(10) NOT NULL,
        user_status     BINARY(1) NOT NULL,
        user_password   VARCHAR(30) NOT NULL,
        PRIMARY KEY(user_id));

# 2. Location
CREATE TABLE location(
        location_id     VARCHAR(10),
        flat_no         VARCHAR(15) NOT NULL,
        street          VARCHAR(20) NOT NULL,
        city            VARCHAR(20) NOT NULL,
        state           VARCHAR(20) NOT NULL,
        pincode         INT NOT NULL,
        PRIMARY KEY(location_id));

# 3. User Location
CREATE TABLE user_loc(
        user_id         VARCHAR(10),
        location_id     VARCHAR(10),
        PRIMARY KEY(user_id,location_id),
        FOREIGN KEY(user_id) REFERENCES user(user_id),
        FOREIGN KEY(location_id) REFERENCES location(location_id));

# 4. Restaurant
CREATE TABLE restaurant(
        restaurant_id   VARCHAR(10),
        restaurant_name VARCHAR(20) NOT NULL,
        rating          TINYINT,
        avg_price       SMALLINT NOT NULL,
        cuisine         VARCHAR(50) NOT NULL,
        PRIMARY KEY(restaurant_id));

# 5. Item
CREATE TABLE item(
        item_id         VARCHAR(10),
        restaurant_id   VARCHAR(10),
        item_name       VARCHAR(20) NOT NULL,
        price           SMALLINT NOT NULL,
        availability    BINARY NOT NULL,
        rating          TINYINT,
        PRIMARY KEY(item_id,restaurant_id),
        FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id));

# 6. Order
CREATE TABLE cart_order(
        order_id        VARCHAR(10),
        item_id         VARCHAR(10) NOT NULL,
        restaurant_id   VARCHAR(10) NOT NULL,
        quantity        TINYINT NOT NULL,
        half_or_full    BINARY NOT NULL,
        PRIMARY KEY(order_id,item_id),
        FOREIGN KEY(item_id) REFERENCES item(item_id),
        FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id));

# 7. Past Orders
CREATE TABLE past_orders(
        user_id         VARCHAR(10),
        order_id        VARCHAR(10),
        PRIMARY KEY(user_id,order_id),
        FOREIGN KEY(user_id) REFERENCES user(user_id),
        FOREIGN KEY(order_id) REFERENCES cart_order(order_id));

# 8. Cart
CREATE TABLE cart(
        cart_id         VARCHAR(10),
        location_id     VARCHAR(10),
        user_id         VARCHAR(10),
        delivery_time   TINYINT NOT NULL,
        delivery_status BINARY NOT NULL,
        PRIMARY KEY(cart_id),
        FOREIGN KEY(location_id) REFERENCES location(location_id),
        FOREIGN KEY(user_id) REFERENCES user(user_id));

# 9. Cart Total
CREATE TABLE total_price(
        cart_id         VARCHAR(10),
        price           SMALLINT NOT NULL,
        gst             SMALLINT NOT NULL,
        delivery_charge TINYINT NOT NULL,
        PRIMARY KEY(cart_id),
        FOREIGN KEY(cart_id) REFERENCES cart(cart_id));

# 10. FAQs
CREATE TABLE faq(
        faq_id          VARCHAR(10),
        question        VARCHAR(100) NOT NULL,
        ans             VARCHAR(100) NOT NULL,
        PRIMARY KEY(faq_id));