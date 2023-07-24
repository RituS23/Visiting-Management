table 50102 Building
{
    Caption = 'Building';
    DataClassification = ToBeClassified;
    DrillDownPageId = "Building List";
    LookupPageId = "Building List";

    fields
    {
        field(1; "Building ID"; Code[10])
        {
            Caption = 'Building ID';
        }
        field(2; "Building Description"; Text[20])
        {
            Caption = 'Building Description';
        }
    }
    keys
    {
        key(PK; "Building ID")
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; "Building ID", "Building Description")
        {
        }

    }
}
