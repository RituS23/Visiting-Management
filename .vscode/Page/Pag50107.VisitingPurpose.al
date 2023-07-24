page 50107 "Visiting Purpose List"
{
    ApplicationArea = All;
    Caption = 'Visiting Purpose List';
    PageType = List;
    SourceTable = "Visiting Purpose";
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Purpose ID"; Rec."Purpose ID")
                {
                    ToolTip = 'Specifies the value of the Purpose ID field.';
                }
                field("Purpose Description"; Rec."Purpose Description")
                {
                    ToolTip = 'Specifies the value of the Purpose Description field.';
                }
            }
        }
    }
}
