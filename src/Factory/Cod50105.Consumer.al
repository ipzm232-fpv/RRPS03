codeunit 50105 Consumer
{
    procedure ConsumeProduct(ProductType: Enum "Product Type")
    var
        Product: Interface IProduct;
        Factory: Codeunit Factory;
    begin
        Product := ProductType;
        if Factory.CreateProduct(Product) then
            Product.Use()
        else
            Error('Not supported product type');
    end;
}
