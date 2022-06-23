/*============================================================================*/
/* DBMS: PostgreSQL 11*/
/* Created on : 06/23/2022 1:50:18 PM                                           */
/*============================================================================*/


/*============================================================================*/
/*                                  TABLES                                    */
/*============================================================================*/
CREATE TABLE "accounts" ( 
  "id_account"              INTEGER NOT NULL,
  "c_type_account_id"       INTEGER NOT NULL,
  "office_id"               INTEGER NOT NULL,
  "currency_id"             INTEGER NOT NULL,
  "product_id"              INTEGER NOT NULL,
  "money"                   BIGINT NOT NULL,
  "number_account"          VARCHAR(45) NOT NULL,
  "is_active"               SMALLINT NOT NULL,
  "created_at"              TIMESTAMP NOT NULL,
  "updated_at"              TIMESTAMP NOT NULL,
CONSTRAINT "PK_accounts" PRIMARY KEY ("id_account")
) 
;

CREATE TABLE "branch_office" ( 
  "id_branch_office"       INTEGER NOT NULL,
  "city_id"                INTEGER NOT NULL,
  "branch_office"          VARCHAR(45) NOT NULL,
  "created_at"             TIMESTAMP NOT NULL,
  "updated_at"             TIMESTAMP NOT NULL,
CONSTRAINT "PK_branch_office" PRIMARY KEY ("id_branch_office")
) 
;

CREATE TABLE "cities" ( 
  "id_city"          INTEGER NOT NULL,
  "country_id"       INTEGER NOT NULL,
  "city_name"        VARCHAR(45) NOT NULL,
CONSTRAINT "PK_cities" PRIMARY KEY ("id_city")
) 
;

CREATE TABLE "countries" ( 
  "id_country"         INTEGER NOT NULL,
  "country_name"       VARCHAR(45) NOT NULL,
  "created_at"         TIMESTAMP NOT NULL,
  "updated_at"         TIMESTAMP NOT NULL,
CONSTRAINT "PK_countries" PRIMARY KEY ("id_country")
) 
;

CREATE TABLE "currency" ( 
  "id_currency"         INTEGER NOT NULL,
  "currency_name"       VARCHAR(45) NOT NULL,
  "created_at"          TIMESTAMP NOT NULL,
  "updated_at"          TIMESTAMP NOT NULL,
CONSTRAINT "PK_currency" PRIMARY KEY ("id_currency")
) 
;

CREATE TABLE "c_type_account" ( 
  "id_type_account"       INTEGER NOT NULL,
  "type_account"          VARCHAR(45) NOT NULL,
  "created_at"            TIMESTAMP NOT NULL,
  "updated_at"            TIMESTAMP NOT NULL,
CONSTRAINT "PK_c_type_account" PRIMARY KEY ("id_type_account")
) 
;

CREATE TABLE "c_type_transactions" ( 
  "idc_type_transactions"         INTEGER NOT NULL,
  "c_type_transaction_name"       VARCHAR(45) NOT NULL,
  "created_at"                    TIMESTAMP NOT NULL,
  "updated_at"                    TIMESTAMP NOT NULL,
CONSTRAINT "PK_c_type_transactions" PRIMARY KEY ("idc_type_transactions")
) 
;

CREATE TABLE "locations" ( 
  "id_location"         INTEGER NOT NULL,
  "countries_id"        INTEGER NOT NULL,
  "location_name"       VARCHAR(45) NOT NULL,
  "created_at"          TIMESTAMP NOT NULL,
  "updated_at"          TIMESTAMP NOT NULL,
CONSTRAINT "PK_locations" PRIMARY KEY ("id_location")
) 
;

CREATE TABLE "office" ( 
  "id_office"              INTEGER NOT NULL,
  "branch_office_id"       INTEGER NOT NULL,
  "office_name"            VARCHAR(45) NOT NULL,
  "created_at"             TIMESTAMP NOT NULL,
  "updated_at"             TIMESTAMP NOT NULL,
CONSTRAINT "PK_office" PRIMARY KEY ("id_office")
) 
;

CREATE TABLE "products" ( 
  "id_product"       INTEGER NOT NULL,
  "user_id"          INTEGER NOT NULL,
  "service_id"       INTEGER NOT NULL,
  "created_at"       TIMESTAMP NOT NULL,
  "updated_at"       TIMESTAMP NOT NULL,
CONSTRAINT "PK_products" PRIMARY KEY ("id_product")
) 
;

