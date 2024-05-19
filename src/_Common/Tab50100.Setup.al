table 50100 "Product Setup"
{
    Caption = 'Product Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; PK; Code[10])
        {
            Caption = 'PK';
        }
        field(2; "Product Type"; Enum "Product Type")
        {
            Caption = 'Product Type';
        }
    }
    keys
    {
        key(PK; PK)
        {
            Clustered = true;
        }
    }
}
