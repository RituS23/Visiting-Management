page 50101 "Visitor Card"
{
    ApplicationArea = All;
    //UsageCategory =Administration;
    // ApplicationArea = Basic, Suite, Service;
    Caption = 'Visitor Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = Visitor;
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                    ShowMandatory = true;

                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                    ShowMandatory = true;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("visitor Address"; Rec."Visitor Address")
                {
                    ToolTip = 'Specifies the value of the From Address field.';
                    ShowMandatory = true;
                }
                field("To Address"; Rec."Visiting Address")
                {
                    ToolTip = 'Specifies the value of the To Address field.';
                    ShowMandatory = true;
                }
                field("Time In"; Rec."Time In")
                {
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ToolTip = 'Specifies the value of the Time Out field.';
                }

                field("Visiting Purpose"; rec."Visiting Purpose")
                {
                    ToolTip = 'Specifies the value of the purpose field.';
                    ShowMandatory = true;
                }
                field("ID Proof Type"; Rec."ID Proof Type")
                {
                }
                field("ID Proof No"; Rec."ID Proof No")
                {
                    ShowMandatory = true;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            // action("Logout")
            // {
            //     ApplicationArea = Comments;
            //     Caption = 'Check Out';
            //     Image = StepOut;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     trigger OnAction()
            //     begin
            //         Logout();
            //     end;

            // }


            action("Send_Request")
            {
                ApplicationArea = Comments;
                Caption = 'Send Request';
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    rec.SendRequest;
                end;

            }
            action("Force_Approve")
            {
                ApplicationArea = Comments;
                Caption = 'Force Approve';
                Image = Approval;
                Promoted = true;
                PromotedCategory = Process;
                trigger OnAction()
                begin
                    Rec.ValidateMandates();
                    rec.Validate(Status, Rec.Status::Approve);
                    rec.Validate("ApprovedReject By", UserId);
                end;
            }
        }
    }
}

