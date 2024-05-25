page 50100 Setup
{
    ApplicationArea = All;
    Caption = 'RRPS03 Setup';
    UsageCategory = Administration;
    PageType = Card;
    SourceTable = "Product Setup";
    InsertAllowed = false;
    DeleteAllowed = false;

    layout
    {
        area(content)
        {
            group(AbstractFactory)
            {
                Caption = 'Abstract Factory';

                field("Product Type"; Rec."Product Type") { }
            }
            group(Decorator)
            {
                Caption = 'Decorator';

                field("Data"; Data) { }
                field("Data State"; DataState) { }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(CheckProductFabric)
            {
                ApplicationArea = All;
                Caption = 'Check Fabric';
                Promoted = true;
                PromotedCategory = Process;
                Image = Production;
                trigger OnAction()
                var
                    Consumer: Codeunit Consumer;
                    Choice: Integer;
                begin
                    Choice := StrMenu('Product1,Product2,Product3', 0, 'Choose Product Type');
                    Consumer.ConsumeProduct(Choice);
                end;
            }
            action(CheckProductAbstractFabric)
            {
                ApplicationArea = All;
                Caption = 'Check Abstract Fabric';
                Promoted = true;
                PromotedCategory = Process;
                Image = ProductDesign;
                trigger OnAction()
                var
                    Consumer: Codeunit ConsumerAbstract;
                begin
                    Consumer.ConsumeProduct(Rec);
                end;
            }
            action(CheckProductObserver)
            {
                ApplicationArea = All;
                Caption = 'Check Observer';
                Promoted = true;
                PromotedCategory = Process;
                Image = Signature;
                trigger OnAction()
                var
                    ProductObserver: Codeunit ProductObserver;
                    Choice: Integer;
                begin
                    Choice := StrMenu('Product1,Product2,Product3', 0, 'Choose Product Type');
                    ProductObserver.SetProduct(Choice);
                    ProductObserver.Run();
                end;
            }

            action(CheckSingleton)
            {
                ApplicationArea = All;
                Caption = 'Check Singleton';
                Promoted = true;
                PromotedCategory = Process;
                Image = Completed;
                trigger OnAction()
                var
                    SingletonRunner: Codeunit SingletonRunner;
                begin
                    SingletonRunner.Run();
                end;
            }
            action(CheckDecorator)
            {
                ApplicationArea = All;
                Caption = 'Check Decorator';
                Promoted = true;
                PromotedCategory = Process;
                Image = Completed;
                trigger OnAction()
                var
                    DataSource: Interface DataSource;
                begin
                    DataSource := DataState;
                    Message('Storing data: %1', Data);
                    DataSource.WriteData(Data);
                    Message('Restored data: %1', DataSource.ReadData());
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        if Rec.Get() then
            exit;
        Rec.Init();
        Rec.Insert();
    end;

    var
        DataState: Enum DataState;
        Data: Text;
}
