use ddrk;

SELECT 
    *
FROM
    commercial;
SELECT 
    *
FROM
    residential;
SELECT 
    *
FROM
    property;
describe property;

-- Find all members owning at least one property
SELECT 
    m.memberid,
    COUNT(*) AS Number_of_Properties,
    m.name,
    m.email
FROM
    member m,
    property p
WHERE
    m.memberid = p.memberid
GROUP BY m.name
ORDER BY m.memberid;

-- Display all members with properties with pincode of location of property starting with 4 (USE LIKE)
SELECT DISTINCT
    m.memberid AS MemberID,
    m.name AS Name,
    m.email AS Email,
    lc.city,
    lc.society,
    lc.pincode
FROM
    property p
        INNER JOIN
    member m ON m.memberid = p.memberid
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid
WHERE
    lc.pincode LIKE '4%'
ORDER BY m.memberid;

-- Display all members owning a Commercial plot with area between 200 and 1000 yards
SELECT DISTINCT
    m.memberid AS MemberID,
    m.name AS Name,
    m.email AS Email,
    lc.city,
    lc.society,
    pl.size AS 'Area (in yards)',
    p.price
FROM
    property p
        INNER JOIN
    member m ON m.memberid = p.memberid
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid
        INNER JOIN
    plot pl ON pl.propertyid = p.propertyid
        INNER JOIN
    plottype pt ON pt.typeid = pl.typeid
WHERE
    pl.size BETWEEN 200 AND 1000
        AND pt.type = 'Commercial';

-- HAVING CLAUSE


SELECT 
    e.employeeid,
    e.name AS Name,
    e.email AS Email,
    f.question AS Question
FROM
    employee e
        INNER JOIN
    faq f ON e.employeeid = f.employeeid
ORDER BY e.employeeid;


-- USING JOINS
SELECT 
    *
FROM
    residential r
        JOIN
    location l ON r.propertyid = l.propertyid;

-- Find all bungalows
SELECT 
    p.price AS Price,
    r.size AS Size,
    rd.bhk AS BHK,
    rd.bathroom AS Bathrooms,
    rd.floor AS Floors,
    r.specifications AS Specifications,
    r.possession AS Possession_Date,
    r.builder AS Builder
FROM
    property p,
    residential r,
    residentialdetails rd,
    residentialtype rt
WHERE
    rd.typeid = rt.typeid
        AND rt.type = 'Bungalow'
        AND p.propertyid = r.propertyid
        AND r.propertyid = rd.propertyid;
        
        
-- Query 1 Show Fully furnished flats.
SELECT 
    p.price,
    r.size,
    rd.bhk,
    rd.bathroom,
    rd.floor,
    r.specifications AS Specifications,
    r.possession AS Possession_Date,
    r.builder AS Builder
FROM
    property p,
    residential r,
    residentialdetails rd,
    furnishing f,
    residentialtype rt
WHERE
    f.type = 'Fully Furnished'
        AND f.furnishingid = rd.furnishingid
        AND rt.type = 'Flat'
        AND rt.typeid = rd.typeid
        AND p.propertyid = r.propertyid
        AND r.propertyid = rd.propertyid;


--  Which type of plots are available?
SELECT 
    pt.type
FROM
    plottype pt;

-- In which locality of the Delhi properties are situated?
SELECT 
    city, locality, pincode
FROM
    location
WHERE
    city = 'Delhi';

-- Could you please show top rated properties available for rent in Chennai?
SELECT 
    lc.city,
    lc.society,
    re.rating,
    re.description,
    p.price,
    r.size,
    rd.bhk,
    rd.bathroom,
    rd.floor,
    r.specifications AS Specifications,
    r.possession AS Possession_Date,
    r.builder AS Builder
FROM
    location lc,
    property p,
    residential r,
    residentialdetails rd,
    status st,
    review re
WHERE
    st.status = 'Rent'
        AND st.statusid = p.statusid
        AND lc.city = 'Chennai'
        AND lc.propertyid = p.propertyid
        AND re.propertyid = p.propertyid
        AND r.propertyid = p.propertyid
        AND rd.propertyid = p.propertyid;
        
