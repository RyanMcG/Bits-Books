--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Admin; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Admin" (
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    level character varying(8) NOT NULL,
    user_id integer
);


ALTER TABLE public."Admin" OWNER TO bitbook;

--
-- Name: Admin_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Admin_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Admin_id_seq" OWNER TO bitbook;

--
-- Name: Admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Admin_id_seq" OWNED BY "Admin".id;


--
-- Name: Admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Admin_id_seq"', 21, true);


--
-- Name: Author; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Author" (
    birth_date date,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public."Author" OWNER TO bitbook;

--
-- Name: Author_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Author_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Author_id_seq" OWNER TO bitbook;

--
-- Name: Author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Author_id_seq" OWNED BY "Author".id;


--
-- Name: Author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Author_id_seq"', 105, true);


--
-- Name: Billing; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Billing" (
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    type character varying(12),
    user_id integer
);


ALTER TABLE public."Billing" OWNER TO bitbook;

--
-- Name: Billing_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Billing_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Billing_id_seq" OWNER TO bitbook;

--
-- Name: Billing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Billing_id_seq" OWNED BY "Billing".id;


--
-- Name: Billing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Billing_id_seq"', 47, true);


--
-- Name: Book; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Book" (
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    isbn bigint NOT NULL,
    price numeric NOT NULL,
    publisher_id integer,
    title text NOT NULL
);


ALTER TABLE public."Book" OWNER TO bitbook;

--
-- Name: Book_Author; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Book_Author" (
    id integer NOT NULL,
    book_id integer,
    author_id integer,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public."Book_Author" OWNER TO bitbook;

--
-- Name: Book_Author_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Book_Author_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Book_Author_id_seq" OWNER TO bitbook;

--
-- Name: Book_Author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Book_Author_id_seq" OWNED BY "Book_Author".id;


--
-- Name: Book_Author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Book_Author_id_seq"', 107, true);


--
-- Name: Book_Category; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Book_Category" (
    id integer NOT NULL,
    book_id integer,
    category_id integer,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public."Book_Category" OWNER TO bitbook;

--
-- Name: Book_Category_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Book_Category_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Book_Category_id_seq" OWNER TO bitbook;

--
-- Name: Book_Category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Book_Category_id_seq" OWNED BY "Book_Category".id;


--
-- Name: Book_Category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Book_Category_id_seq"', 107, true);


--
-- Name: Book_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Book_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Book_id_seq" OWNER TO bitbook;

--
-- Name: Book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Book_id_seq" OWNED BY "Book".id;


--
-- Name: Book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Book_id_seq"', 107, true);


--
-- Name: Cart; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Cart" (
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    user_id integer,
    status character varying(10) NOT NULL
);


ALTER TABLE public."Cart" OWNER TO bitbook;

--
-- Name: CartItem; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "CartItem" (
    id integer NOT NULL,
    cart_id integer,
    book_id integer,
    quantity integer,
    status character varying(10) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public."CartItem" OWNER TO bitbook;

--
-- Name: CartItem_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "CartItem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CartItem_id_seq" OWNER TO bitbook;

--
-- Name: CartItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "CartItem_id_seq" OWNED BY "CartItem".id;


--
-- Name: CartItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"CartItem_id_seq"', 21, true);


--
-- Name: Cart_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Cart_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Cart_id_seq" OWNER TO bitbook;

--
-- Name: Cart_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Cart_id_seq" OWNED BY "Cart".id;


--
-- Name: Cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Cart_id_seq"', 21, true);


--
-- Name: Category; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Category" (
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public."Category" OWNER TO bitbook;

--
-- Name: Category_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Category_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Category_id_seq" OWNER TO bitbook;

--
-- Name: Category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Category_id_seq" OWNED BY "Category".id;


--
-- Name: Category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Category_id_seq"', 10, true);


--
-- Name: Creditcard; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Creditcard" (
    id integer NOT NULL,
    address_id integer,
    billing_id integer,
    name character varying(64) NOT NULL,
    cc_number bigint NOT NULL,
    sec_number integer NOT NULL,
    exp_date date NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public."Creditcard" OWNER TO bitbook;

--
-- Name: Creditcard_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Creditcard_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Creditcard_id_seq" OWNER TO bitbook;

--
-- Name: Creditcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Creditcard_id_seq" OWNED BY "Creditcard".id;


--
-- Name: Creditcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Creditcard_id_seq"', 20, true);


--
-- Name: Giftcard; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Giftcard" (
    billing_id integer,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    number character varying(24) NOT NULL,
    pin integer NOT NULL
);


ALTER TABLE public."Giftcard" OWNER TO bitbook;

--
-- Name: Giftcard_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Giftcard_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Giftcard_id_seq" OWNER TO bitbook;

--
-- Name: Giftcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Giftcard_id_seq" OWNED BY "Giftcard".id;


--
-- Name: Giftcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Giftcard_id_seq"', 27, true);


--
-- Name: Inventory; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Inventory" (
    book_id integer,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    quantity integer NOT NULL,
    status character varying(10) NOT NULL
);


ALTER TABLE public."Inventory" OWNER TO bitbook;

--
-- Name: InventoryOrder; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "InventoryOrder" (
    cost numeric NOT NULL,
    cur_quantity integer NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    inventory_id integer,
    orig_quantity integer NOT NULL
);


ALTER TABLE public."InventoryOrder" OWNER TO bitbook;

--
-- Name: InventoryOrder_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "InventoryOrder_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."InventoryOrder_id_seq" OWNER TO bitbook;

--
-- Name: InventoryOrder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "InventoryOrder_id_seq" OWNED BY "InventoryOrder".id;


--
-- Name: InventoryOrder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"InventoryOrder_id_seq"', 55, true);


--
-- Name: Inventory_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Inventory_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Inventory_id_seq" OWNER TO bitbook;

--
-- Name: Inventory_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Inventory_id_seq" OWNED BY "Inventory".id;


--
-- Name: Inventory_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Inventory_id_seq"', 107, true);


--
-- Name: Order; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Order" (
    id integer NOT NULL,
    user_id integer,
    cart_id integer,
    shipping numeric NOT NULL,
    tax numeric NOT NULL,
    status character varying(10) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public."Order" OWNER TO bitbook;

