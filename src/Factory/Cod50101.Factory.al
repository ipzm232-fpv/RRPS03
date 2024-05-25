codeunit 50101 Factory
{

    procedure CreateProduct(Type: Option Option1,Option2,Option3): Boolean
    var
        Product1: Codeunit Product1;
        Product2: Codeunit Product2;
        Product3: Codeunit Product3;
        Product: Interface IProduct;
    begin
        case Type of
            Type::Option1:
                Product := Product1;
            Type::Option2:
                Product := Product2;
            Type::Option3:
                Product := Product3;
            else
                exit(false);
        end;
        Product.Use();
        exit(true);
    end;
}
