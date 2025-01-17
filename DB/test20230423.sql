toc.dat                                                                                             0000600 0004000 0002000 00000064567 14421120134 0014451 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        PGDMP       ;                    {         
   StuGradeDB    13.5    13.5 C    G           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false         H           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false         I           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false         J           1262    54460 
   StuGradeDB    DATABASE     t   CREATE DATABASE "StuGradeDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Chinese (Simplified)_China.936';
    DROP DATABASE "StuGradeDB";
                postgres    false         �            1255    62221    check_insert()    FUNCTION     �  CREATE FUNCTION public.check_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
  sidexit record;
  cidexit record;
  colname bigint;
begin
   select count(*) into colname from grade;
   colname=colname+1;
   select into sidexit from student where studentid=new.studentid;
   if found then 
      select into cidexit from course where courseid=new.courseid;
      if found then
	     insert into grade values(colname,new.studentid,new.courseid,'周五',new.grade,'闭卷');
		 return new;
	     else raise exception '课程号 % 不存在',new.courseid;
		 return null;
	  end if;
	  else raise exception '学号 % 不存在',new.studentid;
	  return null;
   end if;
   return null;
end;
$$;
 %   DROP FUNCTION public.check_insert();
       public          postgres    false         �            1255    62126    getcredit0()    FUNCTION     �  CREATE FUNCTION public.getcredit0() RETURNS TABLE(vsid character, vsname character varying, vscredit bigint)
    LANGUAGE plpgsql
    AS $$

begin
   return query 
   select C.studentid as "vsid",C.studentname as "vsname",sum(A.credit) as "vscredit"  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;                            
end;
$$;
 #   DROP FUNCTION public.getcredit0();
       public          postgres    false         �            1255    54564    getcredit199()    FUNCTION     �  CREATE FUNCTION public.getcredit199() RETURNS TABLE(vsid character, vsname character varying, vscredit bigint)
    LANGUAGE plpgsql
    AS $$

begin
   return query 
   select C.studentid as "vsid",C.studentname as "vsname",sum(A.credit) as "vscredit"  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;                            
end;
$$;
 %   DROP FUNCTION public.getcredit199();
       public          postgres    false         �            1255    54583    getcredit2()    FUNCTION     *  CREATE FUNCTION public.getcredit2() RETURNS TABLE(vsid character, vsname character varying, vscredit bigint)
    LANGUAGE plpgsql
    AS $$
--declare 
--  rec record;
begin
   create view outcome22 AS select C.studentid,C.studentname,B.courseid,A.credit from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60;
   return query
   select studentid as "vsid",studentname as "vsname",sum(credit) as "vscredit" from outcome22 group by studentid,studentname;                             
end;
$$;
 #   DROP FUNCTION public.getcredit2();
       public          postgres    false         �            1255    62128    getcredit22()    FUNCTION     �  CREATE FUNCTION public.getcredit22() RETURNS bigint
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return vscredit;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;
 $   DROP FUNCTION public.getcredit22();
       public          postgres    false         �            1255    62133    getcredit25()    FUNCTION     �  CREATE FUNCTION public.getcredit25() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;
 $   DROP FUNCTION public.getcredit25();
       public          postgres    false         �            1255    62134    getcredit26()    FUNCTION     �  CREATE FUNCTION public.getcredit26() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;
 $   DROP FUNCTION public.getcredit26();
       public          postgres    false         �            1255    62137    getcredit27()    FUNCTION     �  CREATE FUNCTION public.getcredit27() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid,C.studentname;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;
 $   DROP FUNCTION public.getcredit27();
       public          postgres    false         �            1255    62138    getcredit28()    FUNCTION     �  CREATE FUNCTION public.getcredit28() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;
 $   DROP FUNCTION public.getcredit28();
       public          postgres    false         �            1255    62243    getcredit29()    FUNCTION     �  CREATE FUNCTION public.getcredit29() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;
 $   DROP FUNCTION public.getcredit29();
       public          postgres    false         �            1259    54461    grade    TABLE     �   CREATE TABLE public.grade (
    gradeid bigint NOT NULL,
    studentid character(13) NOT NULL,
    courseid character(10) NOT NULL,
    coursetime character varying(20),
    grade smallint,
    method character(10) DEFAULT '闭卷考试'::bpchar
);
    DROP TABLE public.grade;
       public         heap    postgres    false         K           0    0    TABLE grade    ACL     o   REVOKE ALL ON TABLE public.grade FROM postgres;
GRANT ALL ON TABLE public.grade TO postgres WITH GRANT OPTION;
          public          postgres    false    200         �            1259    54465    Grade_GradeID_seq    SEQUENCE     �   CREATE SEQUENCE public."Grade_GradeID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public."Grade_GradeID_seq";
       public          postgres    false    200         L           0    0    Grade_GradeID_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public."Grade_GradeID_seq" OWNED BY public.grade.gradeid;
          public          postgres    false    201         �            1259    54467    course    TABLE     �   CREATE TABLE public.course (
    courseid character(10) NOT NULL,
    coursename character varying(20) NOT NULL,
    coursehours integer,
    credit smallint
);
    DROP TABLE public.course;
       public         heap    postgres    false         M           0    0    TABLE course    ACL     q   REVOKE ALL ON TABLE public.course FROM postgres;
GRANT ALL ON TABLE public.course TO postgres WITH GRANT OPTION;
          public          postgres    false    202         �            1259    54470    courserelating    VIEW     �   CREATE VIEW public.courserelating AS
 SELECT course.coursename
   FROM public.course
  WHERE ((course.coursename)::text ~~ '%电路%'::text);
 !   DROP VIEW public.courserelating;
       public          postgres    false    202         �            1259    54474    courserelating2    VIEW     �   CREATE VIEW public.courserelating2 AS
 SELECT course.coursename
   FROM public.course
  WHERE ((course.coursename)::text ~~ '%电路%'::text);
 "   DROP VIEW public.courserelating2;
       public          postgres    false    202         �            1259    54478 
   grademin60    VIEW     �   CREATE VIEW public.grademin60 AS
 SELECT grade.studentid,
    min(grade.grade) AS mingrade
   FROM public.grade
  GROUP BY grade.studentid
 HAVING (min(grade.grade) >= 60);
    DROP VIEW public.grademin60;
       public          postgres    false    200    200         �            1259    54482 
   grademin61    VIEW     �   CREATE VIEW public.grademin61 AS
 SELECT grade.studentid,
    min(grade.grade) AS mingrade
   FROM public.grade
  GROUP BY grade.studentid
 HAVING (min(grade.grade) >= 60);
    DROP VIEW public.grademin61;
       public          postgres    false    200    200         �            1259    54486    student    TABLE     �   CREATE TABLE public.student (
    studentid character(13) NOT NULL,
    studentname character varying(10) NOT NULL,
    gender boolean,
    birthday date,
    major character varying(20)
);
    DROP TABLE public.student;
       public         heap    postgres    false         N           0    0    TABLE student    COMMENT     0   COMMENT ON TABLE public.student IS '学生表';
          public          postgres    false    207         O           0    0    TABLE student    ACL     s   REVOKE ALL ON TABLE public.student FROM postgres;
GRANT ALL ON TABLE public.student TO postgres WITH GRANT OPTION;
          public          postgres    false    207         �            1259    54570 	   outcome11    VIEW     �   CREATE VIEW public.outcome11 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.credit,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));
    DROP VIEW public.outcome11;
       public          postgres    false    202    202    207    207    200    200    200         �            1259    54584 	   outcome22    VIEW        CREATE VIEW public.outcome22 AS
 SELECT c.studentid,
    c.studentname,
    b.courseid,
    a.credit
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid) AND (b.grade >= 60));
    DROP VIEW public.outcome22;
       public          postgres    false    207    207    202    202    200    200    200         �            1259    54489    studentnopass    VIEW     �   CREATE VIEW public.studentnopass AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
     DROP VIEW public.studentnopass;
       public          postgres    false    200    200         �            1259    54493    studentnopass1    VIEW     �   CREATE VIEW public.studentnopass1 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 !   DROP VIEW public.studentnopass1;
       public          postgres    false    200    200         �            1259    54497    studentnopass14    VIEW     �   CREATE VIEW public.studentnopass14 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 "   DROP VIEW public.studentnopass14;
       public          postgres    false    200    200         �            1259    54501    studentnopass18    VIEW     �   CREATE VIEW public.studentnopass18 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 "   DROP VIEW public.studentnopass18;
       public          postgres    false    200    200         �            1259    54505    studentnopass19    VIEW     �   CREATE VIEW public.studentnopass19 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 "   DROP VIEW public.studentnopass19;
       public          postgres    false    200    200         �            1259    54509    studentnopass2    VIEW     �   CREATE VIEW public.studentnopass2 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 !   DROP VIEW public.studentnopass2;
       public          postgres    false    200    200         �            1259    54513    studentnopass20    VIEW     �   CREATE VIEW public.studentnopass20 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 "   DROP VIEW public.studentnopass20;
       public          postgres    false    200    200         �            1259    54517    studentnopass3    VIEW     �   CREATE VIEW public.studentnopass3 AS
 SELECT grade.studentid,
    count(*) AS countcourse
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid;
 !   DROP VIEW public.studentnopass3;
       public          postgres    false    200    200         �            1259    54521    studentnopass4    VIEW     *  CREATE VIEW public.studentnopass4 AS
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
       public          postgres    false    207    200    200    202    202    207    200         �            1259    54525    studentnopass5    VIEW     *  CREATE VIEW public.studentnopass5 AS
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
       public          postgres    false    200    202    202    200    200    207    207         �            1259    54529    studentnopass6    VIEW     �   CREATE VIEW public.studentnopass6 AS
 SELECT grade.studentid,
    count(*) AS courseid
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 !   DROP VIEW public.studentnopass6;
       public          postgres    false    200    200         �            1259    54533    studentnopass7    VIEW     �   CREATE VIEW public.studentnopass7 AS
 SELECT grade.studentid,
    count(*) AS courseid
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 !   DROP VIEW public.studentnopass7;
       public          postgres    false    200    200         �            1259    54537    studentnopass8    VIEW     �   CREATE VIEW public.studentnopass8 AS
 SELECT grade.studentid,
    count(*) AS coursenum
   FROM public.grade
  WHERE (grade.grade < 60)
  GROUP BY grade.studentid
 HAVING (count(*) = 1);
 !   DROP VIEW public.studentnopass8;
       public          postgres    false    200    200         �            1259    62217    stuscoreview    VIEW        CREATE VIEW public.stuscoreview AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));
    DROP VIEW public.stuscoreview;
       public          postgres    false    200    200    207    207    202    202    200         �            1259    62223    stuscoreview1    VIEW       CREATE VIEW public.stuscoreview1 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));
     DROP VIEW public.stuscoreview1;
       public          postgres    false    207    207    200    200    200    202    202         �            1259    62228    stuscoreview2    VIEW       CREATE VIEW public.stuscoreview2 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));
     DROP VIEW public.stuscoreview2;
       public          postgres    false    200    200    200    202    202    207    207         �            1259    62233    stuscoreview3    VIEW       CREATE VIEW public.stuscoreview3 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));
     DROP VIEW public.stuscoreview3;
       public          postgres    false    200    202    207    207    200    200    202         �            1259    54541    teacher    TABLE     h   CREATE TABLE public.teacher (
    teacherid character(12) NOT NULL,
    tname character(12) NOT NULL
);
    DROP TABLE public.teacher;
       public         heap    postgres    false         �           2604    54544    grade gradeid    DEFAULT     p   ALTER TABLE ONLY public.grade ALTER COLUMN gradeid SET DEFAULT nextval('public."Grade_GradeID_seq"'::regclass);
 <   ALTER TABLE public.grade ALTER COLUMN gradeid DROP DEFAULT;
       public          postgres    false    201    200         B          0    54467    course 
   TABLE DATA           K   COPY public.course (courseid, coursename, coursehours, credit) FROM stdin;
    public          postgres    false    202       3138.dat @          0    54461    grade 
   TABLE DATA           X   COPY public.grade (gradeid, studentid, courseid, coursetime, grade, method) FROM stdin;
    public          postgres    false    200       3136.dat C          0    54486    student 
   TABLE DATA           R   COPY public.student (studentid, studentname, gender, birthday, major) FROM stdin;
    public          postgres    false    207       3139.dat D          0    54541    teacher 
   TABLE DATA           3   COPY public.teacher (teacherid, tname) FROM stdin;
    public          postgres    false    221       3140.dat P           0    0    Grade_GradeID_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Grade_GradeID_seq"', 1, false);
          public          postgres    false    201         �           2606    54546    course Course_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.course
    ADD CONSTRAINT "Course_pkey" PRIMARY KEY (courseid);
 >   ALTER TABLE ONLY public.course DROP CONSTRAINT "Course_pkey";
       public            postgres    false    202         �           2606    54547    grade Grade_check    CHECK CONSTRAINT     o   ALTER TABLE public.grade
    ADD CONSTRAINT "Grade_check" CHECK (((grade >= 0) AND (grade <= 100))) NOT VALID;
 8   ALTER TABLE public.grade DROP CONSTRAINT "Grade_check";
       public          postgres    false    200    200         Q           0    0 !   CONSTRAINT "Grade_check" ON grade    COMMENT     G   COMMENT ON CONSTRAINT "Grade_check" ON public.grade IS '成绩检查';
          public          postgres    false    2966         �           2606    54549    grade Grade_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Grade_pkey" PRIMARY KEY (gradeid);
 <   ALTER TABLE ONLY public.grade DROP CONSTRAINT "Grade_pkey";
       public            postgres    false    200         �           2606    54551    student Student_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.student
    ADD CONSTRAINT "Student_pkey" PRIMARY KEY (studentid);
 @   ALTER TABLE ONLY public.student DROP CONSTRAINT "Student_pkey";
       public            postgres    false    207         �           2606    54553    teacher teacher_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.teacher
    ADD CONSTRAINT teacher_pkey PRIMARY KEY (teacherid);
 >   ALTER TABLE ONLY public.teacher DROP CONSTRAINT teacher_pkey;
       public            postgres    false    221         �           2620    62242    stuscoreview insteadofinsert    TRIGGER     }   CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview FOR EACH ROW EXECUTE FUNCTION public.check_insert();
 5   DROP TRIGGER insteadofinsert ON public.stuscoreview;
       public          postgres    false    224    247         �           2620    62227    stuscoreview1 insteadofinsert    TRIGGER     ~   CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview1 FOR EACH ROW EXECUTE FUNCTION public.check_insert();
 6   DROP TRIGGER insteadofinsert ON public.stuscoreview1;
       public          postgres    false    247    225         �           2620    62232    stuscoreview2 insteadofinsert    TRIGGER     ~   CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview2 FOR EACH ROW EXECUTE FUNCTION public.check_insert();
 6   DROP TRIGGER insteadofinsert ON public.stuscoreview2;
       public          postgres    false    226    247         �           2620    62237    stuscoreview3 insteadofinsert    TRIGGER     ~   CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview3 FOR EACH ROW EXECUTE FUNCTION public.check_insert();
 6   DROP TRIGGER insteadofinsert ON public.stuscoreview3;
       public          postgres    false    247    227         �           2620    62240    stuscoreview insteadofinsert1    TRIGGER     ~   CREATE TRIGGER insteadofinsert1 INSTEAD OF INSERT ON public.stuscoreview FOR EACH ROW EXECUTE FUNCTION public.check_insert();
 6   DROP TRIGGER insteadofinsert1 ON public.stuscoreview;
       public          postgres    false    224    247         �           2620    62241    stuscoreview insteadofinsert2    TRIGGER     ~   CREATE TRIGGER insteadofinsert2 INSTEAD OF INSERT ON public.stuscoreview FOR EACH ROW EXECUTE FUNCTION public.check_insert();
 6   DROP TRIGGER insteadofinsert2 ON public.stuscoreview;
       public          postgres    false    247    224         �           2606    54554    grade Grade_CourseID_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Grade_CourseID_fkey" FOREIGN KEY (courseid) REFERENCES public.course(courseid) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 E   ALTER TABLE ONLY public.grade DROP CONSTRAINT "Grade_CourseID_fkey";
       public          postgres    false    2970    200    202         �           2606    54559    grade Stu_FK    FK CONSTRAINT     �   ALTER TABLE ONLY public.grade
    ADD CONSTRAINT "Stu_FK" FOREIGN KEY (studentid) REFERENCES public.student(studentid) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;
 8   ALTER TABLE ONLY public.grade DROP CONSTRAINT "Stu_FK";
       public          postgres    false    2972    207    200                                                                                                                                                 3138.dat                                                                                            0000600 0004000 0002000 00000000171 14421120134 0014237 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        002       	数字电路	20	4
