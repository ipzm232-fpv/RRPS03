codeunit 50107 SingletonConsumer
{
    var
        Singleton: codeunit Singleton;
        Inst: Guid;

    trigger OnRun()
    begin
        Inst := CreateGuid();
        InitSingleton(Inst);
    end;

    local procedure InitSingleton(Inst: Guid)
    begin
        Singleton.SetInstance(Inst);
    end;

    procedure SetupSingleton()
    var
        Data: Dictionary of [Text, Text];
    begin
        Data.Add('A', 'A');
        Data.Add('B', 'B');
        Singleton.SetData(Inst, Data);
        Singleton.SetProcess(Inst, 1);
    end;

    procedure UseSingleton()
    begin
        Singleton.DoJob(Inst);
    end;

    procedure ConsumeSingleton()
    var
        Data: Dictionary of [Text, Text];
    begin
        Data := Singleton.GetData(Inst);
    end;
}
