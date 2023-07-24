page 50106 "Approval Entry"
{
    ApplicationArea = All;
    Caption = 'Approval Entry';
    PageType = List;
    SourceTable = Visitor;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Name; Rec."First Name" + ' ' + rec."Last Name")
                {
                    Editable = false;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                    Editable = false;
                }
                field("Visitor Address"; Rec."Visitor Address")
                {
                    ToolTip = 'Specifies the value of the From Address field.';
                    Editable = false;
                }
                field("Visiting Purpose"; Rec."Visiting Purpose")
                {
                    ToolTip = 'Specifies the value of the Visiting Purpose field.';
                    Editable = false;
                }
                field("Time In"; Rec."Time In")
                {
                    ToolTip = 'Specifies the value of the Time In field.';
                    Editable = false;
                }

                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
                field(Select; Rec."Select for approval")
                {
                    ToolTip = 'Specifies the value for Approve/Reject';
                }
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action("Approve")
            {
                ApplicationArea = Comments;
                Caption = 'Approve';
                Image = Approve;
                trigger OnAction()
                var
                    Approved: Boolean;
                    Rejected: Boolean;
                begin
                    Approved := true;
                    Rec.ApproveRejectEntry(Rec."FlatNo.", Approved, Rejected)
                end;
            }
            action("Reject")
            {
                ApplicationArea = Comments;
                Caption = 'Reject';
                Image = Reject;
                trigger OnAction()
                var
                    Approved: Boolean;
                    Rejected: Boolean;
                begin
                    Rejected := true;
                    Rec.ApproveRejectEntry(Rec."FlatNo.", Approved, Rejected)
                end;
            }
        }
    }
}