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
prior_year_work_exp float(3,2) not null,
Undergrad_Degree varchar(40) not null,
primary key(student_id),
foreign key(student_type_code) references student_type(student_type_code));


create table industry(
industry_id integer not null auto_increment,
Industry varchar(20) not null,
student_id integer not null,
primary key(industry_id),
foreign key(student_id) references student(student_id));

create table skill(
skill_id INTEGER NOT NULL AUTO_INCREMENT,
skill varchar(20) not null,
student_id integer not null,
primary key(skill_id,student_id),
foreign key (student_id) references student(student_id));

create table Home_Address(
address_id integer not null auto_increment,
city varchar(10) not null,
state varchar(10) not null,
country varchar(10) not null,
primary key(address_id));

create table Current_Student(
student_id integer not null,
student_type_code char(2) not null default 'CS',
address_id integer not null,
primary key(student_id),
unique(student_id,student_type_code),
foreign key(student_type_code) references student(student_type_code),
foreign key(student_id) references student(student_id),
foreign key (address_id) references home_address(address_id));


create table Alumini_Student(
student_id integer not null,
student_type_code char(2) not null default 'AL',
skill_id integer not null, 
MS_GPA float(3,2) not null,
Employer varchar(20) not null,
Job_Title varchar(20) not null,
Salary varchar(10) not null,
location char(10) not null,
primary key(student_id),
unique(student_id,student_type_code),
foreign key(skill_id) references skill(skill_id),
foreign key(student_type_code) references student(student_type_code),
foreign key(student_id) references student(student_id));


/* ---------------------------Test Score Tables-------------------
------------------------------------GRE or GMAT---------------------------
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
other_columns char(1) default 'x',
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
student_id integer not null,
score_type_code char(1) not null default 'A',
aptitude_type char(4) not null,
other_columns char(1) not null default 'X',
primary key(score_id),
unique(score_id,score_type_code,aptitude_type),
foreign key(score_id,score_type_code) references scores(score_id,score_type_code),
foreign key(aptitude_type) references aptitude_type(aptitude_type),
foreign key(student_id) references student(student_id));

create table language_type(
language_type char(5) not null,
primary key(language_type));

insert into language_type values ('TOEFL'),('IELTS');

create table language_score(
score_id integer not null,
student_id integer not null,
score_type_code char(1) not null default 'L',
language_type char(5) not null,
other_columns char(1) not null default 'X',
primary key(score_id),
unique(score_id,score_type_code,language_type),
foreign key(score_id,score_type_code) references scores(score_id,score_type_code),
foreign key(language_type) references language_type(language_type),
foreign key(student_id) references student(student_id));
