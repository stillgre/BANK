create table clients (
client_id integer primary key,
status integer,
full_name varchar(255),
reg_dt date,
doc_num varchar(10),
doc_series varchar(10),
phone varchar(10),
VIP_flg integer,
birth_dt date,
sex CHAR(1)
);

CREATE TABLE balances (
current_amt DECIMAL(12,2),
row_id integer,
actual_flg integer,
processed_dttm TIMESTAMP,
client_id integer,
foreign key (client_id) references clients(client_id)
);

create table cards (
card_number varchar(16) primary key,
client_id integer,
card_type char(1),
open_dt date,
close_dt date,
processed_dttm timestamp,
foreign key (client_id) references clients(client_id)
);

create table status_desc (
status integer primary key,
description varchar(100)
);

alter table clients
add foreign key (status) references status_desc(status);

create table transactions (
trans_id integer primary key,
card_number varchar(16),
trans_amt decimal(12,2),
trans_dttm timestamp,
processed_dttm timestamp,
foreign key (card_number) references cards(card_number)
);


