Create PROCEDURE getProductSellPrice
(
@product_number INT,                       --Input parameter
@sellprice FLOAT OUT        -- Out parameter declared with the help of OUT keyword
)
BEGIN
SELECT @sellprice=(production_cost + margin) FROM Product WHERE product_number=@product_number
END


Create PROCEDURE getTotalOrderPrice
{
@order_id INT,
@totalprice FLOAT OUT
}
WHILE EXISTS (SELECT quantity, product_number FROM Order_item JOIN Product ON Product.product_number = Order_item.product_id WHERE order_id=@order_id)
BEGIN
	@totalprice += ((EXEC getProductSellPrice product_number)*quantity)
END