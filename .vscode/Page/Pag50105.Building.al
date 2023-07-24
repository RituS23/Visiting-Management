page 50105 "Building List"
{
    ApplicationArea = All;
    Caption = 'Building';
    PageType = List;
    SourceTable = Building;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Building ID"; Rec."Building ID")
                {
                    ToolTip = 'Specifies the value of the Building ID field.';
                }
                field("Building Description"; Rec."Building Description")
                {
                    ToolTip = 'Specifies the value of the Building Description field.';
                }
            }
        }
    }
}
