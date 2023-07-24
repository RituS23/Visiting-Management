table 50103 Floor
{
    Caption = 'Floor';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Floor List";
    LookupPageId = "Floor List";
    fields
    {
        field(1; "Floor ID"; Code[10])
        {
            Caption = 'Floor ID';
        }
        field(2; "Floor Description"; text[10])
        {
            Caption = 'Floor Description';
        }
    }
    keys
    {
        key(PK; "Floor ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Floor ID")
        {
        }

    }
}
