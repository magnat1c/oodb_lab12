<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
		"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<meta charset="utf-8"/>
	<link rel='stylesheet' href='${model["app_path"]}/css/lab10.css'>
	<script src='${model["app_path"]}/js/lab10.js'></script>

	<title>lab12_Sagdatov</title>
</head>
<body>

<div class="menu-bar">
	<ul>
		<li><a class="active" href='${model["app_path"]}'>Главная</a></li>
        <li><a href='${model["app_path"]}/customer'>Заказчики</a></li>
        <li><a href='${model["app_path"]}/addcustomer'>Новый заказчик</a></li>
        <li><a href='${model["app_path"]}/customerbyname'>Поиск заказчика</a></li>
        <li><a href='${model["app_path"]}/delobject'>Удаление объектов</a></li>
	</ul>
</div>

<div class="c-wrapper">

<H2>
	Учет заказов
</H2>

    <div>
        <p><strong>Предметная область - учет заказов и клиентов предприятия</strong>
        <p><strong>Сущности:</strong>
        <ul>
            <li>Клиент</li>
            <li>Заказы (принадлежит клиенту, может иметь несколько)</li>
        </ul>
        <p><strong>Классы:</strong>
        <p>Описание клиента<br>
            @Entity <br>
            @Inheritance(strategy = InheritanceType.JOINED)<br>
            public class Person {<br>
            @Id<br>
            @GeneratedValue<br>
            private Long id;<br>
            String name;<br>
            }<br>

            @Entity<br>
            public class Customer extends Person {<br>
            private Integer companyNumber;<br>
            @OneToMany<br>
            private List<Orders> orders = new ArrayList<>();<br>
                }<br>

        <p>Описание заказов<br>
			@Entity<br>
			public class Orders {<br>
			@Id<br>
			@GeneratedValue()<br>
			private Long id;<br>

			@Column(length = 20)<br>
			private String orderName;<br>
            }<br>


        <p><strong>Структура БД:</strong>
            CREATE TABLE person<br>
            (<br>
            id bigint NOT NULL,<br>
            name character varying(255) ,<br>
            surname character varying(255) ,<br>
            CONSTRAINT person_pkey PRIMARY KEY (id)<br>
            )<br>

            CREATE TABLE customer<br>
            (<br>
            companynumber integer,<br>
            id bigint NOT NULL,<br>
            CONSTRAINT customer_pkey PRIMARY KEY (id),<br>
            CONSTRAINT fktlsbe8659xwqdi2087j3q2tiu FOREIGN KEY (id)<br>
            )

            CREATE TABLE orders<br>
            (<br>
            id bigint NOT NULL,<br>
            ordername character varying(20),<br>
            CONSTRAINT orders_pkey PRIMARY KEY (id)<br>
            )<br>

            CREATE TABLE customer_orders<br>
            (<br>
            customer_id bigint NOT NULL,<br>
            orders_id bigint NOT NULL,<br>
            CONSTRAINT uk_3djfisy9es1a5xhixl7s3nx7t UNIQUE (orders_id)<br>
            ,<br>
            CONSTRAINT fkghalnp2026aevnar12uqyi4k FOREIGN KEY (customer_id)<br>
            REFERENCES customer (id) MATCH SIMPLE<br>
            ON UPDATE NO ACTION<br>
            ON DELETE NO ACTION,<br>
            CONSTRAINT fkl8wrme8ascf1gfce42vdkom9n FOREIGN KEY (orders_id)<br>
            REFERENCES orders (id) MATCH SIMPLE<br>
            ON UPDATE NO ACTION<br>
            ON DELETE NO ACTION<br>
            )<br>
    </div>

</div>
</body>
</html>