create table SELLER (
	ID VARCHAR(20) NOT NULL,
	name VARCHAR(50),
	email VARCHAR(100)
);

alter table seller add constraint pk_sellerId primary key (ID);

