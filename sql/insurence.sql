DROP TABLE IF EXISTS offers CASCADE;
commit;

DROP TABLE IF EXISTS coupons CASCADE;
commit;

DROP TABLE IF EXISTS policy CASCADE;
commit;

DROP TABLE IF EXISTS quotes CASCADE;
commit;

DROP TABLE IF EXISTS claims CASCADE;
commit;

DROP TABLE IF EXISTS masterinfo CASCADE;
commit;

DROP TABLE IF EXISTS ref_city CASCADE;
commit;

DROP TABLE IF EXISTS ref_state CASCADE;
commit;

DROP TABLE IF EXISTS ref_country CASCADE;
commit;

DROP TABLE IF EXISTS user_info CASCADE;
commit;

CREATE TABLE user_info (
customer_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'customer id auto-increment', 
INDEX (customer_id),
customer_user_id VARCHAR(2000) NOT NULL COMMENT 'user id',
customer_name VARCHAR(60) NOT NULL COMMENT 'Customer Name',
customer_email VARCHAR(60) NOT NULL COMMENT 'customers email address',
customer_password VARCHAR(60) NOT NULL COMMENT 'customer password' ,
customer_dob DATE NOT NULL COMMENT 'DOB of the customer',
customer_isRemembered BOOLEAN NOT NULL COMMENT 'is Customer remembered or not',
customer_sessionkey VARCHAR(60) NOT NULL COMMENT 'session key',
customer_secans VARCHAR(20000) NOT NULL COMMENT 'secret answer to the question',
PRIMARY KEY (customer_id)
)engine=InnoDB; commit;

CREATE TABLE policy(
policy_number BIGINT NOT NULL AUTO_INCREMENT COMMENT 'policy number for the customer',
INDEX (policy_number),
cust_id MEDIUMINT NOT NULL COMMENT 'Foreign key reference to user_info->customer_id',
policy_period_from DATE NOT NULL COMMENT 'policy period from this date on',
policy_period_to DATE NOT NULL,
balance BIGINT NOT NULL COMMENT 'shows the remaining balance, 0 if paid in full',
FOREIGN KEY (cust_id) REFERENCES user_info (customer_id)  ON UPDATE CASCADE
ON DELETE CASCADE,
PRIMARY KEY (policy_number)
)engine = InnoDB; commit;


CREATE TABLE offers(
offer_id BIGINT NOT NULL AUTO_INCREMENT COMMENT 'id of the offer',
INDEX (offer_id),
offer_name VARCHAR(2000) NOT NULL COMMENT 'name of the offer',
offer_desc VARCHAR(20000) NOT NULL COMMENT 'describe the offer details',
exp_date DATE NOT NULL COMMENT 'when the offer is suppose to expire',
insert_date DATE NOT NULL COMMENT 'when the offer was inserted in the DB',
offer_image VARCHAR(2000) NOT NULL COMMENT 'link to the image saved for that offer',
PRIMARY KEY (offer_id)
)engine = InnoDB; commit;

CREATE TABLE coupons(
coupon_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'primary key for coupons',
INDEX (coupon_id),
coupon_desc VARCHAR(20000) NOT NULL COMMENT 'description of the coupon',
exp_date DATE NOT NULL COMMENT 'when the coupon is suppose to expire',
insert_date DATE NOT NULL COMMENT 'when the coupon was inserted in the DB',
coupon_image VARCHAR(2000) NOT NULL COMMENT 'link to the image for that coupon',
PRIMARY KEY (coupon_id)
)engine = InnoDB; commit;

CREATE TABLE quotes(
quotes_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'primary key for quotes', 
INDEX (quotes_id),
quotes_user_id MEDIUMINT NOT NULL COMMENT 'foreign key referenced to the user_info',
quotes_date DATE NOT NULL COMMENT 'date that the quote was generated on',
quotes_type VARCHAR(20) NOT NULL COMMENT 'type of the quote, car, house etc',
quotes_premium MEDIUMINT NOT NULL COMMENT 'monthly or yearly premium',
quotes_desc VARCHAR(20000) NOT NULL COMMENT 'details of the policy',
FOREIGN KEY (quotes_user_id) REFERENCES user_info (customer_id) ON UPDATE CASCADE
ON DELETE CASCADE,
PRIMARY KEY (quotes_id)
)engine = InnoDB; commit;

CREATE TABLE claims(
claims_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'primary key for the table',
INDEX (claims_id),
claims_user_id MEDIUMINT NOT NULL COMMENT 'foreign key reference to the user_info',
claims_DT DATETIME NOT NULL COMMENT 'date and time of the accident',
claims_location VARCHAR(2000) NOT NULL COMMENT 'location of the accident',
claims_police_response BOOLEAN NOT NULL COMMENT 'if police responded or not',
claims_desc VARCHAR(20000) NOT NULL COMMENT 'description of the accident',
claims_injury VARCHAR(20000) NOT NULL COMMENT 'description of the injuries',
claims_otherInfo VARCHAR(20000) NOT NULL COMMENT 'additional info about accident',
FOREIGN KEY (claims_user_id) REFERENCES user_info (customer_id)  ON UPDATE CASCADE
ON DELETE CASCADE,
PRIMARY KEY (claims_id)
)engine = InnoDB; commit;

CREATE TABLE ref_country(
country_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'id of the country',
INDEX(country_id),
country_name VARCHAR(2000) NOT NULL COMMENT 'the name of the country',
PRIMARY KEY (country_id)
)engine = InnoDB; commit;

CREATE TABLE ref_state(
state_id MEDIUMINT NOT NULL AUTO_INCREMENT COMMENT 'id of the state',
INDEX(state_id),
state_name VARCHAR(2000) NOT NULL COMMENT 'name of the state',
state_country_key MEDIUMINT NOT NULL COMMENT 'foreign key reference to country_id',
FOREIGN KEY (state_country_key) REFERENCES ref_country (country_id) ON UPDATE CASCADE
ON DELETE CASCADE,
PRIMARY KEY (state_id)
)engine = InnoDB; commit;

CREATE TABLE ref_city(
city_id BIGINT NOT NULL COMMENT 'zip code of the city',
INDEX(city_id),
city_name VARCHAR(2000) NOT NULL COMMENT 'name of the city',
city_state_key MEDIUMINT NOT NULL COMMENT 'foreign reference key to state_id',
FOREIGN KEY (city_state_key) REFERENCES ref_state (state_id) ON UPDATE CASCADE
ON DELETE CASCADE,
PRIMARY KEY(city_id)
)engine = InnoDB; commit;

CREATE TABLE masterinfo (
location_name VARCHAR(20) NOT NULL COMMENT 'name of Branch',
city_id_key BIGINT NOT NULL COMMENT 'foreign reference key to the city_id',
num INT NOT NULL COMMENT' phone number of Agent Location',
address VARCHAR(50) NOT NULL COMMENT ' address of location',
email VARCHAR(20) NOT NULL COMMENT 'email id of agent',
longitude MEDIUMINT NOT NULL COMMENT 'longitude of the location for maping',
latitude MEDIUMINT NOT NULL COMMENT 'latitude of the location for mapping',
FOREIGN KEY (city_id_key) REFERENCES ref_city (city_id) ON UPDATE CASCADE
ON DELETE CASCADE,
PRIMARY KEY ( location_name)
) engine=InnoDB; commit;