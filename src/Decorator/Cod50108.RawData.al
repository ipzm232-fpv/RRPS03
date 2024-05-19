codeunit 50108 RawData implements DataSource
{

    procedure WriteData(Data: Text)
    var
        SavedFile: Codeunit Singleton;
    begin
        //write data to file
        Message('Writing data: %1', Data);
        SavedFile.SaveDecoratorData(Data);
    end;

    procedure ReadData() Data: Text
    var
        SavedFile: Codeunit Singleton;
    begin
        //read data from file
        Data := SavedFile.GetDecoratorData();
        Message('Reading data: %1', Data);
    end;

}
