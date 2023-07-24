report 50100 VisitorDetail
{
    ApplicationArea = All;
    Caption = 'VisitorDetail';
    UsageCategory = ReportsAndAnalysis;
    RDLCLayout = 'Visitor Detail.RDL';
    DefaultLayout = RDLC;
    dataset
    {
        dataitem(Visitor; Visitor)
        {
            column(checkIn; "Time In")
            { }

            column(ContactNo; "Contact No.")
            {
            }
            column(FirstName; "First Name")
            {
            }
            column(LastName; "Last Name")
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
}