--
-- Name: OrderItem; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "OrderItem" (
    id integer NOT NULL,
    order_id integer,
    book_id integer,
    quantity integer,
    cost numeric NOT NULL,
    price numeric NOT NULL,
    status character varying(10) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public."OrderItem" OWNER TO bitbook;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "OrderItem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderItem_id_seq" OWNER TO bitbook;

--
-- Name: OrderItem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "OrderItem_id_seq" OWNED BY "OrderItem".id;


--
-- Name: OrderItem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"OrderItem_id_seq"', 21, true);


--
-- Name: OrderPayment; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "OrderPayment" (
    id integer NOT NULL,
    order_id integer,
    billing_id integer,
    price numeric NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL
);


ALTER TABLE public."OrderPayment" OWNER TO bitbook;

--
-- Name: OrderPayment_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "OrderPayment_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."OrderPayment_id_seq" OWNER TO bitbook;

--
-- Name: OrderPayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "OrderPayment_id_seq" OWNED BY "OrderPayment".id;


--
-- Name: OrderPayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"OrderPayment_id_seq"', 21, true);


--
-- Name: Order_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Order_id_seq" OWNER TO bitbook;

--
-- Name: Order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Order_id_seq" OWNED BY "Order".id;


--
-- Name: Order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Order_id_seq"', 21, true);


--
-- Name: Publisher; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "Publisher" (
    city character varying(20),
    country character varying(20),
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    established_date date,
    id integer NOT NULL,
    name character varying(32) NOT NULL,
    state character varying(20)
);


ALTER TABLE public."Publisher" OWNER TO bitbook;

--
-- Name: Publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "Publisher_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Publisher_id_seq" OWNER TO bitbook;

--
-- Name: Publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "Publisher_id_seq" OWNED BY "Publisher".id;


--
-- Name: Publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"Publisher_id_seq"', 62, true);


--
-- Name: User; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "User" (
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    email character varying(128) NOT NULL,
    id integer NOT NULL,
    name character varying(64),
    password character varying(64) NOT NULL,
    phone bigint,
    username character varying(32) NOT NULL
);


ALTER TABLE public."User" OWNER TO bitbook;

--
-- Name: UserAddress; Type: TABLE; Schema: public; Owner: bitbook; Tablespace: 
--

CREATE TABLE "UserAddress" (
    address1 character varying(64) NOT NULL,
    address2 character varying(32),
    city character varying(32) NOT NULL,
    country character varying(32) NOT NULL,
    date_created timestamp without time zone NOT NULL,
    date_modified timestamp without time zone NOT NULL,
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    state character varying(20),
    status character varying(10) NOT NULL,
    user_id integer,
    zip integer
);


ALTER TABLE public."UserAddress" OWNER TO bitbook;

--
-- Name: UserAddress_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "UserAddress_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserAddress_id_seq" OWNER TO bitbook;

--
-- Name: UserAddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "UserAddress_id_seq" OWNED BY "UserAddress".id;


--
-- Name: UserAddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"UserAddress_id_seq"', 20, true);


--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: bitbook
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO bitbook;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: bitbook
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: bitbook
--

SELECT pg_catalog.setval('"User_id_seq"', 22, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Admin" ALTER COLUMN id SET DEFAULT nextval('"Admin_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Author" ALTER COLUMN id SET DEFAULT nextval('"Author_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Billing" ALTER COLUMN id SET DEFAULT nextval('"Billing_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Book" ALTER COLUMN id SET DEFAULT nextval('"Book_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Book_Author" ALTER COLUMN id SET DEFAULT nextval('"Book_Author_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Book_Category" ALTER COLUMN id SET DEFAULT nextval('"Book_Category_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Cart" ALTER COLUMN id SET DEFAULT nextval('"Cart_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "CartItem" ALTER COLUMN id SET DEFAULT nextval('"CartItem_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Category" ALTER COLUMN id SET DEFAULT nextval('"Category_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Creditcard" ALTER COLUMN id SET DEFAULT nextval('"Creditcard_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Giftcard" ALTER COLUMN id SET DEFAULT nextval('"Giftcard_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Inventory" ALTER COLUMN id SET DEFAULT nextval('"Inventory_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "InventoryOrder" ALTER COLUMN id SET DEFAULT nextval('"InventoryOrder_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Order" ALTER COLUMN id SET DEFAULT nextval('"Order_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "OrderItem" ALTER COLUMN id SET DEFAULT nextval('"OrderItem_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "OrderPayment" ALTER COLUMN id SET DEFAULT nextval('"OrderPayment_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "Publisher" ALTER COLUMN id SET DEFAULT nextval('"Publisher_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: bitbook
--

ALTER TABLE "UserAddress" ALTER COLUMN id SET DEFAULT nextval('"UserAddress_id_seq"'::regclass);


--
-- Data for Name: Admin; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Admin" (date_created, date_modified, id, level, user_id) FROM stdin;
2011-12-15 01:58:00	2011-12-15 01:58:00	1	2	20
2011-12-15 01:58:00	2011-12-15 01:58:00	2	2	11
2011-12-15 01:58:00	2011-12-15 01:58:00	3	1	17
2011-12-15 01:58:00	2011-12-15 01:58:00	4	2	12
2011-12-15 01:58:00	2011-12-15 01:58:00	5	2	10
2011-12-15 01:58:00	2011-12-15 01:58:00	6	0	18
2011-12-15 01:58:00	2011-12-15 01:58:00	7	2	2
2011-12-15 01:58:00	2011-12-15 01:58:00	8	0	15
2011-12-15 01:58:00	2011-12-15 01:58:00	9	2	13
2011-12-15 01:58:00	2011-12-15 01:58:00	10	0	21
2011-12-15 01:58:00	2011-12-15 01:58:00	11	0	5
2011-12-15 01:58:00	2011-12-15 01:58:00	12	0	19
2011-12-15 01:58:00	2011-12-15 01:58:00	13	2	8
2011-12-15 01:58:00	2011-12-15 01:58:00	14	2	6
2011-12-15 01:58:00	2011-12-15 01:58:00	15	2	16
2011-12-15 01:58:00	2011-12-15 01:58:00	16	0	4
2011-12-15 01:58:00	2011-12-15 01:58:00	17	2	1
2011-12-15 01:58:00	2011-12-15 01:58:00	18	0	3
2011-12-15 01:58:00	2011-12-15 01:58:00	19	2	14
2011-12-15 01:58:00	2011-12-15 01:58:00	20	2	9
2011-12-15 01:58:00	2011-12-15 01:58:00	21	2	7
\.


--
-- Data for Name: Author; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Author" (birth_date, date_created, date_modified, id, name) FROM stdin;
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	1	Chip Dawes
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	2	Biju Thomas
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	3	Doug Stuns
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	4	Matthew Weishan
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	5	Joseph C. Johnson
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	6	Brian Knight
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	7	Ralph Kimball
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	8	Margy Ross
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	9	Bill Mann
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	10	Ian H. Witten
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	11	Eibe Frank
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	12	Robert D. Schmidt
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	13	Ken Henderson
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	14	Paul Litwin
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	15	Ken Getz
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	16	Mike Gunderloy
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	17	Ben Forta
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	18	Nate Weiss
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	19	Leon Chalnick
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	20	Angela C. Buraglia
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	21	Ramez A. Elmasri
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	22	Shamkant B. Navathe
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	23	Rob Vieira
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	24	Paul DuBois
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	25	Laurell K. Hamilton 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	26	Sue Monk Kidd
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	27	Tara Calishain
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	28	Rael Dornfest
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	29	Jay P. Decima 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	30	Wladyslaw Szpilman
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	31	Roma Ligocka
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	32	Michael Cunningham
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	33	Larry Bossidy
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	34	Ram Charan
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	35	Charles Burck
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	36	James Patterson
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	37	Andrew Gross
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	38	Jeffery Deaver
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	39	Jacquelyn Mitchard
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	40	Patrick Lencioni
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	41	Mary Higgins Clark
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	42	Dee Henderson
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	43	Ann Patchett
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	44	Karen Marie Moning
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	45	Suzanne Brockmann
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	46	Steven Pinker
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	47	Edward Osborne Wilson 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	48	Stephen Wolfram 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	49	Harold McGee
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	50	Francis D. K. Ching
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	51	Cassandra Adams
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	52	Virginia McAlester
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	53	Lee McAlester
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	54	Bryan Burkhart
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	55	Allison Arieff
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	56	Ralph R. Kylloe 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	57	Leslie Plummer Clagett 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	58	Gerard Gefen
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	59	Christine Bastin
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	60	Jacques Evrard
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	61	Donald Kaufman
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	62	Taffy Dahl
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	63	Laurel Graeber
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	64	Tina Freeman 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	65	Simon Benninga
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	66	Mark Grinblatt
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	67	Sheridan Titman
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	68	Robert C. Higgins 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	69	Paul Marcus Fischer
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	70	William James Taylor
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	71	Rita Hartung Cheng
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	72	Donald E. Kieso
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	73	Jerry J. Weygandt
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	74	Terry D. Warfield
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	75	Lawrence Revsine
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	76	Daniel W. Collins
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	77	W. Bruce Johnson
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	78	Nicholas Sparks 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	79	Don DeLillo
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	80	Stephen King
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	81	Mark Z. Danielewski 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	82	Michael Romkey 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	83	Chuck Palahniuk 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	84	Matthew Delaney
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	85	Bernie Wrightson
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	86	Stephen King 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	87	Don DeLillo 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	88	Ann Patchett 
2011-12-15	2011-12-15 01:35:00	2011-12-15 01:35:00	89	Steven Pinker 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	90	Simon Benninga 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	91	Jeffrey M. Wooldridge 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	92	Steven J. Root 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	93	Ken Coffman 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	94	Gerald Carter 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	95	Scott Kelby 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	96	B. J. Fogg 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	97	Michael Meyers 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	98	Carl Sagan 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	99	Alice Sebold 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	100	Alice Sebold
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	101	Ian McEwan 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	102	Nora Roberts 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	103	Andy Rae 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	104	Joseph Truini 
2011-12-15	2011-12-15 01:36:00	2011-12-15 01:36:00	105	Terry Pratchett
\.


--
-- Data for Name: Billing; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Billing" (date_created, date_modified, id, type, user_id) FROM stdin;
2011-12-15 01:58:00	2011-12-15 01:58:00	1	Creditcard	21
2011-12-15 01:58:00	2011-12-15 01:58:00	2	Creditcard	21
2011-12-15 01:58:00	2011-12-15 01:58:00	3	Creditcard	2
2011-12-15 01:58:00	2011-12-15 01:58:00	4	Creditcard	4
2011-12-15 01:58:00	2011-12-15 01:58:00	5	Creditcard	5
2011-12-15 01:58:00	2011-12-15 01:58:00	6	Creditcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	7	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	8	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	9	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	10	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	11	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	12	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	13	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	14	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	15	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	16	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	17	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	18	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	19	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	20	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	21	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	22	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	23	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	24	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	25	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	26	Giftcard	16
2011-12-15 01:58:00	2011-12-15 01:58:00	27	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	28	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	29	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	30	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	31	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	32	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	33	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	34	Creditcard	20
2011-12-15 01:58:00	2011-12-15 01:58:00	35	Giftcard	14
2011-12-15 01:58:00	2011-12-15 01:58:00	36	Giftcard	14
2011-12-15 01:58:00	2011-12-15 01:58:00	37	Giftcard	14
2011-12-15 01:58:00	2011-12-15 01:58:00	38	Giftcard	14
2011-12-15 01:58:00	2011-12-15 01:58:00	39	Giftcard	14
2011-12-15 01:58:00	2011-12-15 01:58:00	40	Giftcard	14
2011-12-15 01:58:00	2011-12-15 01:58:00	41	Creditcard	7
2011-12-15 01:58:00	2011-12-15 01:58:00	42	Creditcard	7
2011-12-15 01:58:00	2011-12-15 01:58:00	43	Creditcard	7
2011-12-15 01:58:00	2011-12-15 01:58:00	44	Creditcard	7
2011-12-15 01:58:00	2011-12-15 01:58:00	45	Creditcard	7
2011-12-15 01:58:00	2011-12-15 01:58:00	46	Creditcard	7
2011-12-15 01:58:00	2011-12-15 01:58:00	47	Giftcard	7
\.


--
-- Data for Name: Book; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Book" (date_created, date_modified, id, isbn, price, publisher_id, title) FROM stdin;
2011-12-15 01:35:00	2011-12-15 01:35:00	1	782140661	104.97	1	OCP: Oracle9i Certification Kit
2011-12-15 01:35:00	2011-12-15 01:35:00	2	72227885	34.99	3	SQL Server 2000 for Experienced DBA's
2011-12-15 01:35:00	2011-12-15 01:35:00	3	471200247	50.0	4	The Data Warehouse Toolkit: The Complete Guide to Dimensional Modeling
2011-12-15 01:35:00	2011-12-15 01:35:00	4	72227710	17.49	3	How To Do Everything with Your Tablet PC
2011-12-15 01:35:00	2011-12-15 01:35:00	5	1558605525	49.95	5	Data Mining: Practical Machine Learning Tools and Techniques with Java Implementations
2011-12-15 01:35:00	2011-12-15 01:35:00	6	972263608	99.0	6	Creating Documents with BusinessObjects 5.1
2011-12-15 01:35:00	2011-12-15 01:35:00	7	201615762	38.49	7	The Guru's Guide to Transact-SQL
2011-12-15 01:35:00	2011-12-15 01:35:00	8	782140114	69.99	1	Access 2002 Developer's Handbook Set
2011-12-15 01:35:00	2011-12-15 01:35:00	9	321125169	38.49	8	ColdFusion MX Web Application Construction Kit
2011-12-15 01:35:00	2011-12-15 01:35:00	10	805317554	95.0	9	Fundamentals of Database Systems 
2011-12-15 01:35:00	2011-12-15 01:35:00	11	1861004486	41.99	10	Professional SQL Server 2000 Programming
2011-12-15 01:35:00	2011-12-15 01:35:00	12	735712123	34.99	9	MySQL
2011-12-15 01:35:00	2011-12-15 01:35:00	13	425188361	16.07	11	Cerulean Sins
2011-12-15 01:35:00	2011-12-15 01:35:00	14	142001740	14.0	12	The Secret Life of Bees
2011-12-15 01:35:00	2011-12-15 01:35:00	15	596004478	24.95	13	Google Hacks
2011-12-15 01:35:00	2011-12-15 01:35:00	16	71414339	18.95	14	Investing in Fixer-Uppers : A Complete Guide to Buying Low, Fixing Smart, Adding Value, and Selling (or Renting) High
2011-12-15 01:35:00	2011-12-15 01:35:00	17	312311354	13.0	15	The Pianist
2011-12-15 01:35:00	2011-12-15 01:35:00	18	312287941	25.95	16	The Girl in the Red Coat: A Memoir
2011-12-15 01:35:00	2011-12-15 01:35:00	19	312243022	3.44	15	The Hours
2011-12-15 01:35:00	2011-12-15 01:35:00	20	609610570	27.5	17	Execution: The Discipline of Getting Things Done
2011-12-15 01:35:00	2011-12-15 01:35:00	21	316602051	27.95	18	The Jester
2011-12-15 01:35:00	2011-12-15 01:35:00	22	743222008	25.0	19	The Vanished Man: A Lincoln Rhyme Novel
2011-12-15 01:35:00	2011-12-15 01:35:00	23	66214750	25.95	20	Twelve Times Blessed
2011-12-15 01:35:00	2011-12-15 01:35:00	24	787960756	13.2	21	The Five Dysfunctions of a Team: A Leadership Fable
2011-12-15 01:35:00	2011-12-15 01:35:00	25	743206061	26.0	19	The Second Time Around
2011-12-15 01:35:00	2011-12-15 01:35:00	26	1590520734	12.99	22	The Rescuer: The O'Malley Series
2011-12-15 01:35:00	2011-12-15 01:35:00	27	60934417	13.95	23	Bel Canto: A Novel
2011-12-15 01:35:00	2011-12-15 01:35:00	28	440237556	6.99	24	The Dark Highlander
2011-12-15 01:35:00	2011-12-15 01:35:00	29	373272839	4.75	25	Letters to Kelly
2011-12-15 01:35:00	2011-12-15 01:35:00	30	670031518	27.95	26	The Blank Slate: The Modern Denial of Human Nature
2011-12-15 01:35:00	2011-12-15 01:35:00	31	679768671	15.0	27	Consilience: The Unity of Knowledge
2011-12-15 01:35:00	2011-12-15 01:35:00	32	679450785	22.0	28	The Future of Life
2011-12-15 01:35:00	2011-12-15 01:35:00	33	1579550088	44.95	29	A New Kind of Science
2011-12-15 01:35:00	2011-12-15 01:35:00	34	684843285	22.0	30	ON FOOD AND COOKING
2011-12-15 01:35:00	2011-12-15 01:35:00	35	471358983	40.0	4	Building Construction Illustrated
2011-12-15 01:35:00	2011-12-15 01:35:00	36	394739698	24.95	31	A Field Guide to American Houses
2011-12-15 01:35:00	2011-12-15 01:35:00	37	1586851322	39.95	32	Prefab
2011-12-15 01:35:00	2011-12-15 01:35:00	38	1586851357	60.0	32	Cabins & Camps
2011-12-15 01:35:00	2011-12-15 01:35:00	39	1561586484	24.95	33	The New City Home: Smart Solutions for Metro Living
2011-12-15 01:35:00	2011-12-15 01:35:00	40	865659982	50.0	34	Composers' Houses
2011-12-15 01:35:00	2011-12-15 01:35:00	41	517576600	50.0	35	Color: Natural Palettes for Painted Rooms
2011-12-15 01:35:00	2011-12-15 01:35:00	42	262024829	70.0	36	Financial Modeling 
2011-12-15 01:35:00	2011-12-15 01:35:00	43	72294337	122.5	37	Financial Markets & Corporate Strategy
2011-12-15 01:35:00	2011-12-15 01:35:00	44	72315318	79.2	37	Analysis for Financial Management
2011-12-15 01:35:00	2011-12-15 01:35:00	45	324107501	112.95	38	Advanced Accounting
2011-12-15 01:35:00	2011-12-15 01:35:00	46	471363049	139.2	4	Intermediate Accounting
2011-12-15 01:35:00	2011-12-15 01:35:00	47	130323519	126.67	39	Financial Reporting and Analysis 
2011-12-15 01:35:00	2011-12-15 01:35:00	48	446527793	24.95	40	The Guardian
2011-12-15 01:35:00	2011-12-15 01:35:00	49	743244249	25.0	41	Cosmopolis: A Novel
2011-12-15 01:35:00	2011-12-15 01:35:00	50	743467523	7.99	42	Dreamcatcher
2011-12-15 01:35:00	2011-12-15 01:35:00	51	375703764	19.95	43	House of Leaves
2011-12-15 01:35:00	2011-12-15 01:35:00	52	345452089	6.99	44	The Vampire's Violin
2011-12-15 01:35:00	2011-12-15 01:35:00	53	385504470	17.47	45	Lullaby: A Novel
2011-12-15 01:35:00	2011-12-15 01:35:00	54	312276702	24.95	16	Jinn: A Novel
2011-12-15 01:35:00	2011-12-15 01:35:00	55	743457358	7.99	42	Everything's Eventual: 14 Dark Tales
2011-12-15 01:35:00	2011-12-15 01:35:00	56	1880418568	35.0	46	Wolves of the Calla 
2011-12-15 01:35:00	2011-12-15 01:35:00	57	743455967	7.99	42	On Writing
2011-12-15 01:35:00	2011-12-15 01:35:00	58	140077022	14.0	12	White Noise 
2011-12-15 01:35:00	2011-12-15 01:35:00	59	679722955	11.2	47	The Names
2011-12-15 01:35:00	2011-12-15 01:35:00	60	684848155	16.0	48	UNDERWORLD: A NOVEL
2011-12-15 01:35:00	2011-12-15 01:35:00	61	471286168	39.95	4	Architecture: Form, Space, and Order
2011-12-15 01:35:00	2011-12-15 01:35:00	62	471288217	39.95	4	A Visual Dictionary of Architecture
2011-12-15 01:35:00	2011-12-15 01:35:00	63	156006219	13.0	49	The Magician's Assistant
2011-12-15 01:35:00	2011-12-15 01:35:00	64	60540753	13.95	50	Patron Saint of Liars
2011-12-15 01:35:00	2011-12-15 01:35:00	65	393318486	17.95	51	How the Mind Works
2011-12-15 01:35:00	2011-12-15 01:35:00	66	60958332	10.5	23	The Language Instinct: How the Mind Creates Language
2011-12-15 01:35:00	2011-12-15 01:35:00	67	60958405	15.0	23	Words and Rules: The Ingredients of Language
2011-12-15 01:35:00	2011-12-15 01:35:00	68	393319407	16.95	51	The Diversity of Life
2011-12-15 01:35:00	2011-12-15 01:35:00	69	674634427	18.95	52	On Human Nature
2011-12-15 01:35:00	2011-12-15 01:35:00	70	446608955	6.99	40	A Walk to Remember
2011-12-15 01:35:00	2011-12-15 01:35:00	71	446676098	12.95	40	The Notebook
2011-12-15 01:35:00	2011-12-15 01:35:00	72	446606812	7.5	40	Message in a Bottle
2011-12-15 01:36:00	2011-12-15 01:36:00	73	262521415	35.0	36	Numerical Techniques in Finance
2011-12-15 01:36:00	2011-12-15 01:36:00	74	262232197	74.95	36	Econometric Analysis of Cross Section and Panel Data
2011-12-15 01:36:00	2011-12-15 01:36:00	75	324113641	107.95	38	Introductory Econometrics: A Modern Approach
2011-12-15 01:36:00	2011-12-15 01:36:00	76	471391123	50.0	4	Beyond Coso : Internal Control to Enhance Corporate Governance
2011-12-15 01:36:00	2011-12-15 01:36:00	77	130998516	83.0	53	Real World FPGA Design with Verilog
2011-12-15 01:36:00	2011-12-15 01:36:00	78	1565924916	39.95	13	Ldap System Administration
2011-12-15 01:36:00	2011-12-15 01:36:00	79	735712360	39.99	54	The Photoshop Book for Digital Photographers
2011-12-15 01:36:00	2011-12-15 01:36:00	80	735712379	39.99	54	Photoshop 7 Down & Dirty Tricks
2011-12-15 01:36:00	2011-12-15 01:36:00	81	735713170	29.99	54	Mac OS X v. 10.2 Jaguar Killer Tips
2011-12-15 01:36:00	2011-12-15 01:36:00	82	1558606432	34.95	5	Persuasive Technology: Using Computers to Change What We Think and Do
2011-12-15 01:36:00	2011-12-15 01:36:00	83	72222743	59.99	3	A+ Certification All-in-One Exam Guide
2011-12-15 01:36:00	2011-12-15 01:36:00	85	375508325	35.0	27	Cosmos
2011-12-15 01:36:00	2011-12-15 01:36:00	86	345336895	6.99	56	Broca's Brain: Reflections on the Romance of Science
2011-12-15 01:36:00	2011-12-15 01:36:00	88	345376595	12.95	55	Pale Blue Dot: A Vision of the Human Future in Space
2011-12-15 01:36:00	2011-12-15 01:36:00	89	316666343	21.95	18	The Lovely Bones: A Novel
2011-12-15 01:36:00	2011-12-15 01:36:00	91	385721794	14.0	58	Atonement
2011-12-15 01:36:00	2011-12-15 01:36:00	93	385494327	14.0	58	Black Dogs
2011-12-15 01:36:00	2011-12-15 01:36:00	95	399149848	25.95	59	Birthright
2011-12-15 01:36:00	2011-12-15 01:36:00	96	373218192	7.5	60	Engaging The Enemy
2011-12-15 01:36:00	2011-12-15 01:36:00	98	399149392	25.95	59	Chesapeake Blue
2011-12-15 01:36:00	2011-12-15 01:36:00	99	1561584029	39.95	33	The Complete Illustrated Guide to Furniture and Cabinet Construction
2011-12-15 01:36:00	2011-12-15 01:36:00	100	1579902944	19.95	61	Choosing & Using Hand Tools
2011-12-15 01:36:00	2011-12-15 01:36:00	101	1561586196	19.95	33	Building a Shed
2011-12-15 01:36:00	2011-12-15 01:36:00	102	61092177	7.99	62	Small Gods
2011-12-15 01:36:00	2011-12-15 01:36:00	104	61020656	7.99	62	Pyramids
2011-12-15 01:36:00	2011-12-15 01:36:00	106	61020648	7.99	62	Guards! Guards!
2011-12-15 01:36:00	2011-12-15 01:36:00	84	345409469	14.95	55	The Demon-Haunted World: Science As a Candle in the Dark
2011-12-15 01:36:00	2011-12-15 01:36:00	87	671004107	7.99	42	Contact
2011-12-15 01:36:00	2011-12-15 01:36:00	90	316096199	11.95	57	Lucky: A Memoir
2011-12-15 01:36:00	2011-12-15 01:36:00	92	385494246	12.0	58	Amsterdam
2011-12-15 01:36:00	2011-12-15 01:36:00	94	385494149	13.0	58	Enduring Love
2011-12-15 01:36:00	2011-12-15 01:36:00	97	373218257	14.95	25	Love By Design
2011-12-15 01:36:00	2011-12-15 01:36:00	103	60502935	7.99	62	Going Postal
2011-12-15 01:36:00	2011-12-15 01:36:00	105	60855925	13.99	62	The Color of Magic
2011-12-15 01:36:00	2011-12-15 01:36:00	107	61161721	7.99	62	Unseen Academicals
\.


--
-- Data for Name: Book_Author; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Book_Author" (id, book_id, author_id, date_created, date_modified) FROM stdin;
1	1	1	2011-12-15 01:35:00	2011-12-15 01:35:00
2	2	6	2011-12-15 01:35:00	2011-12-15 01:35:00
3	3	7	2011-12-15 01:35:00	2011-12-15 01:35:00
4	4	9	2011-12-15 01:35:00	2011-12-15 01:35:00
5	5	10	2011-12-15 01:35:00	2011-12-15 01:35:00
6	6	12	2011-12-15 01:35:00	2011-12-15 01:35:00
7	7	13	2011-12-15 01:35:00	2011-12-15 01:35:00
8	8	14	2011-12-15 01:35:00	2011-12-15 01:35:00
9	9	17	2011-12-15 01:35:00	2011-12-15 01:35:00
10	10	21	2011-12-15 01:35:00	2011-12-15 01:35:00
11	11	23	2011-12-15 01:35:00	2011-12-15 01:35:00
12	12	24	2011-12-15 01:35:00	2011-12-15 01:35:00
13	13	25	2011-12-15 01:35:00	2011-12-15 01:35:00
14	14	26	2011-12-15 01:35:00	2011-12-15 01:35:00
15	15	27	2011-12-15 01:35:00	2011-12-15 01:35:00
16	16	29	2011-12-15 01:35:00	2011-12-15 01:35:00
17	17	30	2011-12-15 01:35:00	2011-12-15 01:35:00
18	18	31	2011-12-15 01:35:00	2011-12-15 01:35:00
19	19	32	2011-12-15 01:35:00	2011-12-15 01:35:00
20	20	33	2011-12-15 01:35:00	2011-12-15 01:35:00
21	21	36	2011-12-15 01:35:00	2011-12-15 01:35:00
22	22	38	2011-12-15 01:35:00	2011-12-15 01:35:00
23	23	39	2011-12-15 01:35:00	2011-12-15 01:35:00
24	24	40	2011-12-15 01:35:00	2011-12-15 01:35:00
25	25	41	2011-12-15 01:35:00	2011-12-15 01:35:00
26	26	42	2011-12-15 01:35:00	2011-12-15 01:35:00
27	27	43	2011-12-15 01:35:00	2011-12-15 01:35:00
28	28	44	2011-12-15 01:35:00	2011-12-15 01:35:00
29	29	45	2011-12-15 01:35:00	2011-12-15 01:35:00
30	30	46	2011-12-15 01:35:00	2011-12-15 01:35:00
31	31	47	2011-12-15 01:35:00	2011-12-15 01:35:00
32	32	47	2011-12-15 01:35:00	2011-12-15 01:35:00
33	33	48	2011-12-15 01:35:00	2011-12-15 01:35:00
34	34	49	2011-12-15 01:35:00	2011-12-15 01:35:00
35	35	50	2011-12-15 01:35:00	2011-12-15 01:35:00
36	36	52	2011-12-15 01:35:00	2011-12-15 01:35:00
37	37	54	2011-12-15 01:35:00	2011-12-15 01:35:00
38	38	56	2011-12-15 01:35:00	2011-12-15 01:35:00
39	39	57	2011-12-15 01:35:00	2011-12-15 01:35:00
40	40	58	2011-12-15 01:35:00	2011-12-15 01:35:00
41	41	61	2011-12-15 01:35:00	2011-12-15 01:35:00
42	42	65	2011-12-15 01:35:00	2011-12-15 01:35:00
43	43	66	2011-12-15 01:35:00	2011-12-15 01:35:00
44	44	68	2011-12-15 01:35:00	2011-12-15 01:35:00
45	45	69	2011-12-15 01:35:00	2011-12-15 01:35:00
46	46	72	2011-12-15 01:35:00	2011-12-15 01:35:00
47	47	75	2011-12-15 01:35:00	2011-12-15 01:35:00
48	48	78	2011-12-15 01:35:00	2011-12-15 01:35:00
49	49	79	2011-12-15 01:35:00	2011-12-15 01:35:00
50	50	80	2011-12-15 01:35:00	2011-12-15 01:35:00
51	51	81	2011-12-15 01:35:00	2011-12-15 01:35:00
52	52	82	2011-12-15 01:35:00	2011-12-15 01:35:00
53	53	83	2011-12-15 01:35:00	2011-12-15 01:35:00
54	54	84	2011-12-15 01:35:00	2011-12-15 01:35:00
55	55	80	2011-12-15 01:35:00	2011-12-15 01:35:00
56	56	80	2011-12-15 01:35:00	2011-12-15 01:35:00
57	57	86	2011-12-15 01:35:00	2011-12-15 01:35:00
58	58	79	2011-12-15 01:35:00	2011-12-15 01:35:00
59	59	87	2011-12-15 01:35:00	2011-12-15 01:35:00
60	60	87	2011-12-15 01:35:00	2011-12-15 01:35:00
61	61	50	2011-12-15 01:35:00	2011-12-15 01:35:00
62	62	50	2011-12-15 01:35:00	2011-12-15 01:35:00
63	63	88	2011-12-15 01:35:00	2011-12-15 01:35:00
64	64	88	2011-12-15 01:35:00	2011-12-15 01:35:00
65	65	89	2011-12-15 01:35:00	2011-12-15 01:35:00
66	66	89	2011-12-15 01:35:00	2011-12-15 01:35:00
67	67	89	2011-12-15 01:35:00	2011-12-15 01:35:00
68	68	47	2011-12-15 01:35:00	2011-12-15 01:35:00
69	69	47	2011-12-15 01:35:00	2011-12-15 01:35:00
70	70	78	2011-12-15 01:35:00	2011-12-15 01:35:00
71	71	78	2011-12-15 01:35:00	2011-12-15 01:35:00
72	72	78	2011-12-15 01:35:00	2011-12-15 01:35:00
73	73	90	2011-12-15 01:35:00	2011-12-15 01:35:00
74	74	91	2011-12-15 01:35:00	2011-12-15 01:35:00
75	75	91	2011-12-15 01:35:00	2011-12-15 01:35:00
76	76	92	2011-12-15 01:35:00	2011-12-15 01:35:00
77	77	93	2011-12-15 01:35:00	2011-12-15 01:35:00
78	78	94	2011-12-15 01:35:00	2011-12-15 01:35:00
79	79	95	2011-12-15 01:35:00	2011-12-15 01:35:00
80	80	95	2011-12-15 01:35:00	2011-12-15 01:35:00
81	81	95	2011-12-15 01:35:00	2011-12-15 01:35:00
82	82	96	2011-12-15 01:35:00	2011-12-15 01:35:00
83	83	97	2011-12-15 01:35:00	2011-12-15 01:35:00
84	84	98	2011-12-15 01:35:00	2011-12-15 01:35:00
85	85	98	2011-12-15 01:35:00	2011-12-15 01:35:00
86	86	98	2011-12-15 01:35:00	2011-12-15 01:35:00
87	87	98	2011-12-15 01:35:00	2011-12-15 01:35:00
88	88	98	2011-12-15 01:35:00	2011-12-15 01:35:00
89	89	99	2011-12-15 01:35:00	2011-12-15 01:35:00
90	90	100	2011-12-15 01:35:00	2011-12-15 01:35:00
91	91	101	2011-12-15 01:35:00	2011-12-15 01:35:00
92	92	101	2011-12-15 01:35:00	2011-12-15 01:35:00
93	93	101	2011-12-15 01:35:00	2011-12-15 01:35:00
94	94	101	2011-12-15 01:35:00	2011-12-15 01:35:00
95	95	102	2011-12-15 01:35:00	2011-12-15 01:35:00
96	96	102	2011-12-15 01:35:00	2011-12-15 01:35:00
97	97	102	2011-12-15 01:35:00	2011-12-15 01:35:00
98	98	102	2011-12-15 01:35:00	2011-12-15 01:35:00
99	99	103	2011-12-15 01:35:00	2011-12-15 01:35:00
100	100	103	2011-12-15 01:35:00	2011-12-15 01:35:00
101	101	104	2011-12-15 01:35:00	2011-12-15 01:35:00
102	102	105	2011-12-15 01:35:00	2011-12-15 01:35:00
103	103	105	2011-12-15 01:35:00	2011-12-15 01:35:00
104	104	105	2011-12-15 01:35:00	2011-12-15 01:35:00
105	105	105	2011-12-15 01:35:00	2011-12-15 01:35:00
106	106	105	2011-12-15 01:35:00	2011-12-15 01:35:00
107	107	105	2011-12-15 01:35:00	2011-12-15 01:35:00
\.


--
-- Data for Name: Book_Category; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Book_Category" (id, book_id, category_id, date_created, date_modified) FROM stdin;
1	1	1	2011-12-15 01:35:00	2011-12-15 01:35:00
2	2	1	2011-12-15 01:35:00	2011-12-15 01:35:00
3	3	1	2011-12-15 01:35:00	2011-12-15 01:35:00
4	4	1	2011-12-15 01:35:00	2011-12-15 01:35:00
5	5	1	2011-12-15 01:35:00	2011-12-15 01:35:00
6	6	1	2011-12-15 01:35:00	2011-12-15 01:35:00
7	7	1	2011-12-15 01:35:00	2011-12-15 01:35:00
8	8	1	2011-12-15 01:35:00	2011-12-15 01:35:00
9	9	1	2011-12-15 01:35:00	2011-12-15 01:35:00
10	10	1	2011-12-15 01:35:00	2011-12-15 01:35:00
11	11	1	2011-12-15 01:35:00	2011-12-15 01:35:00
12	12	1	2011-12-15 01:35:00	2011-12-15 01:35:00
13	13	3	2011-12-15 01:35:00	2011-12-15 01:35:00
14	14	3	2011-12-15 01:35:00	2011-12-15 01:35:00
15	15	1	2011-12-15 01:35:00	2011-12-15 01:35:00
16	16	4	2011-12-15 01:35:00	2011-12-15 01:35:00
17	17	3	2011-12-15 01:35:00	2011-12-15 01:35:00
18	18	3	2011-12-15 01:35:00	2011-12-15 01:35:00
19	19	3	2011-12-15 01:35:00	2011-12-15 01:35:00
20	20	5	2011-12-15 01:35:00	2011-12-15 01:35:00
21	21	3	2011-12-15 01:35:00	2011-12-15 01:35:00
22	22	3	2011-12-15 01:35:00	2011-12-15 01:35:00
23	23	3	2011-12-15 01:35:00	2011-12-15 01:35:00
24	24	4	2011-12-15 01:35:00	2011-12-15 01:35:00
25	25	4	2011-12-15 01:35:00	2011-12-15 01:35:00
26	26	6	2011-12-15 01:35:00	2011-12-15 01:35:00
27	27	6	2011-12-15 01:35:00	2011-12-15 01:35:00
28	28	6	2011-12-15 01:35:00	2011-12-15 01:35:00
29	29	6	2011-12-15 01:35:00	2011-12-15 01:35:00
30	30	7	2011-12-15 01:35:00	2011-12-15 01:35:00
31	31	7	2011-12-15 01:35:00	2011-12-15 01:35:00
32	32	7	2011-12-15 01:35:00	2011-12-15 01:35:00
33	33	7	2011-12-15 01:35:00	2011-12-15 01:35:00
34	34	7	2011-12-15 01:35:00	2011-12-15 01:35:00
35	35	8	2011-12-15 01:35:00	2011-12-15 01:35:00
36	36	8	2011-12-15 01:35:00	2011-12-15 01:35:00
37	37	8	2011-12-15 01:35:00	2011-12-15 01:35:00
38	38	8	2011-12-15 01:35:00	2011-12-15 01:35:00
39	39	8	2011-12-15 01:35:00	2011-12-15 01:35:00
40	40	8	2011-12-15 01:35:00	2011-12-15 01:35:00
41	41	8	2011-12-15 01:35:00	2011-12-15 01:35:00
42	42	4	2011-12-15 01:35:00	2011-12-15 01:35:00
43	43	4	2011-12-15 01:35:00	2011-12-15 01:35:00
44	44	4	2011-12-15 01:35:00	2011-12-15 01:35:00
45	45	4	2011-12-15 01:35:00	2011-12-15 01:35:00
46	46	4	2011-12-15 01:35:00	2011-12-15 01:35:00
47	47	4	2011-12-15 01:35:00	2011-12-15 01:35:00
48	48	3	2011-12-15 01:35:00	2011-12-15 01:35:00
49	49	3	2011-12-15 01:35:00	2011-12-15 01:35:00
50	50	9	2011-12-15 01:35:00	2011-12-15 01:35:00
51	51	9	2011-12-15 01:35:00	2011-12-15 01:35:00
52	52	9	2011-12-15 01:35:00	2011-12-15 01:35:00
53	53	9	2011-12-15 01:35:00	2011-12-15 01:35:00
54	54	9	2011-12-15 01:35:00	2011-12-15 01:35:00
55	55	9	2011-12-15 01:35:00	2011-12-15 01:35:00
56	56	9	2011-12-15 01:35:00	2011-12-15 01:35:00
57	57	9	2011-12-15 01:35:00	2011-12-15 01:35:00
58	58	3	2011-12-15 01:35:00	2011-12-15 01:35:00
59	59	3	2011-12-15 01:35:00	2011-12-15 01:35:00
60	60	3	2011-12-15 01:35:00	2011-12-15 01:35:00
61	61	8	2011-12-15 01:35:00	2011-12-15 01:35:00
62	62	8	2011-12-15 01:35:00	2011-12-15 01:35:00
63	63	6	2011-12-15 01:35:00	2011-12-15 01:35:00
64	64	6	2011-12-15 01:35:00	2011-12-15 01:35:00
65	65	7	2011-12-15 01:35:00	2011-12-15 01:35:00
66	66	7	2011-12-15 01:35:00	2011-12-15 01:35:00
67	67	7	2011-12-15 01:35:00	2011-12-15 01:35:00
68	68	7	2011-12-15 01:35:00	2011-12-15 01:35:00
69	69	7	2011-12-15 01:35:00	2011-12-15 01:35:00
70	70	3	2011-12-15 01:35:00	2011-12-15 01:35:00
71	71	3	2011-12-15 01:35:00	2011-12-15 01:35:00
72	72	3	2011-12-15 01:35:00	2011-12-15 01:35:00
73	73	4	2011-12-15 01:35:00	2011-12-15 01:35:00
74	74	4	2011-12-15 01:35:00	2011-12-15 01:35:00
75	75	4	2011-12-15 01:35:00	2011-12-15 01:35:00
76	76	4	2011-12-15 01:35:00	2011-12-15 01:35:00
77	77	1	2011-12-15 01:35:00	2011-12-15 01:35:00
78	78	1	2011-12-15 01:35:00	2011-12-15 01:35:00
79	79	1	2011-12-15 01:35:00	2011-12-15 01:35:00
80	80	1	2011-12-15 01:35:00	2011-12-15 01:35:00
81	81	1	2011-12-15 01:35:00	2011-12-15 01:35:00
82	82	1	2011-12-15 01:35:00	2011-12-15 01:35:00
83	83	1	2011-12-15 01:35:00	2011-12-15 01:35:00
84	84	7	2011-12-15 01:35:00	2011-12-15 01:35:00
85	85	7	2011-12-15 01:35:00	2011-12-15 01:35:00
86	86	7	2011-12-15 01:35:00	2011-12-15 01:35:00
87	87	7	2011-12-15 01:35:00	2011-12-15 01:35:00
88	88	7	2011-12-15 01:35:00	2011-12-15 01:35:00
89	89	3	2011-12-15 01:35:00	2011-12-15 01:35:00
90	90	3	2011-12-15 01:35:00	2011-12-15 01:35:00
91	91	3	2011-12-15 01:35:00	2011-12-15 01:35:00
92	92	3	2011-12-15 01:35:00	2011-12-15 01:35:00
93	93	3	2011-12-15 01:35:00	2011-12-15 01:35:00
94	94	3	2011-12-15 01:35:00	2011-12-15 01:35:00
95	95	3	2011-12-15 01:35:00	2011-12-15 01:35:00
96	96	3	2011-12-15 01:35:00	2011-12-15 01:35:00
97	97	3	2011-12-15 01:35:00	2011-12-15 01:35:00
98	98	3	2011-12-15 01:35:00	2011-12-15 01:35:00
99	99	8	2011-12-15 01:35:00	2011-12-15 01:35:00
100	100	8	2011-12-15 01:35:00	2011-12-15 01:35:00
101	101	8	2011-12-15 01:35:00	2011-12-15 01:35:00
102	102	10	2011-12-15 01:35:00	2011-12-15 01:35:00
103	103	10	2011-12-15 01:35:00	2011-12-15 01:35:00
104	104	10	2011-12-15 01:35:00	2011-12-15 01:35:00
105	105	10	2011-12-15 01:35:00	2011-12-15 01:35:00
106	106	10	2011-12-15 01:35:00	2011-12-15 01:35:00
107	107	10	2011-12-15 01:35:00	2011-12-15 01:35:00
\.


--
-- Data for Name: Cart; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Cart" (date_created, date_modified, id, user_id, status) FROM stdin;
2011-12-15 01:58:00	2011-12-15 01:58:00	1	20	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	2	11	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	3	17	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	4	12	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	5	10	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	6	18	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	7	2	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	8	15	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	9	13	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	10	21	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	11	5	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	12	19	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	13	8	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	14	6	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	15	16	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	16	4	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	17	1	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	18	3	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	19	14	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	20	9	Open
2011-12-15 01:58:00	2011-12-15 01:58:00	21	7	Open
\.


--
-- Data for Name: CartItem; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "CartItem" (id, cart_id, book_id, quantity, status, date_created, date_modified) FROM stdin;
1	1	47	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
2	2	47	4	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
3	3	47	3	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
4	4	46	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
5	5	47	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
6	6	47	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
7	7	47	4	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
8	8	47	3	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
9	9	47	3	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
10	10	47	3	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
11	11	47	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
12	12	46	2	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
13	13	47	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
14	14	43	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
15	15	47	4	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
16	16	47	4	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
17	17	46	4	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
18	18	47	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
19	19	45	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
20	20	45	2	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
21	21	47	1	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
\.


--
-- Data for Name: Category; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Category" (date_created, date_modified, id, name) FROM stdin;
2011-12-15 01:35:00	2011-12-15 01:35:00	1	Computer
2011-12-15 01:35:00	2011-12-15 01:35:00	2	
2011-12-15 01:35:00	2011-12-15 01:35:00	3	Literature & Fiction
2011-12-15 01:35:00	2011-12-15 01:35:00	4	Accounting & Finance
2011-12-15 01:35:00	2011-12-15 01:35:00	5	Reference
2011-12-15 01:35:00	2011-12-15 01:35:00	6	Romance
2011-12-15 01:35:00	2011-12-15 01:35:00	7	Science
2011-12-15 01:35:00	2011-12-15 01:35:00	8	Home Design
2011-12-15 01:35:00	2011-12-15 01:35:00	9	Horror
2011-12-15 01:36:00	2011-12-15 01:36:00	10	Fantasy
\.


--
-- Data for Name: Creditcard; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Creditcard" (id, address_id, billing_id, name, cc_number, sec_number, exp_date, date_created, date_modified) FROM stdin;
1	1	1	Alex Notwell	4321543265437654	123	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
2	2	2	Alex Notwell	4321543265437654	123	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
3	4	3	Milagros Basta	4321543265438765	354	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
4	6	4	Neil Brittingham	6784543265438765	957	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
5	7	5	Fernando Mcray	4321565245438765	186	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
6	9	6	Liza Yadao	4339565245438765	208	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
7	10	27	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
8	11	28	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
9	12	29	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
10	13	30	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
11	14	31	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
12	15	32	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
13	16	33	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
14	17	34	Ted Syed	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
15	18	41	Kurt Helt	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
16	19	42	Kurt Helt	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
17	20	43	Kurt Helt	4321565245448596	903	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
18	18	44	Kurt Helt	4321565245645643	234	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
19	19	45	Kurt Helt	4321565245645643	234	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
20	20	46	Kurt Helt	4321565245645643	234	2011-12-15	2011-12-15 01:58:00	2011-12-15 01:58:00
\.


--
-- Data for Name: Giftcard; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Giftcard" (billing_id, date_created, date_modified, id, number, pin) FROM stdin;
7	2011-12-15 01:58:00	2011-12-15 01:58:00	1	439592275876572653535243	7219
8	2011-12-15 01:58:00	2011-12-15 01:58:00	2	836528058692839268043209	2745
9	2011-12-15 01:58:00	2011-12-15 01:58:00	3	315755088375991788770284	8365
10	2011-12-15 01:58:00	2011-12-15 01:58:00	4	775309880615800675932233	6301
11	2011-12-15 01:58:00	2011-12-15 01:58:00	5	763107621220758420042958	1863
12	2011-12-15 01:58:00	2011-12-15 01:58:00	6	584996467739528902971305	5997
13	2011-12-15 01:58:00	2011-12-15 01:58:00	7	949798725468865511706117	8075
14	2011-12-15 01:58:00	2011-12-15 01:58:00	8	486753580280764114687726	9150
15	2011-12-15 01:58:00	2011-12-15 01:58:00	9	458891225354608025548401	3596
16	2011-12-15 01:58:00	2011-12-15 01:58:00	10	311614810141454108347288	7972
17	2011-12-15 01:58:00	2011-12-15 01:58:00	11	907138027146764097493498	3902
18	2011-12-15 01:58:00	2011-12-15 01:58:00	12	286152888491993206249069	4541
19	2011-12-15 01:58:00	2011-12-15 01:58:00	13	338529677361937171561268	1845
20	2011-12-15 01:58:00	2011-12-15 01:58:00	14	896700743441324666444893	5441
21	2011-12-15 01:58:00	2011-12-15 01:58:00	15	948751248868025199455692	5039
22	2011-12-15 01:58:00	2011-12-15 01:58:00	16	687466639382922372049949	6315
23	2011-12-15 01:58:00	2011-12-15 01:58:00	17	712765385137940600253084	6491
24	2011-12-15 01:58:00	2011-12-15 01:58:00	18	176730263305533627375936	9686
25	2011-12-15 01:58:00	2011-12-15 01:58:00	19	413778451869646782335372	8670
26	2011-12-15 01:58:00	2011-12-15 01:58:00	20	697051532777325623472235	2924
35	2011-12-15 01:58:00	2011-12-15 01:58:00	21	987629374321565245448596	2222
36	2011-12-15 01:58:00	2011-12-15 01:58:00	22	987629374321565245484756	2348
37	2011-12-15 01:58:00	2011-12-15 01:58:00	23	987629374534523423423423	9383
38	2011-12-15 01:58:00	2011-12-15 01:58:00	24	987629374321565234234354	7821
39	2011-12-15 01:58:00	2011-12-15 01:58:00	25	987629374321565249273546	2917
40	2011-12-15 01:58:00	2011-12-15 01:58:00	26	987629374321565245863524	8734
47	2011-12-15 01:58:00	2011-12-15 01:58:00	27	847586974321565234234354	5687
\.


--
-- Data for Name: Inventory; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Inventory" (book_id, date_created, date_modified, id, quantity, status) FROM stdin;
1	2011-12-15 01:35:00	2011-12-15 01:35:00	1	91	OK
2	2011-12-15 01:35:00	2011-12-15 01:35:00	2	80	OK
3	2011-12-15 01:35:00	2011-12-15 01:35:00	3	80	OK
4	2011-12-15 01:35:00	2011-12-15 01:35:00	4	78	OK
5	2011-12-15 01:35:00	2011-12-15 01:35:00	5	20	OK
6	2011-12-15 01:35:00	2011-12-15 01:35:00	6	19	OK
7	2011-12-15 01:35:00	2011-12-15 01:35:00	7	92	OK
8	2011-12-15 01:35:00	2011-12-15 01:35:00	8	35	OK
9	2011-12-15 01:35:00	2011-12-15 01:35:00	9	49	OK
10	2011-12-15 01:35:00	2011-12-15 01:35:00	10	7	OK
11	2011-12-15 01:35:00	2011-12-15 01:35:00	11	1	OK
12	2011-12-15 01:35:00	2011-12-15 01:35:00	12	67	OK
13	2011-12-15 01:35:00	2011-12-15 01:35:00	13	83	OK
14	2011-12-15 01:35:00	2011-12-15 01:35:00	14	94	OK
15	2011-12-15 01:35:00	2011-12-15 01:35:00	15	48	OK
16	2011-12-15 01:35:00	2011-12-15 01:35:00	16	62	OK
17	2011-12-15 01:35:00	2011-12-15 01:35:00	17	14	OK
18	2011-12-15 01:35:00	2011-12-15 01:35:00	18	69	OK
19	2011-12-15 01:35:00	2011-12-15 01:35:00	19	4	OK
20	2011-12-15 01:35:00	2011-12-15 01:35:00	20	51	OK
21	2011-12-15 01:35:00	2011-12-15 01:35:00	21	80	OK
22	2011-12-15 01:35:00	2011-12-15 01:35:00	22	65	OK
23	2011-12-15 01:35:00	2011-12-15 01:35:00	23	40	OK
24	2011-12-15 01:35:00	2011-12-15 01:35:00	24	72	OK
25	2011-12-15 01:35:00	2011-12-15 01:35:00	25	99	OK
26	2011-12-15 01:35:00	2011-12-15 01:35:00	26	28	OK
27	2011-12-15 01:35:00	2011-12-15 01:35:00	27	65	OK
28	2011-12-15 01:35:00	2011-12-15 01:35:00	28	26	OK
29	2011-12-15 01:35:00	2011-12-15 01:35:00	29	63	OK
30	2011-12-15 01:35:00	2011-12-15 01:35:00	30	84	OK
31	2011-12-15 01:35:00	2011-12-15 01:35:00	31	36	OK
32	2011-12-15 01:35:00	2011-12-15 01:35:00	32	81	OK
33	2011-12-15 01:35:00	2011-12-15 01:35:00	33	11	OK
34	2011-12-15 01:35:00	2011-12-15 01:35:00	34	20	OK
35	2011-12-15 01:35:00	2011-12-15 01:35:00	35	99	OK
36	2011-12-15 01:35:00	2011-12-15 01:35:00	36	41	OK
37	2011-12-15 01:35:00	2011-12-15 01:35:00	37	52	OK
38	2011-12-15 01:35:00	2011-12-15 01:35:00	38	89	OK
39	2011-12-15 01:35:00	2011-12-15 01:35:00	39	93	OK
40	2011-12-15 01:35:00	2011-12-15 01:35:00	40	58	OK
41	2011-12-15 01:35:00	2011-12-15 01:35:00	41	80	OK
42	2011-12-15 01:35:00	2011-12-15 01:35:00	42	8	OK
43	2011-12-15 01:35:00	2011-12-15 01:35:00	43	89	OK
44	2011-12-15 01:35:00	2011-12-15 01:35:00	44	35	OK
45	2011-12-15 01:35:00	2011-12-15 01:35:00	45	49	OK
46	2011-12-15 01:35:00	2011-12-15 01:35:00	46	32	OK
47	2011-12-15 01:35:00	2011-12-15 01:35:00	47	21	OK
48	2011-12-15 01:35:00	2011-12-15 01:35:00	48	18	OK
49	2011-12-15 01:35:00	2011-12-15 01:35:00	49	49	OK
50	2011-12-15 01:35:00	2011-12-15 01:35:00	50	98	OK
51	2011-12-15 01:35:00	2011-12-15 01:35:00	51	16	OK
52	2011-12-15 01:35:00	2011-12-15 01:35:00	52	23	OK
53	2011-12-15 01:35:00	2011-12-15 01:35:00	53	58	OK
54	2011-12-15 01:35:00	2011-12-15 01:35:00	54	48	OK
55	2011-12-15 01:35:00	2011-12-15 01:35:00	55	59	OK
56	2011-12-15 01:35:00	2011-12-15 01:35:00	56	77	OK
57	2011-12-15 01:35:00	2011-12-15 01:35:00	57	32	OK
58	2011-12-15 01:35:00	2011-12-15 01:35:00	58	64	OK
59	2011-12-15 01:35:00	2011-12-15 01:35:00	59	39	OK
60	2011-12-15 01:35:00	2011-12-15 01:35:00	60	19	OK
61	2011-12-15 01:35:00	2011-12-15 01:35:00	61	39	OK
62	2011-12-15 01:35:00	2011-12-15 01:35:00	62	42	OK
63	2011-12-15 01:35:00	2011-12-15 01:35:00	63	98	OK
64	2011-12-15 01:35:00	2011-12-15 01:35:00	64	93	OK
65	2011-12-15 01:35:00	2011-12-15 01:35:00	65	26	OK
66	2011-12-15 01:35:00	2011-12-15 01:35:00	66	23	OK
67	2011-12-15 01:35:00	2011-12-15 01:35:00	67	65	OK
68	2011-12-15 01:35:00	2011-12-15 01:35:00	68	81	OK
69	2011-12-15 01:35:00	2011-12-15 01:35:00	69	37	OK
70	2011-12-15 01:35:00	2011-12-15 01:35:00	70	13	OK
71	2011-12-15 01:35:00	2011-12-15 01:35:00	71	58	OK
72	2011-12-15 01:35:00	2011-12-15 01:35:00	72	62	OK
73	2011-12-15 01:36:00	2011-12-15 01:36:00	73	86	OK
74	2011-12-15 01:36:00	2011-12-15 01:36:00	74	70	OK
75	2011-12-15 01:36:00	2011-12-15 01:36:00	75	76	OK
76	2011-12-15 01:36:00	2011-12-15 01:36:00	76	24	OK
77	2011-12-15 01:36:00	2011-12-15 01:36:00	77	7	OK
78	2011-12-15 01:36:00	2011-12-15 01:36:00	78	89	OK
79	2011-12-15 01:36:00	2011-12-15 01:36:00	79	41	OK
80	2011-12-15 01:36:00	2011-12-15 01:36:00	80	88	OK
81	2011-12-15 01:36:00	2011-12-15 01:36:00	81	5	OK
82	2011-12-15 01:36:00	2011-12-15 01:36:00	82	81	OK
83	2011-12-15 01:36:00	2011-12-15 01:36:00	83	8	OK
84	2011-12-15 01:36:00	2011-12-15 01:36:00	84	60	OK
85	2011-12-15 01:36:00	2011-12-15 01:36:00	85	2	OK
86	2011-12-15 01:36:00	2011-12-15 01:36:00	86	45	OK
87	2011-12-15 01:36:00	2011-12-15 01:36:00	87	42	OK
88	2011-12-15 01:36:00	2011-12-15 01:36:00	88	87	OK
89	2011-12-15 01:36:00	2011-12-15 01:36:00	89	73	OK
90	2011-12-15 01:36:00	2011-12-15 01:36:00	90	27	OK
91	2011-12-15 01:36:00	2011-12-15 01:36:00	91	22	OK
92	2011-12-15 01:36:00	2011-12-15 01:36:00	92	50	OK
93	2011-12-15 01:36:00	2011-12-15 01:36:00	93	21	OK
94	2011-12-15 01:36:00	2011-12-15 01:36:00	94	31	OK
95	2011-12-15 01:36:00	2011-12-15 01:36:00	95	32	OK
96	2011-12-15 01:36:00	2011-12-15 01:36:00	96	43	OK
97	2011-12-15 01:36:00	2011-12-15 01:36:00	97	14	OK
98	2011-12-15 01:36:00	2011-12-15 01:36:00	98	52	OK
99	2011-12-15 01:36:00	2011-12-15 01:36:00	99	31	OK
100	2011-12-15 01:36:00	2011-12-15 01:36:00	100	84	OK
101	2011-12-15 01:36:00	2011-12-15 01:36:00	101	14	OK
102	2011-12-15 01:36:00	2011-12-15 01:36:00	102	95	OK
103	2011-12-15 01:36:00	2011-12-15 01:36:00	103	39	OK
104	2011-12-15 01:36:00	2011-12-15 01:36:00	104	60	OK
105	2011-12-15 01:36:00	2011-12-15 01:36:00	105	97	OK
106	2011-12-15 01:36:00	2011-12-15 01:36:00	106	11	OK
107	2011-12-15 01:36:00	2011-12-15 01:36:00	107	10	OK
\.


--
-- Data for Name: InventoryOrder; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "InventoryOrder" (cost, cur_quantity, date_created, date_modified, id, inventory_id, orig_quantity) FROM stdin;
49.95	20	2011-12-15 01:40:00	2011-12-15 01:40:00	1	5	20
99.0	20	2011-12-15 01:40:00	2011-12-15 01:40:00	2	6	19
69.99	20	2011-12-15 01:40:00	2011-12-15 01:40:00	3	8	35
38.49	20	2011-12-15 01:40:00	2011-12-15 01:40:00	4	9	49
95.0	20	2011-12-15 01:40:00	2011-12-15 01:40:00	5	10	7
41.99	20	2011-12-15 01:40:00	2011-12-15 01:40:00	6	11	1
24.95	20	2011-12-15 01:40:00	2011-12-15 01:40:00	7	15	48
13.0	20	2011-12-15 01:40:00	2011-12-15 01:40:00	8	17	14
3.44	20	2011-12-15 01:40:00	2011-12-15 01:40:00	9	19	4
25.95	20	2011-12-15 01:40:00	2011-12-15 01:40:00	10	23	40
12.99	20	2011-12-15 01:40:00	2011-12-15 01:40:00	11	26	28
6.99	20	2011-12-15 01:40:00	2011-12-15 01:40:00	12	28	26
15.0	20	2011-12-15 01:40:00	2011-12-15 01:40:00	13	31	36
44.95	20	2011-12-15 01:40:00	2011-12-15 01:40:00	14	33	11
22.0	20	2011-12-15 01:40:00	2011-12-15 01:40:00	15	34	20
24.95	20	2011-12-15 01:40:00	2011-12-15 01:40:00	16	36	41
70.0	20	2011-12-15 01:40:00	2011-12-15 01:40:00	17	42	8
79.2	20	2011-12-15 01:41:00	2011-12-15 01:41:00	18	44	35
112.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	19	45	49
139.2	20	2011-12-15 01:41:00	2011-12-15 01:41:00	20	46	32
126.67	20	2011-12-15 01:41:00	2011-12-15 01:41:00	21	47	21
24.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	22	48	18
25.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	23	49	49
19.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	24	51	16
6.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	25	52	23
24.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	26	54	48
7.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	27	57	32
11.2	20	2011-12-15 01:41:00	2011-12-15 01:41:00	28	59	39
16.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	29	60	19
39.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	30	61	39
39.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	31	62	42
17.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	32	65	26
10.5	20	2011-12-15 01:41:00	2011-12-15 01:41:00	33	66	23
18.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	34	69	37
6.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	35	70	13
50.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	36	76	24
83.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	37	77	7
39.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	38	79	41
29.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	39	81	5
59.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	40	83	8
35.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	41	85	2
6.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	42	86	45
7.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	43	87	42
11.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	44	90	27
14.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	45	91	22
14.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	46	93	21
13.0	20	2011-12-15 01:41:00	2011-12-15 01:41:00	47	94	31
25.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	48	95	32
7.5	20	2011-12-15 01:41:00	2011-12-15 01:41:00	49	96	43
14.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	50	97	14
39.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	51	99	31
19.95	20	2011-12-15 01:41:00	2011-12-15 01:41:00	52	101	14
7.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	53	103	39
7.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	54	106	11
7.99	20	2011-12-15 01:41:00	2011-12-15 01:41:00	55	107	10
\.


--
-- Data for Name: Order; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Order" (id, user_id, cart_id, shipping, tax, status, date_created, date_modified) FROM stdin;
1	20	1	5	8.936900000000001	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
2	11	2	5	35.747600000000006	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
3	17	3	5	26.810700000000004	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
4	12	4	5	9.814	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
5	10	5	5	8.936900000000001	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
6	18	6	5	8.936900000000001	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
7	2	7	5	35.747600000000006	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
8	15	8	5	26.810700000000004	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
9	13	9	5	26.810700000000004	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
10	21	10	5	26.810700000000004	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
11	5	11	5	8.936900000000001	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
12	19	12	5	19.628	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
13	8	13	5	8.936900000000001	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
14	6	14	5	8.645000000000001	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
15	16	15	5	35.747600000000006	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
16	4	16	5	35.747600000000006	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
17	1	17	5	39.256	Shipped	2011-12-15 01:58:00	2011-12-15 01:58:00
18	3	18	5	8.936900000000001	Shipped	2011-12-15 01:59:00	2011-12-15 01:59:00
19	14	19	5	7.976500000000001	Shipped	2011-12-15 01:59:00	2011-12-15 01:59:00
20	9	20	5	15.953000000000001	Shipped	2011-12-15 01:59:00	2011-12-15 01:59:00
21	7	21	5	8.936900000000001	Shipped	2011-12-15 01:59:00	2011-12-15 01:59:00
\.


--
-- Data for Name: OrderItem; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "OrderItem" (id, order_id, book_id, quantity, cost, price, status, date_created, date_modified) FROM stdin;
1	1	47	1	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
2	2	47	4	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
3	3	47	3	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
4	4	46	1	139.2	140.2	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
5	5	47	1	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
6	6	47	1	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
7	7	47	4	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
8	8	47	3	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
9	9	47	3	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
10	10	47	3	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
11	11	47	1	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
12	12	46	2	139.2	140.2	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
13	13	47	1	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
14	14	43	1	122.5	123.5	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
15	15	47	4	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
16	16	47	4	126.67	127.67	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
17	17	46	4	139.2	140.2	OK	2011-12-15 01:58:00	2011-12-15 01:58:00
18	18	47	1	126.67	127.67	OK	2011-12-15 01:59:00	2011-12-15 01:59:00
19	19	45	1	112.95	113.95	OK	2011-12-15 01:59:00	2011-12-15 01:59:00
20	20	45	2	112.95	113.95	OK	2011-12-15 01:59:00	2011-12-15 01:59:00
21	21	47	1	126.67	127.67	OK	2011-12-15 01:59:00	2011-12-15 01:59:00
\.


--
-- Data for Name: OrderPayment; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "OrderPayment" (id, order_id, billing_id, price, date_created, date_modified) FROM stdin;
1	1	34	141.6069	2011-12-15 01:58:00	2011-12-15 01:58:00
2	2	\N	551.4276	2011-12-15 01:58:00	2011-12-15 01:58:00
3	3	\N	414.8207	2011-12-15 01:58:00	2011-12-15 01:58:00
4	4	\N	155.01399999999998	2011-12-15 01:58:00	2011-12-15 01:58:00
5	5	\N	141.6069	2011-12-15 01:58:00	2011-12-15 01:58:00
6	6	\N	141.6069	2011-12-15 01:58:00	2011-12-15 01:58:00
7	7	3	551.4276	2011-12-15 01:58:00	2011-12-15 01:58:00
8	8	\N	414.8207	2011-12-15 01:58:00	2011-12-15 01:58:00
9	9	\N	414.8207	2011-12-15 01:58:00	2011-12-15 01:58:00
10	10	2	414.8207	2011-12-15 01:58:00	2011-12-15 01:58:00
11	11	5	141.6069	2011-12-15 01:58:00	2011-12-15 01:58:00
12	12	\N	305.02799999999996	2011-12-15 01:58:00	2011-12-15 01:58:00
13	13	\N	141.6069	2011-12-15 01:58:00	2011-12-15 01:58:00
14	14	\N	137.145	2011-12-15 01:58:00	2011-12-15 01:58:00
15	15	26	551.4276	2011-12-15 01:58:00	2011-12-15 01:58:00
16	16	4	551.4276	2011-12-15 01:58:00	2011-12-15 01:58:00
17	17	\N	605.0559999999999	2011-12-15 01:58:00	2011-12-15 01:58:00
18	18	\N	141.6069	2011-12-15 01:59:00	2011-12-15 01:59:00
19	19	40	126.9265	2011-12-15 01:59:00	2011-12-15 01:59:00
20	20	\N	248.853	2011-12-15 01:59:00	2011-12-15 01:59:00
21	21	47	141.6069	2011-12-15 01:59:00	2011-12-15 01:59:00
\.


--
-- Data for Name: Publisher; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "Publisher" (city, country, date_created, date_modified, established_date, id, name, state) FROM stdin;
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	1	Sybex	NY
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	2		MI
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	3	McGraw-Hill Osborne Media	WA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	4	John Wiley & Sons	CA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	5	Morgan Kaufmann	CA
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	6	Schmidt Ink, Inc.	IL
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	7	Addison-Wesley Pub Co	IL
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	8	Macromedia Press	IL
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	9	Addison-Wesley Publishing	NY
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	10	Wrox Press Inc	MI
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	11	Berkley Pub Group	CA
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	12	Penguin USA 	IL
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	13	O'Reilly & Associates	IL
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	14	McGraw-Hill Trade	CA
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	15	Picador	WA
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	16	St. Martin's Press	WA
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	17	Crown Pub	NY
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	18	Little Brown & Company	MI
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	19	Simon & Schuster	MI
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	20	HarperCollins	IL
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	21	Jossey-Bass	NY
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	22	Multnomah Publishers Inc.	NY
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	23	Perennial	WA
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	24	Dell Pub Co	WA
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	25	Harlequin	IL
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	26	Viking Press	WA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	27	Random House	CA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	28	Knopf	CA
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	29	Wolfram Media, Inc.	IL
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	30	Fireside	NY
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	31	Random House Trade Paperbacks	IL
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	32	Gibbs Smith Publisher	WA
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	33	Taunton Pr	MI
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	34	Vendome Pr	MI
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	35	Clarkson N. Potter	CA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	36	MIT Press	CA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	37	McGraw-Hill/Irwin	CA
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	38	South-Western College Pub	WA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	39	Prentice Hall	CA
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	40	Warner Books	MI
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	41	Scribner	WA
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	42	Pocket Books	WA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	43	Pantheon Books	CA
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	44	Del Rey	NY
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	45	Doubleday	WA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	46	Donald M. Grant Publisher, Inc.	CA
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	47	Vintage Books	CA
Detroit	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	48	Scribner Paperback Fiction	MI
Chicago	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	49	Harvest Books	IL
Seattle	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	50	Harperperennial Library	WA
New York	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	51	W.W. Norton & Company	NY
Palo Alto	United States	2011-12-15 01:35:00	2011-12-15 01:35:00	2011-12-15	52	Harvard Univ Pr	CA
Seattle	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	53	Prentice Hall PTR	WA
Palo Alto	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	54	New Riders Publishing	CA
Detroit	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	55	Ballantine Books 	MI
New York	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	56	Ballantine Books	NY
Detroit	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	57	Back Bay Books	MI
New York	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	58	Anchor Books	NY
Seattle	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	59	Putnam Pub Group	WA
New York	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	60	Silhouette	NY
Seattle	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	61	Lark Books	WA
Seattle	United States	2011-12-15 01:36:00	2011-12-15 01:36:00	2011-12-15	62	Harper	WA
\.


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "User" (date_created, date_modified, email, id, name, password, phone, username) FROM stdin;
2011-12-15 01:58:00	2011-12-15 01:58:00	dsheffey@bitbook.com	1	Dona Sheffey	mypass	6141231234	dsheffey
2011-12-15 01:58:00	2011-12-15 01:58:00	mbasta@gmail.com	2	Milagros Basta	password	6141231234	mbasta
2011-12-15 01:58:00	2011-12-15 01:58:00	ccrandle@yahoo.com	3	Chandra Crandle	pass1234	6141231234	ccrandle
2011-12-15 01:58:00	2011-12-15 01:58:00	nbritt@hotmail.com	4	Neil Brittingham	p1a2s3s4	6141231234	nbritt
2011-12-15 01:58:00	2011-12-15 01:58:00	fmcray@hotmail.com	5	Fernando Mcray	fernpass	6141231234	fmcray
2011-12-15 01:58:00	2011-12-15 01:58:00	hrozar@yahoo.com	6	Hugh Rozar	rozpass1	6141231234	hrozar
2011-12-15 01:58:00	2011-12-15 01:58:00	khelt@gmail.com	7	Kurt Helt	mypassword	6141231234	khelt
2011-12-15 01:58:00	2011-12-15 01:58:00	efierros@bitbook.com	8	Erik Fierros	passerik	6141231234	efierros
2011-12-15 01:58:00	2011-12-15 01:58:00	mkono@bitbook.com	9	Marcie Kono	marc123	6141231234	mkono
2011-12-15 01:58:00	2011-12-15 01:58:00	mwafford@bitbook.com	10	Mathew Wafford	passwordmatt	6141231234	mwafford
2011-12-15 01:58:00	2011-12-15 01:58:00	kgrajales@gmail.com	11	Kelly Grajales	kgpassw	6141231234	kgrajales
2011-12-15 01:58:00	2011-12-15 01:58:00	cbrimer@gmail.com	12	Cody Brimer	cbrimpass	6141231234	cbrimer
2011-12-15 01:58:00	2011-12-15 01:58:00	bdoubleday@facebook.com	13	Benita Doubleday	bdub123	6141231234	bdouble
2011-12-15 01:58:00	2011-12-15 01:58:00	dsaul@yahoo.com	14	Darren Saulsberry	dspass	6141231234	dsaul
2011-12-15 01:58:00	2011-12-15 01:58:00	eherdt@gmail.com	15	Edwina Herdt	mypass12	6141231234	eherdt
2011-12-15 01:58:00	2011-12-15 01:58:00	lyadao@gmail.com	16	Liza Yadao	lize565	6141231234	lyadao
2011-12-15 01:58:00	2011-12-15 01:58:00	jpanza@yahoo.com	17	Javier Panza	password999	6141231234	jpanza
2011-12-15 01:58:00	2011-12-15 01:58:00	equashie@hotmail.com	18	Esmeralda Quashie	eqpass9898	6141231234	equashie
2011-12-15 01:58:00	2011-12-15 01:58:00	emaio@hotmail.com	19	Earlene Maio	thepassword	6141231234	emaio
2011-12-15 01:58:00	2011-12-15 01:58:00	tsyed@yahoo.com	20	Ted Syed	tspassword	6141231234	tseyd
2011-12-15 01:58:00	2011-12-15 01:58:00	notwella@me.com	21	Alex Notwell	login	5174031662	anotwell
2011-12-15 02:00:00	2011-12-15 02:00:00	ryan@ryanmcg.com	22		pogmohoin	6146784408	RyanMcG
\.


--
-- Data for Name: UserAddress; Type: TABLE DATA; Schema: public; Owner: bitbook
--

COPY "UserAddress" (address1, address2, city, country, date_created, date_modified, id, name, state, status, user_id, zip) FROM stdin;
123 Neil Avenue		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	1	Alex Notwell	OH	OK	21	43201
2046 Bedford Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	2	Alex Notwell	OH	OK	21	43212
1800 King Avenue		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	3	Alex Notwell	OH	OK	21	43212
1700 Essex Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	4	Milagros Basta	OH	OK	2	43221
203 3rd Avenue	Apt. 101	Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	5	Milagros Basta	OH	OK	2	43201
1710 Essex Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	6	Neil Brittingham	OH	OK	4	43221
1801 Guilford Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	7	Fernando Mcray	OH	OK	5	43221
2403 Main Street		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	8	Fernando Mcray	OH	OK	5	43200
1325 Tremont Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	9	Liza Yadao	OH	OK	16	43212
212 Running Farm Lane	Apt. 101	Palo Alto	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	10	Ted Syed	CA	OK	20	97802
2934 Coventry Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	11	Ted Syed	OH	OK	20	43212
4234 West Devon Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	12	Ted Syed	OH	OK	20	43212
383 Ashdowne Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	13	Ted Syed	OH	OK	20	43212
2383 Arlington Avenue		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	14	Ted Syed	OH	OK	20	43212
1283 Club Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	15	Ted Syed	OH	OK	20	42122
1282 Cardiff Road		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	16	Ted Syed	OH	OK	20	43211
2398 Lane Avenue		Columbus	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	17	Ted Syed	OH	OK	20	43222
212 Farm Lane		Palo Alto	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	18	Kurt Helt	CA	OK	7	97802
213 Farm Lane		Palo Alto	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	19	Kurt Helt	CA	OK	7	97802
214 Farm Lane		Palo Alto	United States	2011-12-15 01:58:00	2011-12-15 01:58:00	20	Kurt Helt	CA	OK	7	97802
\.


--
-- Name: Admin_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Admin"
    ADD CONSTRAINT "Admin_pkey" PRIMARY KEY (id);


--
-- Name: Author_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Author"
    ADD CONSTRAINT "Author_pkey" PRIMARY KEY (id);


--
-- Name: Billing_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Billing"
    ADD CONSTRAINT "Billing_pkey" PRIMARY KEY (id);


--
-- Name: Book_Author_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Book_Author"
    ADD CONSTRAINT "Book_Author_pkey" PRIMARY KEY (id);


--
-- Name: Book_Category_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Book_Category"
    ADD CONSTRAINT "Book_Category_pkey" PRIMARY KEY (id);


--
-- Name: Book_isbn_key; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Book"
    ADD CONSTRAINT "Book_isbn_key" UNIQUE (isbn);


--
-- Name: Book_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Book"
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (id);


--
-- Name: CartItem_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "CartItem"
    ADD CONSTRAINT "CartItem_pkey" PRIMARY KEY (id);


--
-- Name: Cart_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Cart"
    ADD CONSTRAINT "Cart_pkey" PRIMARY KEY (id);


--
-- Name: Category_name_key; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Category"
    ADD CONSTRAINT "Category_name_key" UNIQUE (name);


--
-- Name: Category_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Category"
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (id);


--
-- Name: Creditcard_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Creditcard"
    ADD CONSTRAINT "Creditcard_pkey" PRIMARY KEY (id);


--
-- Name: Giftcard_number_key; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Giftcard"
    ADD CONSTRAINT "Giftcard_number_key" UNIQUE (number);


--
-- Name: Giftcard_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Giftcard"
    ADD CONSTRAINT "Giftcard_pkey" PRIMARY KEY (id);


--
-- Name: InventoryOrder_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "InventoryOrder"
    ADD CONSTRAINT "InventoryOrder_pkey" PRIMARY KEY (id);


--
-- Name: Inventory_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Inventory"
    ADD CONSTRAINT "Inventory_pkey" PRIMARY KEY (id);


--
-- Name: OrderItem_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "OrderItem"
    ADD CONSTRAINT "OrderItem_pkey" PRIMARY KEY (id);


--
-- Name: OrderPayment_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "OrderPayment"
    ADD CONSTRAINT "OrderPayment_pkey" PRIMARY KEY (id);


--
-- Name: Order_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (id);


--
-- Name: Publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "Publisher"
    ADD CONSTRAINT "Publisher_pkey" PRIMARY KEY (id);


--
-- Name: UserAddress_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "UserAddress"
    ADD CONSTRAINT "UserAddress_pkey" PRIMARY KEY (id);


--
-- Name: User_email_key; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_email_key" UNIQUE (email);


--
-- Name: User_pkey; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: User_username_key; Type: CONSTRAINT; Schema: public; Owner: bitbook; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_username_key" UNIQUE (username);


--
-- Name: Admin_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Admin"
    ADD CONSTRAINT "Admin_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "User"(id);


--
-- Name: Billing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Billing"
    ADD CONSTRAINT "Billing_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "User"(id);


--
-- Name: Book_Author_author_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Book_Author"
    ADD CONSTRAINT "Book_Author_author_id_fkey" FOREIGN KEY (author_id) REFERENCES "Author"(id);


--
-- Name: Book_Author_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Book_Author"
    ADD CONSTRAINT "Book_Author_book_id_fkey" FOREIGN KEY (book_id) REFERENCES "Book"(id);


--
-- Name: Book_Category_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Book_Category"
    ADD CONSTRAINT "Book_Category_book_id_fkey" FOREIGN KEY (book_id) REFERENCES "Book"(id);


--
-- Name: Book_Category_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Book_Category"
    ADD CONSTRAINT "Book_Category_category_id_fkey" FOREIGN KEY (category_id) REFERENCES "Category"(id);


--
-- Name: Book_publisher_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Book"
    ADD CONSTRAINT "Book_publisher_id_fkey" FOREIGN KEY (publisher_id) REFERENCES "Publisher"(id);


--
-- Name: CartItem_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "CartItem"
    ADD CONSTRAINT "CartItem_book_id_fkey" FOREIGN KEY (book_id) REFERENCES "Book"(id);


--
-- Name: CartItem_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "CartItem"
    ADD CONSTRAINT "CartItem_cart_id_fkey" FOREIGN KEY (cart_id) REFERENCES "Cart"(id);


--
-- Name: Cart_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Cart"
    ADD CONSTRAINT "Cart_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "User"(id);


--
-- Name: Creditcard_address_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Creditcard"
    ADD CONSTRAINT "Creditcard_address_id_fkey" FOREIGN KEY (address_id) REFERENCES "UserAddress"(id);


--
-- Name: Creditcard_billing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Creditcard"
    ADD CONSTRAINT "Creditcard_billing_id_fkey" FOREIGN KEY (billing_id) REFERENCES "Billing"(id);


--
-- Name: Giftcard_billing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Giftcard"
    ADD CONSTRAINT "Giftcard_billing_id_fkey" FOREIGN KEY (billing_id) REFERENCES "Billing"(id);


--
-- Name: InventoryOrder_inventory_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "InventoryOrder"
    ADD CONSTRAINT "InventoryOrder_inventory_id_fkey" FOREIGN KEY (inventory_id) REFERENCES "Inventory"(id);


--
-- Name: Inventory_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Inventory"
    ADD CONSTRAINT "Inventory_book_id_fkey" FOREIGN KEY (book_id) REFERENCES "Book"(id);


--
-- Name: OrderItem_book_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "OrderItem"
    ADD CONSTRAINT "OrderItem_book_id_fkey" FOREIGN KEY (book_id) REFERENCES "Book"(id);


--
-- Name: OrderItem_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "OrderItem"
    ADD CONSTRAINT "OrderItem_order_id_fkey" FOREIGN KEY (order_id) REFERENCES "Order"(id);


--
-- Name: OrderPayment_billing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "OrderPayment"
    ADD CONSTRAINT "OrderPayment_billing_id_fkey" FOREIGN KEY (billing_id) REFERENCES "Billing"(id);


--
-- Name: OrderPayment_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "OrderPayment"
    ADD CONSTRAINT "OrderPayment_order_id_fkey" FOREIGN KEY (order_id) REFERENCES "Order"(id);


--
-- Name: Order_cart_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Order"
    ADD CONSTRAINT "Order_cart_id_fkey" FOREIGN KEY (cart_id) REFERENCES "Cart"(id);


--
-- Name: Order_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "Order"
    ADD CONSTRAINT "Order_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "User"(id);


--
-- Name: UserAddress_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: bitbook
--

ALTER TABLE ONLY "UserAddress"
    ADD CONSTRAINT "UserAddress_user_id_fkey" FOREIGN KEY (user_id) REFERENCES "User"(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

