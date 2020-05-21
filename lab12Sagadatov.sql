CREATE TABLE person
(
    id bigint NOT NULL,
    name character varying(255) ,
    surname character varying(255) ,
    CONSTRAINT person_pkey PRIMARY KEY (id)
)

CREATE TABLE customer
(
    companynumber integer,
    id bigint NOT NULL,
    CONSTRAINT customer_pkey PRIMARY KEY (id),
    CONSTRAINT fktlsbe8659xwqdi2087j3q2tiu FOREIGN KEY (id)
)

CREATE TABLE orders
(
    id bigint NOT NULL,
    ordername character varying(20),
    CONSTRAINT orders_pkey PRIMARY KEY (id)
)

CREATE TABLE customer_orders
(
    customer_id bigint NOT NULL,
    orders_id bigint NOT NULL,
    CONSTRAINT uk_3djfisy9es1a5xhixl7s3nx7t UNIQUE (orders_id)
,
    CONSTRAINT fkghalnp2026aevnar12uqyi4k FOREIGN KEY (customer_id)
        REFERENCES customer (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT fkl8wrme8ascf1gfce42vdkom9n FOREIGN KEY (orders_id)
        REFERENCES orders (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)