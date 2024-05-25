codeunit 50105 Consumer
{
    procedure ConsumeProduct(ProductType: Option)
    var
        Factory: Codeunit Factory;
    begin
        if not Factory.CreateProduct(ProductType) then
            Error('Not supported product type');
    end;
}
