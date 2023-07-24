pageextension 50101 EmployeeCardExtension extends "Employee Card"
{
    layout
    {
        addafter(General)

        {

            group("Flat Details")
            {
                Caption = 'Flat Details';
                field(Location; Rec.Location)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Block ID"; Rec."Block ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Block ID field.';
                }
                field("Building No."; Rec."Building No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Building No. field.';
                }
                field("Floor No."; Rec."Floor No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Floor No. field.';
                }

                field("First Owner"; Rec."First Owner")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the First Owner field.';
                }
                field("Second Owner"; Rec."Second Owner")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Second Owner field.';
                }

                field("No. of Family Member"; Rec."No. of Family Member")
                {
                    ApplicationArea = all;
                }
                field("No. of Kids "; Rec."No. of Kids ")
                {
                    ApplicationArea = all;

                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the UserID';

                }


            }
        }
        // }
    }

    var
        myInt: Integer;
}

