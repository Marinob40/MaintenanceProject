<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AdvancedProgrammingProject1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project 1: Assignment Maintenance</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <main class="row">
        <form id="form1" runat="server" class="form-horizontal">

            <div class="col-xs-12 table-responsive">
                <div class="text-center">
                    <h1>Assignment Maintenance</h1>
                </div>
                &nbsp;
                <div class="text-center">
                    <asp:DropDownList ID="ddlEmployees" runat="server" CssClass="ddl" 
                        DataSourceID="SqlDataSource2" DataTextField="EmployeeName" 
                        DataValueField="EmployeeID" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:AssignmentsConnection1 %>
                        " SelectCommand="SELECT  [EmployeeID], [EmployeeFirstName]+ ' ' +[EmployeeLastName]
                        as EmployeeName FROM [Employees]"></asp:SqlDataSource>
                </div>
                &nbsp;
                    <asp:GridView ID="grdAssignments" runat="server"
                        AutoGenerateColumns="False" DataSourceID="SqlDataSource1" 
                        OnRowDeleted="grdAssignments_RowDeleted" OnRowUpdated="grdAssignments_RowUpdated">
                        <Columns>
                            <asp:BoundField DataField="AssignmentID" HeaderText="AssignmentID" 
                                ReadOnly="True">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="DateAssigned" HeaderText="DateAssigned" 
                                SortExpression="DateAssigned">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OwnerFirstName" HeaderText="OwnerFirstName" 
                                SortExpression="OwnerFirstName">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="OwnerLastName" HeaderText="OwnerLastName" 
                                SortExpression="OwnerLastName">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Phone" HeaderText="Phone" 
                                SortExpression="Phone">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Address" HeaderText="Address" 
                                SortExpression="Address">
                                <ItemStyle CssClass="col-xs-2" />
                            </asp:BoundField>
                            <asp:BoundField DataField="ProblemDescription" HeaderText="ProblemDescription" 
                                SortExpression="ProblemDescription">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Completed" HeaderText="Completed" 
                                SortExpression="Completed">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                                SortExpression="EmployeeID">
                                <ItemStyle CssClass="col-xs-1" />
                            </asp:BoundField>
                            <asp:CommandField CausesValidation="False" ShowEditButton="True">
                                <ItemStyle CssClass="col-xs-1 text-danger" />
                            </asp:CommandField>
                            <asp:CommandField CausesValidation="False" ShowDeleteButton="True">
                                <ItemStyle CssClass="col-xs-1" /> 
                            </asp:CommandField>
                        </Columns>
                        <HeaderStyle CssClass="bg-assignments" />
                        <AlternatingRowStyle CssClass="altRow" />
                        <EditRowStyle CssClass="warning" />
                    </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:AssignmentsConnection1 %>"
                    OldValuesParameterFormatString="original_{0}" 
                     ConflictDetection="CompareAllValues"
                    SelectCommand="SELECT [AssignmentID], [DateAssigned], [OwnerFirstName], [OwnerLastName], [Phone], 
                        [Address], [ProblemDescription], [Completed], [EmployeeID] FROM [Assignments] WHERE [EmployeeID] = @EmployeeID" 

                    InsertCommand="INSERT INTO [Assignments]
                            ([DateAssigned], [OwnerFirstName], [OwnerLastName], 
                            [Address], [Phone], [ProblemDescription], [Completed], [EmployeeID]) 
                         VALUES (@DateAssigned, @OwnerFirstName, @OwnerLastName, @Address, @Phone, 
                            @ProblemDescription, @Completed, @EmployeeID)" 
                    UpdateCommand="UPDATE [Assignments] 
                        SET [DateAssigned] = @DateAssigned, 
                            [OwnerFirstName] = @OwnerFirstName, 
                            [OwnerLastName] = @OwnerLastName, 
                            [Address] = @Address, 
                            [Phone] = @Phone, 
                            [ProblemDescription] = @ProblemDescription, 
                            [Completed] = @Completed, 
                            [EmployeeID] = @EmployeeID 
                        WHERE [AssignmentID] = @original_AssignmentID
                            AND [DateAssigned] = @original_DateAssigned 
                            AND [OwnerFirstName] = @original_OwnerFirstName
                            AND [OwnerLastName] = @original_OwnerLastName 
                            AND [Address] = @original_Address
                            AND [Phone] = @original_Phone
                            AND [ProblemDescription] = @original_ProblemDescription
                            AND [Completed] = @original_Completed
                            AND [EmployeeID] = @original_EmployeeID" 
                    DeleteCommand="DELETE FROM [Assignments] 
                        WHERE [AssignmentID] = @original_AssignmentID
                            AND [DateAssigned] = @original_DateAssigned 
                            AND [OwnerFirstName] = @original_OwnerFirstName
                            AND [OwnerLastName] = @original_OwnerLastName 
                            AND [Address] = @original_Address 
                            AND [Phone] = @original_Phone 
                            AND [ProblemDescription] = @original_ProblemDescription 
                            AND [Completed] = @original_Completed 
                            AND [EmployeeID] = @original_EmployeeID"> 
                    <DeleteParameters>
                        <asp:Parameter Name="original_AssignmentID" Type="Int64" />
                        <asp:Parameter Name="original_DateAssigned" Type="String" />
                        <asp:Parameter Name="original_OwnerFirstName" Type="String" />
                        <asp:Parameter Name="original_OwnerLastName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String" />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_ProblemDescription" Type="String" />
                        <asp:Parameter Name="original_Completed" Type="String" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int64" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DateAssigned" Type="DateTime" />
                        <asp:Parameter Name="OwnerFirstName" Type="String" />
                        <asp:Parameter Name="OwnerLastName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="ProblemDescription" Type="String" />
                        <asp:Parameter Name="Completed" Type="String" />
                        <asp:Parameter Name="EmployeeID" Type="Int64" />
                    </InsertParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlEmployees" Name="EmployeeID" 
                            PropertyName="SelectedValue" Type="Int64" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DateAssigned" Type="DateTime" />
                        <asp:Parameter Name="OwnerFirstName" Type="String" />
                        <asp:Parameter Name="OwnerLastName" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="ProblemDescription" Type="String" />
                        <asp:Parameter Name="Completed" Type="String" />
                        <asp:Parameter Name="EmployeeID" Type="Int64" />
                        <asp:Parameter Name="original_AssignmentID" Type="String" />
                        <asp:Parameter Name="original_DateAssigned" Type="DateTime" />
                        <asp:Parameter Name="original_OwnerFirstName" Type="String"  />
                        <asp:Parameter Name="original_OwnerLastName" Type="String" />
                        <asp:Parameter Name="original_Address" Type="String"  />
                        <asp:Parameter Name="original_Phone" Type="String" />
                        <asp:Parameter Name="original_ProblemDescription" Type="String" />
                        <asp:Parameter Name="original_Completed" Type="String" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int64" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                </div>
                &nbsp;
                &nbsp;

                <div class="col-xs-12">
                    <p>To add a new assignment, enter the assignment 
                        information and click "Add New Assignment"</p>
                    <p><asp:Label ID="lblError" runat="server" EnableViewState="false"
                         CssClass="text-danger"></asp:Label></p>
                &nbsp;
                &nbsp;

                    <div class="form-group">
                        <label for="txtDateAssigned" class="col-sm-2">DateAssigned</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtDateAssigned" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-3 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvDateAssigned" runat="server" 
                                ErrorMessage="DateAssigned is a required field." ControlToValidate="txtDateAssigned" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtOwnerFirstName" class="col-sm-2">OwnerFirstName</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtOwnerFirstName" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-3 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvOwnerFirstName" runat="server" 
                                ErrorMessage="OwnerFirstName is a required field." ControlToValidate="txtOwnerFirstName" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtOwnerLastName" class="col-sm-2">OwnerLastName</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtOwnerLastName" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-3 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvOwnerLastName" runat="server" 
                                ErrorMessage="OwnerLastName is a required field." ControlToValidate="txtOwnerLastName" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtAddress" class="col-sm-2">Address</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtAddress" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-2 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                                ErrorMessage="Address is a required field." ControlToValidate="txtAddress" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtPhone" class="col-sm-2">Phone</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtPhone" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-3 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                ErrorMessage="Phone is a required field." ControlToValidate="txtPhone" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtProblemDescription" class="col-sm-2">ProblemDescription</label>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtProblemDescription" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-2 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvProblemDescripton" runat="server" 
                                ErrorMessage="ProblemDescription is a required field." ControlToValidate="txtProblemDescription" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtCompleted" class="col-sm-2">Completed</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtCompleted" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-3 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvCompleted" runat="server" 
                                ErrorMessage="Completed is a required field." ControlToValidate="txtCompleted" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="txtEmployeeID" class="col-sm-2">EmployeeID</label>
                        <div class="col-sm-3">
                            <asp:TextBox ID="txtEmployeeID" runat="server" 
                                CssClass="form-control"></asp:TextBox>
                        </div>
                        <div class="col-sm-offset-3 col-sm-4">
                            <asp:RequiredFieldValidator ID="rfvEmployeeID" runat="server" 
                                ErrorMessage="EmployeeID is a required field." ControlToValidate="txtEmployeeID" 
                                CssClass="text-danger">
                            </asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <asp:Button ID="btnAdd" runat="server" Text="Add New Assignment" 
                        CssClass="btn" OnClick="btnAdd_Click" />
                </div>
        </form>
    </main>
</div>
</body>
</html>