-- Show flats by laalaji builder
SELECT 
    lc.city,
    lc.society,
    p.price,
    r.size,
    rd.bhk,
    rd.bathroom,
    rd.floor,
    r.specifications AS Specifications,
    r.possession AS Possession_Date,
    r.builder AS Builder
FROM
    location lc,
    property p,
    residential r,
    residentialdetails rd,
    residentialtype rt
WHERE
    rt.type = 'Flat'
        AND rt.typeid = rd.typeid
        AND r.builder = 'Laalaji'
        AND r.propertyid = p.propertyid
        AND lc.propertyid = p.propertyid
        AND rd.propertyid = p.propertyid;
    

-- Properties owned by member gowardhan having email = gowardha@gmail.com, password = 12345
SELECT 
    p.propertyid AS PropertyID,
    lc.city AS City,
    lc.society AS Society,
    p.price AS Price
FROM
    property p
        INNER JOIN
    location lc ON p.propertyid = lc.propertyid
        INNER JOIN
    member m ON p.memberid = m.memberid
WHERE
    m.email = 'gowardha@gmail.com'
        AND m.password = '12345';
    
-- Increase price of all plots in Pune by 5%.
UPDATE property p
        INNER JOIN
    plot pl ON pl.propertyid = p.propertyid
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid 
SET 
    p.price = p.price * 0.5
WHERE
    lc.city = 'Pune';

SELECT 
    *
FROM
    property;

-- Show all the Public Relation's employee's name, email, phone no. AND HOW MANY queries have they solved.
SELECT 
    e.name AS Name,
    e.email AS Email,
    ep.phoneno AS Phone,
    er.department AS Department,
    COUNT(*) AS 'Queries Solved'
FROM
    employee e
        INNER JOIN
    empphoneno ep ON e.employeeid = ep.employeeid
        INNER JOIN
    employeerole er ON er.departmentid = e.departmentid
        INNER JOIN
    faq f ON e.employeeid = f.employeeid
WHERE
    er.department = 'Public Relations'
GROUP BY e.employeeid
ORDER BY e.employeeid;

-- Calculate average rating of a member by calculating average of all ratings left on his properties.
SELECT 
    m.memberid AS MemberID,
    m.name AS Name,
    AVG(re.rating) AS 'Average Rating'
FROM
    member m
        INNER JOIN
    property p ON m.memberid = p.memberid
        INNER JOIN
    review re ON re.propertyid = p.propertyid
GROUP BY m.memberid
ORDER BY m.memberid;

-- Show all the positive reviews(rating>3) from rating on a particular property.
SELECT 
    p.propertyid AS PropertyID,
    lc.city AS City,
    lc.society AS Society,
    re.description AS Review,
    re.rating AS Rating
FROM
    property p
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid
        INNER JOIN
    review re ON re.propertyid = p.propertyid
WHERE
    re.rating > 3 AND re.propertyid = 2;

-- Show all the properties in a particular city bought or sold within the last year

SELECT 
    lc.city AS City, AVG(p.price) AS 'Average Price'
FROM
    property p
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid
        INNER JOIN
    residentialdetails rd ON rd.propertyid = p.propertyid
        INNER JOIN
    residentialtype rt ON rd.typeid = rt.typeid
WHERE
    rt.type = 'Flat' AND lc.city = 'Mumbai'
GROUP BY lc.city;

-- Show top 3 members who has the most properties on the website
SELECT 
    m.memberid AS MemberID,
    m.name AS Name,
    COUNT(*) AS 'Total Properties'
FROM
    property p
        INNER JOIN
    member m ON m.memberid = p.memberid
GROUP BY m.memberid
ORDER BY COUNT(*) DESC
LIMIT 3;

-- Cheapest shop available in a city
SELECT 
    lc.city AS City,
    lc.society AS Society,
    p.propertyid AS PropertyID,
    c.size AS Area,
    c.builder AS Builder,
    p.price AS 'Price'
FROM
    property p
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid
        INNER JOIN
    commercial c ON c.propertyid = p.propertyid
        INNER JOIN
    commercialtype ct ON c.typeid = ct.typeid