004       	信息系统	30	4
003       	高等数学	50	6
001       	模拟电路	40	3
\.


                                                                                                                                                                                                                                                                                                                                                                                                       3136.dat                                                                                            0000600 0004000 0002000 00000002710 14421120134 0014236 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        1	s01          	001       	周二	99	闭卷        
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
17	s02          	003       	90	\N	闭卷考试      
18	s02          	003       	90	\N	闭卷考试      
19	s02          	003       	90	\N	闭卷考试      
20	s02          	003       	周五	90	闭卷        
21	s01          	003       	周五	90	闭卷        
22	s01          	003       	周五	90	闭卷        
23	s01          	003       	周五	90	闭卷        
24	s01          	003       	周五	90	闭卷        
25	s01          	003       	周五	90	闭卷        
26	s01          	003       	周五	90	闭卷        
27	s01          	003       	周五	90	闭卷        
28	s01          	003       	周五	90	闭卷        
\.


                                                        3139.dat                                                                                            0000600 0004000 0002000 00000000402 14421120134 0014235 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        s01          	王琳	f	1999-01-03	软件工程
s02          	李飞	t	1993-09-24	软件工程
s03          	江东	t	2000-08-12	计算机科学技术
s04          	刘艳春	f	2001-03-23	计算机应用
s05          	王梅林	f	1997-01-03	软件工程
\.


                                                                                                                                                                                                                                                              3140.dat                                                                                            0000600 0004000 0002000 00000000005 14421120134 0014224 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        \.


                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           restore.sql                                                                                         0000600 0004000 0002000 00000056044 14421120134 0015365 0                                                                                                    ustar 00postgres                        postgres                        0000000 0000000                                                                                                                                                                        --
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 13.5
-- Dumped by pg_dump version 13.5

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

