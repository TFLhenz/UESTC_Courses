toc.dat                                                                                             0000600 0004000 0002000 00000032602 14420032265 0014440 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       #    $                {         
   StuGradeDB    11.7    11.7 -    k           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false         l           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false         m           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false         n           1262    16662 
   StuGradeDB    DATABASE     �   CREATE DATABASE "StuGradeDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Chinese (Simplified)_People''s Republic of China.936' LC_CTYPE = 'Chinese (Simplified)_People''s Republic of China.936';
    DROP DATABASE "StuGradeDB";
             postgres    false         �            1259    16663    grade    TABLE     �   CREATE TABLE public.grade (
    gradeid bigint NOT NULL,
    studentid character(13) NOT NULL,
    courseid character(10) NOT NULL,
    coursetime character varying(20),
    grade smallint,
    method character(10) DEFAULT '闭卷考试'::bpchar
);
    DROP TABLE public.grade;
       public         postgres    false         o           0    0    TABLE grade    ACL     o   REVOKE ALL ON TABLE public.grade FROM postgres;
GRANT ALL ON TABLE public.grade TO postgres WITH GRANT OPTION;
            public       postgres    false    196         �            1259    16667    Grade_GradeID_seq    SEQUENCE     �   CREATE SEQUENCE public."Grade_GradeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Grade_GradeID_seq";
       public       postgres    false    196         p           0    0    Grade_GradeID_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Grade_GradeID_seq" OWNED BY public.grade.gradeid;
            public       postgres    false    197         �            1259    16669    course    TABLE     �   CREATE TABLE public.course (
    courseid character(10) NOT NULL,
    coursename character varying(20) NOT NULL,
    coursehours integer,
    credit smallint
);
    DROP TABLE public.course;
       public         postgres    false         q           0    0    TABLE course    ACL     q   REVOKE ALL ON TABLE public.course FROM postgres;
GRANT ALL ON TABLE public.course TO postgres WITH GRANT OPTION;
            public       postgres    false    198         �            1259    16672    courserelating    VIEW     �   CREATE VIEW public.courserelating AS
 SELECT course.coursename
   FROM public.course
  WHERE ((course.coursename)::text ~~ '%电路%'::text);
 !   DROP VIEW public.courserelating;
       public       postgres    false    198         �            1259    16676    courserelating2    VIEW     �   CREATE VIEW public.courserelating2 AS
 SELECT course.coursename
   FROM public.course
  WHERE ((course.coursename)::text ~~ '%电路%'::text);
 "   DROP VIEW public.courserelating2;
       public       postgres    false    198         �            1259    16680 
   grademin60    VIEW     �   CREATE VIEW public.grademin60 AS
 SELECT grade.studentid,
    min(grade.grade) AS mingrade
   FROM public.grade
  GROUP BY grade.studentid
 HAVING (min(grade.grade) >= 60);
    DROP VIEW public.grademin60;
       public       postgres    false    196    196         �            1259    16684 
   grademin61    VIEW     �   CREATE VIEW public.grademin61 AS
 SELECT grade.studentid,
    min(grade.grade) AS mingrade
   FROM public.grade
  GROUP BY grade.studentid
 HAVING (min(grade.grade) >= 60);
    DROP VIEW public.grademin61;
       public       postgres    false    196    196         �            1259    16688    student    TABLE     �   CREATE TABLE public.student (
    studentid character(13) NOT NULL,
    studentname character varying(10) NOT NULL,
    gender boolean,
    birthday date,
    major character varying(20)
);
    DROP TABLE public.student;
       public         postgres    false         r           0    0    TABLE student    COMMENT     0   COMMENT ON TABLE public.student IS '学生表';
            public       postgres    false    203         s           0    0    TABLE student    ACL     s   REVOKE ALL ON TABLE public.student FROM postgres;
