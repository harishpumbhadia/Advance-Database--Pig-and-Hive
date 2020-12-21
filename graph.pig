G = LOAD '$G' USING PigStorage(',') AS (x:int,y:int );
I = GROUP G BY x;	
J  = FOREACH I GENERATE group AS a,COUNT(G) AS b;
K = GROUP J BY b;
L = FOREACH K GENERATE group, COUNT(J);
STORE L INTO '$O' USING PigStorage(' ');