INSERT INTO user_info(customer_user_id,customer_name, customer_email, 
customer_password, customer_dob, customer_isRemembered, customer_sessionkey, customer_secans)
VALUES("kkamina", "kutta kamina", "kutta@kamina.com", "mainkutta123", 19891003, 
true, "kuttahaiyesala", "ahmedabad"); 

INSERT INTO user_info(customer_user_id,customer_name, customer_email, 
customer_password, customer_dob, customer_isRemembered, customer_sessionkey, customer_secans)
VALUES("sharami", "sala harami", "sala@harami.com", "mainharami123", 19900329, 
false, "haramihaiyesala", "junaghar"); 

INSERT INTO policy(cust_id, policy_period_from, policy_period_to, balance)
VALUES(1, 02022010, 02022011, 500); 

INSERT INTO policy(cust_id, policy_period_from, policy_period_to, balance)
VALUES(1, 11111111, 11111111, 200);

INSERT INTO policy(cust_id, policy_period_from, policy_period_to, balance)
VALUES(2, 03032010, 03032011, 0);

INSERT INTO ref_country(country_name)
VALUES("USA");

INSERT INTO ref_state(state_name, state_country_key)
VALUES("NJ", 1);

INSERT INTO ref_city(city_id, city_name, city_state_key)
VALUES(08901, "New Brunswick", 1);

INSERT INTO ref_city(city_id, city_name, city_state_key)
VALUES(07109, "Belleville", 1);

INSERT INTO masterinfo(location_name, city_id_key, num, address, email, longitude, latitude)
VALUES("belleville branch", 07109, 9737590666, "344B main st, belleville, NJ", "irfan@beyondwireless.com",
9393839494, 9438382929282);

INSERT INTO coupons(coupon_desc, exp_date, insert_date, coupon_image)
VALUES("Multi_car Discount", 20110610, 20110601, "c:/coupons/image");

INSERT INTO coupons(coupon_desc, exp_date, insert_date, coupon_image)
VALUES("Multi_car Discount", 20110712, 20110601, "c:/coupons/image/next");

INSERT INTO offers(offer_name, offer_desc, exp_date, insert_date, offer_image)
VALUES("15% Off", "summer sale for 15% auto insurance", 
20110610, 20110601, "c:/offers/images");

INSERT INTO quotes(quotes_user_id, quotes_date, quotes_type, quotes_premium, quotes_desc)
VALUES(1, 20110403, "car", 500, "Lexus ES330 62,000 Burgendy 4dr sedan");

INSERT INTO quotes(quotes_user_id, quotes_date, quotes_type, quotes_premium, quotes_desc)
VALUES(2, 20110607, "car", 500, "Nissan ALtima 140,000 black 4dr sedan");

INSERT INTO claims (claims_user_id, claims_DT, claims_location, claims_police_response, claims_desc,
claims_injury, claims_otherInfo)
VALUES(1, '20110603143000', "NJ", true, "nothing serious", "no injury", "Minor Bodily injury");

INSERT INTO claims (claims_user_id, claims_DT, claims_location, claims_police_response, claims_desc,
claims_injury, claims_otherInfo)
VALUES(2, '20100501143000', "PA", true, "serious car damage", "no serious injury", "Minor Bodily injury");