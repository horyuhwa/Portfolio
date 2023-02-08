--drop(���ΰ�ħ��)
drop table pitcher_info;
drop table pitcher_position;
drop table pitcher_winlose;
drop table stadium;
drop table team;
drop table pitcher_info;
drop table pitcher_record;

drop sequence pitcher_position_code;
drop sequence pitcher_num;

--����������
create table pitcher_position 
(
pitcher_position_code int primary key,
pitcher_position_list varchar2(20) not null
);

create sequence pitcher_position_code;
insert into pitcher_position values (pitcher_position_code.nextval,'������Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'������Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'����Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'�����Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'����Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'�����Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'������Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'������Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'�»��Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'�»���Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'�¾��Ÿ');
insert into pitcher_position values (pitcher_position_code.nextval,'�¾���Ÿ');

--���Ľ���
create table pitcher_winlose 
(
pitcher_winlose_code int primary key,
pitcher_winlose_list varchar2(20) not null
);

insert into pitcher_winlose values (1,'�¸�');
insert into pitcher_winlose values (2,'����');
insert into pitcher_winlose values (3,'������');

--����
create table stadium 
(
stadium_code int primary key,
stadium_list varchar2(10) not null
);

insert into stadium values (1,'�뱸');
insert into stadium values (2,'����');
insert into stadium values (3,'����');
insert into stadium values (4,'���');
insert into stadium values (5,'â��');
insert into stadium values (6,'����');
insert into stadium values (7,'��ô');
insert into stadium values (8,'���');
insert into stadium values (9,'����');
insert into stadium values (10,'����');
insert into stadium values (11,'����');

--������
create table team 
(
team_code int primary key,
team_list varchar2(50) not null
);

insert into team values (1,'�Ｚ���̿���');
insert into team values (2,'�Ե����̾���');
insert into team values (3,'NC���̳뽺');
insert into team values (4,'���Ÿ�̰���');
insert into team values (5,'Ű���������');
insert into team values (6,'LGƮ����');
insert into team values (7,'�λ꺣�');
insert into team values (8,'SSG������');
insert into team values (9,'KT����');
insert into team values (10,'��ȭ�̱۽�');
insert into team values (11,'��');

--������������
create table pitcher_info 
(
pitcher_num int primary key,
pitcher_name varchar2(20) not null,
pitcher_backnum int unique,
pitcher_birth int not null,
pitcher_position int not null, --FK
pitcher_height int not null,
pitcher_weight int not null,
pitcher_last_school varchar2(50) not null,
pitcher_joindate int not null,
pitcher_jointeam int not null, --FK
constraint FK_pitcher_position foreign key(pitcher_position) references pitcher_position(pitcher_position_code),
constraint FK_pitcher_jointeam foreign key(pitcher_jointeam) references stadium(stadium_code)
);

create sequence pitcher_num;
insert into pitcher_info values(pitcher_num.nextval,'������',18,20000406,1,183,92,'��ϰ�',2019,1);
insert into pitcher_info values(pitcher_num.nextval,'��ĳ��',4,19890511,1,190,90,'�������ָ���',2020,1);
insert into pitcher_info values(pitcher_num.nextval,'���Ʒ���',57,19891008,1,190,120,'���������������̰�',2022,1);
insert into pitcher_info values(pitcher_num.nextval,'���ϴ�',53,19990326,5,190,99,'����',2019,2);
insert into pitcher_info values(pitcher_num.nextval,'������',49,20010619,8,181,90,'���Ű�',2020,1);
insert into pitcher_info values(pitcher_num.nextval,'������',26,19880408,1,190,90,'���ϰ�',2007,11);
insert into pitcher_info values(pitcher_num.nextval,'������',29,19870713,8,184,80,'�뱸�����',2007,1);
insert into pitcher_info values(pitcher_num.nextval,'��â��',1,19990922,1,182,85,'������',2018,1);
insert into pitcher_info values(pitcher_num.nextval,'Ȳ����',61,20011103,1,191,97,'��ϰ�',2020,1);

