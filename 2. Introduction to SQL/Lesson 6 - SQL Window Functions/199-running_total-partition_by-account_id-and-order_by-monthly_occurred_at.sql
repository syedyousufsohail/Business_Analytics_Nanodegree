/*
Udacity's certified program > Business Analytics Nanodegree
SQL practice > Lesson 6 : SQL Window Functions

WINDOW FUNCTIONS:

Running total of standard_qty 'PARTITION BY' account_id and
'ORDER BY' occurred_at
*/

SELECT account_id,
       DATE_TRUNC('month', occurred_at),
       standard_qty,
       SUM(standard_qty) OVER (PARTITION BY account_id ORDER BY DATE_TRUNC('month', occurred_at)) AS running_total
FROM orders;


/*
Output6912 results
account_id	date_trunc	standard_qty	running_total
1001	2015-10-01T00:00:00.000Z	123	123
1001	2015-11-01T00:00:00.000Z	506	819
1001	2015-11-01T00:00:00.000Z	190	819
1001	2015-12-01T00:00:00.000Z	85	1430
1001	2015-12-01T00:00:00.000Z	526	1430
1001	2016-01-01T00:00:00.000Z	566	2140
1001	2016-01-01T00:00:00.000Z	144	2140
1001	2016-02-01T00:00:00.000Z	473	2721
1001	2016-02-01T00:00:00.000Z	108	2721
1001	2016-03-01T00:00:00.000Z	103	3322
1001	2016-03-01T00:00:00.000Z	498	3322
1001	2016-04-01T00:00:00.000Z	497	3920
1001	2016-04-01T00:00:00.000Z	101	3920
1001	2016-05-01T00:00:00.000Z	483	5120
1001	2016-05-01T00:00:00.000Z	95	5120
1001	2016-05-01T00:00:00.000Z	91	5120
1001	2016-05-01T00:00:00.000Z	531	5120
1001	2016-06-01T00:00:00.000Z	94	5214
1001	2016-07-01T00:00:00.000Z	101	5772
1001	2016-07-01T00:00:00.000Z	457	5772
1001	2016-08-01T00:00:00.000Z	557	6453
1001	2016-08-01T00:00:00.000Z	124	6453
1001	2016-09-01T00:00:00.000Z	104	7064
1001	2016-09-01T00:00:00.000Z	507	7064
1001	2016-10-01T00:00:00.000Z	97	7161
1001	2016-11-01T00:00:00.000Z	485	7773
1001	2016-11-01T00:00:00.000Z	127	7773
1001	2016-12-01T00:00:00.000Z	123	7896
1011	2016-12-01T00:00:00.000Z	527	527
1021	2015-10-01T00:00:00.000Z	0	516
1021	2015-10-01T00:00:00.000Z	516	516
1021	2015-11-01T00:00:00.000Z	0	1013
1021	2015-11-01T00:00:00.000Z	497	1013
1021	2015-12-01T00:00:00.000Z	483	1496
1021	2016-01-01T00:00:00.000Z	0	2031
*/

/*
1. As rows are partitioned by account_id, running_total is reset every time new
account_id is detected.

2. As rows are ordered by monthly_occurred_at, running_total increments
accordance to every month by occurred_at.
*/