GRANT ALL ON TABLE public.student TO postgres WITH GRANT OPTION;
            public       postgres    false    203         �            1259    16691    studentnopass    VIEW     �   CREATE VIEW public.studentnopass AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
     DROP VIEW public.studentnopass;
       public       postgres    false    196    196         �            1259    16695    studentnopass1    VIEW     �   CREATE VIEW public.studentnopass1 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 !   DROP VIEW public.studentnopass1;
       public       postgres    false    196    196         �            1259    16699    studentnopass14    VIEW     �   CREATE VIEW public.studentnopass14 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 "   DROP VIEW public.studentnopass14;
       public       postgres    false    196    196         �            1259    16703    studentnopass18    VIEW     �   CREATE VIEW public.studentnopass18 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 "   DROP VIEW public.studentnopass18;
       public       postgres    false    196    196         �            1259    16707    studentnopass19    VIEW     �   CREATE VIEW public.studentnopass19 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 "   DROP VIEW public.studentnopass19;
       public       postgres    false    196    196         �            1259    16711    studentnopass2    VIEW     �   CREATE VIEW public.studentnopass2 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 !   DROP VIEW public.studentnopass2;
       public       postgres    false    196    196         �            1259    16715    studentnopass20    VIEW     �   CREATE VIEW public.studentnopass20 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 "   DROP VIEW public.studentnopass20;
       public       postgres    false    196    196         �            1259    16719    studentnopass3    VIEW     �   CREATE VIEW public.studentnopass3 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 !   DROP VIEW public.studentnopass3;
       public       postgres    false    196    196         �            1259    16723    studentnopass4    VIEW     *  CREATE VIEW public.studentnopass4 AS
 SELECT a.studentid,
    a.studentname,
    g.grade,
    c.coursename
   FROM ((public.student a
     JOIN public.grade g ON ((a.studentid = g.studentid)))
     JOIN public.course c ON ((g.courseid = c.courseid)))
  WHERE (g.grade < 60)
  ORDER BY a.studentid;
 !   DROP VIEW public.studentnopass4;
       public       postgres    false    196    196    196    198    198    203    203         �            1259    16727    studentnopass5    VIEW     *  CREATE VIEW public.studentnopass5 AS
 SELECT a.studentid,
    a.studentname,
    g.grade,
    c.coursename
   FROM ((public.student a
     JOIN public.grade g ON ((a.studentid = g.studentid)))
     JOIN public.course c ON ((g.courseid = c.courseid)))
  WHERE (g.grade < 60)
  ORDER BY a.studentid;
 !   DROP VIEW public.studentnopass5;
       public       postgres    false    203    203    196    196    196    198    198         �            1259    16731    studentnopass6    VIEW     �   CREATE VIEW public.studentnopass6 AS
 SELECT grade.studentid,
    count(*) AS courseid
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 !   DROP VIEW public.studentnopass6;
       public       postgres    false    196    196         �            1259    16735    studentnopass7    VIEW     �   CREATE VIEW public.studentnopass7 AS
 SELECT grade.studentid,
    count(*) AS courseid
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 !   DROP VIEW public.studentnopass7;
       public       postgres    false    196    196         �            1259    16739    studentnopass8    VIEW     �   CREATE VIEW public.studentnopass8 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 !   DROP VIEW public.studentnopass8;
       public       postgres    false    196    196         �            1259    25324    teacher    TABLE     h   CREATE TABLE public.teacher (
    teacherid character(12) NOT NULL,
    tname character(12) NOT NULL
);
    DROP TABLE public.teacher;
       public         postgres    false         �
           2604    16743    grade gradeid    DEFAULT     p   ALTER TABLE ONLY public.grade ALTER COLUMN gradeid SET DEFAULT nextval('public."Grade_GradeID_seq"'::regclass);
 <   ALTER TABLE public.grade ALTER COLUMN gradeid DROP DEFAULT;
       public       postgres    false    197    196         f          0    16669    course 
   TABLE DATA               K   COPY public.course (courseid, coursename, coursehours, credit) FROM stdin;
    public       postgres    false    198       2918.dat d          0    16663    grade 
   TABLE DATA               X   COPY public.grade (gradeid, studentid, courseid, coursetime, grade, method) FROM stdin;
    public       postgres    false    196       2916.dat g          0    16688    student 
   TABLE DATA               R   COPY public.student (studentid, studentname, gender, birthday, major) FROM stdin;
    public       postgres    false    203       2919.dat h          0    25324    teacher 
   TABLE DATA               3   COPY public.teacher (teacherid, tname) FROM stdin;
    public       postgres    false    217       2920.dat t           0    0    Grade_GradeID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Grade_GradeID_seq"', 1, false);
            public       postgres    false    197         �
           2606    16745    course Course_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.course
    ADD CONSTRAINT "Course_pkey" PRIMARY KEY (courseid);
 >   ALTER TABLE ONLY public.course DROP CONSTRAINT "Course_pkey";
       public         postgres    false    198         �
           2606    16746    grade Grade_check    CHECK CONSTRAINT     o   ALTER TABLE public.grade
    ADD CONSTRAINT "Grade_check" CHECK (((grade >= 0) AND (grade <= 100))) NOT VALID;
 8   ALTER TABLE public.grade DROP CONSTRAINT "Grade_check";
       public       postgres    false    196    196         u           0    0 !   CONSTRAINT "Grade_check" ON grade    COMMENT     G   COMMENT ON CONSTRAINT "Grade_check" ON public.grade IS '成绩检查';
            public       postgres    false    2767         �
           2606    16748    grade Grade_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (gradeid);
 <   ALTER TABLE ONLY public.grade DROP CONSTRAINT "Grade_pkey";
       public         postgres    false    196         �
           2606    16750    student Student_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.student
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (studentid);
 @   ALTER TABLE ONLY public.student DROP CONSTRAINT "Student_pkey";
       public         postgres    false    203         �
           2606    25328    teacher teacher_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacherid);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public         postgres    false    217         �
           2606    16751    grade Grade_CourseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Grade_CourseID_fkey" FOREIGN KEY (courseid) REFERENCES public.course(courseid) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 E   ALTER TABLE ONLY public.grade DROP CONSTRAINT "Grade_CourseID_fkey";
       public       postgres    false    196    198    2771         �
           2606    16756    grade Stu_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Stu_FK" FOREIGN KEY (studentid) REFERENCES public.student(studentid) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 8   ALTER TABLE ONLY public.grade DROP CONSTRAINT "Stu_FK";
       public       postgres    false    2773    196    203                                                                                                                                      2918.dat                                                                                            0000600 0004000 0002000 00000000171 14420032265 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        002       	数字电路	20	4
