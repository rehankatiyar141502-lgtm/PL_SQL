--program to calculate result
set serveroutput on
declare
xrlno NUMBER(3):=&xrlno;
xs1 NUMBER(3);
xs2 NUMBER(3);
xs3 NUMBER(3);
xs4 NUMBER(3);
xs5 NUMBER(3);

t NUMBER(3);
p NUMBER(3);
begin
select sub1,sub2,sub3,sub4,sub5 INTO xs1,xs2,xs3,xs4,xs5 from
results where rollno=xrlno;

if (xs1 < 40) OR (xs2 < 40) OR (xs3 < 40) OR (xs4 <
40) OR (xs5 < 40)
then
update results set
total=0,per=0,grade='F' where rollno=xrlno;
end if;

t:=xs1 + xs2 + xs3 + xs4 + xs5;
p:=t/5;
if p >= 40 and p < 50
then
update results set

total=t,per=p,grade='D' where rollno=xrlno;

elsif p >= 50 and p < 60
then
update results set

total=t,per=p,grade='C' where rollno=xrlno;

elsif p >= 60 and p < 70
then
update results set

total=t,per=p,grade='B' where rollno=xrlno;

elsif p >= 70 and p <=100

then
update results set

total=t,per=p,grade='A' where rollno=xrlno;
else
update results set

total=0,per=0,grade='F' where rollno=xrlno;
end if;

end;
/