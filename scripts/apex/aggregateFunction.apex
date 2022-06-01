//AVG(),Count(),MAX(),MIN()
//1.Sum of amount for all opps which are not closed
//2.Sum of amount for all opps StageName wise
Select SUM(amount) from opportunity Where isClosed = false
select Sum(amount), stageName from opportunity where isClosed = flase group by stageName