create table pitcher_record 
(
game_date int not null,
game_stadium int not null, --FK
pitcher_name int not null, --FK
pitcher_ining int not null,
pitcher_hit int not null,
pitcher_r int not null,
pitcher_bb int not null,
pitcher_k int not null,
pitcher_hr int not null,
pitcher_pit int not null,
pitcher_era number not null,
pitcher_wl int not null, --FK
constraint FK_game_stadium foreign key(game_stadium) references stadium(stadium_code), --���̺� �� FK ����
constraint FK_pitcher_name foreign key(pitcher_name) references pitcher_info(pitcher_num) --���̺� �� FK ����
);

alter table pitcher_record add constraint FK_pitcher_wl 
foreign key (pitcher_wl) references pitcher_winlose(pitcher_winlose_code); --���̺� �� FK ����

insert into pitcher_record values (20220312,1,6,3,6,2,1,2,0,54,6,3);
insert into pitcher_record values (20220314,1,8,6,5,1,1,4,0,79,1.5,3);
insert into pitcher_record values (20220315,1,2,2,2,1,0,2,0,27,0,3);
insert into pitcher_record values (20220318,1,1,1.333,7,6,1,0,1,48,40.5,2);
insert into pitcher_record values (20220320,1,2,4,3,1,2,1,0,57,1.5,1);
insert into pitcher_record values (20220321,1,6,5,2,1,3,3,0,74,3.38,3);
insert into pitcher_record values (20220322,1,3,4,1,0,2,2,0,61,0,1);
insert into pitcher_record values (20220324,10,1,4.666,8,2,0,3,2,80,11.25,1);
insert into pitcher_record values (20220325,10,2,5,6,1,0,7,0,80,1.64,1);
insert into pitcher_record values (20220327,9,8,4,4,2,3,2,1,76,3.46,3);
insert into pitcher_record values (20220328,1,3,5,4,2,0,3,0,69,0,3);
insert into pitcher_record values (20220329,1,7,4.666,12,5,2,2,1,79,7.04,2);
insert into pitcher_record values (20220402,9,2,6,7,2,4,4,0,106,3,2);
insert into pitcher_record values (20220403,9,3,6,4,2,2,9,1,100,3,3);
insert into pitcher_record values (20220405,5,1,5.333,8,3,0,4,1,97,5.06,3);
insert into pitcher_record values (20220406,5,8,6,3,0,2,3,0,93,0,1);
insert into pitcher_record values (20220407,5,5,3,2,3,5,2,0,57,6,3);
insert into pitcher_record values (20220408,1,2,7,6,1,0,2,0,88,2.08,2);
insert into pitcher_record values (20220409,1,3,7,4,2,1,5,0,95,2.08,2);
insert into pitcher_record values (20220410,1,7,6.666,6,4,1,0,2,79,5.4,3);
insert into pitcher_record values (20220412,1,1,7,3,0,2,8,0,102,2.19,1);
insert into pitcher_record values (20220413,1,8,6,4,1,0,4,1,87,0.75,1);
insert into pitcher_record values (20220414,1,2,7,6,3,1,6,0,97,1.8,1);
insert into pitcher_record values (20220415,8,3,2,6,4,0,1,0,44,3.6,2);
insert into pitcher_record values (20220416,8,7,5,6,5,5,1,0,97,6.94,2);
insert into pitcher_record values (20220417,8,1,5,7,5,6,2,0,101,4.15,2);
insert into pitcher_record values (20220419,10,8,2.333,5,4,2,2,0,56,3.14,3);
insert into pitcher_record values (20220420,10,2,6,8,2,2,3,0,102,2.08,2);
insert into pitcher_record values (20220421,10,3,6,4,1,2,7,0,102,3,1);
insert into pitcher_record values (20220422,1,7,6.333,9,7,2,2,3,102,8,2);
insert into pitcher_record values (20220423,1,9,5,6,2,0,4,0,80,3.18,3);
insert into pitcher_record values (20220424,1,8,1,2,3,2,0,1,25,4.7,2);
insert into pitcher_record values (20220426,1,2,7,6,4,1,7,0,100,2.45,1);
insert into pitcher_record values (20220427,1,3,7,4,2,4,2,0,103,2.89,2);
insert into pitcher_record values (20220428,1,7,6,7,3,2,3,1,98,7.13,3);
insert into pitcher_record values (20220429,3,9,4.333,7,2,3,2,0,97,1.8,3);
insert into pitcher_record values (20220430,3,1,5.666,10,3,2,7,0,106,3.52,3);