004       	信息系统	30	4
003       	高等数学	50	6
001       	模拟电路	40	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                       2916.dat                                                                                            0000600 0004000 0002000 00000001514 14420032265 0014252 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	s01          	001       	周二	99	闭卷        
2	s01          	002       	周三	89	闭卷        
3	s01          	003       	周五	69	开卷        
4	s02          	001       	周二	91	闭卷        
5	s02          	002       	周三	59	闭卷        
6	s02          	003       	周五	89	开卷        
7	s03          	001       	周二	49	闭卷        
8	s03          	002       	周三	59	闭卷        
9	s03          	003       	周五	89	开卷        
10	s04          	001       	周二	79	闭卷        
11	s04          	002       	周三	81	闭卷        
12	s04          	003       	周五	79	开卷        
13	s01          	004       	周五	32	开卷        
14	s02          	004       	周五	96	开卷        
15	s03          	004       	周五	88	开卷        
16	s04          	004       	周五	79	开卷        
\.


                                                                                                                                                                                    2919.dat                                                                                            0000600 0004000 0002000 00000000402 14420032265 0014250 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        s01          	王琳	f	1999-01-03	软件工程
s02          	李飞	t	1993-09-24	软件工程
s03          	江东	t	2000-08-12	计算机科学技术
s04          	刘艳春	f	2001-03-23	计算机应用
s05          	王梅林	f	1997-01-03	软件工程
\.


                                                                                                                                                                                                                                                              2920.dat                                                                                            0000600 0004000 0002000 00000000005 14420032265 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000027522 14420032265 0015372 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 11.7
