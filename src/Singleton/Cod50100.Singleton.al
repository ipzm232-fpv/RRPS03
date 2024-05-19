codeunit 50100 Singleton
{
    SingleInstance = true;

    var
        GlobalInstance: Guid;
        Data: Dictionary of [Text, Text];
        Result: Dictionary of [Text, Text];
        ConvertProcess: Integer;
        DecoratorData: Text;

    procedure SetInstance(NewInstance: Guid)
    begin
        if IsNullGuid(GlobalInstance) then
            GlobalInstance := NewInstance
        else
            Error('Singleton already consumed by another process');
    end;

    procedure SetProcess(Instance: Guid; Process: Integer)
    begin
        if Instance <> GlobalInstance then
            exit;
        ConvertProcess := Process;
    end;

    procedure SetData(Instance: Guid; NewData: Dictionary of [Text, Text])
    begin
        if Instance <> GlobalInstance then
            exit;
        Data := NewData;
    end;

    procedure GetData(Instance: Guid): Dictionary of [Text, Text]
    begin
        if Instance <> GlobalInstance then
            exit;
        exit(Result);
    end;

    procedure DoJob(Instance: Guid)
    var
        K: Text;
        V: Text;
    begin
        if Instance <> GlobalInstance then
            exit;
        // Do something with Data
        case ConvertProcess of
            0:
                Result := Data;
            1:
                foreach K in Data.Keys do begin
                    V := Result.Get(K);
                    Result.Set(K, V + '1');
                end;
            else
        end;
    end;

    procedure SaveDecoratorData(FileData: Text)
    begin
        DecoratorData := FileData;
    end;

    procedure GetDecoratorData(): Text
    begin
        exit(DecoratorData);
    end;
}
