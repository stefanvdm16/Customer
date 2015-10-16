using System;

namespace Customer
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Data.DataTable dsCustomers = new System.Data.DataTable();
            System.Data.DataTable dsCountry = new System.Data.DataTable();
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

            dsCustomers = client.GetCustomers(0);
            dsCountry = client.GetCountries();

            //CountryDD.DataSource = dsCountry;
            //CountryDD.DataValueField = "CountryID";
            //CountryDD.DataTextField = "CountryName";
            //CountryDD.DataBind();

            GridView1.DataSource = dsCustomers;
            GridView1.DataBind();

        }
    }
}