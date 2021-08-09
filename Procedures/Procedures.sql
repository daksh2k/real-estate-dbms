-- Procedure 1  Count number of properties having BHK in a range in a city
delimiter @
create procedure reView(propid int)
deterministic
BEGIN
SELECT rating,description FROM review WHERE propertyid=propid;
END @

call reView(4);

-- Procedure 2 Display all residential properties having more than 'n' number of floors
delimiter @
create procedure propfloor(floor1 int, city1 varchar(50))
deterministic
BEGIN
SELECT rd.propertyid as PropertyID ,l.city as City ,r.size as 'Size(in sqft)' , rd.bhk as BHK, rd.bathroom as Bathrooms,rd.floor as Floors,p.price as Price
FROM residentialdetails rd,property p, location l , residential r
WHERE rd.floor<=floor1 AND rd.propertyid=p.propertyid AND l.city=city1 AND l.propertyid=p.propertyid and r.propertyid=p.propertyid;
END @

drop procedure propfloor;
call propfloor(20, 'Mumbai');
call propfloor(10, 'Mumbai');

-- Procedure 3 Display all the residential properties whose possession is available immediately  
delimiter @
create procedure propavail()
deterministic
BEGIN
SELECT p.propertyid as PropertyID,city as City,bhk as BHK,bathroom as Bathrooms,floor as Floor,price as Price,possession as Possession
FROM residentialdetails rd,property p,location l,residential r 
WHERE r.possession<=CURRENT_DATE and rd.propertyid=r.propertyid and l.propertyid=r.propertyid and p.propertyid=r.propertyid;
END @

drop procedure propavail;
call propavail();

-- Procedure 4 Display all the properties of a builder.
delimiter @
create procedure builderprop(builder1 varchar(50))
deterministic
BEGIN
select distinct p.propertyid as PropertyID,
    lc.city as City,
    lc.society as Society,
    p.price as Price,
    s.status as Status
    from
    location lc,
    property p,
    residential r,
    commercial c,
    status s
 where ((p.propertyid = r.propertyid and r.builder=builder1) or (p.propertyid = c.propertyid and c.builder=builder1)) and p.propertyid = lc.propertyid and p.statusid=s.statusid;
-- 	where p.propertyid in (r.propertyid, c.propertyid) and p.propertyid = lc.propertyid and p.statusid=s.statusid and builder1 in (r.builder,c.builder);
-- SELECT p.propertyid as PropertyID,city as City,status as Status,price as Price,r.builder as Builder
-- FROM property p,location l,residential r, commercial c,status s
-- WHERE r.builder=builder1 AND p.statusid=s.statusid AND p.propertyid=r.propertyid and p.propertyid=c.propertyid and p.propertyid=l.propertyid;
END @

drop procedure builderprop;
call builderprop('AFRCON');

-- Procedure 5 Diplay all plots with minimum area.
delimiter @
create procedure compPlotSize(city1 varchar(50),sizecomp int)
deterministic
BEGIN
SELECT pl.propertyid as PropertyID,pl.size as Size ,pt.type as Type,locality as Locality,society as Society 
FROM plot pl, location l, plottype pt
WHERE size>=sizecomp AND pl.typeid=pt.typeid AND city=city1 AND pl.propertyid=l.propertyid;
END @

drop procedure compPlotSize;
call compPlotSize('Pune', 370);