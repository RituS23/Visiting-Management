page 50104 "Floor List"
{
    ApplicationArea = All;
    Caption = 'Floors';
    PageType = List;
    SourceTable = floor;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Floor ID"; Rec."Floor ID")
                {
                    ToolTip = 'Specifies the value of the Floor ID field.';
                }
                field("Floor Description"; Rec."Floor Description")
                {
                    ToolTip = 'Specifies the value of the Floor Description field.';
                }
            }
        }
    }
}
