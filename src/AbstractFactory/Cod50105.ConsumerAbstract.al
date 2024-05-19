codeunit 50111 ConsumerAbstract
{
    procedure ConsumeProduct(Setup: Record "Product Setup")
    var
        Product: Interface IProduct;
        Factory: Codeunit AbstractFactory;
    begin
        Product := Setup."Product Type";
        if Factory.CreateProduct(Product) then
            Product.Use()
        else
            Error('Not supported product type');
    end;
}
