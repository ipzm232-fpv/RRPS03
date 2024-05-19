codeunit 50114 ProductObserver1
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ProductObserver, OnRunProduct, '', false, false)]
    local procedure ObserverProcessor_OnRunProcessor(sender: Codeunit ProductObserver)
    begin
        if sender.GetProduct() <> 1 then
            exit;
        RunImplement();
    end;

    local procedure RunImplement()
    begin
        Message('Product 1 (Observer)');
    end;
}