WHERE
    ct.type = 'Shop'
        AND lc.city = 'Bangalore'
        AND p.price <= ALL (SELECT 
            p.price
        FROM
            property p
                INNER JOIN
            location lc ON lc.propertyid = p.propertyid
                INNER JOIN
            commercial c ON c.propertyid = p.propertyid
                INNER JOIN
            commercialtype ct ON c.typeid = ct.typeid
        WHERE
            ct.type = 'Shop'
                AND lc.city = 'Bangalore');

-- Top 3 properties with most reviews/ratings
SELECT 
    lc.city AS City,
    lc.society AS Society,
    p.price AS Price,
    s.status AS Status,
    COUNT(*) AS 'Total Reviews'
FROM
    property p
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid
        INNER JOIN
    review re ON re.propertyid = p.propertyid
        INNER JOIN
    status s ON s.statusid = p.statusid
GROUP BY p.propertyid
ORDER BY COUNT(*) DESC
LIMIT 3;

-- Biggest plot available in a particular city (Pune)
SELECT 
    p.propertyid AS PropertyID,
    lc.city AS City,
    lc.society AS Society,
    pl.size AS Area
FROM
    property p
        INNER JOIN
    location lc ON lc.propertyid = p.propertyid
        INNER JOIN
    plot pl ON pl.propertyid = p.propertyid
WHERE
    lc.city = 'Pune'
        AND pl.size >= ALL (SELECT 
            pl.size
        FROM
            property p
                INNER JOIN
            location lc ON lc.propertyid = p.propertyid
                INNER JOIN
            plot pl ON pl.propertyid = p.propertyid
        WHERE
            lc.city = 'Pune');
                
-- Show all residential properties available for possession within next 2 months
SELECT 
    p.propertyid AS PropertyID,
    city AS City,
    bhk AS BHK,
    bathroom AS Bathrooms,
    floor AS Floor,
    price AS Price,
    possession AS Possession
FROM
    residentialdetails rd,
    property p,
    location l,
    residential r
WHERE
    DATEDIFF(r.possession, CURRENT_DATE) < 60
        AND rd.propertyid = r.propertyid
        AND l.propertyid = r.propertyid
        AND p.propertyid = r.propertyid
ORDER BY possession;

-- Show all properties and their locations posted on website
SELECT 
    p.propertyid AS PropertyID,
    status AS Status,
    price AS Price,
    city AS City,
    locality AS Locality,
    society AS Society,
    pincode AS Pincode
FROM
    property p,
    status s,
    location l
WHERE
    p.propertyid = l.propertyid
        AND p.statusid = s.statusid
ORDER BY propertyid;

-- Display all Plots.
SELECT 
    p.propertyid AS PropertyID,
    p.price AS Price,
    pl.size AS 'Area in Yards',
    pt.type AS Type
FROM
    property p
        INNER JOIN
    plot pl ON pl.propertyid = p.propertyid
        INNER JOIN
    plottype pt ON pl.typeid = pt.typeid
ORDER BY propertyid;

-- Display all Residential properties.
SELECT 
    p.propertyid AS PropertyID,
    specifications AS Specifications,
    size AS 'Area in Yards',
    possession AS Possession,
    builder AS Builder,
    rt.type AS Type,
    f.type AS Furnishing,
    bhk AS BHK,
    status AS Status,
    price AS Price
FROM
    property p,
    residential r,
    residentialdetails rd,
    residentialtype rt,
    furnishing f,
    status s
WHERE
    p.propertyid = r.propertyid
        AND p.propertyid = rd.propertyid
        AND p.statusid = s.statusid
        AND rt.typeid = rd.typeid
        AND f.furnishingid = rd.furnishingid
ORDER BY propertyid;

-- Display all Commercial properties.
SELECT 
    p.propertyid AS PropertyID,
    p.price AS Price,
    type AS Type,
    size AS 'Area in Yards',
    possession AS Possession,
    builder AS Builder,
    status AS Status
FROM
    commercial c,
    commercialtype ct,
    property p,
    status s
WHERE
    c.typeid = ct.typeid
        AND p.propertyid = c.propertyid
        AND p.statusid = s.statusid
ORDER BY propertyid;