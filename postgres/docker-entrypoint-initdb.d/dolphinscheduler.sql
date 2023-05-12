--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Debian 12.13-1.pgdg110+1)
-- Dumped by pg_dump version 12.13 (Debian 12.13-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: products; Type: TABLE; Schema: public; Owner: etl
--
DROP TABLE IF EXISTS public.products;
CREATE TABLE public.products (
    id integer NOT NULL,
    product_code character varying(15) NOT NULL,
    product_name character varying(70) NOT NULL,
    product_line character varying(50),
    product_scale character varying(10),
    product_count character varying(10),
    product_base character varying(10),
    product_vendor character varying(50),
    product_description text,
    quantity_in_stock smallint,
    buy_price numeric(10,2),
    msrp numeric(10,2)
);


ALTER TABLE public.products OWNER TO etl;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO etl;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO etl;

--
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO etl;

--
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO etl;

--
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(200) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint NOT NULL,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO etl;

--
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO etl;

--
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO etl;

--
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO etl;

--
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO etl;

--
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO etl;

--
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO etl;

--
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO etl;

--
-- Name: t_ds_access_token_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_access_token_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_access_token_id_sequence OWNER TO etl;

--
-- Name: t_ds_access_token; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_access_token (
    id integer DEFAULT nextval('public.t_ds_access_token_id_sequence'::regclass) NOT NULL,
    user_id integer,
    token character varying(64) DEFAULT NULL::character varying,
    expire_time timestamp without time zone,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_access_token OWNER TO etl;

--
-- Name: t_ds_alert_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_alert_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_alert_id_sequence OWNER TO etl;

--
-- Name: t_ds_alert; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_alert (
    id integer DEFAULT nextval('public.t_ds_alert_id_sequence'::regclass) NOT NULL,
    title character varying(64) DEFAULT NULL::character varying,
    sign character varying(40) DEFAULT ''::character varying NOT NULL,
    content text,
    alert_status integer DEFAULT 0,
    warning_type integer DEFAULT 2,
    log text,
    alertgroup_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    project_code bigint,
    process_definition_code bigint,
    process_instance_id integer,
    alert_type integer
);


ALTER TABLE public.t_ds_alert OWNER TO etl;

--
-- Name: COLUMN t_ds_alert.sign; Type: COMMENT; Schema: public; Owner: etl
--

COMMENT ON COLUMN public.t_ds_alert.sign IS 'sign=sha1(content)';


--
-- Name: t_ds_alert_plugin_instance; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_alert_plugin_instance (
    id integer NOT NULL,
    plugin_define_id integer NOT NULL,
    plugin_instance_params text,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    instance_name character varying(200)
);


ALTER TABLE public.t_ds_alert_plugin_instance OWNER TO etl;

--
-- Name: t_ds_alert_plugin_instance_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_alert_plugin_instance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_alert_plugin_instance_id_seq OWNER TO etl;

--
-- Name: t_ds_alert_plugin_instance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_alert_plugin_instance_id_seq OWNED BY public.t_ds_alert_plugin_instance.id;


--
-- Name: t_ds_alert_send_status; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_alert_send_status (
    id integer NOT NULL,
    alert_id integer NOT NULL,
    alert_plugin_instance_id integer NOT NULL,
    send_status integer DEFAULT 0,
    log text,
    create_time timestamp without time zone
);


ALTER TABLE public.t_ds_alert_send_status OWNER TO etl;

--
-- Name: t_ds_alert_send_status_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_alert_send_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_alert_send_status_id_seq OWNER TO etl;

--
-- Name: t_ds_alert_send_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_alert_send_status_id_seq OWNED BY public.t_ds_alert_send_status.id;


--
-- Name: t_ds_alertgroup_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_alertgroup_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_alertgroup_id_sequence OWNER TO etl;

--
-- Name: t_ds_alertgroup; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_alertgroup (
    id integer DEFAULT nextval('public.t_ds_alertgroup_id_sequence'::regclass) NOT NULL,
    alert_instance_ids character varying(255) DEFAULT NULL::character varying,
    create_user_id integer,
    group_name character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_alertgroup OWNER TO etl;

--
-- Name: t_ds_audit_log; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_audit_log (
    id integer NOT NULL,
    user_id integer NOT NULL,
    resource_type integer NOT NULL,
    operation integer NOT NULL,
    "time" timestamp without time zone,
    resource_id integer NOT NULL
);


ALTER TABLE public.t_ds_audit_log OWNER TO etl;

--
-- Name: t_ds_audit_log_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_audit_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_audit_log_id_seq OWNER TO etl;

--
-- Name: t_ds_audit_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_audit_log_id_seq OWNED BY public.t_ds_audit_log.id;


--
-- Name: t_ds_cluster; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_cluster (
    id integer NOT NULL,
    code bigint NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    config text,
    description text,
    operator integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_cluster OWNER TO etl;

--
-- Name: t_ds_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_cluster_id_seq OWNER TO etl;

--
-- Name: t_ds_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_cluster_id_seq OWNED BY public.t_ds_cluster.id;


--
-- Name: t_ds_command_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_command_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_command_id_sequence OWNER TO etl;

--
-- Name: t_ds_command; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_command (
    id integer DEFAULT nextval('public.t_ds_command_id_sequence'::regclass) NOT NULL,
    command_type integer,
    process_definition_code bigint NOT NULL,
    command_param text,
    task_depend_type integer,
    failure_strategy integer DEFAULT 0,
    warning_type integer DEFAULT 0,
    warning_group_id integer,
    schedule_time timestamp without time zone,
    start_time timestamp without time zone,
    executor_id integer,
    update_time timestamp without time zone,
    process_instance_priority integer DEFAULT 2,
    worker_group character varying(64),
    environment_code bigint DEFAULT '-1'::bigint,
    dry_run integer DEFAULT 0,
    process_instance_id integer DEFAULT 0,
    process_definition_version integer DEFAULT 0
);


ALTER TABLE public.t_ds_command OWNER TO etl;

--
-- Name: t_ds_datasource_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_datasource_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_datasource_id_sequence OWNER TO etl;

--
-- Name: t_ds_datasource; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_datasource (
    id integer DEFAULT nextval('public.t_ds_datasource_id_sequence'::regclass) NOT NULL,
    name character varying(64) NOT NULL,
    note character varying(255) DEFAULT NULL::character varying,
    type integer NOT NULL,
    user_id integer NOT NULL,
    connection_params text NOT NULL,
    create_time timestamp without time zone NOT NULL,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_datasource OWNER TO etl;

--
-- Name: t_ds_dq_comparison_type; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_dq_comparison_type (
    id integer NOT NULL,
    type character varying NOT NULL,
    execute_sql character varying,
    output_table character varying,
    name character varying,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    is_inner_source boolean
);


ALTER TABLE public.t_ds_dq_comparison_type OWNER TO etl;

--
-- Name: t_ds_dq_comparison_type_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_dq_comparison_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_dq_comparison_type_id_seq OWNER TO etl;

--
-- Name: t_ds_dq_comparison_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_dq_comparison_type_id_seq OWNED BY public.t_ds_dq_comparison_type.id;


--
-- Name: t_ds_dq_execute_result; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_dq_execute_result (
    id integer NOT NULL,
    process_definition_id integer,
    process_instance_id integer,
    task_instance_id integer,
    rule_type integer,
    rule_name character varying(255) DEFAULT NULL::character varying,
    statistics_value double precision,
    comparison_value double precision,
    check_type integer,
    threshold double precision,
    operator integer,
    failure_strategy integer,
    state integer,
    user_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    comparison_type integer,
    error_output_path text
);


ALTER TABLE public.t_ds_dq_execute_result OWNER TO etl;

--
-- Name: t_ds_dq_execute_result_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_dq_execute_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_dq_execute_result_id_seq OWNER TO etl;

--
-- Name: t_ds_dq_execute_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_dq_execute_result_id_seq OWNED BY public.t_ds_dq_execute_result.id;


--
-- Name: t_ds_dq_rule; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_dq_rule (
    id integer NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    type integer,
    user_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_dq_rule OWNER TO etl;

--
-- Name: t_ds_dq_rule_execute_sql; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_dq_rule_execute_sql (
    id integer NOT NULL,
    index integer,
    sql text,
    table_alias character varying(255) DEFAULT NULL::character varying,
    type integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    is_error_output_sql boolean
);


ALTER TABLE public.t_ds_dq_rule_execute_sql OWNER TO etl;

--
-- Name: t_ds_dq_rule_execute_sql_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_dq_rule_execute_sql_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_dq_rule_execute_sql_id_seq OWNER TO etl;

--
-- Name: t_ds_dq_rule_execute_sql_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_dq_rule_execute_sql_id_seq OWNED BY public.t_ds_dq_rule_execute_sql.id;


--
-- Name: t_ds_dq_rule_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_dq_rule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_dq_rule_id_seq OWNER TO etl;

--
-- Name: t_ds_dq_rule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_dq_rule_id_seq OWNED BY public.t_ds_dq_rule.id;


--
-- Name: t_ds_dq_rule_input_entry; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_dq_rule_input_entry (
    id integer NOT NULL,
    field character varying(255) DEFAULT NULL::character varying,
    type character varying(255) DEFAULT NULL::character varying,
    title character varying(255) DEFAULT NULL::character varying,
    value character varying(255) DEFAULT NULL::character varying,
    options text,
    placeholder character varying(255) DEFAULT NULL::character varying,
    option_source_type integer,
    value_type integer,
    input_type integer,
    is_show smallint DEFAULT '1'::smallint,
    can_edit smallint DEFAULT '1'::smallint,
    is_emit smallint DEFAULT '0'::smallint,
    is_validate smallint DEFAULT '0'::smallint,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_dq_rule_input_entry OWNER TO etl;

--
-- Name: t_ds_dq_rule_input_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_dq_rule_input_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_dq_rule_input_entry_id_seq OWNER TO etl;

--
-- Name: t_ds_dq_rule_input_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_dq_rule_input_entry_id_seq OWNED BY public.t_ds_dq_rule_input_entry.id;


--
-- Name: t_ds_dq_task_statistics_value; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_dq_task_statistics_value (
    id integer NOT NULL,
    process_definition_id integer NOT NULL,
    task_instance_id integer,
    rule_id integer NOT NULL,
    unique_code character varying NOT NULL,
    statistics_name character varying,
    statistics_value double precision,
    data_time timestamp(0) without time zone,
    create_time timestamp(0) without time zone,
    update_time timestamp(0) without time zone
);


ALTER TABLE public.t_ds_dq_task_statistics_value OWNER TO etl;

--
-- Name: t_ds_dq_task_statistics_value_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_dq_task_statistics_value_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_dq_task_statistics_value_id_seq OWNER TO etl;

--
-- Name: t_ds_dq_task_statistics_value_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_dq_task_statistics_value_id_seq OWNED BY public.t_ds_dq_task_statistics_value.id;


--
-- Name: t_ds_environment; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_environment (
    id integer NOT NULL,
    code bigint NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    config text,
    description text,
    operator integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_environment OWNER TO etl;

--
-- Name: t_ds_environment_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_environment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_environment_id_seq OWNER TO etl;

--
-- Name: t_ds_environment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_environment_id_seq OWNED BY public.t_ds_environment.id;


--
-- Name: t_ds_environment_worker_group_relation; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_environment_worker_group_relation (
    id integer NOT NULL,
    environment_code bigint NOT NULL,
    worker_group character varying(255) NOT NULL,
    operator integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_environment_worker_group_relation OWNER TO etl;

--
-- Name: t_ds_environment_worker_group_relation_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_environment_worker_group_relation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_environment_worker_group_relation_id_seq OWNER TO etl;

--
-- Name: t_ds_environment_worker_group_relation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_environment_worker_group_relation_id_seq OWNED BY public.t_ds_environment_worker_group_relation.id;


--
-- Name: t_ds_error_command; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_error_command (
    id integer NOT NULL,
    command_type integer,
    process_definition_code bigint NOT NULL,
    command_param text,
    task_depend_type integer,
    failure_strategy integer DEFAULT 0,
    warning_type integer DEFAULT 0,
    warning_group_id integer,
    schedule_time timestamp without time zone,
    start_time timestamp without time zone,
    executor_id integer,
    update_time timestamp without time zone,
    process_instance_priority integer DEFAULT 2,
    worker_group character varying(64),
    environment_code bigint DEFAULT '-1'::bigint,
    dry_run integer DEFAULT 0,
    message text,
    process_instance_id integer DEFAULT 0,
    process_definition_version integer DEFAULT 0
);


ALTER TABLE public.t_ds_error_command OWNER TO etl;

--
-- Name: t_ds_fav_task; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_fav_task (
    id integer NOT NULL,
    task_name character varying(64) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.t_ds_fav_task OWNER TO etl;

--
-- Name: t_ds_fav_task_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_fav_task_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_fav_task_id_seq OWNER TO etl;

--
-- Name: t_ds_fav_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_fav_task_id_seq OWNED BY public.t_ds_fav_task.id;


--
-- Name: t_ds_k8s; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_k8s (
    id integer NOT NULL,
    k8s_name character varying(100) DEFAULT NULL::character varying,
    k8s_config text,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_k8s OWNER TO etl;

--
-- Name: t_ds_k8s_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_k8s_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_k8s_id_seq OWNER TO etl;

--
-- Name: t_ds_k8s_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_k8s_id_seq OWNED BY public.t_ds_k8s.id;


--
-- Name: t_ds_k8s_namespace; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_k8s_namespace (
    id integer NOT NULL,
    code bigint NOT NULL,
    limits_memory integer,
    namespace character varying(100) DEFAULT NULL::character varying,
    user_id integer,
    pod_replicas integer,
    pod_request_cpu numeric(13,4),
    pod_request_memory integer,
    limits_cpu numeric(13,4),
    cluster_code bigint NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_k8s_namespace OWNER TO etl;

--
-- Name: t_ds_k8s_namespace_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_k8s_namespace_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_k8s_namespace_id_seq OWNER TO etl;

--
-- Name: t_ds_k8s_namespace_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_k8s_namespace_id_seq OWNED BY public.t_ds_k8s_namespace.id;


--
-- Name: t_ds_plugin_define; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_plugin_define (
    id integer NOT NULL,
    plugin_name character varying(100) NOT NULL,
    plugin_type character varying(100) NOT NULL,
    plugin_params text,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_plugin_define OWNER TO etl;

--
-- Name: t_ds_plugin_define_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_plugin_define_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_plugin_define_id_seq OWNER TO etl;

--
-- Name: t_ds_plugin_define_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_plugin_define_id_seq OWNED BY public.t_ds_plugin_define.id;


--
-- Name: t_ds_process_definition_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_process_definition_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_process_definition_id_sequence OWNER TO etl;

--
-- Name: t_ds_process_definition; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_process_definition (
    id integer DEFAULT nextval('public.t_ds_process_definition_id_sequence'::regclass) NOT NULL,
    code bigint NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    version integer NOT NULL,
    description text,
    project_code bigint,
    release_state integer,
    user_id integer,
    global_params text,
    locations text,
    warning_group_id integer,
    flag integer,
    timeout integer DEFAULT 0,
    tenant_id integer DEFAULT '-1'::integer,
    execution_type integer DEFAULT 0,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_process_definition OWNER TO etl;

--
-- Name: t_ds_process_definition_log_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_process_definition_log_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_process_definition_log_id_sequence OWNER TO etl;

--
-- Name: t_ds_process_definition_log; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_process_definition_log (
    id integer DEFAULT nextval('public.t_ds_process_definition_log_id_sequence'::regclass) NOT NULL,
    code bigint NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    version integer NOT NULL,
    description text,
    project_code bigint,
    release_state integer,
    user_id integer,
    global_params text,
    locations text,
    warning_group_id integer,
    flag integer,
    timeout integer DEFAULT 0,
    tenant_id integer DEFAULT '-1'::integer,
    execution_type integer DEFAULT 0,
    operator integer,
    operate_time timestamp without time zone,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_process_definition_log OWNER TO etl;

--
-- Name: t_ds_process_instance_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_process_instance_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_process_instance_id_sequence OWNER TO etl;

--
-- Name: t_ds_process_instance; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_process_instance (
    id integer DEFAULT nextval('public.t_ds_process_instance_id_sequence'::regclass) NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    process_definition_code bigint,
    process_definition_version integer,
    state integer,
    state_history text,
    recovery integer,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    run_times integer,
    host character varying(135) DEFAULT NULL::character varying,
    command_type integer,
    command_param text,
    task_depend_type integer,
    max_try_times integer DEFAULT 0,
    failure_strategy integer DEFAULT 0,
    warning_type integer DEFAULT 0,
    warning_group_id integer,
    schedule_time timestamp without time zone,
    command_start_time timestamp without time zone,
    global_params text,
    process_instance_json text,
    flag integer DEFAULT 1,
    update_time timestamp without time zone,
    is_sub_process integer DEFAULT 0,
    executor_id integer NOT NULL,
    history_cmd text,
    dependence_schedule_times text,
    process_instance_priority integer DEFAULT 2,
    worker_group character varying(64),
    environment_code bigint DEFAULT '-1'::bigint,
    timeout integer DEFAULT 0,
    tenant_id integer DEFAULT '-1'::integer NOT NULL,
    var_pool text,
    dry_run integer DEFAULT 0,
    next_process_instance_id integer DEFAULT 0,
    restart_time timestamp without time zone
);


ALTER TABLE public.t_ds_process_instance OWNER TO etl;

--
-- Name: t_ds_process_task_relation_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_process_task_relation_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_process_task_relation_id_sequence OWNER TO etl;

--
-- Name: t_ds_process_task_relation; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_process_task_relation (
    id integer DEFAULT nextval('public.t_ds_process_task_relation_id_sequence'::regclass) NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    project_code bigint,
    process_definition_code bigint,
    process_definition_version integer,
    pre_task_code bigint,
    pre_task_version integer DEFAULT 0,
    post_task_code bigint,
    post_task_version integer DEFAULT 0,
    condition_type integer,
    condition_params text,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_process_task_relation OWNER TO etl;

--
-- Name: t_ds_process_task_relation_log_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_process_task_relation_log_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_process_task_relation_log_id_sequence OWNER TO etl;

--
-- Name: t_ds_process_task_relation_log; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_process_task_relation_log (
    id integer DEFAULT nextval('public.t_ds_process_task_relation_log_id_sequence'::regclass) NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    project_code bigint,
    process_definition_code bigint,
    process_definition_version integer,
    pre_task_code bigint,
    pre_task_version integer DEFAULT 0,
    post_task_code bigint,
    post_task_version integer DEFAULT 0,
    condition_type integer,
    condition_params text,
    operator integer,
    operate_time timestamp without time zone,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_process_task_relation_log OWNER TO etl;

--
-- Name: t_ds_project_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_project_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_project_id_sequence OWNER TO etl;

--
-- Name: t_ds_project; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_project (
    id integer DEFAULT nextval('public.t_ds_project_id_sequence'::regclass) NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    code bigint NOT NULL,
    description character varying(255) DEFAULT NULL::character varying,
    user_id integer,
    flag integer DEFAULT 1,
    create_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    update_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.t_ds_project OWNER TO etl;

--
-- Name: t_ds_queue_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_queue_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_queue_id_sequence OWNER TO etl;

--
-- Name: t_ds_queue; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_queue (
    id integer DEFAULT nextval('public.t_ds_queue_id_sequence'::regclass) NOT NULL,
    queue_name character varying(64) DEFAULT NULL::character varying,
    queue character varying(64) DEFAULT NULL::character varying,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_queue OWNER TO etl;

--
-- Name: t_ds_relation_datasource_user_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_datasource_user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_datasource_user_id_sequence OWNER TO etl;

--
-- Name: t_ds_relation_datasource_user; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_datasource_user (
    id integer DEFAULT nextval('public.t_ds_relation_datasource_user_id_sequence'::regclass) NOT NULL,
    user_id integer NOT NULL,
    datasource_id integer,
    perm integer DEFAULT 1,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_relation_datasource_user OWNER TO etl;

--
-- Name: t_ds_relation_namespace_user; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_namespace_user (
    id integer NOT NULL,
    user_id integer,
    namespace_id integer,
    perm integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_relation_namespace_user OWNER TO etl;

--
-- Name: t_ds_relation_namespace_user_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_namespace_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_namespace_user_id_seq OWNER TO etl;

--
-- Name: t_ds_relation_namespace_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_relation_namespace_user_id_seq OWNED BY public.t_ds_relation_namespace_user.id;


--
-- Name: t_ds_relation_process_instance_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_process_instance_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_process_instance_id_sequence OWNER TO etl;

--
-- Name: t_ds_relation_process_instance; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_process_instance (
    id integer DEFAULT nextval('public.t_ds_relation_process_instance_id_sequence'::regclass) NOT NULL,
    parent_process_instance_id integer,
    parent_task_instance_id integer,
    process_instance_id integer
);


ALTER TABLE public.t_ds_relation_process_instance OWNER TO etl;

--
-- Name: t_ds_relation_project_user_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_project_user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_project_user_id_sequence OWNER TO etl;

--
-- Name: t_ds_relation_project_user; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_project_user (
    id integer DEFAULT nextval('public.t_ds_relation_project_user_id_sequence'::regclass) NOT NULL,
    user_id integer NOT NULL,
    project_id integer,
    perm integer DEFAULT 1,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_relation_project_user OWNER TO etl;

--
-- Name: t_ds_relation_resources_user_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_resources_user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_resources_user_id_sequence OWNER TO etl;

--
-- Name: t_ds_relation_resources_user; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_resources_user (
    id integer DEFAULT nextval('public.t_ds_relation_resources_user_id_sequence'::regclass) NOT NULL,
    user_id integer NOT NULL,
    resources_id integer,
    perm integer DEFAULT 1,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_relation_resources_user OWNER TO etl;

--
-- Name: t_ds_relation_rule_execute_sql; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_rule_execute_sql (
    id integer NOT NULL,
    rule_id integer,
    execute_sql_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_relation_rule_execute_sql OWNER TO etl;

--
-- Name: t_ds_relation_rule_execute_sql_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_rule_execute_sql_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_rule_execute_sql_id_seq OWNER TO etl;

--
-- Name: t_ds_relation_rule_execute_sql_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_relation_rule_execute_sql_id_seq OWNED BY public.t_ds_relation_rule_execute_sql.id;


--
-- Name: t_ds_relation_rule_input_entry; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_rule_input_entry (
    id integer NOT NULL,
    rule_id integer,
    rule_input_entry_id integer,
    values_map text,
    index integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_relation_rule_input_entry OWNER TO etl;

--
-- Name: t_ds_relation_rule_input_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_rule_input_entry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_rule_input_entry_id_seq OWNER TO etl;

--
-- Name: t_ds_relation_rule_input_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_relation_rule_input_entry_id_seq OWNED BY public.t_ds_relation_rule_input_entry.id;


--
-- Name: t_ds_relation_udfs_user_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_relation_udfs_user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_relation_udfs_user_id_sequence OWNER TO etl;

--
-- Name: t_ds_relation_udfs_user; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_relation_udfs_user (
    id integer DEFAULT nextval('public.t_ds_relation_udfs_user_id_sequence'::regclass) NOT NULL,
    user_id integer NOT NULL,
    udf_id integer,
    perm integer DEFAULT 1,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_relation_udfs_user OWNER TO etl;

--
-- Name: t_ds_resources_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_resources_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_resources_id_sequence OWNER TO etl;

--
-- Name: t_ds_resources; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_resources (
    id integer DEFAULT nextval('public.t_ds_resources_id_sequence'::regclass) NOT NULL,
    alias character varying(64) DEFAULT NULL::character varying,
    file_name character varying(64) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    user_id integer,
    type integer,
    size bigint,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    pid integer,
    full_name character varying(128),
    is_directory boolean DEFAULT false
);


ALTER TABLE public.t_ds_resources OWNER TO etl;

--
-- Name: t_ds_schedules_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_schedules_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_schedules_id_sequence OWNER TO etl;

--
-- Name: t_ds_schedules; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_schedules (
    id integer DEFAULT nextval('public.t_ds_schedules_id_sequence'::regclass) NOT NULL,
    process_definition_code bigint NOT NULL,
    start_time timestamp without time zone NOT NULL,
    end_time timestamp without time zone NOT NULL,
    timezone_id character varying(40) DEFAULT NULL::character varying,
    crontab character varying(255) NOT NULL,
    failure_strategy integer NOT NULL,
    user_id integer NOT NULL,
    release_state integer NOT NULL,
    warning_type integer NOT NULL,
    warning_group_id integer,
    process_instance_priority integer DEFAULT 2,
    worker_group character varying(64),
    environment_code bigint DEFAULT '-1'::bigint,
    create_time timestamp without time zone NOT NULL,
    update_time timestamp without time zone NOT NULL
);


ALTER TABLE public.t_ds_schedules OWNER TO etl;

--
-- Name: t_ds_session; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_session (
    id character varying(64) NOT NULL,
    user_id integer,
    ip character varying(45) DEFAULT NULL::character varying,
    last_login_time timestamp without time zone
);


ALTER TABLE public.t_ds_session OWNER TO etl;

--
-- Name: t_ds_task_definition_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_task_definition_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_task_definition_id_sequence OWNER TO etl;

--
-- Name: t_ds_task_definition; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_task_definition (
    id integer DEFAULT nextval('public.t_ds_task_definition_id_sequence'::regclass) NOT NULL,
    code bigint NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    version integer NOT NULL,
    description text,
    project_code bigint,
    user_id integer,
    task_type character varying(50) DEFAULT NULL::character varying,
    task_execute_type integer DEFAULT 0,
    task_params text,
    flag integer,
    task_priority integer DEFAULT 2,
    worker_group character varying(255) DEFAULT NULL::character varying,
    environment_code bigint DEFAULT '-1'::bigint,
    fail_retry_times integer,
    fail_retry_interval integer,
    timeout_flag integer,
    timeout_notify_strategy integer,
    timeout integer DEFAULT 0,
    delay_time integer DEFAULT 0,
    task_group_id integer,
    task_group_priority integer DEFAULT 0,
    resource_ids text,
    cpu_quota integer DEFAULT '-1'::integer NOT NULL,
    memory_max integer DEFAULT '-1'::integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_task_definition OWNER TO etl;

--
-- Name: t_ds_task_definition_log_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_task_definition_log_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_task_definition_log_id_sequence OWNER TO etl;

--
-- Name: t_ds_task_definition_log; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_task_definition_log (
    id integer DEFAULT nextval('public.t_ds_task_definition_log_id_sequence'::regclass) NOT NULL,
    code bigint NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    version integer NOT NULL,
    description text,
    project_code bigint,
    user_id integer,
    task_type character varying(50) DEFAULT NULL::character varying,
    task_execute_type integer DEFAULT 0,
    task_params text,
    flag integer,
    task_priority integer DEFAULT 2,
    worker_group character varying(255) DEFAULT NULL::character varying,
    environment_code bigint DEFAULT '-1'::bigint,
    fail_retry_times integer,
    fail_retry_interval integer,
    timeout_flag integer,
    timeout_notify_strategy integer,
    timeout integer DEFAULT 0,
    delay_time integer DEFAULT 0,
    resource_ids text,
    operator integer,
    task_group_id integer,
    task_group_priority integer DEFAULT 0,
    operate_time timestamp without time zone,
    cpu_quota integer DEFAULT '-1'::integer NOT NULL,
    memory_max integer DEFAULT '-1'::integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_task_definition_log OWNER TO etl;

--
-- Name: t_ds_task_group; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_task_group (
    id integer NOT NULL,
    name character varying(100) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    group_size integer NOT NULL,
    project_code bigint DEFAULT '0'::bigint,
    use_size integer DEFAULT 0,
    user_id integer,
    status integer DEFAULT 1,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_task_group OWNER TO etl;

--
-- Name: t_ds_task_group_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_task_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_task_group_id_seq OWNER TO etl;

--
-- Name: t_ds_task_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_task_group_id_seq OWNED BY public.t_ds_task_group.id;


--
-- Name: t_ds_task_group_queue; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_task_group_queue (
    id integer NOT NULL,
    task_id integer,
    task_name character varying(100) DEFAULT NULL::character varying,
    group_id integer,
    process_id integer,
    priority integer DEFAULT 0,
    status integer DEFAULT '-1'::integer,
    force_start integer DEFAULT 0,
    in_queue integer DEFAULT 0,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_task_group_queue OWNER TO etl;

--
-- Name: t_ds_task_group_queue_id_seq; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_task_group_queue_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_task_group_queue_id_seq OWNER TO etl;

--
-- Name: t_ds_task_group_queue_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: etl
--

ALTER SEQUENCE public.t_ds_task_group_queue_id_seq OWNED BY public.t_ds_task_group_queue.id;


--
-- Name: t_ds_task_instance_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_task_instance_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_task_instance_id_sequence OWNER TO etl;

--
-- Name: t_ds_task_instance; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_task_instance (
    id integer DEFAULT nextval('public.t_ds_task_instance_id_sequence'::regclass) NOT NULL,
    name character varying(255) DEFAULT NULL::character varying,
    task_type character varying(50) DEFAULT NULL::character varying,
    task_execute_type integer DEFAULT 0,
    task_code bigint NOT NULL,
    task_definition_version integer,
    process_instance_id integer,
    state integer,
    submit_time timestamp without time zone,
    start_time timestamp without time zone,
    end_time timestamp without time zone,
    host character varying(135) DEFAULT NULL::character varying,
    execute_path character varying(200) DEFAULT NULL::character varying,
    log_path text,
    alert_flag integer,
    retry_times integer DEFAULT 0,
    pid integer,
    app_link text,
    task_params text,
    flag integer DEFAULT 1,
    retry_interval integer,
    max_retry_times integer,
    task_instance_priority integer,
    worker_group character varying(64),
    environment_code bigint DEFAULT '-1'::bigint,
    environment_config text,
    executor_id integer,
    first_submit_time timestamp without time zone,
    delay_time integer DEFAULT 0,
    task_group_id integer,
    var_pool text,
    dry_run integer DEFAULT 0,
    cpu_quota integer DEFAULT '-1'::integer NOT NULL,
    memory_max integer DEFAULT '-1'::integer NOT NULL
);


ALTER TABLE public.t_ds_task_instance OWNER TO etl;

--
-- Name: t_ds_tenant_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_tenant_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_tenant_id_sequence OWNER TO etl;

--
-- Name: t_ds_tenant; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_tenant (
    id integer DEFAULT nextval('public.t_ds_tenant_id_sequence'::regclass) NOT NULL,
    tenant_code character varying(64) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    queue_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.t_ds_tenant OWNER TO etl;

--
-- Name: t_ds_udfs_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_udfs_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_udfs_id_sequence OWNER TO etl;

--
-- Name: t_ds_udfs; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_udfs (
    id integer DEFAULT nextval('public.t_ds_udfs_id_sequence'::regclass) NOT NULL,
    user_id integer NOT NULL,
    func_name character varying(100) NOT NULL,
    class_name character varying(255) NOT NULL,
    type integer NOT NULL,
    arg_types character varying(255) DEFAULT NULL::character varying,
    database character varying(255) DEFAULT NULL::character varying,
    description character varying(255) DEFAULT NULL::character varying,
    resource_id integer NOT NULL,
    resource_name character varying(255) NOT NULL,
    create_time timestamp without time zone NOT NULL,
    update_time timestamp without time zone NOT NULL
);


ALTER TABLE public.t_ds_udfs OWNER TO etl;

--
-- Name: t_ds_user_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_user_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_user_id_sequence OWNER TO etl;

--
-- Name: t_ds_user; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_user (
    id integer DEFAULT nextval('public.t_ds_user_id_sequence'::regclass) NOT NULL,
    user_name character varying(64) DEFAULT NULL::character varying,
    user_password character varying(64) DEFAULT NULL::character varying,
    user_type integer,
    email character varying(64) DEFAULT NULL::character varying,
    phone character varying(11) DEFAULT NULL::character varying,
    tenant_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    queue character varying(64) DEFAULT NULL::character varying,
    state integer DEFAULT 1,
    time_zone character varying(32) DEFAULT NULL::character varying
);


ALTER TABLE public.t_ds_user OWNER TO etl;

--
-- Name: COLUMN t_ds_user.state; Type: COMMENT; Schema: public; Owner: etl
--

COMMENT ON COLUMN public.t_ds_user.state IS 'state 0:disable 1:enable';


--
-- Name: t_ds_version_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_version_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_version_id_sequence OWNER TO etl;

--
-- Name: t_ds_version; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_version (
    id integer DEFAULT nextval('public.t_ds_version_id_sequence'::regclass) NOT NULL,
    version character varying(200) NOT NULL
);


ALTER TABLE public.t_ds_version OWNER TO etl;

--
-- Name: t_ds_worker_group_id_sequence; Type: SEQUENCE; Schema: public; Owner: etl
--

CREATE SEQUENCE public.t_ds_worker_group_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.t_ds_worker_group_id_sequence OWNER TO etl;

--
-- Name: t_ds_worker_group; Type: TABLE; Schema: public; Owner: etl
--

CREATE TABLE public.t_ds_worker_group (
    id bigint DEFAULT nextval('public.t_ds_worker_group_id_sequence'::regclass) NOT NULL,
    name character varying(255) NOT NULL,
    addr_list text,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    description text,
    other_params_json text
);


ALTER TABLE public.t_ds_worker_group OWNER TO etl;

--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: t_ds_alert_plugin_instance id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alert_plugin_instance ALTER COLUMN id SET DEFAULT nextval('public.t_ds_alert_plugin_instance_id_seq'::regclass);


--
-- Name: t_ds_alert_send_status id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alert_send_status ALTER COLUMN id SET DEFAULT nextval('public.t_ds_alert_send_status_id_seq'::regclass);


--
-- Name: t_ds_audit_log id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_audit_log ALTER COLUMN id SET DEFAULT nextval('public.t_ds_audit_log_id_seq'::regclass);


--
-- Name: t_ds_cluster id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_cluster ALTER COLUMN id SET DEFAULT nextval('public.t_ds_cluster_id_seq'::regclass);


--
-- Name: t_ds_dq_comparison_type id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_comparison_type ALTER COLUMN id SET DEFAULT nextval('public.t_ds_dq_comparison_type_id_seq'::regclass);


--
-- Name: t_ds_dq_execute_result id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_execute_result ALTER COLUMN id SET DEFAULT nextval('public.t_ds_dq_execute_result_id_seq'::regclass);


--
-- Name: t_ds_dq_rule id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_rule ALTER COLUMN id SET DEFAULT nextval('public.t_ds_dq_rule_id_seq'::regclass);


--
-- Name: t_ds_dq_rule_execute_sql id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_rule_execute_sql ALTER COLUMN id SET DEFAULT nextval('public.t_ds_dq_rule_execute_sql_id_seq'::regclass);


--
-- Name: t_ds_dq_rule_input_entry id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_rule_input_entry ALTER COLUMN id SET DEFAULT nextval('public.t_ds_dq_rule_input_entry_id_seq'::regclass);


--
-- Name: t_ds_dq_task_statistics_value id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_task_statistics_value ALTER COLUMN id SET DEFAULT nextval('public.t_ds_dq_task_statistics_value_id_seq'::regclass);


--
-- Name: t_ds_environment id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_environment ALTER COLUMN id SET DEFAULT nextval('public.t_ds_environment_id_seq'::regclass);


--
-- Name: t_ds_environment_worker_group_relation id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_environment_worker_group_relation ALTER COLUMN id SET DEFAULT nextval('public.t_ds_environment_worker_group_relation_id_seq'::regclass);


--
-- Name: t_ds_fav_task id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_fav_task ALTER COLUMN id SET DEFAULT nextval('public.t_ds_fav_task_id_seq'::regclass);


--
-- Name: t_ds_k8s id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_k8s ALTER COLUMN id SET DEFAULT nextval('public.t_ds_k8s_id_seq'::regclass);


--
-- Name: t_ds_k8s_namespace id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_k8s_namespace ALTER COLUMN id SET DEFAULT nextval('public.t_ds_k8s_namespace_id_seq'::regclass);


--
-- Name: t_ds_plugin_define id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_plugin_define ALTER COLUMN id SET DEFAULT nextval('public.t_ds_plugin_define_id_seq'::regclass);


--
-- Name: t_ds_relation_namespace_user id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_namespace_user ALTER COLUMN id SET DEFAULT nextval('public.t_ds_relation_namespace_user_id_seq'::regclass);


--
-- Name: t_ds_relation_rule_execute_sql id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_rule_execute_sql ALTER COLUMN id SET DEFAULT nextval('public.t_ds_relation_rule_execute_sql_id_seq'::regclass);


--
-- Name: t_ds_relation_rule_input_entry id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_rule_input_entry ALTER COLUMN id SET DEFAULT nextval('public.t_ds_relation_rule_input_entry_id_seq'::regclass);


--
-- Name: t_ds_task_group id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_task_group ALTER COLUMN id SET DEFAULT nextval('public.t_ds_task_group_id_seq'::regclass);


--
-- Name: t_ds_task_group_queue id; Type: DEFAULT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_task_group_queue ALTER COLUMN id SET DEFAULT nextval('public.t_ds_task_group_queue_id_seq'::regclass);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.products (id, product_code, product_name, product_line, product_scale, product_count, product_base, product_vendor, product_description, quantity_in_stock, buy_price, msrp) FROM stdin;
\.


--
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_blob_triggers (sched_name, trigger_name, trigger_group, blob_data) FROM stdin;
\.


--
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_calendars (sched_name, calendar_name, calendar) FROM stdin;
\.


--
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_cron_triggers (sched_name, trigger_name, trigger_group, cron_expression, time_zone_id) FROM stdin;
\.


--
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_fired_triggers (sched_name, entry_id, trigger_name, trigger_group, instance_name, fired_time, sched_time, priority, state, job_name, job_group, is_nonconcurrent, requests_recovery) FROM stdin;
\.


--
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_job_details (sched_name, job_name, job_group, description, job_class_name, is_durable, is_nonconcurrent, is_update_data, requests_recovery, job_data) FROM stdin;
\.


--
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_locks (sched_name, lock_name) FROM stdin;
DolphinScheduler	STATE_ACCESS
DolphinScheduler	TRIGGER_ACCESS
\.


--
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_paused_trigger_grps (sched_name, trigger_group) FROM stdin;
\.


--
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_scheduler_state (sched_name, instance_name, last_checkin_time, checkin_interval) FROM stdin;
DolphinScheduler	a7cd1d350e301678427189961	1678427901764	5000
\.


--
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_simple_triggers (sched_name, trigger_name, trigger_group, repeat_count, repeat_interval, times_triggered) FROM stdin;
\.


--
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_simprop_triggers (sched_name, trigger_name, trigger_group, str_prop_1, str_prop_2, str_prop_3, int_prop_1, int_prop_2, long_prop_1, long_prop_2, dec_prop_1, dec_prop_2, bool_prop_1, bool_prop_2) FROM stdin;
\.


--
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.qrtz_triggers (sched_name, trigger_name, trigger_group, job_name, job_group, description, next_fire_time, prev_fire_time, priority, trigger_state, trigger_type, start_time, end_time, calendar_name, misfire_instr, job_data) FROM stdin;
\.


--
-- Data for Name: t_ds_access_token; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_access_token (id, user_id, token, expire_time, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_alert; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_alert (id, title, sign, content, alert_status, warning_type, log, alertgroup_id, create_time, update_time, project_code, process_definition_code, process_instance_id, alert_type) FROM stdin;
\.


--
-- Data for Name: t_ds_alert_plugin_instance; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_alert_plugin_instance (id, plugin_define_id, plugin_instance_params, create_time, update_time, instance_name) FROM stdin;
\.


--
-- Data for Name: t_ds_alert_send_status; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_alert_send_status (id, alert_id, alert_plugin_instance_id, send_status, log, create_time) FROM stdin;
\.


--
-- Data for Name: t_ds_alertgroup; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_alertgroup (id, alert_instance_ids, create_user_id, group_name, description, create_time, update_time) FROM stdin;
1	1,2	1	default admin warning group	default admin warning group	2018-11-29 10:20:39	2018-11-29 10:20:39
\.


--
-- Data for Name: t_ds_audit_log; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_audit_log (id, user_id, resource_type, operation, "time", resource_id) FROM stdin;
\.


--
-- Data for Name: t_ds_cluster; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_cluster (id, code, name, config, description, operator, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_command; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_command (id, command_type, process_definition_code, command_param, task_depend_type, failure_strategy, warning_type, warning_group_id, schedule_time, start_time, executor_id, update_time, process_instance_priority, worker_group, environment_code, dry_run, process_instance_id, process_definition_version) FROM stdin;
\.


--
-- Data for Name: t_ds_datasource; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_datasource (id, name, note, type, user_id, connection_params, create_time, update_time) FROM stdin;
2	docker-postgres		1	1	{"user":"etl","password":"Admin@123","address":"jdbc:postgresql://postgres:5432","database":"etl","jdbcUrl":"jdbc:postgresql://postgres:5432/etl","driverClassName":"org.postgresql.Driver","validationQuery":"select version()"}	2023-03-10 03:38:14.404	2023-03-10 05:50:51.755
1	docker-mysql		0	1	{"user":"etl","password":"Admin@123","address":"jdbc:mysql://mysql:3306","database":"etl","jdbcUrl":"jdbc:mysql://mysql:3306/etl","driverClassName":"com.mysql.cj.jdbc.Driver","validationQuery":"select 1"}	2023-03-10 03:37:55.817	2023-03-10 05:51:00.124
\.


--
-- Data for Name: t_ds_dq_comparison_type; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_dq_comparison_type (id, type, execute_sql, output_table, name, create_time, update_time, is_inner_source) FROM stdin;
1	FixValue	\N	\N	\N	2021-06-30 00:00:00	2021-06-30 00:00:00	f
2	DailyAvg	select round(avg(statistics_value),2) as day_avg from t_ds_dq_task_statistics_value where data_time >=date_trunc('DAY', ${data_time}) and data_time < date_add(date_trunc('day', ${data_time}),1) and unique_code = ${unique_code} and statistics_name = '${statistics_name}'	day_range	day_range.day_avg	2021-06-30 00:00:00	2021-06-30 00:00:00	t
3	WeeklyAvg	select round(avg(statistics_value),2) as week_avg from t_ds_dq_task_statistics_value where  data_time >= date_trunc('WEEK', ${data_time}) and data_time <date_trunc('day', ${data_time}) and unique_code = ${unique_code} and statistics_name = '${statistics_name}'	week_range	week_range.week_avg	2021-06-30 00:00:00	2021-06-30 00:00:00	t
4	MonthlyAvg	select round(avg(statistics_value),2) as month_avg from t_ds_dq_task_statistics_value where  data_time >= date_trunc('MONTH', ${data_time}) and data_time <date_trunc('day', ${data_time}) and unique_code = ${unique_code} and statistics_name = '${statistics_name}'	month_range	month_range.month_avg	2021-06-30 00:00:00	2021-06-30 00:00:00	t
5	Last7DayAvg	select round(avg(statistics_value),2) as last_7_avg from t_ds_dq_task_statistics_value where  data_time >= date_add(date_trunc('day', ${data_time}),-7) and  data_time <date_trunc('day', ${data_time}) and unique_code = ${unique_code} and statistics_name = '${statistics_name}'	last_seven_days	last_seven_days.last_7_avg	2021-06-30 00:00:00	2021-06-30 00:00:00	t
6	Last30DayAvg	select round(avg(statistics_value),2) as last_30_avg from t_ds_dq_task_statistics_value where  data_time >= date_add(date_trunc('day', ${data_time}),-30) and  data_time < date_trunc('day', ${data_time}) and unique_code = ${unique_code} and statistics_name = '${statistics_name}'	last_thirty_days	last_thirty_days.last_30_avg	2021-06-30 00:00:00	2021-06-30 00:00:00	t
7	SrcTableTotalRows	SELECT COUNT(*) AS total FROM ${src_table} WHERE (${src_filter})	total_count	total_count.total	2021-06-30 00:00:00	2021-06-30 00:00:00	f
8	TargetTableTotalRows	SELECT COUNT(*) AS total FROM ${target_table} WHERE (${target_filter})	total_count	total_count.total	2021-06-30 00:00:00	2021-06-30 00:00:00	f
\.


--
-- Data for Name: t_ds_dq_execute_result; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_dq_execute_result (id, process_definition_id, process_instance_id, task_instance_id, rule_type, rule_name, statistics_value, comparison_value, check_type, threshold, operator, failure_strategy, state, user_id, create_time, update_time, comparison_type, error_output_path) FROM stdin;
\.


--
-- Data for Name: t_ds_dq_rule; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_dq_rule (id, name, type, user_id, create_time, update_time) FROM stdin;
1	$t(null_check)	0	1	2020-01-12 00:00:00	2020-01-12 00:00:00
2	$t(custom_sql)	1	1	2020-01-12 00:00:00	2020-01-12 00:00:00
3	$t(multi_table_accuracy)	2	1	2020-01-12 00:00:00	2020-01-12 00:00:00
4	$t(multi_table_value_comparison)	3	1	2020-01-12 00:00:00	2020-01-12 00:00:00
5	$t(field_length_check)	0	1	2020-01-12 00:00:00	2020-01-12 00:00:00
6	$t(uniqueness_check)	0	1	2020-01-12 00:00:00	2020-01-12 00:00:00
7	$t(regexp_check)	0	1	2020-01-12 00:00:00	2020-01-12 00:00:00
8	$t(timeliness_check)	0	1	2020-01-12 00:00:00	2020-01-12 00:00:00
9	$t(enumeration_check)	0	1	2020-01-12 00:00:00	2020-01-12 00:00:00
10	$t(table_count_check)	0	1	2020-01-12 00:00:00	2020-01-12 00:00:00
\.


--
-- Data for Name: t_ds_dq_rule_execute_sql; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_dq_rule_execute_sql (id, index, sql, table_alias, type, create_time, update_time, is_error_output_sql) FROM stdin;
1	1	SELECT COUNT(*) AS nulls FROM null_items	null_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
2	1	SELECT COUNT(*) AS total FROM ${src_table} WHERE (${src_filter})	total_count	2	2021-03-03 11:31:24	2021-03-03 11:31:24	f
3	1	SELECT COUNT(*) AS miss from miss_items	miss_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
4	1	SELECT COUNT(*) AS valids FROM invalid_length_items	invalid_length_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
5	1	SELECT COUNT(*) AS total FROM ${target_table} WHERE (${target_filter})	total_count	2	2021-03-03 11:31:24	2021-03-03 11:31:24	f
6	1	SELECT ${src_field} FROM ${src_table} group by ${src_field} having count(*) > 1	duplicate_items	0	2021-03-03 11:31:24	2021-03-03 11:31:24	t
7	1	SELECT COUNT(*) AS duplicates FROM duplicate_items	duplicate_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
8	1	SELECT ${src_table}.* FROM (SELECT * FROM ${src_table} WHERE (${src_filter})) ${src_table} LEFT JOIN (SELECT * FROM ${target_table} WHERE (${target_filter})) ${target_table} ON ${on_clause} WHERE ${where_clause}	miss_items	0	2021-03-03 11:31:24	2021-03-03 11:31:24	t
9	1	SELECT * FROM ${src_table} WHERE (${src_field} not regexp '${regexp_pattern}') AND (${src_filter}) 	regexp_items	0	2021-03-03 11:31:24	2021-03-03 11:31:24	t
10	1	SELECT COUNT(*) AS regexps FROM regexp_items	regexp_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
11	1	SELECT * FROM ${src_table} WHERE (to_unix_timestamp(${src_field}, '${datetime_format}')-to_unix_timestamp('${deadline}', '${datetime_format}') <= 0) AND (to_unix_timestamp(${src_field}, '${datetime_format}')-to_unix_timestamp('${begin_time}', '${datetime_format}') >= 0) AND (${src_filter}) 	timeliness_items	0	2021-03-03 11:31:24	2021-03-03 11:31:24	t
12	1	SELECT COUNT(*) AS timeliness FROM timeliness_items	timeliness_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
13	1	SELECT * FROM ${src_table} where (${src_field} not in ( ${enum_list} ) or ${src_field} is null) AND (${src_filter}) 	enum_items	0	2021-03-03 11:31:24	2021-03-03 11:31:24	t
14	1	SELECT COUNT(*) AS enums FROM enum_items	enum_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
15	1	SELECT COUNT(*) AS total FROM ${src_table} WHERE (${src_filter})	table_count	1	2021-03-03 11:31:24	2021-03-03 11:31:24	f
16	1	SELECT * FROM ${src_table} WHERE (${src_field} is null or ${src_field} = '') AND (${src_filter})	null_items	0	2021-03-03 11:31:24	2021-03-03 11:31:24	t
17	1	SELECT * FROM ${src_table} WHERE (length(${src_field}) ${logic_operator} ${field_length}) AND (${src_filter})	invalid_length_items	0	2021-03-03 11:31:24	2021-03-03 11:31:24	t
\.


--
-- Data for Name: t_ds_dq_rule_input_entry; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_dq_rule_input_entry (id, field, type, title, value, options, placeholder, option_source_type, value_type, input_type, is_show, can_edit, is_emit, is_validate, create_time, update_time) FROM stdin;
1	src_connector_type	select	$t(src_connector_type)		[{"label":"HIVE","value":"HIVE"},{"label":"JDBC","value":"JDBC"}]	please select source connector type	2	2	0	1	1	1	0	2021-03-03 11:31:24	2021-03-03 11:31:24
2	src_datasource_id	select	$t(src_datasource_id)		\N	please select source datasource id	1	2	0	1	1	1	0	2021-03-03 11:31:24	2021-03-03 11:31:24
3	src_table	select	$t(src_table)	\N	\N	Please enter source table name	0	0	0	1	1	1	1	2021-03-03 11:31:24	2021-03-03 11:31:24
4	src_filter	input	$t(src_filter)	\N	\N	Please enter filter expression	0	3	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
5	src_field	select	$t(src_field)	\N	\N	Please enter column, only single column is supported	0	0	0	1	1	0	1	2021-03-03 11:31:24	2021-03-03 11:31:24
6	statistics_name	input	$t(statistics_name)	\N	\N	Please enter statistics name, the alias in statistics execute sql	0	0	1	0	0	0	1	2021-03-03 11:31:24	2021-03-03 11:31:24
7	check_type	select	$t(check_type)	0	[{"label":"Expected - Actual","value":"0"},{"label":"Actual - Expected","value":"1"},{"label":"Actual / Expected","value":"2"},{"label":"(Expected - Actual) / Expected","value":"3"}]	please select check type	0	0	3	1	1	1	0	2021-03-03 11:31:24	2021-03-03 11:31:24
8	operator	select	$t(operator)	0	[{"label":"=","value":"0"},{"label":"<","value":"1"},{"label":"<=","value":"2"},{"label":">","value":"3"},{"label":">=","value":"4"},{"label":"!=","value":"5"}]	please select operator	0	0	3	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
9	threshold	input	$t(threshold)	\N	\N	Please enter threshold, number is needed	0	2	3	1	1	0	1	2021-03-03 11:31:24	2021-03-03 11:31:24
10	failure_strategy	select	$t(failure_strategy)	0	[{"label":"Alert","value":"0"},{"label":"Block","value":"1"}]	please select failure strategy	0	0	3	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
11	target_connector_type	select	$t(target_connector_type)		[{"label":"HIVE","value":"HIVE"},{"label":"JDBC","value":"JDBC"}]	Please select target connector type	2	0	0	1	1	1	0	2021-03-03 11:31:24	2021-03-03 11:31:24
12	target_datasource_id	select	$t(target_datasource_id)		\N	Please select target datasource	1	2	0	1	1	1	0	2021-03-03 11:31:24	2021-03-03 11:31:24
13	target_table	select	$t(target_table)	\N	\N	Please enter target table	0	0	0	1	1	1	1	2021-03-03 11:31:24	2021-03-03 11:31:24
14	target_filter	input	$t(target_filter)	\N	\N	Please enter target filter expression	0	3	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
15	mapping_columns	group	$t(mapping_columns)	\N	[{"field":"src_field","props":{"placeholder":"Please input src field","rows":0,"disabled":false,"size":"small"},"type":"input","title":"src_field"},{"field":"operator","props":{"placeholder":"Please input operator","rows":0,"disabled":false,"size":"small"},"type":"input","title":"operator"},{"field":"target_field","props":{"placeholder":"Please input target field","rows":0,"disabled":false,"size":"small"},"type":"input","title":"target_field"}]	please enter mapping columns	0	0	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
16	statistics_execute_sql	textarea	$t(statistics_execute_sql)	\N	\N	Please enter statistics execute sql	0	3	0	1	1	0	1	2021-03-03 11:31:24	2021-03-03 11:31:24
17	comparison_name	input	$t(comparison_name)	\N	\N	Please enter comparison name, the alias in comparison execute sql	0	0	0	0	0	0	1	2021-03-03 11:31:24	2021-03-03 11:31:24
18	comparison_execute_sql	textarea	$t(comparison_execute_sql)	\N	\N	Please enter comparison execute sql	0	3	0	1	1	0	1	2021-03-03 11:31:24	2021-03-03 11:31:24
19	comparison_type	select	$t(comparison_type)		\N	Please enter comparison title	3	0	2	1	0	1	0	2021-03-03 11:31:24	2021-03-03 11:31:24
20	writer_connector_type	select	$t(writer_connector_type)		[{"label":"MYSQL","value":"0"},{"label":"POSTGRESQL","value":"1"}]	please select writer connector type	0	2	0	1	1	1	0	2021-03-03 11:31:24	2021-03-03 11:31:24
21	writer_datasource_id	select	$t(writer_datasource_id)		\N	please select writer datasource id	1	2	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
22	target_field	select	$t(target_field)	\N	\N	Please enter column, only single column is supported	0	0	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
23	field_length	input	$t(field_length)	\N	\N	Please enter length limit	0	3	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
24	logic_operator	select	$t(logic_operator)	=	[{"label":"=","value":"="},{"label":"<","value":"<"},{"label":"<=","value":"<="},{"label":">","value":">"},{"label":">=","value":">="},{"label":"<>","value":"<>"}]	please select logic operator	0	0	3	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
25	regexp_pattern	input	$t(regexp_pattern)	\N	\N	Please enter regexp pattern	0	0	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
26	deadline	input	$t(deadline)	\N	\N	Please enter deadline	0	0	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
27	datetime_format	input	$t(datetime_format)	\N	\N	Please enter datetime format	0	0	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
28	enum_list	input	$t(enum_list)	\N	\N	Please enter enumeration	0	0	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
29	begin_time	input	$t(begin_time)	\N	\N	Please enter begin time	0	0	0	1	1	0	0	2021-03-03 11:31:24	2021-03-03 11:31:24
\.


--
-- Data for Name: t_ds_dq_task_statistics_value; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_dq_task_statistics_value (id, process_definition_id, task_instance_id, rule_id, unique_code, statistics_name, statistics_value, data_time, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_environment; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_environment (id, code, name, config, description, operator, create_time, update_time) FROM stdin;
1	8831653965344	dev	export JAVA_HOME=/opt/java/openjdk\nexport DATAX_HOME=/opt/soft/datax\nexport PYTHON_HOME=/usr\nexport PATH=$JAVA_HOME/bin:$PYTHON_HOME/bin:$DATAX_HOME/bin:$PATH	develop	1	2023-03-10 05:54:56.604	2023-03-10 05:54:56.604
\.


--
-- Data for Name: t_ds_environment_worker_group_relation; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_environment_worker_group_relation (id, environment_code, worker_group, operator, create_time, update_time) FROM stdin;
1	8831653965344	default	1	2023-03-10 05:54:56.609	2023-03-10 05:54:56.609
\.


--
-- Data for Name: t_ds_error_command; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_error_command (id, command_type, process_definition_code, command_param, task_depend_type, failure_strategy, warning_type, warning_group_id, schedule_time, start_time, executor_id, update_time, process_instance_priority, worker_group, environment_code, dry_run, message, process_instance_id, process_definition_version) FROM stdin;
\.


--
-- Data for Name: t_ds_fav_task; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_fav_task (id, task_name, user_id) FROM stdin;
\.


--
-- Data for Name: t_ds_k8s; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_k8s (id, k8s_name, k8s_config, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_k8s_namespace; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_k8s_namespace (id, code, limits_memory, namespace, user_id, pod_replicas, pod_request_cpu, pod_request_memory, limits_cpu, cluster_code, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_plugin_define; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_plugin_define (id, plugin_name, plugin_type, plugin_params, create_time, update_time) FROM stdin;
1	Script	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"please enter your custom parameters, which will be passed to you when calling your script","size":"small"},"field":"userParams","name":"$t('userParams')","type":"input","title":"$t('userParams')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"please upload the file to the disk directory of the alert server, and ensure that the path is absolute and has the corresponding access rights","size":"small"},"field":"path","name":"$t('scriptPath')","type":"input","title":"$t('scriptPath')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"type","name":"$t('scriptType')","type":"radio","title":"$t('scriptType')","value":"SHELL","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"SHELL","value":"SHELL","disabled":false}]}]	2023-03-10 05:46:33.818	2023-03-10 05:46:33.818
2	Telegram	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"telegram web hook","size":"small"},"field":"webHook","name":"$t('webHook')","type":"input","title":"$t('webHook')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"telegram bot token","size":"small"},"field":"botToken","name":"botToken","type":"input","title":"botToken","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"telegram channel chat id","size":"small"},"field":"chatId","name":"chatId","type":"input","title":"chatId","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"field":"parseMode","name":"parseMode","props":{"disabled":null,"placeholder":null,"size":"small"},"type":"select","title":"parseMode","value":"Txt","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"Txt","value":"Txt","disabled":false},{"label":"Markdown","value":"Markdown","disabled":false},{"label":"MarkdownV2","value":"MarkdownV2","disabled":false},{"label":"Html","value":"Html","disabled":false}]},{"props":null,"field":"IsEnableProxy","name":"$t('isEnableProxy')","type":"radio","title":"$t('isEnableProxy')","value":"false","validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"YES","value":"true","disabled":false},{"label":"NO","value":"false","disabled":false}]},{"props":null,"field":"Proxy","name":"$t('proxy')","type":"input","title":"$t('proxy')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"Port","name":"$t('port')","type":"input","title":"$t('port')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"User","name":"$t('user')","type":"input","title":"$t('user')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"field":"Password","name":"$t('password')","props":{"disabled":null,"placeholder":"if enable use authentication, you need input password","size":"small"},"type":"input","title":"$t('password')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null}]	2023-03-10 05:46:33.847	2023-03-10 05:46:33.847
3	WeChat	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"please input corp id ","size":"small"},"field":"corpId","name":"$t('corpId')","type":"input","title":"$t('corpId')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"please input secret ","size":"small"},"field":"secret","name":"$t('secret')","type":"input","title":"$t('secret')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"use `|` to separate userIds and `@all` to everyone ","size":"small"},"field":"users","name":"$t('users')","type":"input","title":"$t('users')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"please input agent id or chat id ","size":"small"},"field":"agentId/chatId","name":"$t('agentId/chatId')","type":"input","title":"$t('agentId/chatId')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"sendType","name":"send.type","type":"radio","title":"send.type","value":"APP/应用","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"APP/应用","value":"APP/应用","disabled":false},{"label":"GROUP CHAT/群聊","value":"GROUP CHAT/群聊","disabled":false}]},{"props":null,"field":"showType","name":"$t('showType')","type":"radio","title":"$t('showType')","value":"markdown","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"markdown","value":"markdown","disabled":false},{"label":"text","value":"text","disabled":false}]}]	2023-03-10 05:46:33.851	2023-03-10 05:46:33.851
4	Email	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"please input receives","size":"small"},"field":"receivers","name":"$t('receivers')","type":"input","title":"$t('receivers')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"receiverCcs","name":"$t('receiverCcs')","type":"input","title":"$t('receiverCcs')","value":null,"validate":null,"emit":null},{"props":null,"field":"serverHost","name":"mail.smtp.host","type":"input","title":"mail.smtp.host","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"serverPort","name":"mail.smtp.port","type":"input","title":"mail.smtp.port","value":"25","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"sender","name":"$t('mailSender')","type":"input","title":"$t('mailSender')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"enableSmtpAuth","name":"mail.smtp.auth","type":"radio","title":"mail.smtp.auth","value":"true","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"YES","value":"true","disabled":false},{"label":"NO","value":"false","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"if enable use authentication, you need input user","size":"small"},"field":"User","name":"$t('mailUser')","type":"input","title":"$t('mailUser')","value":null,"validate":null,"emit":null},{"field":"Password","name":"$t('mailPasswd')","props":{"disabled":null,"placeholder":"if enable use authentication, you need input password","size":"small"},"type":"input","title":"$t('mailPasswd')","value":null,"validate":null,"emit":null},{"props":null,"field":"starttlsEnable","name":"mail.smtp.starttls.enable","type":"radio","title":"mail.smtp.starttls.enable","value":"false","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"YES","value":"true","disabled":false},{"label":"NO","value":"false","disabled":false}]},{"props":null,"field":"sslEnable","name":"mail.smtp.ssl.enable","type":"radio","title":"mail.smtp.ssl.enable","value":"false","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"YES","value":"true","disabled":false},{"label":"NO","value":"false","disabled":false}]},{"props":null,"field":"smtpSslTrust","name":"mail.smtp.ssl.trust","type":"input","title":"mail.smtp.ssl.trust","value":"*","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"showType","name":"$t('showType')","type":"radio","title":"$t('showType')","value":"table","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"table","value":"table","disabled":false},{"label":"text","value":"text","disabled":false},{"label":"attachment","value":"attachment","disabled":false},{"label":"table attachment","value":"table attachment","disabled":false}]}]	2023-03-10 05:46:33.855	2023-03-10 05:46:33.855
5	Slack	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"Input WebHook Url","size":"small"},"field":"webHook","name":"$t('webhook')","type":"input","title":"$t('webhook')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"Input the bot username","size":"small"},"field":"username","name":"$t('Username')","type":"input","title":"$t('Username')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null}]	2023-03-10 05:46:33.858	2023-03-10 05:46:33.858
6	Feishu	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":null,"field":"WebHook","name":"$t('webhook')","type":"input","title":"$t('webhook')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"IsEnableProxy","name":"$t('isEnableProxy')","type":"radio","title":"$t('isEnableProxy')","value":"true","validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"YES","value":"true","disabled":false},{"label":"NO","value":"false","disabled":false}]},{"props":null,"field":"Proxy","name":"$t('proxy')","type":"input","title":"$t('proxy')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"Port","name":"$t('port')","type":"input","title":"$t('port')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"User","name":"$t('user')","type":"input","title":"$t('user')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"field":"Password","name":"$t('password')","props":{"disabled":null,"placeholder":"if enable use authentication, you need input password","size":"small"},"type":"input","title":"$t('password')","value":null,"validate":null,"emit":null}]	2023-03-10 05:46:33.861	2023-03-10 05:46:33.861
7	Http	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"input request URL","size":"small"},"field":"url","name":"$t('url')","type":"input","title":"$t('url')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"input request type POST or GET","size":"small"},"field":"requestType","name":"$t('requestType')","type":"input","title":"$t('requestType')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"input request headers as JSON format ","size":"small"},"field":"headerParams","name":"$t('headerParams')","type":"input","title":"$t('headerParams')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"input request body as JSON format ","size":"small"},"field":"bodyParams","name":"$t('bodyParams')","type":"input","title":"$t('bodyParams')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"input alert msg field name","size":"small"},"field":"contentField","name":"$t('contentField')","type":"input","title":"$t('contentField')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null}]	2023-03-10 05:46:33.865	2023-03-10 05:46:33.865
8	DingTalk	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":null,"field":"WebHook","name":"$t('webhook')","type":"input","title":"$t('webhook')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"Keyword","name":"$t('keyword')","type":"input","title":"$t('keyword')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"Secret","name":"$t('secret')","type":"input","title":"$t('secret')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"MsgType","name":"$t('msgType')","type":"radio","title":"$t('msgType')","value":"text","validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"text","value":"text","disabled":false},{"label":"markdown","value":"markdown","disabled":false}]},{"props":null,"field":"AtMobiles","name":"$t('atMobiles')","type":"input","title":"$t('atMobiles')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"AtUserIds","name":"$t('atUserIds')","type":"input","title":"$t('atUserIds')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"IsAtAll","name":"$t('isAtAll')","type":"radio","title":"$t('isAtAll')","value":"false","validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"YES","value":"true","disabled":false},{"label":"NO","value":"false","disabled":false}]},{"props":null,"field":"IsEnableProxy","name":"$t('isEnableProxy')","type":"radio","title":"$t('isEnableProxy')","value":"false","validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"YES","value":"true","disabled":false},{"label":"NO","value":"false","disabled":false}]},{"props":null,"field":"Proxy","name":"$t('proxy')","type":"input","title":"$t('proxy')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"Port","name":"$t('port')","type":"input","title":"$t('port')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"User","name":"$t('user')","type":"input","title":"$t('user')","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"field":"Password","name":"$t('password')","props":{"disabled":null,"placeholder":"if enable use authentication, you need input password","size":"small"},"type":"input","title":"$t('password')","value":null,"validate":null,"emit":null}]	2023-03-10 05:46:33.867	2023-03-10 05:46:33.867
9	WebexTeams	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"Please enter the robot's access token you were given","size":"small"},"field":"BotAccessToken","name":"botAccessToken","type":"input","title":"botAccessToken","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"The room ID of the message","size":"small"},"field":"RoomId","name":"roomId","type":"input","title":"roomId","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"The person ID of the message recipient","size":"small"},"field":"ToPersonId","name":"toPersonId","type":"input","title":"toPersonId","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"The email address of the message recipient","size":"small"},"field":"ToPersonEmail","name":"toPersonEmail","type":"input","title":"toPersonEmail","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":{"disabled":null,"type":null,"maxlength":null,"minlength":null,"clearable":null,"prefixIcon":null,"suffixIcon":null,"rows":null,"autosize":null,"autocomplete":null,"name":null,"readonly":null,"max":null,"min":null,"step":null,"resize":null,"autofocus":null,"form":null,"label":null,"tabindex":null,"validateEvent":null,"showPassword":null,"placeholder":"use ,(eng commas) to separate multiple emails","size":"small"},"field":"AtSomeoneInRoom","name":"atSomeoneInRoom","type":"input","title":"atSomeoneInRoom","value":null,"validate":[{"required":false,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"Destination","name":"destination","type":"radio","title":"destination","value":"roomId","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"roomId","value":"roomId","disabled":false},{"label":"personEmail","value":"personEmail","disabled":false},{"label":"personId","value":"personId","disabled":false}]}]	2023-03-10 05:46:33.87	2023-03-10 05:46:33.87
10	PagerDuty	alert	[{"props":null,"field":"WarningType","name":"warningType","type":"radio","title":"warningType","value":"all","validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null,"options":[{"label":"success","value":"success","disabled":false},{"label":"failure","value":"failure","disabled":false},{"label":"all","value":"all","disabled":false}]},{"props":null,"field":"IntegrationKey","name":"integrationKey","type":"input","title":"integrationKey","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null}]	2023-03-10 05:46:33.872	2023-03-10 05:46:33.872
11	JUPYTER	task	null	2023-03-10 05:46:33.882	2023-03-10 05:46:33.882
12	SPARK	task	null	2023-03-10 05:46:33.885	2023-03-10 05:46:33.885
13	FLINK_STREAM	task	null	2023-03-10 05:46:33.888	2023-03-10 05:46:33.888
14	PYTHON	task	null	2023-03-10 05:46:33.889	2023-03-10 05:46:33.889
15	CHUNJUN	task	null	2023-03-10 05:46:33.89	2023-03-10 05:46:33.89
16	CONDITIONS	task	[{"props":null,"field":"name","name":"$t('Node name')","type":"input","title":"$t('Node name')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"runFlag","name":"RUN_FLAG","type":"radio","title":"RUN_FLAG","value":null,"validate":null,"emit":null,"options":[{"label":"NORMAL","value":"NORMAL","disabled":false},{"label":"FORBIDDEN","value":"FORBIDDEN","disabled":false}]}]	2023-03-10 05:46:33.892	2023-03-10 05:46:33.892
17	PIGEON	task	[{"props":null,"field":"targetJobName","name":"targetJobName","type":"input","title":"targetJobName","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null}]	2023-03-10 05:46:33.894	2023-03-10 05:46:33.894
18	PROCEDURE	task	null	2023-03-10 05:46:33.896	2023-03-10 05:46:33.896
19	SHELL	task	[{"props":null,"field":"name","name":"$t('Node name')","type":"input","title":"$t('Node name')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"runFlag","name":"RUN_FLAG","type":"radio","title":"RUN_FLAG","value":null,"validate":null,"emit":null,"options":[{"label":"NORMAL","value":"NORMAL","disabled":false},{"label":"FORBIDDEN","value":"FORBIDDEN","disabled":false}]}]	2023-03-10 05:46:33.898	2023-03-10 05:46:33.898
20	DEPENDENT	task	null	2023-03-10 05:46:33.899	2023-03-10 05:46:33.899
21	MR	task	null	2023-03-10 05:46:33.9	2023-03-10 05:46:33.9
22	PYTORCH	task	[]	2023-03-10 05:46:33.902	2023-03-10 05:46:33.902
23	SQOOP	task	null	2023-03-10 05:46:33.906	2023-03-10 05:46:33.906
24	SUB_PROCESS	task	null	2023-03-10 05:46:33.908	2023-03-10 05:46:33.908
25	K8S	task	null	2023-03-10 05:46:33.91	2023-03-10 05:46:33.91
26	SAGEMAKER	task	[]	2023-03-10 05:46:33.912	2023-03-10 05:46:33.912
27	SEATUNNEL	task	null	2023-03-10 05:46:33.914	2023-03-10 05:46:33.914
28	HTTP	task	null	2023-03-10 05:46:33.915	2023-03-10 05:46:33.915
29	EMR	task	[]	2023-03-10 05:46:33.916	2023-03-10 05:46:33.916
30	DATA_QUALITY	task	null	2023-03-10 05:46:33.918	2023-03-10 05:46:33.918
31	SQL	task	null	2023-03-10 05:46:33.919	2023-03-10 05:46:33.919
32	DVC	task	[{"props":null,"field":"name","name":"$t('Node name')","type":"input","title":"$t('Node name')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"runFlag","name":"RUN_FLAG","type":"radio","title":"RUN_FLAG","value":null,"validate":null,"emit":null,"options":[{"label":"NORMAL","value":"NORMAL","disabled":false},{"label":"FORBIDDEN","value":"FORBIDDEN","disabled":false}]}]	2023-03-10 05:46:33.92	2023-03-10 05:46:33.92
33	DATAX	task	null	2023-03-10 05:46:33.922	2023-03-10 05:46:33.922
34	ZEPPELIN	task	null	2023-03-10 05:46:33.924	2023-03-10 05:46:33.924
35	DINKY	task	[]	2023-03-10 05:46:33.924	2023-03-10 05:46:33.924
36	MLFLOW	task	[{"props":null,"field":"name","name":"$t('Node name')","type":"input","title":"$t('Node name')","value":null,"validate":[{"required":true,"message":null,"type":"string","trigger":"blur","min":null,"max":null}],"emit":null},{"props":null,"field":"runFlag","name":"RUN_FLAG","type":"radio","title":"RUN_FLAG","value":null,"validate":null,"emit":null,"options":[{"label":"NORMAL","value":"NORMAL","disabled":false},{"label":"FORBIDDEN","value":"FORBIDDEN","disabled":false}]}]	2023-03-10 05:46:33.926	2023-03-10 05:46:33.926
37	OPENMLDB	task	null	2023-03-10 05:46:33.927	2023-03-10 05:46:33.927
38	SWITCH	task	null	2023-03-10 05:46:33.928	2023-03-10 05:46:33.928
39	BLOCKING	task	null	2023-03-10 05:46:33.928	2023-03-10 05:46:33.928
40	FLINK	task	null	2023-03-10 05:46:33.929	2023-03-10 05:46:33.929
41	HIVECLI	task	null	2023-03-10 05:46:33.93	2023-03-10 05:46:33.93
\.


--
-- Data for Name: t_ds_process_definition; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_process_definition (id, code, name, version, description, project_code, release_state, user_id, global_params, locations, warning_group_id, flag, timeout, tenant_id, execution_type, create_time, update_time) FROM stdin;
1	8831660154784	valid_env	1		8830605209312	0	1	[]	[{"taskCode":8831656002848,"x":79,"y":99}]	\N	1	0	-1	0	2023-03-10 05:55:44.961	2023-03-10 05:55:44.961
2	8831677664800	mysql2pg	1		8830605209312	0	1	[]	[{"taskCode":8831660834080,"x":132,"y":163}]	\N	1	0	-1	0	2023-03-10 05:58:01.758	2023-03-10 05:58:01.758
\.


--
-- Data for Name: t_ds_process_definition_log; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_process_definition_log (id, code, name, version, description, project_code, release_state, user_id, global_params, locations, warning_group_id, flag, timeout, tenant_id, execution_type, operator, operate_time, create_time, update_time) FROM stdin;
1	8831660154784	valid_env	1		8830605209312	0	1	[]	[{"taskCode":8831656002848,"x":79,"y":99}]	\N	1	0	-1	0	1	2023-03-10 05:55:44.961	2023-03-10 05:55:44.961	2023-03-10 05:55:44.961
2	8831677664800	mysql2pg	1		8830605209312	0	1	[]	[{"taskCode":8831660834080,"x":132,"y":163}]	\N	1	0	-1	0	1	2023-03-10 05:58:01.758	2023-03-10 05:58:01.758	2023-03-10 05:58:01.758
\.


--
-- Data for Name: t_ds_process_instance; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_process_instance (id, name, process_definition_code, process_definition_version, state, state_history, recovery, start_time, end_time, run_times, host, command_type, command_param, task_depend_type, max_try_times, failure_strategy, warning_type, warning_group_id, schedule_time, command_start_time, global_params, process_instance_json, flag, update_time, is_sub_process, executor_id, history_cmd, dependence_schedule_times, process_instance_priority, worker_group, environment_code, timeout, tenant_id, var_pool, dry_run, next_process_instance_id, restart_time) FROM stdin;
\.


--
-- Data for Name: t_ds_process_task_relation; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_process_task_relation (id, name, project_code, process_definition_code, process_definition_version, pre_task_code, pre_task_version, post_task_code, post_task_version, condition_type, condition_params, create_time, update_time) FROM stdin;
1		8830605209312	8831660154784	1	0	0	8831656002848	1	0	{}	2023-03-10 05:55:44.977	2023-03-10 05:55:44.977
2		8830605209312	8831677664800	1	0	0	8831660834080	1	0	{}	2023-03-10 05:58:01.768	2023-03-10 05:58:01.768
\.


--
-- Data for Name: t_ds_process_task_relation_log; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_process_task_relation_log (id, name, project_code, process_definition_code, process_definition_version, pre_task_code, pre_task_version, post_task_code, post_task_version, condition_type, condition_params, operator, operate_time, create_time, update_time) FROM stdin;
1		8830605209312	8831660154784	1	0	0	8831656002848	1	0	{}	1	2023-03-10 05:55:44.977	2023-03-10 05:55:44.977	2023-03-10 05:55:44.977
2		8830605209312	8831677664800	1	0	0	8831660834080	1	0	{}	1	2023-03-10 05:58:01.768	2023-03-10 05:58:01.768	2023-03-10 05:58:01.768
\.


--
-- Data for Name: t_ds_project; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_project (id, name, code, description, user_id, flag, create_time, update_time) FROM stdin;
1	demo	8830605209312		1	1	2023-03-10 03:38:23.195	2023-03-10 03:38:23.195
\.


--
-- Data for Name: t_ds_queue; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_queue (id, queue_name, queue, create_time, update_time) FROM stdin;
1	default	default	2018-11-29 10:22:33	2018-11-29 10:22:33
\.


--
-- Data for Name: t_ds_relation_datasource_user; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_datasource_user (id, user_id, datasource_id, perm, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_relation_namespace_user; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_namespace_user (id, user_id, namespace_id, perm, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_relation_process_instance; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_process_instance (id, parent_process_instance_id, parent_task_instance_id, process_instance_id) FROM stdin;
\.


--
-- Data for Name: t_ds_relation_project_user; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_project_user (id, user_id, project_id, perm, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_relation_resources_user; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_resources_user (id, user_id, resources_id, perm, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_relation_rule_execute_sql; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_rule_execute_sql (id, rule_id, execute_sql_id, create_time, update_time) FROM stdin;
1	1	1	2021-03-03 11:31:24	2021-03-03 11:31:24
3	5	4	2021-03-03 11:31:24	2021-03-03 11:31:24
2	3	3	2021-03-03 11:31:24	2021-03-03 11:31:24
4	3	8	2021-03-03 11:31:24	2021-03-03 11:31:24
5	6	6	2021-03-03 11:31:24	2021-03-03 11:31:24
6	6	7	2021-03-03 11:31:24	2021-03-03 11:31:24
7	7	9	2021-03-03 11:31:24	2021-03-03 11:31:24
8	7	10	2021-03-03 11:31:24	2021-03-03 11:31:24
9	8	11	2021-03-03 11:31:24	2021-03-03 11:31:24
10	8	12	2021-03-03 11:31:24	2021-03-03 11:31:24
11	9	13	2021-03-03 11:31:24	2021-03-03 11:31:24
12	9	14	2021-03-03 11:31:24	2021-03-03 11:31:24
13	10	15	2021-03-03 11:31:24	2021-03-03 11:31:24
14	1	16	2021-03-03 11:31:24	2021-03-03 11:31:24
15	5	17	2021-03-03 11:31:24	2021-03-03 11:31:24
\.


--
-- Data for Name: t_ds_relation_rule_input_entry; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_rule_input_entry (id, rule_id, rule_input_entry_id, values_map, index, create_time, update_time) FROM stdin;
1	1	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
2	1	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
3	1	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
4	1	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
5	1	5	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
6	1	6	{"statistics_name":"null_count.nulls"}	6	2021-03-03 11:31:24	2021-03-03 11:31:24
7	1	7	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
8	1	8	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
9	1	9	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
10	1	10	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
11	1	17		11	2021-03-03 11:31:24	2021-03-03 11:31:24
12	1	19	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
13	2	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
14	2	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
15	2	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
16	2	6	{"is_show":"true","can_edit":"true"}	4	2021-03-03 11:31:24	2021-03-03 11:31:24
17	2	16	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
18	2	4	\N	6	2021-03-03 11:31:24	2021-03-03 11:31:24
19	2	7	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
20	2	8	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
21	2	9	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
22	2	10	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
24	2	19	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
25	3	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
26	3	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
27	3	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
28	3	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
29	3	11	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
30	3	12	\N	6	2021-03-03 11:31:24	2021-03-03 11:31:24
31	3	13	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
32	3	14	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
33	3	15	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
34	3	7	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
35	3	8	\N	11	2021-03-03 11:31:24	2021-03-03 11:31:24
36	3	9	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
37	3	10	\N	13	2021-03-03 11:31:24	2021-03-03 11:31:24
38	3	17	{"comparison_name":"total_count.total"}	14	2021-03-03 11:31:24	2021-03-03 11:31:24
39	3	19	\N	15	2021-03-03 11:31:24	2021-03-03 11:31:24
40	4	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
41	4	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
42	4	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
43	4	6	{"is_show":"true","can_edit":"true"}	4	2021-03-03 11:31:24	2021-03-03 11:31:24
44	4	16	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
45	4	11	\N	6	2021-03-03 11:31:24	2021-03-03 11:31:24
46	4	12	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
47	4	13	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
48	4	17	{"is_show":"true","can_edit":"true"}	9	2021-03-03 11:31:24	2021-03-03 11:31:24
49	4	18	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
50	4	7	\N	11	2021-03-03 11:31:24	2021-03-03 11:31:24
51	4	8	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
52	4	9	\N	13	2021-03-03 11:31:24	2021-03-03 11:31:24
53	4	10	\N	14	2021-03-03 11:31:24	2021-03-03 11:31:24
62	3	6	{"statistics_name":"miss_count.miss"}	18	2021-03-03 11:31:24	2021-03-03 11:31:24
63	5	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
64	5	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
65	5	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
66	5	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
67	5	5	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
68	5	6	{"statistics_name":"invalid_length_count.valids"}	6	2021-03-03 11:31:24	2021-03-03 11:31:24
69	5	24	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
70	5	23	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
71	5	7	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
72	5	8	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
73	5	9	\N	11	2021-03-03 11:31:24	2021-03-03 11:31:24
74	5	10	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
75	5	17		13	2021-03-03 11:31:24	2021-03-03 11:31:24
76	5	19	\N	14	2021-03-03 11:31:24	2021-03-03 11:31:24
79	6	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
80	6	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
81	6	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
82	6	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
83	6	5	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
84	6	6	{"statistics_name":"duplicate_count.duplicates"}	6	2021-03-03 11:31:24	2021-03-03 11:31:24
85	6	7	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
86	6	8	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
87	6	9	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
88	6	10	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
89	6	17		11	2021-03-03 11:31:24	2021-03-03 11:31:24
90	6	19	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
93	7	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
94	7	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
95	7	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
96	7	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
97	7	5	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
98	7	6	{"statistics_name":"regexp_count.regexps"}	6	2021-03-03 11:31:24	2021-03-03 11:31:24
99	7	25	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
100	7	7	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
101	7	8	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
102	7	9	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
103	7	10	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
104	7	17	\N	11	2021-03-03 11:31:24	2021-03-03 11:31:24
105	7	19	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
108	8	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
109	8	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
110	8	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
111	8	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
112	8	5	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
113	8	6	{"statistics_name":"timeliness_count.timeliness"}	6	2021-03-03 11:31:24	2021-03-03 11:31:24
114	8	26	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
115	8	27	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
116	8	7	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
117	8	8	\N	11	2021-03-03 11:31:24	2021-03-03 11:31:24
118	8	9	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
119	8	10	\N	13	2021-03-03 11:31:24	2021-03-03 11:31:24
120	8	17	\N	14	2021-03-03 11:31:24	2021-03-03 11:31:24
121	8	19	\N	15	2021-03-03 11:31:24	2021-03-03 11:31:24
124	9	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
125	9	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
126	9	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
127	9	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
128	9	5	\N	5	2021-03-03 11:31:24	2021-03-03 11:31:24
129	9	6	{"statistics_name":"enum_count.enums"}	6	2021-03-03 11:31:24	2021-03-03 11:31:24
130	9	28	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
131	9	7	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
132	9	8	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
133	9	9	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
134	9	10	\N	11	2021-03-03 11:31:24	2021-03-03 11:31:24
135	9	17	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
136	9	19	\N	13	2021-03-03 11:31:24	2021-03-03 11:31:24
139	10	1	\N	1	2021-03-03 11:31:24	2021-03-03 11:31:24
140	10	2	\N	2	2021-03-03 11:31:24	2021-03-03 11:31:24
141	10	3	\N	3	2021-03-03 11:31:24	2021-03-03 11:31:24
142	10	4	\N	4	2021-03-03 11:31:24	2021-03-03 11:31:24
143	10	6	{"statistics_name":"table_count.total"}	6	2021-03-03 11:31:24	2021-03-03 11:31:24
144	10	7	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
145	10	8	\N	8	2021-03-03 11:31:24	2021-03-03 11:31:24
146	10	9	\N	9	2021-03-03 11:31:24	2021-03-03 11:31:24
147	10	10	\N	10	2021-03-03 11:31:24	2021-03-03 11:31:24
148	10	17	\N	11	2021-03-03 11:31:24	2021-03-03 11:31:24
149	10	19	\N	12	2021-03-03 11:31:24	2021-03-03 11:31:24
150	8	29	\N	7	2021-03-03 11:31:24	2021-03-03 11:31:24
\.


--
-- Data for Name: t_ds_relation_udfs_user; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_relation_udfs_user (id, user_id, udf_id, perm, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_resources; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_resources (id, alias, file_name, description, user_id, type, size, create_time, update_time, pid, full_name, is_directory) FROM stdin;
\.


--
-- Data for Name: t_ds_schedules; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_schedules (id, process_definition_code, start_time, end_time, timezone_id, crontab, failure_strategy, user_id, release_state, warning_type, warning_group_id, process_instance_priority, worker_group, environment_code, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_session; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_session (id, user_id, ip, last_login_time) FROM stdin;
130bff7c-91cb-45f7-a6e6-ff0423832c9d	1	192.168.16.1	2023-03-10 05:46:36.429
\.


--
-- Data for Name: t_ds_task_definition; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_task_definition (id, code, name, version, description, project_code, user_id, task_type, task_execute_type, task_params, flag, task_priority, worker_group, environment_code, fail_retry_times, fail_retry_interval, timeout_flag, timeout_notify_strategy, timeout, delay_time, task_group_id, task_group_priority, resource_ids, cpu_quota, memory_max, create_time, update_time) FROM stdin;
1	8831656002848	valid_env	1		8830605209312	1	SHELL	0	{"localParams":[],"rawScript":"echo \\"JAVA_HOME: $JAVA_HOME \\\\n\\"\\necho \\"DATAX_HOME: $DATAX_HOME \\\\n\\"\\necho \\"PYTHON_HOME: $PYTHON_HOME \\\\n\\"\\njava -version\\npython --version","resourceList":[]}	1	2	default	8831653965344	0	1	0	\N	0	0	0	0		-1	-1	2023-03-10 05:55:44.961	2023-03-10 05:55:44.961
2	8831660834080	mysql2pg	1		8830605209312	1	DATAX	0	{"localParams":[],"resourceList":[],"customConfig":1,"json":"{\\n  \\"job\\": {\\n    \\"setting\\": {\\n      \\"speed\\": {\\n        \\"channel\\": 1\\n      }\\n    },\\n    \\"content\\": [\\n      {\\n        \\"reader\\": {\\n          \\"name\\": \\"mysqlreader\\",\\n          \\"parameter\\": {\\n            \\"username\\": \\"etl\\",\\n            \\"password\\": \\"Admin@123\\",\\n            \\"splitPk\\": \\"id\\",\\n            \\"where\\": \\"id <= 20\\",\\n            \\"column\\": [\\n              \\"*\\"\\n            ],\\n            \\"connection\\": [\\n              {\\n                \\"jdbcUrl\\": [\\n                  \\"jdbc:mysql://mysql:3306/etl?useSSL=false\\"\\n                ],\\n                \\"table\\": [\\n                  \\"products\\"\\n                ]\\n              }\\n            ]\\n          }\\n        },\\n        \\"writer\\": {\\n          \\"name\\": \\"postgresqlwriter\\",\\n          \\"parameter\\": {\\n            \\"username\\": \\"etl\\",\\n            \\"password\\": \\"Admin@123\\",\\n            \\"column\\": [\\n              \\"id\\",\\n              \\"product_code\\",\\n              \\"product_name\\",\\n              \\"product_line\\",\\n              \\"product_scale\\",\\n              \\"product_vendor\\",\\n              \\"product_description\\",\\n              \\"quantity_in_stock\\",\\n              \\"buy_price\\",\\n              \\"msrp\\"\\n            ],\\n            \\"preSql\\": [\\n              \\"delete from products where 1=1\\"\\n            ],\\n            \\"connection\\": [\\n              {\\n                \\"jdbcUrl\\": \\"jdbc:postgresql://postgres:5432/etl\\",\\n                \\"table\\": [\\n                  \\"products\\"\\n                ]\\n              }\\n            ]\\n          }\\n        }\\n      }\\n    ]\\n  }\\n}","xms":1,"xmx":1}	1	2	default	8831653965344	0	1	0	\N	0	0	0	0		-1	-1	2023-03-10 05:58:01.758	2023-03-10 05:58:01.758
\.


--
-- Data for Name: t_ds_task_definition_log; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_task_definition_log (id, code, name, version, description, project_code, user_id, task_type, task_execute_type, task_params, flag, task_priority, worker_group, environment_code, fail_retry_times, fail_retry_interval, timeout_flag, timeout_notify_strategy, timeout, delay_time, resource_ids, operator, task_group_id, task_group_priority, operate_time, cpu_quota, memory_max, create_time, update_time) FROM stdin;
1	8831656002848	valid_env	1		8830605209312	1	SHELL	0	{"localParams":[],"rawScript":"echo \\"JAVA_HOME: $JAVA_HOME \\\\n\\"\\necho \\"DATAX_HOME: $DATAX_HOME \\\\n\\"\\necho \\"PYTHON_HOME: $PYTHON_HOME \\\\n\\"\\njava -version\\npython --version","resourceList":[]}	1	2	default	8831653965344	0	1	0	\N	0	0		1	0	0	2023-03-10 05:55:44.961	-1	-1	2023-03-10 05:55:44.961	2023-03-10 05:55:44.961
2	8831660834080	mysql2pg	1		8830605209312	1	DATAX	0	{"localParams":[],"resourceList":[],"customConfig":1,"json":"{\\n  \\"job\\": {\\n    \\"setting\\": {\\n      \\"speed\\": {\\n        \\"channel\\": 1\\n      }\\n    },\\n    \\"content\\": [\\n      {\\n        \\"reader\\": {\\n          \\"name\\": \\"mysqlreader\\",\\n          \\"parameter\\": {\\n            \\"username\\": \\"etl\\",\\n            \\"password\\": \\"Admin@123\\",\\n            \\"splitPk\\": \\"id\\",\\n            \\"where\\": \\"id <= 20\\",\\n            \\"column\\": [\\n              \\"*\\"\\n            ],\\n            \\"connection\\": [\\n              {\\n                \\"jdbcUrl\\": [\\n                  \\"jdbc:mysql://mysql:3306/etl?useSSL=false\\"\\n                ],\\n                \\"table\\": [\\n                  \\"products\\"\\n                ]\\n              }\\n            ]\\n          }\\n        },\\n        \\"writer\\": {\\n          \\"name\\": \\"postgresqlwriter\\",\\n          \\"parameter\\": {\\n            \\"username\\": \\"etl\\",\\n            \\"password\\": \\"Admin@123\\",\\n            \\"column\\": [\\n              \\"id\\",\\n              \\"product_code\\",\\n              \\"product_name\\",\\n              \\"product_line\\",\\n              \\"product_scale\\",\\n              \\"product_vendor\\",\\n              \\"product_description\\",\\n              \\"quantity_in_stock\\",\\n              \\"buy_price\\",\\n              \\"msrp\\"\\n            ],\\n            \\"preSql\\": [\\n              \\"delete from products where 1=1\\"\\n            ],\\n            \\"connection\\": [\\n              {\\n                \\"jdbcUrl\\": \\"jdbc:postgresql://postgres:5432/etl\\",\\n                \\"table\\": [\\n                  \\"products\\"\\n                ]\\n              }\\n            ]\\n          }\\n        }\\n      }\\n    ]\\n  }\\n}","xms":1,"xmx":1}	1	2	default	8831653965344	0	1	0	\N	0	0		1	0	0	2023-03-10 05:58:01.758	-1	-1	2023-03-10 05:58:01.758	2023-03-10 05:58:01.758
\.


--
-- Data for Name: t_ds_task_group; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_task_group (id, name, description, group_size, project_code, use_size, user_id, status, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_task_group_queue; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_task_group_queue (id, task_id, task_name, group_id, process_id, priority, status, force_start, in_queue, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_task_instance; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_task_instance (id, name, task_type, task_execute_type, task_code, task_definition_version, process_instance_id, state, submit_time, start_time, end_time, host, execute_path, log_path, alert_flag, retry_times, pid, app_link, task_params, flag, retry_interval, max_retry_times, task_instance_priority, worker_group, environment_code, environment_config, executor_id, first_submit_time, delay_time, task_group_id, var_pool, dry_run, cpu_quota, memory_max) FROM stdin;
\.


--
-- Data for Name: t_ds_tenant; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_tenant (id, tenant_code, description, queue_id, create_time, update_time) FROM stdin;
1	default		1	2023-03-10 05:53:22.264	2023-03-10 05:53:22.264
\.


--
-- Data for Name: t_ds_udfs; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_udfs (id, user_id, func_name, class_name, type, arg_types, database, description, resource_id, resource_name, create_time, update_time) FROM stdin;
\.


--
-- Data for Name: t_ds_user; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_user (id, user_name, user_password, user_type, email, phone, tenant_id, create_time, update_time, queue, state, time_zone) FROM stdin;
1	admin	7ad2410b2f4c074479a8937a28a22b8f	0	xxx@qq.com		1	2018-03-27 15:48:50	2023-03-10 05:53:32.465	default	1	\N
\.


--
-- Data for Name: t_ds_version; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_version (id, version) FROM stdin;
1	3.1.5
\.


--
-- Data for Name: t_ds_worker_group; Type: TABLE DATA; Schema: public; Owner: etl
--

COPY public.t_ds_worker_group (id, name, addr_list, create_time, update_time, description, other_params_json) FROM stdin;
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.products_id_seq', 1, false);


--
-- Name: t_ds_access_token_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_access_token_id_sequence', 1, false);


--
-- Name: t_ds_alert_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_alert_id_sequence', 1, false);


--
-- Name: t_ds_alert_plugin_instance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_alert_plugin_instance_id_seq', 1, false);


--
-- Name: t_ds_alert_send_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_alert_send_status_id_seq', 1, false);


--
-- Name: t_ds_alertgroup_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_alertgroup_id_sequence', 1, true);


--
-- Name: t_ds_audit_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_audit_log_id_seq', 1, false);


--
-- Name: t_ds_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_cluster_id_seq', 1, false);


--
-- Name: t_ds_command_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_command_id_sequence', 1, false);


--
-- Name: t_ds_datasource_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_datasource_id_sequence', 1, false);


--
-- Name: t_ds_dq_comparison_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_dq_comparison_type_id_seq', 1, false);


--
-- Name: t_ds_dq_execute_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_dq_execute_result_id_seq', 1, false);


--
-- Name: t_ds_dq_rule_execute_sql_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_dq_rule_execute_sql_id_seq', 1, false);


--
-- Name: t_ds_dq_rule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_dq_rule_id_seq', 1, false);


--
-- Name: t_ds_dq_rule_input_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_dq_rule_input_entry_id_seq', 1, false);


--
-- Name: t_ds_dq_task_statistics_value_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_dq_task_statistics_value_id_seq', 1, false);


--
-- Name: t_ds_environment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_environment_id_seq', 1, true);


--
-- Name: t_ds_environment_worker_group_relation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_environment_worker_group_relation_id_seq', 1, true);


--
-- Name: t_ds_fav_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_fav_task_id_seq', 1, false);


--
-- Name: t_ds_k8s_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_k8s_id_seq', 1, false);


--
-- Name: t_ds_k8s_namespace_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_k8s_namespace_id_seq', 1, false);


--
-- Name: t_ds_plugin_define_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_plugin_define_id_seq', 41, true);


--
-- Name: t_ds_process_definition_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_process_definition_id_sequence', 1, false);


--
-- Name: t_ds_process_definition_log_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_process_definition_log_id_sequence', 2, true);


--
-- Name: t_ds_process_instance_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_process_instance_id_sequence', 1, false);


--
-- Name: t_ds_process_task_relation_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_process_task_relation_id_sequence', 2, true);


--
-- Name: t_ds_process_task_relation_log_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_process_task_relation_log_id_sequence', 2, true);


--
-- Name: t_ds_project_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_project_id_sequence', 1, false);


--
-- Name: t_ds_queue_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_queue_id_sequence', 1, true);


--
-- Name: t_ds_relation_datasource_user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_datasource_user_id_sequence', 1, false);


--
-- Name: t_ds_relation_namespace_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_namespace_user_id_seq', 1, false);


--
-- Name: t_ds_relation_process_instance_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_process_instance_id_sequence', 1, false);


--
-- Name: t_ds_relation_project_user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_project_user_id_sequence', 1, false);


--
-- Name: t_ds_relation_resources_user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_resources_user_id_sequence', 1, false);


--
-- Name: t_ds_relation_rule_execute_sql_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_rule_execute_sql_id_seq', 1, false);


--
-- Name: t_ds_relation_rule_input_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_rule_input_entry_id_seq', 1, false);


--
-- Name: t_ds_relation_udfs_user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_relation_udfs_user_id_sequence', 1, false);


--
-- Name: t_ds_resources_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_resources_id_sequence', 1, false);


--
-- Name: t_ds_schedules_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_schedules_id_sequence', 1, false);


--
-- Name: t_ds_task_definition_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_task_definition_id_sequence', 2, true);


--
-- Name: t_ds_task_definition_log_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_task_definition_log_id_sequence', 2, true);


--
-- Name: t_ds_task_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_task_group_id_seq', 1, false);


--
-- Name: t_ds_task_group_queue_id_seq; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_task_group_queue_id_seq', 1, false);


--
-- Name: t_ds_task_instance_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_task_instance_id_sequence', 1, false);


--
-- Name: t_ds_tenant_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_tenant_id_sequence', 1, true);


--
-- Name: t_ds_udfs_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_udfs_id_sequence', 1, false);


--
-- Name: t_ds_user_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_user_id_sequence', 1, true);


--
-- Name: t_ds_version_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_version_id_sequence', 1, true);


--
-- Name: t_ds_worker_group_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: etl
--

SELECT pg_catalog.setval('public.t_ds_worker_group_id_sequence', 1, false);


--
-- Name: t_ds_alert_send_status alert_send_status_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alert_send_status
    ADD CONSTRAINT alert_send_status_unique UNIQUE (alert_id, alert_plugin_instance_id);


--
-- Name: t_ds_cluster cluster_code_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_cluster
    ADD CONSTRAINT cluster_code_unique UNIQUE (code);


--
-- Name: t_ds_cluster cluster_name_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_cluster
    ADD CONSTRAINT cluster_name_unique UNIQUE (name);


--
-- Name: t_ds_environment environment_code_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_environment
    ADD CONSTRAINT environment_code_unique UNIQUE (code);


--
-- Name: t_ds_environment environment_name_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_environment
    ADD CONSTRAINT environment_name_unique UNIQUE (name);


--
-- Name: t_ds_environment_worker_group_relation environment_worker_group_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_environment_worker_group_relation
    ADD CONSTRAINT environment_worker_group_unique UNIQUE (environment_code, worker_group);


--
-- Name: t_ds_k8s_namespace k8s_namespace_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_k8s_namespace
    ADD CONSTRAINT k8s_namespace_unique UNIQUE (namespace, cluster_code);


--
-- Name: t_ds_worker_group name_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_worker_group
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: t_ds_relation_namespace_user namespace_user_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_namespace_user
    ADD CONSTRAINT namespace_user_unique UNIQUE (user_id, namespace_id);


--
-- Name: t_ds_process_definition process_definition_unique; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_process_definition
    ADD CONSTRAINT process_definition_unique UNIQUE (name, project_code);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: qrtz_blob_triggers qrtz_blob_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT qrtz_blob_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_calendars qrtz_calendars_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT qrtz_calendars_pkey PRIMARY KEY (sched_name, calendar_name);


--
-- Name: qrtz_cron_triggers qrtz_cron_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT qrtz_cron_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_fired_triggers qrtz_fired_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT qrtz_fired_triggers_pkey PRIMARY KEY (sched_name, entry_id);


--
-- Name: qrtz_job_details qrtz_job_details_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT qrtz_job_details_pkey PRIMARY KEY (sched_name, job_name, job_group);


--
-- Name: qrtz_locks qrtz_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT qrtz_locks_pkey PRIMARY KEY (sched_name, lock_name);


--
-- Name: qrtz_paused_trigger_grps qrtz_paused_trigger_grps_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT qrtz_paused_trigger_grps_pkey PRIMARY KEY (sched_name, trigger_group);


--
-- Name: qrtz_scheduler_state qrtz_scheduler_state_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT qrtz_scheduler_state_pkey PRIMARY KEY (sched_name, instance_name);


--
-- Name: qrtz_simple_triggers qrtz_simple_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT qrtz_simple_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_simprop_triggers qrtz_simprop_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT qrtz_simprop_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: qrtz_triggers qrtz_triggers_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT qrtz_triggers_pkey PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- Name: t_ds_access_token t_ds_access_token_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_access_token
    ADD CONSTRAINT t_ds_access_token_pkey PRIMARY KEY (id);


--
-- Name: t_ds_alert t_ds_alert_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alert
    ADD CONSTRAINT t_ds_alert_pkey PRIMARY KEY (id);


--
-- Name: t_ds_alert_plugin_instance t_ds_alert_plugin_instance_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alert_plugin_instance
    ADD CONSTRAINT t_ds_alert_plugin_instance_pk PRIMARY KEY (id);


--
-- Name: t_ds_alert_send_status t_ds_alert_send_status_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alert_send_status
    ADD CONSTRAINT t_ds_alert_send_status_pkey PRIMARY KEY (id);


--
-- Name: t_ds_alertgroup t_ds_alertgroup_name_un; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alertgroup
    ADD CONSTRAINT t_ds_alertgroup_name_un UNIQUE (group_name);


--
-- Name: t_ds_alertgroup t_ds_alertgroup_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_alertgroup
    ADD CONSTRAINT t_ds_alertgroup_pkey PRIMARY KEY (id);


--
-- Name: t_ds_audit_log t_ds_audit_log_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_audit_log
    ADD CONSTRAINT t_ds_audit_log_pkey PRIMARY KEY (id);


--
-- Name: t_ds_cluster t_ds_cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_cluster
    ADD CONSTRAINT t_ds_cluster_pkey PRIMARY KEY (id);


--
-- Name: t_ds_command t_ds_command_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_command
    ADD CONSTRAINT t_ds_command_pkey PRIMARY KEY (id);


--
-- Name: t_ds_datasource t_ds_datasource_name_un; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_datasource
    ADD CONSTRAINT t_ds_datasource_name_un UNIQUE (name, type);


--
-- Name: t_ds_datasource t_ds_datasource_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_datasource
    ADD CONSTRAINT t_ds_datasource_pkey PRIMARY KEY (id);


--
-- Name: t_ds_dq_comparison_type t_ds_dq_comparison_type_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_comparison_type
    ADD CONSTRAINT t_ds_dq_comparison_type_pk PRIMARY KEY (id);


--
-- Name: t_ds_dq_execute_result t_ds_dq_execute_result_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_execute_result
    ADD CONSTRAINT t_ds_dq_execute_result_pk PRIMARY KEY (id);


--
-- Name: t_ds_dq_rule_execute_sql t_ds_dq_rule_execute_sql_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_rule_execute_sql
    ADD CONSTRAINT t_ds_dq_rule_execute_sql_pk PRIMARY KEY (id);


--
-- Name: t_ds_dq_rule_input_entry t_ds_dq_rule_input_entry_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_rule_input_entry
    ADD CONSTRAINT t_ds_dq_rule_input_entry_pk PRIMARY KEY (id);


--
-- Name: t_ds_dq_rule t_ds_dq_rule_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_rule
    ADD CONSTRAINT t_ds_dq_rule_pk PRIMARY KEY (id);


--
-- Name: t_ds_dq_task_statistics_value t_ds_dq_task_statistics_value_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_dq_task_statistics_value
    ADD CONSTRAINT t_ds_dq_task_statistics_value_pk PRIMARY KEY (id);


--
-- Name: t_ds_environment t_ds_environment_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_environment
    ADD CONSTRAINT t_ds_environment_pkey PRIMARY KEY (id);


--
-- Name: t_ds_environment_worker_group_relation t_ds_environment_worker_group_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_environment_worker_group_relation
    ADD CONSTRAINT t_ds_environment_worker_group_relation_pkey PRIMARY KEY (id);


--
-- Name: t_ds_error_command t_ds_error_command_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_error_command
    ADD CONSTRAINT t_ds_error_command_pkey PRIMARY KEY (id);


--
-- Name: t_ds_fav_task t_ds_fav_task_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_fav_task
    ADD CONSTRAINT t_ds_fav_task_pkey PRIMARY KEY (id);


--
-- Name: t_ds_k8s_namespace t_ds_k8s_namespace_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_k8s_namespace
    ADD CONSTRAINT t_ds_k8s_namespace_pkey PRIMARY KEY (id);


--
-- Name: t_ds_k8s t_ds_k8s_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_k8s
    ADD CONSTRAINT t_ds_k8s_pkey PRIMARY KEY (id);


--
-- Name: t_ds_plugin_define t_ds_plugin_define_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_plugin_define
    ADD CONSTRAINT t_ds_plugin_define_pk PRIMARY KEY (id);


--
-- Name: t_ds_plugin_define t_ds_plugin_define_un; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_plugin_define
    ADD CONSTRAINT t_ds_plugin_define_un UNIQUE (plugin_name, plugin_type);


--
-- Name: t_ds_process_definition_log t_ds_process_definition_log_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_process_definition_log
    ADD CONSTRAINT t_ds_process_definition_log_pkey PRIMARY KEY (id);


--
-- Name: t_ds_process_definition t_ds_process_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_process_definition
    ADD CONSTRAINT t_ds_process_definition_pkey PRIMARY KEY (id);


--
-- Name: t_ds_process_instance t_ds_process_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_process_instance
    ADD CONSTRAINT t_ds_process_instance_pkey PRIMARY KEY (id);


--
-- Name: t_ds_process_task_relation_log t_ds_process_task_relation_log_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_process_task_relation_log
    ADD CONSTRAINT t_ds_process_task_relation_log_pkey PRIMARY KEY (id);


--
-- Name: t_ds_process_task_relation t_ds_process_task_relation_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_process_task_relation
    ADD CONSTRAINT t_ds_process_task_relation_pkey PRIMARY KEY (id);


--
-- Name: t_ds_project t_ds_project_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_project
    ADD CONSTRAINT t_ds_project_pkey PRIMARY KEY (id);


--
-- Name: t_ds_queue t_ds_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_queue
    ADD CONSTRAINT t_ds_queue_pkey PRIMARY KEY (id);


--
-- Name: t_ds_relation_datasource_user t_ds_relation_datasource_user_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_datasource_user
    ADD CONSTRAINT t_ds_relation_datasource_user_pkey PRIMARY KEY (id);


--
-- Name: t_ds_relation_namespace_user t_ds_relation_namespace_user_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_namespace_user
    ADD CONSTRAINT t_ds_relation_namespace_user_pkey PRIMARY KEY (id);


--
-- Name: t_ds_relation_process_instance t_ds_relation_process_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_process_instance
    ADD CONSTRAINT t_ds_relation_process_instance_pkey PRIMARY KEY (id);


--
-- Name: t_ds_relation_project_user t_ds_relation_project_user_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_project_user
    ADD CONSTRAINT t_ds_relation_project_user_pkey PRIMARY KEY (id);


--
-- Name: t_ds_relation_project_user t_ds_relation_project_user_un; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_project_user
    ADD CONSTRAINT t_ds_relation_project_user_un UNIQUE (user_id, project_id);


--
-- Name: t_ds_relation_resources_user t_ds_relation_resources_user_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_resources_user
    ADD CONSTRAINT t_ds_relation_resources_user_pkey PRIMARY KEY (id);


--
-- Name: t_ds_relation_rule_execute_sql t_ds_relation_rule_execute_sql_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_rule_execute_sql
    ADD CONSTRAINT t_ds_relation_rule_execute_sql_pk PRIMARY KEY (id);


--
-- Name: t_ds_relation_rule_input_entry t_ds_relation_rule_input_entry_pk; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_rule_input_entry
    ADD CONSTRAINT t_ds_relation_rule_input_entry_pk PRIMARY KEY (id);


--
-- Name: t_ds_relation_udfs_user t_ds_relation_udfs_user_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_relation_udfs_user
    ADD CONSTRAINT t_ds_relation_udfs_user_pkey PRIMARY KEY (id);


--
-- Name: t_ds_resources t_ds_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_resources
    ADD CONSTRAINT t_ds_resources_pkey PRIMARY KEY (id);


--
-- Name: t_ds_resources t_ds_resources_un; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_resources
    ADD CONSTRAINT t_ds_resources_un UNIQUE (full_name, type);


--
-- Name: t_ds_schedules t_ds_schedules_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_schedules
    ADD CONSTRAINT t_ds_schedules_pkey PRIMARY KEY (id);


--
-- Name: t_ds_session t_ds_session_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_session
    ADD CONSTRAINT t_ds_session_pkey PRIMARY KEY (id);


--
-- Name: t_ds_task_definition_log t_ds_task_definition_log_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_task_definition_log
    ADD CONSTRAINT t_ds_task_definition_log_pkey PRIMARY KEY (id);


--
-- Name: t_ds_task_definition t_ds_task_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_task_definition
    ADD CONSTRAINT t_ds_task_definition_pkey PRIMARY KEY (id);


--
-- Name: t_ds_task_group t_ds_task_group_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_task_group
    ADD CONSTRAINT t_ds_task_group_pkey PRIMARY KEY (id);


--
-- Name: t_ds_task_group_queue t_ds_task_group_queue_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_task_group_queue
    ADD CONSTRAINT t_ds_task_group_queue_pkey PRIMARY KEY (id);


--
-- Name: t_ds_task_instance t_ds_task_instance_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_task_instance
    ADD CONSTRAINT t_ds_task_instance_pkey PRIMARY KEY (id);


--
-- Name: t_ds_tenant t_ds_tenant_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_tenant
    ADD CONSTRAINT t_ds_tenant_pkey PRIMARY KEY (id);


--
-- Name: t_ds_udfs t_ds_udfs_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_udfs
    ADD CONSTRAINT t_ds_udfs_pkey PRIMARY KEY (id);


--
-- Name: t_ds_user t_ds_user_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_user
    ADD CONSTRAINT t_ds_user_pkey PRIMARY KEY (id);


--
-- Name: t_ds_version t_ds_version_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_version
    ADD CONSTRAINT t_ds_version_pkey PRIMARY KEY (id);


--
-- Name: t_ds_worker_group t_ds_worker_group_pkey; Type: CONSTRAINT; Schema: public; Owner: etl
--

ALTER TABLE ONLY public.t_ds_worker_group
    ADD CONSTRAINT t_ds_worker_group_pkey PRIMARY KEY (id);


--
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);


--
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- Name: idx_relation_process_instance_parent_process_task; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_relation_process_instance_parent_process_task ON public.t_ds_relation_process_instance USING btree (parent_process_instance_id, parent_task_instance_id);


--
-- Name: idx_relation_process_instance_process_instance_id; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_relation_process_instance_process_instance_id ON public.t_ds_relation_process_instance USING btree (process_instance_id);


--
-- Name: idx_sign; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_sign ON public.t_ds_alert USING btree (sign);


--
-- Name: idx_status; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_status ON public.t_ds_alert USING btree (alert_status);


--
-- Name: idx_task_definition_log_code_version; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_task_definition_log_code_version ON public.t_ds_task_definition_log USING btree (code, version);


--
-- Name: idx_task_definition_log_project_code; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_task_definition_log_project_code ON public.t_ds_task_definition_log USING btree (project_code);


--
-- Name: idx_task_instance_code_version; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX idx_task_instance_code_version ON public.t_ds_task_instance USING btree (task_code, task_definition_version);


--
-- Name: priority_id_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX priority_id_index ON public.t_ds_command USING btree (process_instance_priority, id);


--
-- Name: process_definition_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX process_definition_index ON public.t_ds_process_definition USING btree (code, id);


--
-- Name: process_instance_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX process_instance_index ON public.t_ds_process_instance USING btree (process_definition_code, id);


--
-- Name: process_task_relation_idx_post_task_code_version; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX process_task_relation_idx_post_task_code_version ON public.t_ds_process_task_relation USING btree (post_task_code, post_task_version);


--
-- Name: process_task_relation_idx_pre_task_code_version; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX process_task_relation_idx_pre_task_code_version ON public.t_ds_process_task_relation USING btree (pre_task_code, pre_task_version);


--
-- Name: process_task_relation_idx_project_code_process_definition_code; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX process_task_relation_idx_project_code_process_definition_code ON public.t_ds_process_task_relation USING btree (project_code, process_definition_code);


--
-- Name: process_task_relation_log_idx_project_code_process_definition_c; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX process_task_relation_log_idx_project_code_process_definition_c ON public.t_ds_process_task_relation_log USING btree (project_code, process_definition_code);


--
-- Name: relation_project_user_id_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX relation_project_user_id_index ON public.t_ds_relation_project_user USING btree (user_id);


--
-- Name: start_time_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX start_time_index ON public.t_ds_process_instance USING btree (start_time, end_time);


--
-- Name: task_definition_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX task_definition_index ON public.t_ds_task_definition USING btree (project_code, id);


--
-- Name: unique_code; Type: INDEX; Schema: public; Owner: etl
--

CREATE UNIQUE INDEX unique_code ON public.t_ds_project USING btree (code);


--
-- Name: unique_func_name; Type: INDEX; Schema: public; Owner: etl
--

CREATE UNIQUE INDEX unique_func_name ON public.t_ds_udfs USING btree (func_name);


--
-- Name: unique_name; Type: INDEX; Schema: public; Owner: etl
--

CREATE UNIQUE INDEX unique_name ON public.t_ds_project USING btree (name);


--
-- Name: unique_queue_name; Type: INDEX; Schema: public; Owner: etl
--

CREATE UNIQUE INDEX unique_queue_name ON public.t_ds_queue USING btree (queue_name);


--
-- Name: unique_tenant_code; Type: INDEX; Schema: public; Owner: etl
--

CREATE UNIQUE INDEX unique_tenant_code ON public.t_ds_tenant USING btree (tenant_code);


--
-- Name: user_id_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX user_id_index ON public.t_ds_project USING btree (user_id);


--
-- Name: version_index; Type: INDEX; Schema: public; Owner: etl
--

CREATE INDEX version_index ON public.t_ds_version USING btree (version);


--
-- PostgreSQL database dump complete
--

