PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE users (
username text,
password text,
added text
);
INSERT INTO users VALUES('joel','n0Clikkerz', '6/14/2013');
INSERT INTO users VALUES('ellie','FLAG UNSET', '6/14/2013');
CREATE TABLE expenses (
date text,
who text,
what text,
amount number
);
INSERT INTO expenses VALUES('8/13/20','ellie','Bullets ''R Us',45);
INSERT INTO expenses VALUES('8/12/20','ellie','Rick Shaw''s Rickshaws',33.990000000000001989);
INSERT INTO expenses VALUES('8/12/20','ellie','Starbucks',200.87999999999999545);
INSERT INTO expenses VALUES('8/11/2020','ellie','Taco Tunnel',39.600000000000001421);
INSERT INTO expenses VALUES('8/10/2020','ellie','Sullen Hoodies',67.230000000000003979);
INSERT INTO expenses VALUES('8/9/2020','ellie','Taco Tunnel',9.6500000000000003552);
INSERT INTO expenses VALUES('8/8/20','ellie','Rick Shaw''s Rickshaws',25.75);
INSERT INTO expenses VALUES('8/7/2020','ellie','Sullen Hoodies',39.100000000000001421);
INSERT INTO expenses VALUES('8/7/2020','ellie','Taco Tunnel',86.189999999999997726);
INSERT INTO expenses VALUES('8/6/20','ellie','Rick Shaw''s Rickshaws',55);
INSERT INTO expenses VALUES('8/6/20','joel','Deedee''s PPE',76);
INSERT INTO expenses VALUES('8/5/2020','ellie','Deedee''s PPE',76.87999999999999545);
INSERT INTO expenses VALUES('8/5/20','ellie','Starbucks',148.41999999999998749);
INSERT INTO expenses VALUES('8/4/2020','ellie','Deedee''s PPE',454.17000000000001592);
INSERT INTO expenses VALUES('7/29/20','ellie','Taco Tunnel',127.70000000000000284);
INSERT INTO expenses VALUES('7/28/2020','ellie','Taco Tunnel',40.649999999999998578);
INSERT INTO expenses VALUES('7/26/2020','ellie','Taco Tunnel',35.070000000000000283);
INSERT INTO expenses VALUES('7/22/20','ellie','Starbucks',2.4500000000000001776);
INSERT INTO expenses VALUES('7/22/20','ellie','Starbucks',129.68999999999999772);
INSERT INTO expenses VALUES('7/21/2020','ellie','Taco Tunnel',86.189999999999997726);
INSERT INTO expenses VALUES('7/19/2020','ellie','Taco Tunnel',25.440000000000001279);
INSERT INTO expenses VALUES('7/15/20','ellie','Starbucks',208.88999999999998636);
INSERT INTO expenses VALUES('7/12/2020','joel','Deedee''s PPE',110);
INSERT INTO expenses VALUES('7/9/2020','joel','Deedee''s PPE',36);
INSERT INTO expenses VALUES('7/8/2020','ellie','Deedee''s PPE',62.289999999999999145);
INSERT INTO expenses VALUES('7/8/20','ellie','Starbucks',166.46999999999999886);
INSERT INTO expenses VALUES('7/7/2020','ellie','Deedee''s PPE',26.739999999999998435);
INSERT INTO expenses VALUES('7/6/2020','ellie','Rick Shaw''s Rickshaws',145.94999999999998863);
INSERT INTO expenses VALUES('7/3/2020','joel','Deedee''s PPE',10);
INSERT INTO expenses VALUES('7/2/2020','ellie','Deedee''s PPE',344.56000000000000227);
INSERT INTO expenses VALUES('7/1/20','ellie','Starbucks',241.81000000000000228);
INSERT INTO expenses VALUES('6/29/2020','ellie','Taco Tunnel',36.820000000000000285);
INSERT INTO expenses VALUES('6/24/20','ellie','Starbucks',214.75);
INSERT INTO expenses VALUES('6/23/2020','ellie','Sullen Hoodies',11.990000000000000212);
INSERT INTO expenses VALUES('6/22/2020','ellie','Taco Tunnel',46.39999999999999858);
INSERT INTO expenses VALUES('6/19/20','ellie','Rick Shaw''s Rickshaws',34.479999999999996873);
INSERT INTO expenses VALUES('6/17/20','ellie','Starbucks',223.41999999999998748);
INSERT INTO expenses VALUES('6/10/2020','ellie','Sullen Hoodies',37.670000000000001705);
INSERT INTO expenses VALUES('6/10/2020','ellie','Sullen Hoodies',39.840000000000003409);
INSERT INTO expenses VALUES('6/10/20','ellie','Starbucks',230.65999999999999658);
INSERT INTO expenses VALUES('6/9/2020','ellie','Deedee''s PPE',42.310000000000002272);
INSERT INTO expenses VALUES('6/6/20','ellie','Taco Tunnel',24.370000000000000995);
INSERT INTO expenses VALUES('6/2/2020','ellie','Deedee''s PPE',333.73000000000001819);
INSERT INTO expenses VALUES('5/29/20','ellie','Taco Tunnel',29.339999999999999857);
INSERT INTO expenses VALUES('5/27/2020','ellie','Sullen Hoodies',94.829999999999998296);
INSERT INTO expenses VALUES('5/26/2020','ellie','Sullen Hoodies',11.990000000000000212);
INSERT INTO expenses VALUES('5/25/20','joel','Taco Tunnel',38);
INSERT INTO expenses VALUES('5/22/20','joel','Taco Tunnel',76);
INSERT INTO expenses VALUES('5/21/2020','ellie','Deedee''s PPE',58.280000000000001135);
INSERT INTO expenses VALUES('5/20/2020','ellie','Rick Shaw''s Rickshaws',21.440000000000001278);
INSERT INTO expenses VALUES('5/20/20','ellie','Starbucks',246.2599999999999909);
INSERT INTO expenses VALUES('5/19/2020','ellie','Deedee''s PPE',92.260000000000005112);
INSERT INTO expenses VALUES('5/15/2020','ellie','Rick Shaw''s Rickshaws',14.990000000000000213);
INSERT INTO expenses VALUES('5/13/20','ellie','Starbucks',157.02000000000001022);
INSERT INTO expenses VALUES('5/9/20','ellie','Taco Tunnel',48.549999999999997159);
INSERT INTO expenses VALUES('5/8/2020','ellie','Deedee''s PPE',19.969999999999998863);
INSERT INTO expenses VALUES('5/7/20','ellie','Taco Tunnel',9.0099999999999997868);
INSERT INTO expenses VALUES('5/7/2020','ellie','Deedee''s PPE',145.94999999999998863);
INSERT INTO expenses VALUES('5/6/20','ellie','Starbucks',210.50999999999999089);
INSERT INTO expenses VALUES('5/5/2020','ellie','Sullen Hoodies',26.890000000000000568);
INSERT INTO expenses VALUES('5/5/2020','ellie','Sullen Hoodies',27.429999999999999716);
INSERT INTO expenses VALUES('5/5/2020','ellie','Rick Shaw''s Rickshaws',271.45999999999997952);
INSERT INTO expenses VALUES('5/2/20','ellie','Deedee''s PPE',43.149999999999998578);
INSERT INTO expenses VALUES('4/28/20','ellie','Starbucks',238.47999999999998977);
INSERT INTO expenses VALUES('4/27/2020','ellie','Sullen Hoodies',12.890000000000000568);
COMMIT;