CREATE TABLE "services" ( 
  "id_service"         INTEGER NOT NULL,
  "service_name"       VARCHAR(45) NOT NULL,
  "created_at"         TIMESTAMP NOT NULL,
  "updated_at"         TIMESTAMP NOT NULL,
CONSTRAINT "PK_services" PRIMARY KEY ("id_service")
) 
;

CREATE TABLE "state_transactions" ( 
  "id_state_transaction"       INTEGER NOT NULL,
  "state_transaction"          VARCHAR(45) NOT NULL,
  "created_at"                 TIMESTAMP NOT NULL,
  "updated_at"                 TIMESTAMP NOT NULL,
CONSTRAINT "PK_state_transactions" PRIMARY KEY ("id_state_transaction")
) 
;

CREATE TABLE "transactions" ( 
  "id_transaction"                INTEGER NOT NULL,
  "c_type_transaction_id"         INTEGER NOT NULL,
  "is_external_transaction"       SMALLINT NOT NULL,
  "created_at"                    TIMESTAMP NOT NULL,
  "updated_at"                    TIMESTAMP NOT NULL,
CONSTRAINT "PK_transactions" PRIMARY KEY ("id_transaction")
) 
;

CREATE TABLE "users" ( 
  "id_user"          INTEGER NOT NULL,
  "city_id"          INTEGER,
  "id"               VARCHAR(45) NOT NULL,
  "name"             VARCHAR(45) NOT NULL,
  "photo"            VARCHAR(600) NOT NULL,
  "created_at"       TIMESTAMP NOT NULL,
  "updated_at"       TIMESTAMP NOT NULL,
CONSTRAINT "PK_users" PRIMARY KEY ("id_user")
) 
;

CREATE TABLE "ware_transfers" ( 
  "id_ware_transfer"            INTEGER NOT NULL,
  "transactions_id"             INTEGER NOT NULL,
  "state_transactions_id"       INTEGER NOT NULL,
  "locations_id"                INTEGER NOT NULL,
  "origin_product_id"           INTEGER NOT NULL,
  "target_product_id"           INTEGER NOT NULL,
  "description"                 VARCHAR(300) NOT NULL,
  "amount"                      BIGINT NOT NULL,
  "created_at"                  TIMESTAMP NOT NULL,
  "updated_at"                  TIMESTAMP NOT NULL,
CONSTRAINT "PK_ware_transfers" PRIMARY KEY ("id_ware_transfer")
) 
;

CREATE TABLE "ware_transfers_other_banks" ( 
  "id_ware_transfers_other_banks"       INTEGER NOT NULL,
  "transaction_id"                      INTEGER NOT NULL,
  "state_transactions_id"               INTEGER NOT NULL,
  "location_id"                         INTEGER NOT NULL,
  "origin_product_id"                   INTEGER NOT NULL,
  "amount"                              BIGINT NOT NULL,
  "name_product_target"                 VARCHAR(45) NOT NULL,
  "description"                         VARCHAR(300) NOT NULL,
  "target_product"                      VARCHAR(45) NOT NULL,
  "created_at"                          TIMESTAMP NOT NULL,
  "updated_at"                          TIMESTAMP NOT NULL,
CONSTRAINT "PK_ware_transfers_other_banks" PRIMARY KEY ("id_ware_transfers_other_banks")
) 
;

/*============================================================================*/
/*                                 INDEXES                                    */
/*============================================================================*/
CREATE  INDEX "fk_accounts_c_type_account1_idx" ON "accounts"("c_type_account_id" ASC)
;
CREATE  INDEX "fk_accounts_office1_idx" ON "accounts"("office_id" ASC)
;

CREATE  INDEX "fk_cities_countries1_idx" ON "cities"("country_id" ASC)
;

CREATE  INDEX "fk_locations_countries1_idx" ON "locations"("countries_id" ASC)
;

CREATE  INDEX "fk_office_branch_office1_idx" ON "office"("branch_office_id" ASC)
;

CREATE  INDEX "fk_user_products_users_idx" ON "products"("user_id" ASC)
;

CREATE  INDEX "fk_transactions_c_type_transactions1_idx" ON "transactions"("c_type_transaction_id" ASC)
;

CREATE  INDEX "fk_users_countries1_idx" ON "users"("city_id" ASC)
;

CREATE  INDEX "fk_users_transactions_transactions1_idx" ON "ware_transfers"("transactions_id" ASC)
;
CREATE  INDEX "fk_users_transactions_state_transactions1_idx" ON "ware_transfers"("state_transactions_id" ASC)
;
CREATE  INDEX "fk_users_transactions_locations1_idx" ON "ware_transfers"("locations_id" ASC)
;

