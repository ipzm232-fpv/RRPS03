codeunit 50110 EncryptedData implements DataSource
{

    procedure WriteData(Data: Text)
    var
        EncryptedData: Text;
        DataSource: Interface DataSource;
    begin
        EncryptedData := Encrypt(Data);
        DataSource := Enum::DataState::Packed;
        DataSource.WriteData(EncryptedData);
    end;

    procedure ReadData() DecryptedData: Text
    var
        UnPackedData: Text;
        DataSource: Interface DataSource;
    begin
        DataSource := Enum::DataState::Packed;
        UnPackedData := DataSource.ReadData();
        DecryptedData := Decrypt(UnPackedData);
        exit(DecryptedData);
    end;

    local procedure Encrypt(Data: Text) EncryptedData: Text
    begin
        EncryptedData := RunEncryption(Data);
        Message('Encrypting data: %1 -> %2', Data, EncryptedData);
        exit(EncryptedData);
    end;

    local procedure Decrypt(EncryptedData: Text) DecryptedData: Text
    begin
        DecryptedData := RunDecryption(EncryptedData);
        Message('Decrypting data: %1 -> %2', EncryptedData, DecryptedData);
        exit(DecryptedData);
    end;

    local procedure RunEncryption(Data: Text) EncryptedData: Text
    begin
        EncryptedData := Data + ',Encrypted';
    end;

    local procedure RunDecryption(EncryptedData: Text) DecryptedData: Text
    begin
        DecryptedData := EncryptedData.Replace(',Encrypted', '');
    end;
}
