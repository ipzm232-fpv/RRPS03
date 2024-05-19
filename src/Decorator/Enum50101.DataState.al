enum 50101 DataState implements DataSource
{
    Extensible = true;

    value(0; Raw)
    {
        Caption = 'Raw';
        Implementation = DataSource = RawData;
    }
    value(1; Packed)
    {
        Caption = 'Packed';
        Implementation = DataSource = PackedData;
    }
    value(2; Encrypted)
    {
        Caption = 'Encrypted';
        Implementation = DataSource = EncryptedData;
    }
}
