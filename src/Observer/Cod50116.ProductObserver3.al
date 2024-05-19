codeunit 50116 ProductObserver3
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ProductObserver, OnRunProduct, '', false, false)]
    local procedure ObserverProcessor_OnRunProcessor(sender: Codeunit ProductObserver)
    begin
        if sender.GetProduct() <> 3 then
            exit;
        RunImplement();
    end;

    local procedure RunImplement()
    begin
        Message('Product 3 (Observer)');
    end;
}
