USE [NYCTaxi_Sample]
GO

DECLARE	@return_value int,
		@trained_model varbinary(max)

EXEC	@return_value = [dbo].[sp_train_model]
		@trained_model = @trained_model OUTPUT

INSERT INTO nyc_taxi_models (model_name, model) VALUES('SK_gra
dientboostregressor_2', @trained_model);