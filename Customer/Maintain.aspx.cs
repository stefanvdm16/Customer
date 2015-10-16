using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Customer.Customer
{
    public partial class Maintain : System.Web.UI.Page
    {
        int iCustID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            myBind();
        }
        

            
        void myBind()
        {
            string paramCustID = Request.QueryString["CustID"];
            if (paramCustID.Trim() == "")
            {
                paramCustID = "0";
            }
            int value;
            if (int.TryParse(paramCustID, out value))
            {
                iCustID = value;
            }
            if (iCustID == 0)
            {
                iCustID = -1;
                dvCustomer.ChangeMode(DetailsViewMode.Insert);
            }
            CustomerIDValue.Value = Convert.ToString(iCustID);
            if (!IsPostBack)
            {
                getCustomers(iCustID);
                if (dvCustomer.CurrentMode==DetailsViewMode.ReadOnly)
                {
                    getAddresses(iCustID);
                }
            }
        }
        private void getCustomers(int CustomerID)
        {
            System.Data.DataTable dsCustomers = new System.Data.DataTable();
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

            if (CustomerID != 0)
            {
                dsCustomers = client.GetCustomers(CustomerID);
            }


            dvCustomer.DataSource = dsCustomers;
            dvCustomer.DataBind();
        }

        private void getAddresses(int CustomerID)
        {
            System.Data.DataTable dsCustomerAddress = new System.Data.DataTable();
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

            if (CustomerID != 0)
            {
                dsCustomerAddress = client.GetCustomerAddress(CustomerID);
            }


            gvAddresses.DataSource = dsCustomerAddress;
            gvAddresses.DataBind();
        }

        protected void dvCustomer_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            int lCustomerID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveCustomer(sender, ref lCustomerID, ref lErrorCode, "Insert");

            if (bSuccess)
            {
                MessageLabel.Text = "The save has been successfull.";
            }
            else
            {
                MessageLabel.Text = "Error: The save has been unsuccessfull. ErrorCode = " + lErrorCode;
            }

            EndEditing(lCustomerID);
        }

        private bool SaveCustomer(object sender, ref int lCustomerID, ref int lErrorCode, string mode = "Edit")
        {
            DateTime dtDOB;
            Boolean bSuccess = false;

            DataKey key = dvCustomer.DataKey;
            TextBox txtFirstName = (TextBox)dvCustomer.FindControl(mode + "FirstNameTextBox");
            TextBox txtSurname = (TextBox)dvCustomer.FindControl(mode + "SurnameTextBox");
            TextBox txtKnownName = (TextBox)dvCustomer.FindControl(mode + "KnownNameTextBox");
            TextBox txtBirthDate = (TextBox)dvCustomer.FindControl(mode + "BirthDateTextBox");
            TextBox txtIDNumber = (TextBox)dvCustomer.FindControl(mode + "IDNumberTextBox");
            TextBox txtEmailAddress = (TextBox)dvCustomer.FindControl(mode + "EmailAddressTextBox");
            TextBox txtContactNumberHome = (TextBox)dvCustomer.FindControl(mode + "ContactNumberHomeTextBox");
            TextBox txtContactNumberMobile = (TextBox)dvCustomer.FindControl(mode + "ContactNumberMobileTextBox");
            TextBox txtContactNumberWork = (TextBox)dvCustomer.FindControl(mode + "ContactNumberWorkTextBox");
            lCustomerID = Convert.ToInt32(CustomerIDValue.Value);
            dtDOB = Convert.ToDateTime(txtBirthDate.Text);
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();
            bSuccess = client.SaveCustomer(ref lCustomerID, txtFirstName.Text, txtSurname.Text, txtKnownName.Text, dtDOB, txtIDNumber.Text, txtEmailAddress.Text, txtContactNumberHome.Text, txtContactNumberMobile.Text, txtContactNumberWork.Text, ref lErrorCode);

            return bSuccess;
        }

        protected void dvCustomer_ItemUpdating1(object sender, DetailsViewUpdateEventArgs e)
        {
            int lCustomerID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveCustomer(null, ref lCustomerID, ref lErrorCode);

            if (bSuccess)
            {
                MessageLabel.Text = "The save has been successfull.";
            }
            else
            {
                MessageLabel.Text = "Error: The save has been unsuccessfull. ErrorCode = " + lErrorCode;
            }

            EndEditing(lCustomerID);
        }

        private void EndEditing(int CustomerID)
        {
            Response.Redirect("~/Customer/Maintain.aspx?CustID=" + CustomerID);
        }

        protected void calBirthDate_SelectionChanged(object sender, EventArgs e)
        {
            TextBox txtBirthDate;
            if (dvCustomer.CurrentMode == DetailsViewMode.Insert)
            {
                txtBirthDate = (TextBox)dvCustomer.FindControl("InsertBirthDateTextBox");
            }
            else
            {
                txtBirthDate = (TextBox)dvCustomer.FindControl("EditBirthDateTextBox");
            }

            txtBirthDate.Text = calBirthDate.SelectedDate.ToString("yyyy/MM/dd");
            calBirthDate.Visible = false;
        }

        protected void EditBirthDateLinkButton_Click(object sender, EventArgs e)
        {
            DateTime dtDOB;
            DateTime today = DateTime.Today;
            calBirthDate.TodaysDate = today;
            TextBox txtBirthDate = (TextBox)dvCustomer.FindControl("EditBirthDateTextBox");
            if (txtBirthDate.Text != "")
            {
                dtDOB = DateTime.Parse(txtBirthDate.Text);
            }
            else
            {
                dtDOB = DateTime.Today.AddYears(-20);
            }
            calBirthDate.TodaysDate = dtDOB;
            calBirthDate.SelectedDate = calBirthDate.TodaysDate;
            calBirthDate.Visible = true;
        }

        protected void InsertBirthDateLinkButton_Click(object sender, EventArgs e)
        {
            DateTime dtDOB;
            TextBox txtBirthDate = (TextBox)dvCustomer.FindControl("InsertBirthDateTextBox");
            if (txtBirthDate.Text != "")
            {
                dtDOB = DateTime.Parse(txtBirthDate.Text);
            }
            else
            {
                dtDOB = DateTime.Today.AddYears(-20);
            }
            calBirthDate.TodaysDate = dtDOB;
            calBirthDate.SelectedDate = calBirthDate.TodaysDate;
            calBirthDate.Visible = true;
        }

        protected void dvCustomer_ModeChanged(object sender, EventArgs e)
        {
           
            myBind();
        }

        protected void btnInsertCustomer_Click(object sender, EventArgs e)
        {
            int lCustomerID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveCustomer(null, ref lCustomerID, ref lErrorCode, "Insert");

            if (bSuccess)
            {
                MessageLabel.Text = "The save has been successfull.";
            }
            else
            {
                MessageLabel.Text = "Error: The save has been unsuccessfull. ErrorCode = " + lErrorCode;
            }

            EndEditing(lCustomerID);
        }

        protected void btnUpdateCustomer_Click(object sender, EventArgs e)
        {
            int lCustomerID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveCustomer(null, ref lCustomerID, ref lErrorCode);

            if (bSuccess)
            {
                MessageLabel.Text = "The save has been successfull.";
            }
            else
            {
                MessageLabel.Text = "Error: The save has been unsuccessfull. ErrorCode = " + lErrorCode;
            }

            EndEditing(lCustomerID);
        }

        protected void btnEditCustomer_Click(object sender, EventArgs e)
        {
            dvCustomer.ChangeMode(DetailsViewMode.Edit);
        }

        protected void btnCancelCustomerUpdate_Click(object sender, EventArgs e)
        {
            dvCustomer.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void btnCancelCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/Default.aspx");
        }

        protected void btnCancelCustomerInsert_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Customer/Default.aspx");
        }

        protected void dvCustomer_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            dvCustomer.DataBind();       
        }

        protected void dvCustomer_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.NewMode != DetailsViewMode.Insert)
            {
                int CustID = Convert.ToInt32(dvCustomer.DataKey.Value);
                System.Data.DataTable dsCustomers = new System.Data.DataTable();
                WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

                if (CustID != 0)
                {
                    dsCustomers = client.GetCustomers(CustID);
                }
                dvCustomer.DataSource = dsCustomers;
                dvCustomer.DataBind();
            }
        }

        protected void gvAddresses_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int CustomerID = 0;
            int AddressID = 0;
            gvAddresses.EditIndex = e.NewEditIndex;
            CustomerID = int.Parse(gvAddresses.DataKeys[gvAddresses.EditIndex].Values["CustomerID"].ToString());
            AddressID = int.Parse(gvAddresses.DataKeys[gvAddresses.EditIndex].Values["AddressID"].ToString());
            Response.Redirect("~/Customer/MaintainAddress.aspx?CustID=" + CustomerID + "&AddressID=" + AddressID);
        }

        protected void gvAddresses_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int CustomerID = 0;
            int AddressID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;
            CustomerID = int.Parse(gvAddresses.DataKeys[e.RowIndex].Values["CustomerID"].ToString());
            AddressID = int.Parse(gvAddresses.DataKeys[e.RowIndex].Values["AddressID"].ToString());
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();
            bSuccess = client.DeleteCustomerAddressLink(CustomerID, AddressID, ref lErrorCode);

            if (bSuccess)
            {
                Response.Redirect("~/Customer/Maintain.aspx?CustID=" + CustomerID);
            }
        }

        protected void InsertAddressLink_PreRender(object sender, EventArgs e)
        {
            InsertAddressLink.NavigateUrl = "~/Customer/MaintainAddress.aspx?CustID=" + CustomerIDValue.Value + "&AddressID=0";
        }
        
    }
}