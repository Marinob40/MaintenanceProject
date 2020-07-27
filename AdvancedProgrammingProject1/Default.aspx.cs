using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AdvancedProgrammingProject1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        //This button will add a new assignment
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["DateAssigned"].DefaultValue = txtDateAssigned.Text;
                parameters["OwnerFirstName"].DefaultValue = txtOwnerFirstName.Text;
                parameters["OwnerLastName"].DefaultValue = txtOwnerLastName.Text;
                parameters["Address"].DefaultValue = txtAddress.Text;
                parameters["Phone"].DefaultValue = txtPhone.Text;
                parameters["ProblemDescription"].DefaultValue = txtProblemDescription.Text;
                parameters["Completed"].DefaultValue = txtCompleted.Text;
                parameters["EmployeeID"].DefaultValue = txtEmployeeID.Text;

                try {
                    SqlDataSource1.Insert();
                    txtDateAssigned.Text = "";
                    txtOwnerFirstName.Text = "";
                    txtOwnerLastName.Text = "";
                    txtAddress.Text = "";
                    txtPhone.Text = "";
                    txtProblemDescription.Text = "";
                    txtCompleted.Text = "";
                    txtEmployeeID.Text = "";

                }
                catch (Exception ex){

                    lblError.Text = DatabaseErrorMessage(ex.Message);
                }

            }
        }

        //General database error message
        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }

        //Database error message if someone else is updated assignment information
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that assignment. Please try again";
        }

        //Will update assignment while in edit mode
        protected void grdAssignments_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }

        //Will delete an assignment
        protected void grdAssignments_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }
    }
}