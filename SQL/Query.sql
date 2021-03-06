select *
from primer_spx

Update primer_spx
set CALL_MID = (BID_CALL + ASK_CALL)/2

UPDATE PRIMER_SPX
SET PUT_MID = (BID_PUT + ASK_PUT)/2

UPDATE PRIMER_SPX
SET CALL_PUT_ABS_DIFF = ABS(CALL_MID - PUT_MID)

------------------------poi��emo najmanj�o razliko za oba datuma----------------------

SELECT *
FROM primer_spx
INNER JOIN(
	SELECT MIN(call_put_abs_diff) as min_diff
	FROM primer_spx
	where datum = '2020-03-31 00:00:00.000'
)t1
ON t1.min_diff=primer_spx.call_put_abs_diff

SELECT *
FROM primer_spx
INNER JOIN(
	SELECT MIN(call_put_abs_diff) as min_diff
	FROM primer_spx
	GROUP BY datum
)t1
ON t1.min_diff=primer_spx.call_put_abs_diff
-----------------------------------------------------------------------------------------

---------F1 = 3086.80
--------F2=3086.65
 ---------------PUTS T1----------------------------
SELECT [Datum],[Strike],[Puts],[Bid_Put],[Ask_Put]
FROM primer_spx
where  Datum = '2020-03-31 00:00:00.000'
AND Strike < 3086.80
ORDER BY Strike ASC

-------CALLS T1---------------
SELECT [Datum],[Strike],[Calls],[Bid_Call],[Ask_Call]
FROM primer_spx
where  Datum = '2020-03-31 00:00:00.000'
AND Strike > 3086.80
ORDER BY Strike ASC

-----PUTS T2-------------------
SELECT [Datum],[Strike],[Puts],[Bid_Put],[Ask_Put]
FROM primer_spx
where  Datum = '2020-04-06 00:00:00.000'
AND Strike < 3086.65
ORDER BY Strike ASC

-------------CALLS T2-------------
SELECT [Datum],[Strike],[Calls],[Bid_Call],[Ask_Call]
FROM primer_spx
where  Datum = '2020-04-06 00:00:00.000'
AND Strike > 3086.65
ORDER BY Strike ASC