CREATE DATABASE "StuGradeDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Chinese (Simplified)_China.936';


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

--
-- Name: check_insert(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.check_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare
  sidexit record;
  cidexit record;
  colname bigint;
begin
   select count(*) into colname from grade;
   colname=colname+1;
   select into sidexit from student where studentid=new.studentid;
   if found then 
      select into cidexit from course where courseid=new.courseid;
      if found then
	     insert into grade values(colname,new.studentid,new.courseid,'周五',new.grade,'闭卷');
		 return new;
	     else raise exception '课程号 % 不存在',new.courseid;
		 return null;
	  end if;
	  else raise exception '学号 % 不存在',new.studentid;
	  return null;
   end if;
   return null;
end;
$$;


ALTER FUNCTION public.check_insert() OWNER TO postgres;

--
-- Name: getcredit0(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit0() RETURNS TABLE(vsid character, vsname character varying, vscredit bigint)
    LANGUAGE plpgsql
    AS $$

begin
   return query 
   select C.studentid as "vsid",C.studentname as "vsname",sum(A.credit) as "vscredit"  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;                            
end;
$$;


ALTER FUNCTION public.getcredit0() OWNER TO postgres;

--
-- Name: getcredit199(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit199() RETURNS TABLE(vsid character, vsname character varying, vscredit bigint)
    LANGUAGE plpgsql
    AS $$

begin
   return query 
   select C.studentid as "vsid",C.studentname as "vsname",sum(A.credit) as "vscredit"  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;                            
end;
$$;


ALTER FUNCTION public.getcredit199() OWNER TO postgres;

--
-- Name: getcredit2(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit2() RETURNS TABLE(vsid character, vsname character varying, vscredit bigint)
    LANGUAGE plpgsql
    AS $$
--declare 
--  rec record;
begin
   create view outcome22 AS select C.studentid,C.studentname,B.courseid,A.credit from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60;
   return query
   select studentid as "vsid",studentname as "vsname",sum(credit) as "vscredit" from outcome22 group by studentid,studentname;                             
end;
$$;


ALTER FUNCTION public.getcredit2() OWNER TO postgres;

--
-- Name: getcredit22(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit22() RETURNS bigint
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return vscredit;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;


ALTER FUNCTION public.getcredit22() OWNER TO postgres;

--
-- Name: getcredit25(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit25() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;


ALTER FUNCTION public.getcredit25() OWNER TO postgres;

--
-- Name: getcredit26(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit26() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;


ALTER FUNCTION public.getcredit26() OWNER TO postgres;

--
-- Name: getcredit27(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit27() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid,C.studentname;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;


ALTER FUNCTION public.getcredit27() OWNER TO postgres;

--
-- Name: getcredit28(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit28() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;


ALTER FUNCTION public.getcredit28() OWNER TO postgres;

--
-- Name: getcredit29(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.getcredit29() RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare 
   unbound_refcursor refcursor;
   vsid varchar;
   vsname varchar;
   vscredit bigint;
begin
   open unbound_refcursor for select C.studentid,C.studentname,sum(A.credit)  from course AS A,grade AS B,student AS C 
    where B.studentid=C.studentid and A.courseid=B.courseid and B.grade>=60 group by C.studentid;
   loop 
      fetch unbound_refcursor into vsid,vsname,vscredit;
	  if found then
	      raise notice '%,%,%',vsid,vsname,vscredit;
	  else 
	      exit;
	  end if;
   end loop;
   close unbound_refcursor;
   raise notice '取数据结束';
   return true;
   exception when others then raise exception 'error(%)',sqlerrm;
end;
$$;


ALTER FUNCTION public.getcredit29() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

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
-- Name: outcome11; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.outcome11 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.credit,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));


ALTER TABLE public.outcome11 OWNER TO postgres;

--
-- Name: outcome22; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.outcome22 AS
 SELECT c.studentid,
    c.studentname,
    b.courseid,
    a.credit
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid) AND (b.grade >= 60));


ALTER TABLE public.outcome22 OWNER TO postgres;

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
-- Name: stuscoreview; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.stuscoreview AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));


ALTER TABLE public.stuscoreview OWNER TO postgres;

--
-- Name: stuscoreview1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.stuscoreview1 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));


ALTER TABLE public.stuscoreview1 OWNER TO postgres;

--
-- Name: stuscoreview2; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.stuscoreview2 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));


