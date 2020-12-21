drop table Graph;

CREATE TABLE Graph(
  x int,
  y int)
row format delimited fields terminated by ',' stored as textfile;

load data local inpath '${hiveconf:G}' overwrite into table Graph;

SELECT sum, count(1) as total FROM (SELECT Graph.x, count(1) AS sum from Graph GROUP BY Graph.x) w GROUP BY sum ORDER BY sum ASC;