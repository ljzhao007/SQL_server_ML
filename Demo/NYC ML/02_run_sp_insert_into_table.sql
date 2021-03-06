USE [NYCTaxi_Sample]
GO

DECLARE	@return_value int
declare @inp nvarchar(max)
set @inp=N'select cast(fare_amount as float) as fare_amount 
	  ,cast(medallion as varchar(50)) as medallion
	  ,cast(hack_license as varchar(50)) as hack_license
      ,cast(passenger_count as int) as passenger_count
      ,convert(varchar(30),pickup_datetime,120) as pickup_datetime
      ,cast(pickup_longitude as float) as pickup_longitude_n
      ,cast(pickup_latitude as float) as pickup_latitude_n
      ,cast(dropoff_longitude as float) as dropoff_longitude_n
      ,cast(dropoff_latitude as float) as dropoff_latitude_n
      from [dbo].[nyctaxi_sample] 
	  where datepart(mm,pickup_datetime)=12'
EXEC @return_value= [dbo].[sp_feature_engineering] @inquery=@inp

SELECT	'Return Value' = @return_value