ALTER TABLE public.stuscoreview2 OWNER TO postgres;

--
-- Name: stuscoreview3; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.stuscoreview3 AS
 SELECT c.studentid,
    c.studentname,
    a.courseid,
    a.coursename,
    b.grade
   FROM public.course a,
    public.grade b,
    public.student c
  WHERE ((b.studentid = c.studentid) AND (a.courseid = b.courseid));


ALTER TABLE public.stuscoreview3 OWNER TO postgres;

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
COPY public.course (courseid, coursename, coursehours, credit) FROM '$$PATH$$/3138.dat';

--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grade (gradeid, studentid, courseid, coursetime, grade, method) FROM stdin;
\.
COPY public.grade (gradeid, studentid, courseid, coursetime, grade, method) FROM '$$PATH$$/3136.dat';

--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (studentid, studentname, gender, birthday, major) FROM stdin;
\.
COPY public.student (studentid, studentname, gender, birthday, major) FROM '$$PATH$$/3139.dat';

--
-- Data for Name: teacher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher (teacherid, tname) FROM stdin;
\.
COPY public.teacher (teacherid, tname) FROM '$$PATH$$/3140.dat';

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
-- Name: stuscoreview insteadofinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview FOR EACH ROW EXECUTE FUNCTION public.check_insert();


--
-- Name: stuscoreview1 insteadofinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview1 FOR EACH ROW EXECUTE FUNCTION public.check_insert();


--
-- Name: stuscoreview2 insteadofinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview2 FOR EACH ROW EXECUTE FUNCTION public.check_insert();


--
-- Name: stuscoreview3 insteadofinsert; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insteadofinsert INSTEAD OF INSERT ON public.stuscoreview3 FOR EACH ROW EXECUTE FUNCTION public.check_insert();


--
-- Name: stuscoreview insteadofinsert1; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insteadofinsert1 INSTEAD OF INSERT ON public.stuscoreview FOR EACH ROW EXECUTE FUNCTION public.check_insert();


--
-- Name: stuscoreview insteadofinsert2; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER insteadofinsert2 INSTEAD OF INSERT ON public.stuscoreview FOR EACH ROW EXECUTE FUNCTION public.check_insert();


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

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            