-- Dumped by pg_dump version 11.7

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

DROP DATABASE "StuGradeDB";
--
-- Name: StuGradeDB; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE "StuGradeDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Chinese (Simplified)_People''s Republic of China.936' LC_CTYPE = 'Chinese (Simplified)_People''s Republic of China.936';


ALTER DATABASE "StuGradeDB" OWNER TO postgres;

\connect "StuGradeDB"

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

SET default_with_oids = false;

--
-- Name: grade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grade (
    gradeid bigint NOT NULL,
    studentid character(13) NOT NULL,
    courseid character(10) NOT NULL,
    coursetime character varying(20),
    grade smallint,
    method character(10) DEFAULT '闭卷考试'::bpchar
);


ALTER TABLE public.grade OWNER TO postgres;

--
-- Name: Grade_GradeID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Grade_GradeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Grade_GradeID_seq" OWNER TO postgres;

--
-- Name: Grade_GradeID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Grade_GradeID_seq" OWNED BY public.grade.gradeid;


--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    courseid character(10) NOT NULL,
    coursename character varying(20) NOT NULL,
    coursehours integer,
    credit smallint
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: courserelating; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.courserelating AS
 SELECT course.coursename
   FROM public.course
  WHERE ((course.coursename)::text ~~ '%电路%'::text);


ALTER TABLE public.courserelating OWNER TO postgres;

--
-- Name: courserelating2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.courserelating2 AS
 SELECT course.coursename
   FROM public.course
  WHERE ((course.coursename)::text ~~ '%电路%'::text);


ALTER TABLE public.courserelating2 OWNER TO postgres;

--
-- Name: grademin60; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.grademin60 AS
 SELECT grade.studentid,
    min(grade.grade) AS mingrade
   FROM public.grade
  GROUP BY grade.studentid
 HAVING (min(grade.grade) >= 60);


ALTER TABLE public.grademin60 OWNER TO postgres;

--
-- Name: grademin61; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.grademin61 AS
 SELECT grade.studentid,
    min(grade.grade) AS mingrade
   FROM public.grade
  GROUP BY grade.studentid
 HAVING (min(grade.grade) >= 60);


ALTER TABLE public.grademin61 OWNER TO postgres;

--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    studentid character(13) NOT NULL,
    studentname character varying(10) NOT NULL,
    gender boolean,
    birthday date,
    major character varying(20)
);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: TABLE student; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.student IS '学生表';


--
-- Name: studentnopass; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;


ALTER TABLE public.studentnopass OWNER TO postgres;

--
-- Name: studentnopass1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass1 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;


ALTER TABLE public.studentnopass1 OWNER TO postgres;

--
-- Name: studentnopass14; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass14 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;


ALTER TABLE public.studentnopass14 OWNER TO postgres;

--
-- Name: studentnopass18; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass18 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);


ALTER TABLE public.studentnopass18 OWNER TO postgres;

--
-- Name: studentnopass19; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass19 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);


ALTER TABLE public.studentnopass19 OWNER TO postgres;

--
-- Name: studentnopass2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass2 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;


ALTER TABLE public.studentnopass2 OWNER TO postgres;

--
-- Name: studentnopass20; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass20 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);


ALTER TABLE public.studentnopass20 OWNER TO postgres;

--
-- Name: studentnopass3; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass3 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;


ALTER TABLE public.studentnopass3 OWNER TO postgres;