/*============================================================================*/
/*                               FOREIGN KEYS                                 */
/*============================================================================*/
ALTER TABLE "accounts"
    ADD CONSTRAINT "fk_account_currency"
        FOREIGN KEY ("currency_id")
            REFERENCES "currency" ("id_currency")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "accounts"
    ADD CONSTRAINT "fk_account_product"
        FOREIGN KEY ("product_id")
            REFERENCES "products" ("id_product")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "accounts"
    ADD CONSTRAINT "fk_accounts_c_type_account1"
        FOREIGN KEY ("c_type_account_id")
            REFERENCES "c_type_account" ("id_type_account")
 ;
 
ALTER TABLE "accounts"
    ADD CONSTRAINT "fk_accounts_office1"
        FOREIGN KEY ("office_id")
            REFERENCES "office" ("id_office")
 ;
 
ALTER TABLE "branch_office"
    ADD CONSTRAINT "fk_branch_office_city"
        FOREIGN KEY ("city_id")
            REFERENCES "cities" ("id_city")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "cities"
    ADD CONSTRAINT "fk_cities_countries1"
        FOREIGN KEY ("country_id")
            REFERENCES "countries" ("id_country")
 ;
 
ALTER TABLE "locations"
    ADD CONSTRAINT "fk_locations_countries1"
        FOREIGN KEY ("countries_id")
            REFERENCES "countries" ("id_country")
 ;
 
ALTER TABLE "office"
    ADD CONSTRAINT "fk_office_branch_office1"
        FOREIGN KEY ("branch_office_id")
            REFERENCES "branch_office" ("id_branch_office")
 ;
 
ALTER TABLE "products"
    ADD CONSTRAINT "fk_user_products_products1"
        FOREIGN KEY ("service_id")
            REFERENCES "services" ("id_service")
 ;
 
ALTER TABLE "products"
    ADD CONSTRAINT "fk_user_products_users"
        FOREIGN KEY ("user_id")
            REFERENCES "users" ("id_user")
 ;
 
ALTER TABLE "transactions"
    ADD CONSTRAINT "fk_transactions_c_type_transactions1"
        FOREIGN KEY ("c_type_transaction_id")
            REFERENCES "c_type_transactions" ("idc_type_transactions")
 ;
 
ALTER TABLE "users"
    ADD CONSTRAINT "fk_users_city"
        FOREIGN KEY ("city_id")
            REFERENCES "cities" ("id_city")
 ;
 
ALTER TABLE "ware_transfers"
    ADD CONSTRAINT "fk_users_transactions_locations1"
        FOREIGN KEY ("locations_id")
            REFERENCES "locations" ("id_location")
 ;
 
ALTER TABLE "ware_transfers"
    ADD CONSTRAINT "fk_users_transactions_state_transactions1"
        FOREIGN KEY ("state_transactions_id")
            REFERENCES "state_transactions" ("id_state_transaction")
 ;
 
ALTER TABLE "ware_transfers"
    ADD CONSTRAINT "fk_users_transactions_transactions1"
        FOREIGN KEY ("transactions_id")
            REFERENCES "transactions" ("id_transaction")
 ;
 
ALTER TABLE "ware_transfers"
    ADD CONSTRAINT "fk_ware_transfers_product"
        FOREIGN KEY ("origin_product_id")
            REFERENCES "products" ("id_product")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "ware_transfers"
    ADD CONSTRAINT "fk_ware_transfers_product1"
        FOREIGN KEY ("target_product_id")
            REFERENCES "products" ("id_product")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "ware_transfers_other_banks"
    ADD CONSTRAINT "fk_ware_transfers_other_banks_localtions"
        FOREIGN KEY ("location_id")
            REFERENCES "locations" ("id_location")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "ware_transfers_other_banks"
    ADD CONSTRAINT "fk_ware_transfers_other_banks_products"
        FOREIGN KEY ("origin_product_id")
            REFERENCES "products" ("id_product")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "ware_transfers_other_banks"
    ADD CONSTRAINT "fk_ware_transfers_other_banks_products_transaction"
        FOREIGN KEY ("transaction_id")
            REFERENCES "transactions" ("id_transaction")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 
ALTER TABLE "ware_transfers_other_banks"
    ADD CONSTRAINT "fk_ware_transfers_other_banks_state_transactions"
        FOREIGN KEY ("state_transactions_id")
            REFERENCES "state_transactions" ("id_state_transaction")
ON DELETE RESTRICT
ON UPDATE RESTRICT
 ;
 

