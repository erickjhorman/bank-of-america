

INSERT INTO countries (id_country, country_name,created_at,updated_at) values (1,'Spain', '2022-05-01','2022-05-01');
INSERT INTO countries (id_country, country_name,created_at,updated_at) values (2,'Germany', '2022-05-01','2022-05-01');
INSERT INTO countries (id_country, country_name,created_at,updated_at) values (3,'France', '2022-05-01','2022-05-01');


INSERT INTO cities (id_city, country_id,city_name) VALUES (1, 1, 'Madrid');
INSERT INTO cities (id_city, country_id,city_name) VALUES (2, 2, 'Munich');
INSERT INTO cities (id_city, country_id,city_name) VALUES (3, 3, 'Paris');

INSERT INTO users (id_user, city_id,id,name,photo,created_at,updated_at) VALUES (1,1,'12121212','Javier Thompson',
'amazon s3 path','2022-05-01','2022-05-01');

INSERT INTO users (id_user, city_id,id,name,photo,created_at,updated_at) VALUES (2,2,'12121212','Jhon Thompson',
'amazon s3 path','2022-05-01','2022-05-01');

INSERT INTO users (id_user, city_id,id,name,photo,created_at,updated_at) VALUES (3,3,'12121212','Jhon Thompson',
'amazon s3 path','2022-05-01','2022-05-01');

INSERT INTO c_type_account (id_type_account,type_account,created_at,updated_at) VALUES (1, 'saving','2022-05-01','2022-05-01');
INSERT INTO c_type_account (id_type_account,type_account,created_at,updated_at) VALUES (2, 'saving','2022-05-01','2022-05-01');

INSERT INTO branch_office (id_branch_office,city_id,branch_office,created_at,updated_at) VALUES (1,1,'La sabana','2022-05-01','2022-05-01')

INSERT INTO office (id_office,branch_office_id,office_name,created_at,updated_at) VALUES
(1,1,'Portoalegre','2022-05-01','2022-05-01');

INSERT INTO currency (id_currency,currency_name,created_at,updated_at) VALUES (1,'USD','2022-05-01','2022-05-01');
INSERT INTO currency (id_currency,currency_name,created_at,updated_at) VALUES (2,'EURO','2022-05-01','2022-05-01');

INSERT INTO services (id_service,service_name,created_at,updated_at) VALUES (1,'Account','2022-05-01','2022-05-01');

INSERT INTO products (id_product,user_id,service_id,created_at,updated_at)  VALUES (1,2,1,'2022-05-01','2022-05-01');
INSERT INTO products (id_product,user_id,service_id,created_at,updated_at)  VALUES (2,2,1,'2022-05-01','2022-05-01');

INSERT INTO accounts (id_account,c_type_account_id, office_id,currency_id,product_id, money,number_account,is_active,created_at,updated_at) VALUES(
1,1,1,2,1,500000,'1212121212',1,'2022-05-01','2022-05-01');

INSERT INTO accounts (id_account,c_type_account_id, office_id,currency_id,product_id, money,number_account,is_active,created_at,updated_at) VALUES(
2,1,1,2,2,500000,'4443434347',1,'2022-05-01','2022-05-01');

INSERT INTO state_transactions (id_state_transaction, state_transaction,created_at,updated_at)  VALUES (1,'SUCCEED','2022-05-01','2022-05-01');
INSERT INTO state_transactions (id_state_transaction, state_transaction,created_at,updated_at)  VALUES (2,'IN PROGRESS','2022-05-01','2022-05-01');
INSERT INTO state_transactions (id_state_transaction, state_transaction,created_at,updated_at)  VALUES (3,'REJECTED','2022-05-01','2022-05-01');
INSERT INTO state_transactions (id_state_transaction, state_transaction,created_at,updated_at)  VALUES (4,'FAILED','2022-05-01','2022-05-01');
INSERT INTO state_transactions (id_state_transaction, state_transaction,created_at,updated_at)  VALUES (5,'ERROR','2022-05-01','2022-05-01');

INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (1,'deposit','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (2,'cash withdrawal','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (3,'online payment','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (4,'debit card charge','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (5,'credit card charge','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (6,'loan payment','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (7,'Cheque','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (8,'PoS terminal','2022-05-01','2022-05-01');
INSERT INTO c_type_transactions (idc_type_transactions,c_type_transaction_name,created_at,updated_at) VALUES (9,'ware transfer','2022-05-01','2022-05-01');


INSERT INTO transactions (id_transaction,c_type_transaction_id,is_external_transaction,created_at,updated_at) VALUES (1,9,0,'2022-05-01','2022-05-01');
INSERT INTO transactions (id_transaction,c_type_transaction_id,is_external_transaction,created_at,updated_at) VALUES (2,9,1,'2022-05-01','2022-05-01');

INSERT INTO locations (id_location,countries_id,location_name,created_at,updated_at) VALUES (1,1,'Centro comercial madrid','2022-05-01','2022-05-01'); 

INSERT INTO ware_transfers (id_ware_transfer,transactions_id,state_transactions_id,locations_id,origin_product_id,target_product_id,description,
amount,created_at,updated_at)  VALUES (1,1,2,1,1,2,'for testing',100.000,'2022-05-01','2022-05-01'); 


INSERT INTO ware_transfers_other_banks (id_ware_transfers_other_banks,transaction_id,state_transactions_id,location_id,origin_product_id,amount,name_product_target,description,target_product,created_at,updated_at) VALUES (
1,2,1,1,1,'32323232323','Maria de los Angeles','testing external transactions','24443434','2022-05-01','2022-05-01');