--select
select*from pitcher_info;
select pitcher_num, pitcher_name, pitcher_backnum from pitcher_info where pitcher_joindate>2019;
select*from pitcher_position where pitcher_position_list='������Ÿ';

--update
select*from pitcher_winlose;
update pitcher_winlose set pitcher_winlose_list='ND' where pitcher_winlose_code=3; 
update pitcher_winlose set pitcher_winlose_list='������' where pitcher_winlose_code=3;
commit;

select*from team;
update team set team_list='��(������)' where team_code=11;

--delete
select*from pitcher_position;
insert into pitcher_position values(13,'������');
delete from pitcher_position where pitcher_position_code=13;

commit;

select*from team;
delete from team where team_list like '%����';
rollback;

--group by
--�� ������ �̴� ���� ����
select*from pitcher_record;
select pitcher_name, sum(pitcher_ining) from pitcher_record group by pitcher_name; 


--having & order by
--�̴� ������ 20 �ʰ��� ������ �̸��� �� �̴׼� ���
select pitcher_name, sum(pitcher_ining) from pitcher_record 
group by pitcher_name having sum(pitcher_ining)>20 order by pitcher_name; 

--��ø����
--���� ��� �� era�� ���� ���� �����͸� ���
select*from pitcher_record where pitcher_era=
(select min(pitcher_era) from pitcher_record);

--view
--���� �̸��� �̴� ������ �������̺� ��
create view v_group_pitcher_record as select pitcher_name, 
sum(pitcher_ining) sum_pitcher_ining from pitcher_record group by pitcher_name;
select*from v_group_pitcher_record;

--���� �̸��� ����ϴ� �������̺� ��
create view v_pitcher_name as select pitcher_name pitcher_name 
from pitcher_info 
group by pitcher_name;
select*from v_pitcher_name;

--join �������
--���� �ѹ��� ���� �̸��� �ִ� ���̺�� �������� �並 join�Ͽ� �̸�-���̴׼� ���
select pitcher_info.pitcher_name, sum_pitcher_ining 
from v_group_pitcher_record join pitcher_info 
on v_group_pitcher_record.pitcher_name = pitcher_info.pitcher_num;


--join �ٸ���� (view�� ���̺�� �����;� �Ѵ�.)
--���� �ѹ��� ���� �̸��� �ִ� ���̺�� �������� �並 join�Ͽ� �̸�-���̴׼� ���
select pitcher_info.pitcher_name, v_group_pitcher_record.sum_pitcher_ining 
from pitcher_info, v_group_pitcher_record 
where pitcher_info.pitcher_num = v_group_pitcher_record.pitcher_name;


--procedure
--pitcher_info�� ������ �߰��ϴ� procedure
create or replace procedure add_pitcher_info 
(
pit_num int,
pit_name varchar2,
pit_backnum int,
pit_birth int,
pit_position int,
pit_height int,
pit_weight int,
pit_last_school varchar2,
pit_joindate int,
pit_jointeam int
)
is begin 
insert into pitcher_info values (pit_num,pit_name,pit_backnum,pit_birth,
pit_position,pit_height,pit_weight,pit_last_school,pit_joindate,pit_jointeam); 
end add_pitcher_info;
/
exec add_pitcher_info (20,'�赵��',99,20001010,3,193,89,'��ϰ�',2000,3);

--function
--���ȣ�� ���� ���� �̸��� ����ϴ� �Լ�
create or replace function func_get_pitcher_name(
    backnum int
    )
return varchar2 
is 
    v_pirchername varchar2(100);
    begin
    select pitcher_name 
    into v_pirchername 
    from pitcher_info
    where pitcher_backnum = backnum;
return v_pirchername;    
end;   
/
select func_get_pitcher_name(18) from dual;