--
-- Name: studentnopass4; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass4 AS
 SELECT a.studentid,
    a.studentname,
    g.grade,
    c.coursename
   FROM ((public.student a
     JOIN public.grade g ON ((a.studentid = g.studentid)))
     JOIN public.course c ON ((g.courseid = c.courseid)))
  WHERE (g.grade < 60)
  ORDER BY a.studentid;


ALTER TABLE public.studentnopass4 OWNER TO postgres;

--
-- Name: studentnopass5; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass5 AS
 SELECT a.studentid,
    a.studentname,
    g.grade,
    c.coursename
   FROM ((public.student a
     JOIN public.grade g ON ((a.studentid = g.studentid)))
     JOIN public.course c ON ((g.courseid = c.courseid)))
  WHERE (g.grade < 60)
  ORDER BY a.studentid;


ALTER TABLE public.studentnopass5 OWNER TO postgres;

--
-- Name: studentnopass6; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass6 AS
 SELECT grade.studentid,
    count(*) AS courseid
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);


ALTER TABLE public.studentnopass6 OWNER TO postgres;

--
-- Name: studentnopass7; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass7 AS
 SELECT grade.studentid,
    count(*) AS courseid
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);


ALTER TABLE public.studentnopass7 OWNER TO postgres;

--
-- Name: studentnopass8; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.studentnopass8 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);


ALTER TABLE public.studentnopass8 OWNER TO postgres;

--
-- Name: teacher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher (
    teacherid character(12) NOT NULL,
    tname character(12) NOT NULL
);


ALTER TABLE public.teacher OWNER TO postgres;

--
-- Name: grade gradeid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade ALTER COLUMN gradeid SET DEFAULT nextval('public."Grade_GradeID_seq"'::regclass);


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (courseid, coursename, coursehours, credit) FROM stdin;
\.
COPY public.course (courseid, coursename, coursehours, credit) FROM '$$PATH$$/2918.dat';

--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade (gradeid, studentid, courseid, coursetime, grade, method) FROM stdin;
\.
COPY public.grade (gradeid, studentid, courseid, coursetime, grade, method) FROM '$$PATH$$/2916.dat';

--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (studentid, studentname, gender, birthday, major) FROM stdin;
\.
COPY public.student (studentid, studentname, gender, birthday, major) FROM '$$PATH$$/2919.dat';

--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (teacherid, tname) FROM stdin;
\.
COPY public.teacher (teacherid, tname) FROM '$$PATH$$/2920.dat';

--
-- Name: Grade_GradeID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Grade_GradeID_seq"', 1, false);


--
-- Name: course Course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT "Course_pkey" PRIMARY KEY (courseid);


--
-- Name: grade Grade_check; Type: CHECK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE public.grade
    ADD CONSTRAINT "Grade_check" CHECK (((grade >= 0) AND (grade <= 100))) NOT VALID;


--
-- Name: CONSTRAINT "Grade_check" ON grade; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON CONSTRAINT "Grade_check" ON public.grade IS '成绩检查';


--
-- Name: grade Grade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (gradeid);


--
-- Name: student Student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (studentid);


--
-- Name: teacher teacher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacherid);


--
-- Name: grade Grade_CourseID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Grade_CourseID_fkey" FOREIGN KEY (courseid) REFERENCES public.course(courseid) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: grade Stu_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Stu_FK" FOREIGN KEY (studentid) REFERENCES public.student(studentid) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: TABLE grade; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.grade FROM postgres;
GRANT ALL ON TABLE public.grade TO postgres WITH GRANT OPTION;


--
-- Name: TABLE course; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.course FROM postgres;
GRANT ALL ON TABLE public.course TO postgres WITH GRANT OPTION;


--
-- Name: TABLE student; Type: ACL; Schema: public; Owner: postgres
--

REVOKE ALL ON TABLE public.student FROM postgres;
GRANT ALL ON TABLE public.student TO postgres WITH GRANT OPTION;


--
-- PostgreSQL database dump complete
--

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              