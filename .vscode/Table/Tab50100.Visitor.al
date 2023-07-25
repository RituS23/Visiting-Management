table 50100 "Visitor"
{
    Caption = 'Visitor';
    DataClassification = ToBeClassified;
    DataCaptionFields = "Entry No.", "First Name", "Last Name", "Contact No.";
    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No';
        }
        field(2; "Contact No."; Text[20])
        {
            Caption = 'Contact No.';
        }
        field(3; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(4; "Last Name"; text[30])
        {
            Caption = 'Last Name';
        }
        field(5; "Visitor Address"; text[60])
        {
            Caption = 'Visitor Address';

        }
        field(6; "Visiting Address"; Text[60])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            trigger OnValidate()
            begin
                TestField(Status, Status::Initiate);
            end;
        }
        field(7; "Time In"; DateTime)
        {
            Caption = 'Time In';
            Editable = false;
        }
        field(8; "Time Out"; DateTime)

        {
            Caption = 'Time Out';
            Editable = false;
        }
        field(9; "Status"; Enum Satus)
        {
            Caption = 'Status';
            Editable = false;
        }
        field(10; "FlatNo."; Code[20])
        {
            Caption = 'Flat No.';
            TableRelation = Employee;
            DataClassification = ToBeClassified;
        }
        field(11; "Visiting Purpose"; Text[50])
        {
            Caption = 'Visiting Purpose';
            TableRelation = "Visiting Purpose";
            DataClassification = ToBeClassified;
        }
        field(12; "Select for approval"; Boolean)
        {
            Caption = 'Select';
            DataClassification = ToBeClassified;
        }
        field(13; "ID Proof Type"; Enum IdProofs)
        {
            DataClassification = ToBeClassified;
        }
        field(14; "ID Proof No"; code[30])
        {
            Caption = 'ID Proof No.';
            DataClassification = ToBeClassified;
        }
        field(15; "ApprovedReject By"; Code[70])
        {
            Caption = 'Approved Rejected By';
            DataClassification = ToBeClassified;

        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(SK; "Time In")
        { }
    }
    trigger OnInsert()

    begin
        Validate("Entry No.", GetLastNo());
        "Time In" := CurrentDateTime;
    end;

    local procedure GetLastNo(): Integer
    var
        Vstr: Record Visitor;
    begin
        IF Vstr.FindLast then
            exit(Vstr."Entry No." + 1)
        else
            exit(1);
    end;

    procedure ApproveRejectEntry(var FlatNo: code[20]; var Approve: boolean; var Reject: boolean)
    var
        visitor: Record Visitor;
    begin
        visitor.SetFilter("FlatNo.", '%1', FlatNo);
        visitor.SetRange("Select for approval", true);
        if visitor.FindSet then begin
            repeat
                IF (Approve = true) AND (Reject = false) then
                    visitor.Validate(Status, Status::Approve);
                if Reject = true then begin
                    visitor.Validate(Status, Status::Reject);
                    visitor.Validate("Time Out", CurrentDateTime);
                end;
                visitor.Validate("Select for approval", false);
                visitor.Validate("ApprovedReject By", UserId);
                visitor.Modify;
            until visitor.Next = 0;
        end;
    end;

    procedure ValidateMandates()
    begin
        rec.TestField("Time out", 0DT);
        rec.TestField("Contact No.");
        Rec.TestField("First Name");
        rec.TestField("Visitor Address");
        Rec.TestField("Visiting Address");
        rec.TestField("Visiting Purpose");
        rec.TestField("ID Proof Type");
        rec.TestField("ID Proof No");
    end;

    procedure SendRequest()
    begin
        ValidateMandates;
        rec.TestField(Status, Rec.Status::Initiate);
        rec.Validate(Status, Rec.Status::"Pending for Approval");
        Message('%1 Request has been sent for the approval, please wait.', Rec."First Name");
    end;

    procedure Logout()
    var
        textConst1001: TextConst ENU = 'Thanks for visiting %1 ji!';
        textCons1002: TextConst ENU = 'Already Logout!';
    begin
        IF Rec."Time Out" = 0DT then begin
            Rec.Validate("Time Out", CurrentDateTime);
            Message(textConst1001, Rec."First Name");
        end else
            Error(textCons1002);
    end;
}
