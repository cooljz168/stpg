-- 2) fails and throws error: 'ERROR:  could not determine polymorphic type 
-- because input has type "unknown"'
select decode('2012-01-01', '2012-01-01', 23, '2012-01-02', 24);
