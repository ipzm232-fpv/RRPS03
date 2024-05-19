codeunit 50109 PackedData implements DataSource
{
    procedure WriteData(Data: Text)
    var
        PackedData: Text;
        DataSource: Interface DataSource;
    begin
        PackedData := Pack(Data);
        DataSource := Enum::DataState::Raw;
        DataSource.WriteData(PackedData);
    end;

    procedure ReadData() UnPackedData: Text
    var
        PackedData: Text;
        DataSource: Interface DataSource;
    begin
        DataSource := Enum::DataState::Raw;
        PackedData := DataSource.ReadData();
        UnPackedData := UnPack(PackedData);
        exit(UnPackedData);
    end;

    local procedure Pack(Data: Text) PackedData: Text
    begin
        PackedData := RunPacking(Data);
        Message('Packing data: %1 -> %2', Data, PackedData);
        exit(PackedData);
    end;

    local procedure UnPack(PackedData: Text) UnPackedData: Text
    begin
        UnPackedData := RunUnpacking(PackedData);
        Message('Unpacking data: %1 -> %2', PackedData, UnPackedData);
        exit(UnPackedData);
    end;

    local procedure RunPacking(Data: Text) PackedData: Text
    begin
        PackedData := Data + ',Packed';
    end;

    local procedure RunUnpacking(PackedData: Text) UnPackedData: Text
    begin
        UnPackedData := PackedData.Replace(',Packed', '');
    end;
}
