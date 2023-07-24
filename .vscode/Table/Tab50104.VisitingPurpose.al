table 50104 "Visiting Purpose"
{
    Caption = 'Visiting Purpose';
    DataClassification = ToBeClassified;
    LookupPageId = 50107;
    fields
    {
        field(1; "Purpose ID"; Code[20])
        {
            Caption = 'Purpose ID';
        }
        field(2; "Purpose Description"; Text[60])
        {
            Caption = 'Purpose Description';
        }
    }
    keys
    {
        key(PK; "Purpose ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "purpose ID", "purpose Description")
        {
        }

    }
}
