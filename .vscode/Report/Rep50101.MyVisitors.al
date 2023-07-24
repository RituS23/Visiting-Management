report 50101 "My Visitors"
{
    ApplicationArea = All;
    Caption = 'My Visitors';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'My Visitor.RDL';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Employee; Employee)
        {
            column(No; "No.")
            {
            }
            column(FirstName; "First Name")
            {
            }

            column(LastName; "Last Name")
            {
            }
            dataitem(Visitor; Visitor)
            {
                DataItemLink = "visiting address" = field("No.");
                DataItemLinkReference = Employee;
                DataItemTableView = SORTING("Time In");
                column(checkIn; CheckIndate)
                {

                }

                column(ContactNo; "Contact No.")
                {
                }
                column(VisitorName; "First Name" + ' ' + "Last Name")
                {
                }

                column(VisitorAddress; "Visitor Address")
                {
                }
                column(VisitingAddress; "Visiting Address")
                {
                }
                column(VisitingPurpose; "Visiting Purpose")
                {
                }
                column(Status; Status)
                {
                }
                column(IDProofNo; "ID Proof No")
                {
                }
                column(IDProofType; "ID Proof Type")
                {
                }
                trigger OnAfterGetRecord()
                begin
                    CheckIndate := DT2Date("Time In");

                end;

            }

        }
    }
    requestpage
    {
        layout
        {
            area(content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(processing)
            {
            }
        }
    }
    var
        CheckIndate: Date;

}
