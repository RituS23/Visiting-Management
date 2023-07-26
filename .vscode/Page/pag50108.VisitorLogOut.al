page 50108 "Visitor Check Out"
{
    ApplicationArea = All;
    UsageCategory = Administration;
    // ApplicationArea = Basic, Suite, Service;
    Caption = 'Visitor Check Out';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Visitor;
    SourceTableTemporary = true;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Visitor Contact"; VisitorPh)
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        FatchData(visitorph);
                    end;


                }

                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                    ShowMandatory = true;
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                    Editable = false;
                }
                field("visitor Address"; Rec."Visitor Address")
                {
                    ToolTip = 'Specifies the value of the From Address field.';
                    Editable = false;
                }
                field("To Address"; Rec."Visiting Address")
                {
                    ToolTip = 'Specifies the value of the To Address field.';
                    Editable = false;
                }
                field("Time In"; Rec."Time In")
                {
                    ToolTip = 'Specifies the value of the Time In field.';
                    Editable = false;
                }
                field("Time Out"; Rec."Time Out")
                {
                    ToolTip = 'Specifies the value of the Time Out field.';
                    Editable = false;
                }

                field("Visiting Purpose"; rec."Visiting Purpose")
                {
                    ToolTip = 'Specifies the value of the purpose field.';
                    Editable = false;
                }
                field("ID Proof Type"; Rec."ID Proof Type")
                {
                    Editable = false;
                }
                field("ID Proof No"; Rec."ID Proof No")
                {
                    ShowMandatory = true;
                }
                field(MatchID; Rec.MatchID)
                {
                    ShowMandatory = true;
                    Editable = true;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("CheckOut")
            {
                ApplicationArea = Comments;
                Caption = 'Check Out';
                Image = StepOut;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.TestField(MatchID);
                    Rec.Logout();
                    rec.Validate(rec."Time Out", CurrentDateTime);

                end;

            }
        }
    }
    var
        VisitorPh: Text[50];

    procedure FatchData(var VisitorPh: text[50])
    var
        recvisitor: Record Visitor;
    begin
        recvisitor.SetRange("Contact No.", VisitorPh);
        IF recvisitor.FindLast() then begin
            rec.TransferFields(recvisitor, true);
            rec.Insert();
        end
    end;

}
