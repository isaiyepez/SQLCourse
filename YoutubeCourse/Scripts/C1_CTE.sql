-- Explanation for this: https://1drv.ms/p/s!AlsWXYcA5DNNkvwoEVDxXYFV51vMEg?e=LaoFVv

WITH SalesWithReason (SalesOrderNumber, SalesOrderLineNumber, SalesReasonName) 
AS 
(
	SELECT 
		 websales.SalesOrderNumber
		,websales.SalesOrderLineNumber		
		,reason.SalesReasonName 
	FROM 
		FactInternetSales AS webSales
	LEFT JOIN 
		FactInternetSalesReason AS webSalesReason 
			ON webSales.SalesOrderNumber = webSalesReason.SalesOrderNumber
			AND webSales.SalesOrderLineNumber = webSalesReason.SalesOrderLineNumber
	JOIN DimSalesReason AS reason 
		ON webSalesReason.SalesReasonKey = reason.SalesReasonKey	
	GROUP BY 
		 websales.SalesOrderNumber
		,websales.SalesOrderLineNumber
		,reason.SalesReasonName
)

SELECT * FROM SalesWithReason;

--SELECT * FROM SalesWithReason WHERE SalesOrderNumber = 'SO43697'
