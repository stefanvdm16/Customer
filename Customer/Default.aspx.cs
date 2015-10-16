using System;



namespace Customer.Customer
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.DataTable dsCustomers = new System.Data.DataTable();
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

            dsCustomers = client.GetCustomers(0);

            gvCustomers.DataSource = dsCustomers;
            gvCustomers.DataBind();
           
        }

        protected void gvCustomers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            int CustomerID = 0;
            gvCustomers.EditIndex = e.NewEditIndex;
            CustomerID = int.Parse(gvCustomers.DataKeys[gvCustomers.EditIndex].Value.ToString());
            Response.Redirect("~/Customer/Maintain.aspx?CustID=" + CustomerID);
        }

        protected void gvCustomers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int CustomerID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false; 
            CustomerID = int.Parse(gvCustomers.DataKeys[e.RowIndex].Value.ToString());
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();
            bSuccess = client.DeleteCustomer(CustomerID, ref lErrorCode);

            if (bSuccess)
            {
                Response.Redirect("~/Customer/Default.aspx");               
            }
        }
        
    }
}