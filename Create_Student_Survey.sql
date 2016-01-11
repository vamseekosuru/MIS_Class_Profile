/*--------------------------Industry----------------------------------------*/
create table industry(
industry_id integer not null ,
Industry varchar(20) not null,
student_id integer not null,
primary key(industry_id),
foreign key(student_id) references student(student_id));
/*-------------------------------------------------------------------------*/
/*--------------------------Skill------------------------------------------*/

create table skill(
skill_id INTEGER NOT NULL ,
skill varchar(20) not null,
primary key(skill_id));

create table Student_Skills(
skill_id integer not null,
student_id integer not null,
primary key (skill_id,student_id),
foreign key (skill_id) references skill(skill_id) on update cascade,
foreign key (student_id) references student(student_id) on update cascade);

/*-------------------------------------------------------------------------*/
/*--------------------------Address------------------------------------------*/

create table Home_Address(
address_id integer not null auto_increment,
city varchar(10) not null,
state varchar(10) not null,
country varchar(10) not null,
primary key(address_id));
/*-------------------------------------------------------------------------*/
/*Student_Type------------------> Current or Alumini <----------------------------*/

create table student_type(
student_type_code char(2) not null,
student_type varchar(20) not null,
primary key(student_type_code),
unique (student_type));

insert into student_type values( 'CS','Current_Student'),('AL', 'Alumini');

create table student(
student_id INTEGER NOT NULL AUTO_INCREMENT,
student_name varchar(20) not null,
student_type_code char(2) not null,
age char(2) not null,
sex varchar(6) not null,
prior_year_work_exp int(2) not null,
Undergrad_Degree varchar(40) not null,
Undergrad_GPA float (3,2) not null,
industry_id integer not null,
primary key(student_id),
foreign key(student_type_code) references student_type(student_type_code),
foreign key (industry_id) references industry(industry_id));

create table Current_Student(
student_id integer not null,
student_type_code char(2) not null default 'CS',
address_id integer not null,
primary key(student_id),
unique(student_id,student_type_code),
foreign key(student_type_code) references student(student_type_code),
foreign key(student_id) references student(student_id),
foreign key (address_id) references Home_address(address_id));

create table Student_Skills_Gained(
skill_id integer not null,
student_id integer not null,
student_type_code char(2) not null default 'AL',
primary key (skill_id,student_id,student_type_code),
foreign key (skill_id) references skill(skill_id) on update cascade,
foreign key (student_id) references Student(student_id) on update cascade);



create table Alumini_Student(
student_id integer not null,
student_type_code char(2) not null default 'AL', 
MS_GPA float(3,2) not null,
Employer varchar(20) not null,
Job_Title varchar(20) not null,
Salary varchar(10) not null,
location char(10) not null,
primary key(student_id),
unique(student_id,student_type_code),
foreign key(skill_id) references skill(skill_id),
foreign key(student_type_code) references student(student_type_code),
FOREIGN KEY (student_id) REFERENCES student (student_id));

/*-------------------------------------------------------------------------*/

/* ---------------------------Test Score Tables------------------------------------
------------------------------------GRE or GMAT-------------------------------------
------------------------------------TOEFL OR IELTS----------------------------------*/

create table score_type(
score_type_code char(1) not null,
score_type_name varchar(10) not null,
primary key(score_type_code),
unique (score_type_name));

insert into score_type values( 'A','Aptitude'),('L', 'Language');

create table scores(
score_id integer not null,
score_type_code char(1) not null,
primary key(score_id),
unique (score_id,score_type_code),
foreign key (score_type_code) references score_type(score_type_code));

insert into scores(score_id,score_type_code) values (1,'A'),(2,'A'),(3,'L'),(4,'L');


create table aptitude_type(
aptitude_type char(4) not null,
primary key(aptitude_type));

insert into aptitude_type values ('GRE'),('GMAT');

create table aptitute_score(
score_id integer not null,
score_type_code char(1) not null default 'A',
aptitude_type char(4) not null,
primary key(score_id),
unique(score_id,score_type_code,aptitude_type),
foreign key(score_id,score_type_code) references scores(score_id,score_type_code),
foreign key(aptitude_type) references aptitude_type(aptitude_type));

insert into aptitute_score (score_id, score_type_code, aptitude_type) values
 (1, 'A', 'GRE'),(2, 'A', 'GMAT');


create table GRE_Score(
  student_id integer not null,
  score_id integer not null default 1,
  score_type_code char(1) not null default 'A',
  aptitude_type char(4) not null default 'GRE',
  Quant_score integer not null,
  Verbal_Score integer not null,
  Total_Score integer not null,
  Awa_Score float(2,1) not null,
  primary key (STUDENT_ID),
  foreign key (score_id, score_type_code, aptitude_type) references aptitute_score (score_id, score_type_code, aptitude_type),
  foreign key(student_id) references student(student_id));

 Create table GMAT_score(
  student_id integer not null,
  score_id integer not null default 2,
  score_type_code char(1) not null default 'A',
  aptitude_type char(4) not null default 'GMAT',
  GMAT_Score integer not null,
  primary key (STUDENT_ID),
  foreign key (score_id, score_type_code, aptitude_type) references aptitute_score (score_id, score_type_code, aptitude_type),
  foreign key(student_id) references student(student_id));
  
  
create table language_type(
language_type char(5) not null,
primary key(language_type));

insert into language_type values ('TOEFL'),('IELTS');

create table language_score(
student_id integer not null,
score_id integer not null,
score_type_code char(1) not null default 'L',
language_type char(5) not null,
language_score VARCHAR(4) not null,
primary key(STUDENT_ID),
unique(student_id,score_id,score_type_code),
foreign key(score_id,score_type_code) references scores(score_id,score_type_code),
foreign key(language_type) references language_type(language_type),
foreign key(student_id) references student(student_id));


/*-------------------------------------------------------------------------*/

/*---------Select Statements To Query Tables -----------------------*/
/*---------Select Statements To Query Tables -----------------------*/
/*---------Select Statements To Query Tables -----------------------*/

select * from student;

select * from industry;

select * from skill;

select * from student_skills;

select * from Student_Skills_Gained;

select * from home_address;

select * from Current_Student;

select * from Alumini_Student;

select * from aptitute_score;

SELECT * FROM SCORE_TYPE;

select * from language_score;

select * from Gre_score;

select * from Gmat_score;

select * from scores;


