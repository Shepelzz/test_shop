--ORACLE
-- Create table
create table ACCOUNTS
(
  USER_NAME VARCHAR2(20 CHAR) not null,
  ACTIVE    NUMBER(1) not null,
  PASSWORD  VARCHAR2(20 CHAR) not null,
  USER_ROLE VARCHAR2(20) not null
) ;

alter table ACCOUNTS
  add primary key (USER_NAME) ;
---------------------------------------

create table PRODUCTS
(
  CODE        VARCHAR2(20 CHAR) not null,
  IMAGE       BLOB,
  NAME        VARCHAR2(255 CHAR) not null,
  PRICE       FLOAT not null,
  CREATE_DATE DATE default sysdate not null
) ;

alter table PRODUCTS
  add primary key (CODE) ;
---------------------------------------
-- Create table
create table ORDERS
(
  ID               VARCHAR2(50 CHAR) not null,
  AMOUNT           FLOAT not null,
  CUSTOMER_ADDRESS VARCHAR2(255 CHAR) not null,
  CUSTOMER_EMAIL   VARCHAR2(128 CHAR) not null,
  CUSTOMER_NAME    VARCHAR2(255 CHAR) not null,
  CUSTOMER_PHONE   VARCHAR2(128 CHAR) not null,
  ORDER_DATE       TIMESTAMP(6) not null,
  ORDER_NUM        NUMBER(10) not null
) ;
alter table ORDERS
  add primary key (ID) ;
alter table ORDERS
  add constraint ORDER_UK unique (ORDER_NUM) ;
---------------------------------------

-- Create table
create table ORDER_DETAILS
(
  ID         VARCHAR2(50 CHAR) not null,
  AMOUNT     FLOAT not null,
  PRICE      FLOAT not null,
  QUANITY    NUMBER(10) not null,
  ORDER_ID   VARCHAR2(50 CHAR) not null,
  PRODUCT_ID VARCHAR2(20 CHAR) not null
) ;
--
alter table ORDER_DETAILS
  add primary key (ID) ;
alter table ORDER_DETAILS
  add constraint ORDER_DETAIL_ORD_FK foreign key (ORDER_ID)
references ORDERS (ID);
alter table ORDER_DETAILS
  add constraint ORDER_DETAIL_PROD_FK foreign key (PRODUCT_ID)
references PRODUCTS (CODE);

---------------------------------------
insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE)
values ('employee1', 1, '123', 'EMPLOYEE');

insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE)
values ('manager1', 1, '123', 'MANAGER');

----------------
insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S001', 'Core Java', 100, sysdate);

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S002', 'Spring for Beginners', 50, sysdate);

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S003', 'Swift for Beginners', 120, sysdate);

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S004', 'Oracle XML Parser', 120, sysdate);

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S005', 'CSharp Tutorial for Beginers', 110, sysdate);

Commit;



--MS SQL
create table Accounts (
  User_Name varchar(20) not null,
  Active bit not null,
  Password varchar(20) not null,
  User_Role varchar(20) not null,
  primary key (User_Name)
);

create table Order_Details (
  ID varchar(50) not null,
  Amount double precision not null,
  Price double precision not null,
  Quanity int not null,
  ORDER_ID varchar(50) not null,
  PRODUCT_ID varchar(20) not null,
  primary key (ID)
);

create table Orders (
  ID varchar(50) not null,
  Amount double precision not null,
  Customer_Address varchar(255) not null,
  Customer_Email varchar(128) not null,
  Customer_Name varchar(255) not null,
  Customer_Phone varchar(128) not null,
  Order_Date datetime not null,
  Order_Num int not null,
  primary key (ID)
);

create table Products (
  Code varchar(20) not null,
  Create_Date datetime not null,
  Image image,
  Name varchar(255) not null,
  Price double precision not null,
  primary key (Code)
);

alter table Orders
  add constraint UK_sxhpvsj665kmi4f7jdu9d2791  unique (Order_Num);

alter table Order_Details
  add constraint ORDER_DETAIL_ORD_FK
foreign key (ORDER_ID)
references Orders;

alter table Order_Details
  add constraint ORDER_DETAIL_PROD_FK
foreign key (PRODUCT_ID)
references Products;

---------------------------------------
insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE)
values ('employee1', 1, '123', 'EMPLOYEE');

insert into Accounts (USER_NAME, ACTIVE, PASSWORD, USER_ROLE)
values ('manager1', 1, '123', 'MANAGER');

----------------
insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S001', 'Core Java', 100, SYSDATETIME() );

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S002', 'Spring for Beginners', 50, SYSDATETIME() );

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S003', 'Swift for Beginners', 120, SYSDATETIME() );

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S004', 'Oracle XML Parser', 120, SYSDATETIME() );

insert into products (CODE, NAME, PRICE, CREATE_DATE)
values ('S005', 'CSharp Tutorial for Beginers', 110, SYSDATETIME() );