tableextension 50100 ExtEmployee extends Employee
{
    fields
    {
        field(50100; Location; Code[20])
        {
            Caption = 'Location';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(50101; "Block ID"; Code[10])
        {
            Caption = 'Block ID';
            DataClassification = ToBeClassified;
            TableRelation = Block;
        }
        field(50102; "Building No."; Code[10])
        {
            Caption = 'Building No.';
            DataClassification = ToBeClassified;
            TableRelation = Building;
        }
        field(50103; "Floor No."; Code[10])
        {
            Caption = 'Floor No.';
            DataClassification = ToBeClassified;
            TableRelation = Floor;
        }
        field(50104; "First Owner"; Code[20])
        {
            Caption = 'First Owner';
            DataClassification = ToBeClassified;
        }
        field(50105; "Second Owner"; Code[20])
        {
            Caption = 'Second Owner';
            DataClassification = ToBeClassified;
        }
        field(50106; "Second Owner Contact No."; Text[20])
        {
            Caption = 'Second Owner Contact No.';
            DataClassification = ToBeClassified;
        }
        field(50107; "No. of Family Member"; Integer)
        {
            Caption = 'No. of Family Member';
            DataClassification = ToBeClassified;
        }
        field(50108; "No. of Kids "; Integer)
        {
            Caption = 'No. of Kids ';
            DataClassification = ToBeClassified;
        }
        field(50109; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = "User Setup";
            DataClassification = ToBeClassified;

        }
    }
}
