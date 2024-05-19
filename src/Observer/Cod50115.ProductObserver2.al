codeunit 50115 ProductObserver2
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::ProductObserver, OnRunProduct, '', false, false)]
    local procedure ObserverProcessor_OnRunProcessor(sender: Codeunit ProductObserver)
    begin
        if sender.GetProduct() <> 2 then
            exit;
        RunImplement();
    end;

    local procedure RunImplement()
    begin
        Message('Product 2 (Observer)');
    end;
}
