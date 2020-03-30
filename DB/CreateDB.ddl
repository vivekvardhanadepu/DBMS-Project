# 1. User data
CREATE TABLE user (
        username        VARCHAR(45),
        emailid         VARCHAR(45) NOT NULL,
        phone_no        VARCHAR(45) NOT NULL,
        firstname       VARCHAR(10) NOT NULL,
        lastname        VARCHAR(10) NOT NULL,
        user_status     BOOLEAN(1) NOT NULL,
        passwd   	VARCHAR(45) NOT NULL,
        PRIMARY KEY(username));

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
        username        VARCHAR(10),
        location_id     VARCHAR(10),
        PRIMARY KEY(username,location_id),
        FOREIGN KEY(username) REFERENCES user(username),
        FOREIGN KEY(location_id) REFERENCES location(location_id));

# 4. Restaurant
CREATE TABLE restaurant(
        restaurant_id   VARCHAR(10),
        restaurant_name VARCHAR(20) NOT NULL,
        rating          DOUBLE,
        avg_price       SMALLINT NOT NULL,
        cuisine         VARCHAR(50) NOT NULL,
        status		BOOLEAN NOT NULL,
        PRIMARY KEY(restaurant_id));

# 5. Item
CREATE TABLE item(
        item_id         VARCHAR(10),
        restaurant_id   VARCHAR(10),
        item_name       VARCHAR(20) NOT NULL,
        price           SMALLINT NOT NULL,
        availability    BOOLEAN NOT NULL,
        rating          DOUBLE,
        PRIMARY KEY(item_id,restaurant_id),
        FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id));

# 6. Order
CREATE TABLE cart_order(
        order_id        VARCHAR(10),
        item_id         VARCHAR(10) NOT NULL,
        restaurant_id   VARCHAR(10) NOT NULL,
        quantity        TINYINT NOT NULL,
        half_or_full    BOOLEAN NOT NULL,
        PRIMARY KEY(order_id),
        FOREIGN KEY(item_id) REFERENCES item(item_id),
        FOREIGN KEY(restaurant_id) REFERENCES restaurant(restaurant_id));

# 7. Past Orders
CREATE TABLE past_orders(
        username        VARCHAR(10),
        order_id        VARCHAR(10),
        rating		TINYINT,
        PRIMARY KEY(username,order_id),
        FOREIGN KEY(username) REFERENCES user(username),
        FOREIGN KEY(order_id) REFERENCES cart_order(order_id));

# 8. Cart
CREATE TABLE cart(
        cart_id         VARCHAR(10),
        location_id     VARCHAR(10),
        username        VARCHAR(10) NOT NULL,
        delivery_time   TINYINT NOT NULL,
        delivery_status BOOLEAN NOT NULL,
        PRIMARY KEY(cart_id),
        FOREIGN KEY(location_id) REFERENCES location(location_id),
        FOREIGN KEY(username) REFERENCES user(username));

# 9. Cart Total
CREATE TABLE total_price(
        cart_id         VARCHAR(10),
        price           SMALLINT NOT NULL,
        gst             DOUBLE NOT NULL,
        delivery_charge TINYINT NOT NULL,
        PRIMARY KEY(cart_id),
        FOREIGN KEY(cart_id) REFERENCES cart(cart_id));
        
# 10. Cart items
CREATE TABLE cart_has(
       cart_id 		VARCHAR(10),
       order_id 	VARCHAR(10),
       PRIMARY KEY(cart_id,order_id),
       FOREIGN KEY(order_id) REFERENCES cart_order(order_id),
       FOREIGN KEY(cart_id) REFERENCES cart(cart_id));

# 11. FAQs
CREATE TABLE faq(
        faq_id          VARCHAR(10),
        question        VARCHAR(100) NOT NULL,
        ans             VARCHAR(100) NOT NULL,
        PRIMARY KEY(faq_id));
