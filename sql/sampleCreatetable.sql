DROP TABLE IF EXISTS customer CASCADE;
commit;

DROP TABLE IF EXISTS menu CASCADE;
commit;

DROP TABLE IF EXISTS pldesc CASCADE;
commit;

DROP TABLE IF EXISTS playlist CASCADE;
commit;

DROP TABLE IF EXISTS order_ CASCADE;
commit;

DROP TABLE IF EXISTS reservation CASCADE;
commit;

DROP TABLE IF EXISTS masterlist CASCADE;
commit;

DROP TABLE IF EXISTS reference CASCADE;
commit;

DROP TABLE IF EXISTS orderlog CASCADE;
commit;

DROP TABLE IF EXISTS masterinfo CASCADE;
commit;

DROP TABLE IF EXISTS ref_menu CASCADE;
commit;

DROP TABLE IF EXISTS recommended CASCADE;
commit;

DROP TABLE IF EXISTS event CASCADE;
commit;

CREATE TABLE event
(
event_id BIGINT NOT NULL AUTO_INCREMENT COMMENT 'primary key',
INDEX (event_id),
event_details VARCHAR(20000) NOT NULL COMMENT 'event details',
PRIMARY KEY (event_id)
)engine=InnoDB; commit;

CREATE TABLE offer
(
offer_id BIGINT NOT NULL AUTO_INCREMENT COMMENT 'primary key',
offer_details VARCHAR(20000) NOT NULL COMMENT 'offer details',
PRIMARY KEY (offer_id)
)engine=InnoDB; commit;
 
CREATE TABLE ref_menu
(
category_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'category id is auto-increment',
INDEX (category_id),
category_name VARCHAR(100) NOT NULL COMMENT 'category name',
PRIMARY KEY (category_id)
)engine=InnoDB; commit;




CREATE TABLE customer (
customer_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'customer id auto-increment', 
INDEX (customer_id), 
customer_email VARCHAR(60) NOT NULL COMMENT 'customers email address',
customer_password VARCHAR(60) NOT NULL COMMENT 'customer password' ,
customer_sessionkey VARCHAR(60) NOT NULL COMMENT 'session key',
customer_dob DATE NOT NULL COMMENT 'customers date of birth',
comm VARCHAR(200) COMMENT 'user comments like preferences and allergies',
PRIMARY KEY (customer_id)
)engine=InnoDB; commit;

CREATE TABLE menu (
menu_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'dish id auto increment',
INDEX (menu_id),
menu_itemname VARCHAR(100) NOT NULL COMMENT 'name of dish',
menu_price VARCHAR(10) NOT NULL COMMENT ' price of dish',
menu_des VARCHAR(1000) COMMENT 'dish description',
menu_category_id MEDIUMINT NOT NULL COMMENT 'category of dish',
menu_image BLOB COMMENT 'stores image for the dish',
FOREIGN KEY (menu_category_id) REFERENCES ref_menu (category_id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (menu_id)
)engine=InnoDB; commit;

CREATE TABLE recommended
(
menu_id MEDIUMINT NOT NULL COMMENT 'menu id foreign key',
INDEX (menu_id),
FOREIGN KEY (menu_id) REFERENCES menu (menu_id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (menu_id)
)engine=InnoDB; commit;

CREATE TABLE pldesc (
pldesc_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'id of favorite list auto increment',
INDEX (pldesc_id),
pldesc_name VARCHAR(10) NOT NULL COMMENT ' name of fav list',
pldesc_des VARCHAR(50) COMMENT ' description of favourite list',
pldesc_cus_id MEDIUMINT COMMENT 'customer id foreign key',
FOREIGN KEY (pldesc_cus_id) REFERENCES customer (customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (pldesc_id)
)engine=InnoDB; commit;

CREATE TABLE playlist (
playlist_pl_id MEDIUMINT NOT NULL,
playlist_cus_id MEDIUMINT NOT NULL,
playlist_menu_id MEDIUMINT NOT NULL,
INDEX (playlist_pl_id , playlist_cus_id, playlist_menu_id),
FOREIGN KEY (playlist_pl_id) REFERENCES pldesc (pldesc_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (playlist_cus_id) REFERENCES customer (customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (playlist_menu_id) REFERENCES menu (menu_id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (playlist_pl_id, playlist_cus_id, playlist_menu_id)
)engine=InnoDB; commit;

CREATE TABLE order_ (
order_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'order id auto increment',
INDEX (order_id),
order_cus_id MEDIUMINT NOT NULL ,
order_des VARCHAR(10000) NOT NULL COMMENT 'stores a list of dishes on order',
FOREIGN KEY (order_cus_id) REFERENCES customer (customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (order_id)
)engine=InnoDB; commit;

CREATE TABLE orderlog(
orderlog_order_id MEDIUMINT NOT NULL COMMENT 'order id foreign key',
INDEX (orderlog_order_id),
orderlog_cus_id MEDIUMINT NOT NULL COMMENT 'customer id foreign key',
orderlog_item_id MEDIUMINT NOT NULL COMMENT 'item id foreign key',
orderlog_quantity INT NOT NULL COMMENT 'quantity of each item',
FOREIGN KEY (orderlog_order_id) REFERENCES order_ (order_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (orderlog_cus_id) REFERENCES customer (customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
FOREIGN KEY (orderlog_item_id) REFERENCES menu (menu_id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (orderlog_order_id , orderlog_cus_id, orderlog_item_id)
)engine=InnoDB; commit;

CREATE TABLE reservation (
reservation_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT' reservation id auto increment',
INDEX (reservation_id),
reservation_cus_id MEDIUMINT NOT NULL,
reservation_details DATETIME NOT NULL COMMENT 'date and time for reservation',
reservation_number INT NOT NULL COMMENT 'number of people expected',
FOREIGN KEY (reservation_cus_id) REFERENCES customer (customer_id) ON UPDATE CASCADE ON DELETE CASCADE,
PRIMARY KEY (reservation_id)
)engine=InnoDB; commit;

CREATE TABLE masterinfo (
name VARCHAR(20) NOT NULL COMMENT 'name of ESTABLISHMENT',
num INT NOT NULL COMMENT' phone number of restaurant',
address VARCHAR(50) NOT NULL COMMENT ' address of restaurant',
email1 VARCHAR(20) NOT NULL COMMENT 'email id of restaurant',
email2 VARCHAR(20) COMMENT 'email id of manager',
PRIMARY KEY ( name)
) engine=InnoDB; commit;
