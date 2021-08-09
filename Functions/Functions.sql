

delimiter @
create function avgeRating(id int)
returns float 
deterministic
BEGIN
declare ar float;
select avg(rating) into ar from review where propertyid = id;
return ar;
end @

select avgeRating(4) as answer;


delimiter @
create function minPrice(city1 varchar(50), status1 varchar(20))
returns float 
deterministic
BEGIN
declare mp float;
select min(price) into mp from property, location, status where status.status = status1 and status.statusid = property.statusid and city=city1 and location.propertyid = property.propertyid;
return mp;
end @


select minPrice('Delhi','Sale') as Answer;



delimiter @
create function countCity(cit varchar(50))
returns int 
deterministic
BEGIN
declare total int;
SELECT count(*) into total FROM location WHERE city=cit;
return total;
END @


select countCity('Delhi') as Answer;



delimiter @
create function countpincodes(pstart int, pend int)
returns int 
deterministic
BEGIN
declare total int;
SELECT count(*) into total FROM location WHERE pincode BETWEEN pstart AND pend;
return total;
END @


select countpincodes(400000, 600000) as Answer;



delimiter @
create function bhkvalues(city1 varchar(50), bhk1 int, bhk2 int)
returns int 
deterministic
BEGIN
declare total int;
SELECT count(*) into total FROM residentialdetails rd,location l WHERE city=city1  and l.propertyid = rd.propertyid and bhk between bhk1 and bhk2;
return total;
END @

select bhkvalues('Mumbai',3,4) as Answer;