page 50103 "Block list"
{
    ApplicationArea = All;
    Caption = 'blocks';
    PageType = List;
    SourceTable = Block;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Block ID"; Rec."Block ID")
                {
                    ToolTip = 'Specifies the value of the Block ID field.';
                }
                field("Block Description"; Rec."Block Description")
                {
                    ToolTip = 'Specifies the value of the Block Description field.';
                }
            }
        }
    }
}
