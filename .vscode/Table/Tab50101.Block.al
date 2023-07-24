table 50101 Block
{
    Caption = 'Block';
    DataClassification = ToBeClassified;
    LookupPageId = 50103;
    DataCaptionFields = "block ID", "Block Description";
    DrillDownPageID = 50103;

    fields
    {
        field(1; "Block ID"; Code[10])
        {
            Caption = 'Block ID';
        }
        field(2; "Block Description"; Text[10])
        {
            Caption = 'Block Description';
        }
    }
    keys
    {
        key(PK; "Block ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Block ID", "Block Description")
        {
        }

    }

}
