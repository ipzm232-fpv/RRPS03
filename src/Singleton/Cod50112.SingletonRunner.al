codeunit 50112 SingletonRunner
{
    trigger OnRun()
    begin
        RunSuccess();
        RunFail(); //Singleton already consumed by RunSuccess process
    end;

    local procedure RunSuccess();
    var
        SingletonConsumer: codeunit SingletonConsumer;
    begin
        if SingletonConsumer.Run() then
            Message('Success')
        else
            Message('Fail: %1', GetLastErrorText());
    end;

    local procedure RunFail();
    var
        SingletonConsumer: codeunit SingletonConsumer;
    begin
        if SingletonConsumer.Run() then
            Message('Success')
        else
            Message('Fail: %1', GetLastErrorText());
    end;
}
