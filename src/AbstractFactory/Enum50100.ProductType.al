enum 50100 "Product Type" implements IProduct
{
    Extensible = true;

    value(1; Product1)
    {
        Caption = 'Product1';
        Implementation = IProduct = Product1;
    }
    value(2; Product2)
    {
        Caption = 'Product2';
        Implementation = IProduct = Product2;
    }
    value(3; Product3)
    {
        Caption = 'Product3';
        Implementation = IProduct = Product3;
    }
}
