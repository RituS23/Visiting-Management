page 50100 "Visitor List"
{
    ApplicationArea = All;
    // ApplicationArea = Basic, Suite, Service;
    Caption = 'Visitors';
    CardPageId = 50101;
    Editable = false;
    PageType = List;
    SourceTable = visitor;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No field.';
                    Visible = false;
                }
                // field(Select; Rec.Select)
                // { }
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Visitor Address"; Rec."Visitor Address")
                {
                    ToolTip = 'Specifies the value of the From Address field.';
                }
                field("Visiting Purpose"; Rec."Visiting Purpose")
                {

                }
                field("To Address"; Rec."Visiting Address")
                {
                    ToolTip = 'Specifies the value of the To Address field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ToolTip = 'Specifies the value of the Time Out field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    Editable = false;
                }
            }
        }
    }
}