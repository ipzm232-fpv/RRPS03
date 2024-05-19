codeunit 50106 AbstractFactory
{
    procedure CreateProduct(var Product: Interface IProduct): Boolean
    var
        Setup: Record "Product Setup";
    begin
        if not Setup.Get() then
            exit(false);

        Product := Setup."Product Type";
        exit(true);
    end;
}
