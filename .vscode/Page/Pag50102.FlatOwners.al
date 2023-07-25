page 50102 "Flat Owner List"
{
    ApplicationArea = All;
    Caption = 'Flat Owners';
    PageType = List;
    SourceTable = employee;
    UsageCategory = Lists;
    CardPageId = "Employee Card";
    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Caption = 'Flat No.';
                }
                field("First Name"; Rec."First Name")
                {
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field(Location; Rec.Location)
                {
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Block ID"; Rec."Block ID")
                {
                    ToolTip = 'Specifies the value of the Block ID field.';
                }
                field("Building No."; Rec."Building No.")
                {
                    ToolTip = 'Specifies the value of the Building No. field.';
                }
                field("Floor No."; Rec."Floor No.")
                {
                    ToolTip = 'Specifies the value of the Floor No. field.';
                }

                field("First Owner"; Rec."First Owner")
                {
                    ToolTip = 'Specifies the value of the First Owner field.';
                }
                field("Second Owner"; Rec."Second Owner")
                {
                    ToolTip = 'Specifies the value of the Second Owner field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ToolTip = 'Specifies the value of the UserID';

                }

            }
        }
        area(factboxes)
        {
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = CONST(Database::Employee),
                              "No." = FIELD("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }

        }
    }
    actions
    {
        area(Processing)
        {
            action("VisitorList")
            {
                ApplicationArea = Comments;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'Approval Request';
                Image = SendApprovalRequest;
                RunObject = page "Approval Entry";
                RunPageLink = "Visiting Address" = field("No."), Status = const("Pending for Approval");
            }
            action(MyVisitor)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Caption = 'My Visitors';
                Image = ViewDetails;

                trigger OnAction()
                var
                    visitor: Record Visitor;
                    PgVisitors: Page "Visitor List";

                begin

                    visitor.FilterGroup(1);
                    //visitor.SetCurrentKey("FlatNo.");

                    visitor.SetCurrentKey("Time In");
                    visitor.SetAscending("Time In", false);
                    visitor.SetRange("Visiting Address", Rec."No.");
                    Page.Run(Page::"Visitor List", visitor);
                    visitor.FilterGroup(0);
                end;
            }
        }
        area(Reporting)
        {
            action("My Visitor Detail")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'My Visitor Detail';
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;

                trigger OnAction()
                begin
                    Employee.SetRange(Employee."User ID", UserId);
                    Report.RunModal(Report::"My Visitors", true, true, Employee);
                end;

            }
        }
    }
    trigger OnOpenPage()
    var
    begin
        Rec.SetFilter("User ID", UserId);
    end;

    var
        Employee: Record Employee;
}