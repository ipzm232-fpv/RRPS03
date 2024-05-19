codeunit 50113 ProductObserver
{
    var
        Product: Integer;

    trigger OnRun()
    begin
        OnRunProduct();
    end;

    procedure SetProduct(Value: Integer)
    begin
        Product := Value;
    end;

    procedure GetProduct(): Integer
    begin
        exit(Product);
    end;

    [IntegrationEvent(true, false)]
    local procedure OnRunProduct()
    begin
    end;
}
