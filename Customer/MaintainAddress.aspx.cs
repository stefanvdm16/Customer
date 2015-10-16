using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Customer.Customer
{
    public partial class MaintainAddress : System.Web.UI.Page
    {
        int iCustID = 0;
        int iAddressID = 0;
        string strCurrentMode = "Edit";
        protected void Page_Load(object sender, EventArgs e)
        {
            myBind();
        }
        void myBind()
        {
            string paramCustID = Request.QueryString["CustID"];
            string paramAddressID = Request.QueryString["AddressID"];

            if (paramAddressID.Trim() == "")
            {
                paramAddressID = "0";
            }
            int value;
            if (int.TryParse(paramAddressID, out value))
            {
                iAddressID = value;
            }
            if (iAddressID == 0)
            {
                iAddressID = -1;
                dvAddress.ChangeMode(DetailsViewMode.Insert);
            }
            if (paramCustID.Trim() == "")
            {
                paramCustID = "0";
            }
            int valueCust;
            if (int.TryParse(paramCustID, out valueCust))
            {
                iCustID = valueCust;
            }
            if (iCustID == 0)
            {
                iCustID = -1;
            }
            CustomerIDValue.Value = Convert.ToString(iCustID);
            AddressIDValue.Value = Convert.ToString(iAddressID);
            if (!IsPostBack)
            {
                if (dvAddress.CurrentMode==DetailsViewMode.Edit)
                {
                    strCurrentMode = "Edit";
                }
                else if(dvAddress.CurrentMode == DetailsViewMode.Insert)
                {
                    strCurrentMode = "Insert";
                }
                getAddresses(iCustID,iAddressID);
            }
        }
        
        private void getAddresses(int CustomerID, int AddressID)
        {
            System.Data.DataTable dsCustomerAddress = new System.Data.DataTable();
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

            if (CustomerID != 0 && AddressID!=0)
            {
                dsCustomerAddress = client.GetCustomerAddress(CustomerID, AddressID);
            }

            dvAddress.DataSource = dsCustomerAddress;
            dvAddress.DataBind();

            if (strCurrentMode=="Insert")
            {
                DropDownList ddCountry = (DropDownList)dvAddress.FindControl("ddCountry" + strCurrentMode);
                DropDownList ddProvince = (DropDownList)dvAddress.FindControl("ddProvince" + strCurrentMode);
                DropDownList ddCity = (DropDownList)dvAddress.FindControl("ddCity" + strCurrentMode);
                ddCountry.AppendDataBoundItems = true;
                try
                {
                    System.Data.DataTable dsCountry = new System.Data.DataTable();

                    dsCountry = client.GetCountries();
                    ddCountry.DataSource = dsCountry;
                    ddCountry.DataTextField = "CountryName";
                    ddCountry.DataValueField = "CountryID";
                    ddCountry.DataBind();
                    ddProvince.Enabled = false;
                    ddCity.Enabled = false;
                }
                catch (Exception ex)
                {
                    throw ex;
                }
                SetupAddressType();
            }
           
        }

        protected void Country_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dvAddress.CurrentMode == DetailsViewMode.Edit)
            {
                strCurrentMode = "Edit";
            }
            else if (dvAddress.CurrentMode == DetailsViewMode.Insert)
            {
                strCurrentMode = "Insert";
            }
            DropDownList ddCountry = (DropDownList)dvAddress.FindControl("ddCountry" + strCurrentMode);
            DropDownList ddProvince = (DropDownList)dvAddress.FindControl("ddProvince" + strCurrentMode);
            DropDownList ddCity = (DropDownList)dvAddress.FindControl("ddCity" + strCurrentMode);
            ddProvince.Items.Clear();
            ddProvince.Items.Add(new ListItem("--Select Province--", ""));
            ddCity.Items.Clear();
            ddCity.Items.Add(new ListItem("--Select City--", ""));

            int CountryVal = 0;
            if (ddCountry.SelectedItem.Value!="")
            {
                CountryVal = Convert.ToInt32(ddCountry.SelectedItem.Value);
            }

            ddProvince.AppendDataBoundItems = true;

            try
            {
                System.Data.DataTable dsProvinces = new System.Data.DataTable();
                WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

                dsProvinces = client.GetProvinces(CountryVal);
                ddProvince.DataSource = dsProvinces;
                ddProvince.DataTextField = "ProvinceName";
                ddProvince.DataValueField = "ProvinceID";
                ddProvince.DataBind();
                if (ddProvince.Items.Count > 1)
                {
                    ddProvince.Enabled = true;
                }
                else
                {
                    ddProvince.Enabled = false;
                    ddCity.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddCountryEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            Country_SelectedIndexChanged(sender, e);
        }

        protected void ddCountryInsert_SelectedIndexChanged(object sender, EventArgs e)
        {
            Country_SelectedIndexChanged(sender, e);
        }

        protected void Province_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dvAddress.CurrentMode == DetailsViewMode.Edit)
            {
                strCurrentMode = "Edit";
            }
            else if (dvAddress.CurrentMode == DetailsViewMode.Insert)
            {
                strCurrentMode = "Insert";
            }
            DropDownList ddCountry = (DropDownList)dvAddress.FindControl("ddCountry" + strCurrentMode);
            DropDownList ddProvince = (DropDownList)dvAddress.FindControl("ddProvince" + strCurrentMode);
            DropDownList ddCity = (DropDownList)dvAddress.FindControl("ddCity" + strCurrentMode);
            ddCity.Items.Clear();
            ddCity.Items.Add(new ListItem("--Select City--", ""));

            int CountryVal = 0;
            if (ddCountry.SelectedItem.Value != "")
            {
                CountryVal = Convert.ToInt32(ddCountry.SelectedItem.Value);
            }
            int ProvinceVal = 0;
            if (ddProvince.SelectedItem.Value != "")
            {
                ProvinceVal = Convert.ToInt32(ddProvince.SelectedItem.Value);
            }

            ddCity.AppendDataBoundItems = true;

            try
            {
                System.Data.DataTable dsCity = new System.Data.DataTable();
                WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

                dsCity = client.GetCities(CountryVal, ProvinceVal);
                ddCity.DataSource = dsCity;
                ddCity.DataTextField = "CityName";
                ddCity.DataValueField = "CityID";
                ddCity.DataBind();
                if (ddCity.Items.Count > 1)
                {
                    ddCity.Enabled = true;
                }
                else
                {
                    ddCity.Enabled = false;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void ddProvinceEdit_SelectedIndexChanged(object sender, EventArgs e)
        {
            Province_SelectedIndexChanged(sender, e);
        }

        protected void ddProvinceInsert_SelectedIndexChanged(object sender, EventArgs e)
        {
            Province_SelectedIndexChanged(sender, e);
        }

        protected void dvAddress_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            int lCustomerID = 0;
            int lAddressID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveAddressByCustomer(sender, ref lCustomerID, ref lAddressID, ref lErrorCode, "Insert");

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

        private bool SaveAddressByCustomer(object sender, ref int lCustomerID, ref int lAddressID, ref int lErrorCode, string mode = "Edit")
        {
            Boolean bSuccess = false;
            int CountryVal = 0;
            int ProvinceVal = 0;
            int CityVal = 0;
            int AddressTypeVal = 0;

            DataKey key = dvAddress.DataKey;
            DropDownList ddCountry = (DropDownList)dvAddress.FindControl("ddCountry" + mode);
            DropDownList ddProvince = (DropDownList)dvAddress.FindControl("ddProvince" + mode);
            DropDownList ddCity = (DropDownList)dvAddress.FindControl("ddCity" + mode);
            TextBox txtAddress = (TextBox)dvAddress.FindControl(mode + "AddressTextBox");
            TextBox txtPostCode = (TextBox)dvAddress.FindControl(mode + "PostCodeTextBox");
            RadioButtonList rblAddressTypes = (RadioButtonList)dvAddress.FindControl(mode + "AddressTypeRadio");

            lCustomerID = Convert.ToInt32(CustomerIDValue.Value);
            lAddressID = Convert.ToInt32(AddressIDValue.Value);
            CountryVal = Convert.ToInt32(ddCountry.SelectedValue);
            ProvinceVal = Convert.ToInt32(ddProvince.SelectedValue);
            CityVal = Convert.ToInt32(ddCity.SelectedValue);
            AddressTypeVal = Convert.ToInt32(rblAddressTypes.SelectedValue);
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();
            bSuccess = client.SaveAddress(ref lAddressID,CountryVal, ProvinceVal,CityVal, txtAddress.Text,txtPostCode.Text, ref lErrorCode);
            if (bSuccess)
            {
                bSuccess = client.LinkAddressToCustomer(lCustomerID, lAddressID, AddressTypeVal, ref lErrorCode);
            }
            return bSuccess;
        }

        protected void dvAddress_ModeChanged(object sender, EventArgs e)
        {
            myBind();
        }

        protected void btnAddressUpdate_Click(object sender, EventArgs e)
        {
            int lCustomerID = 0;
            int lAddressID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveAddressByCustomer(null, ref lCustomerID, ref lAddressID, ref lErrorCode);

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

        protected void btnAddressCancelUpdate_Click(object sender, EventArgs e)
        {
            dvAddress.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void btnAddressInsert_Click(object sender, EventArgs e)
        {
            int lCustomerID = 0;
            int lAddressID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveAddressByCustomer(null, ref lCustomerID, ref lAddressID, ref lErrorCode, "Insert");

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

        protected void btnAddressCancelInsert_Click(object sender, EventArgs e)
        {
            int CustID = Convert.ToInt32(CustomerIDValue.Value);
            EndEditing(CustID);
        }

        protected void btnAddressEdit_Click(object sender, EventArgs e)
        {
            dvAddress.ChangeMode(DetailsViewMode.Edit);
        }

        protected void btnAddressCancel_Click(object sender, EventArgs e)
        {
            int CustID = Convert.ToInt32(dvAddress.DataKey["CustomerID"]);
            EndEditing(CustID);
        }

        protected void dvAddress_ModeChanging(object sender, DetailsViewModeEventArgs e)
        {
            if (e.NewMode != DetailsViewMode.Insert)
            {
                int CustID = Convert.ToInt32(dvAddress.DataKey["CustomerID"]);
                int AddressID = Convert.ToInt32(dvAddress.DataKey["AddressID"]);
                System.Data.DataTable dsCustomerAddress = new System.Data.DataTable();
                WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

                int CountryVal = 0;
                int ProvinceVal = 0;
                int CityVal = 0;
                int AddressTypeVal = 0;

                if (CustID != 0 && AddressID!=0)
                {
                    dsCustomerAddress = client.GetCustomerAddress(CustID,AddressID);
                    foreach (System.Data.DataRow row in dsCustomerAddress.Rows)
                    {
                        CountryVal = int.Parse(row["CountryID"].ToString());
                        ProvinceVal = int.Parse(row["ProvinceID"].ToString());
                        CityVal = int.Parse(row["CityID"].ToString());
                        AddressTypeVal = int.Parse(row["AddressTypeID"].ToString());
                    }
                    
                    
                }

                dvAddress.DataSource = dsCustomerAddress;
                dvAddress.DataBind();

                if (e.NewMode == DetailsViewMode.Edit)
                {
                    SetupCountryDD(CountryVal);
                    SetupProvinceDD(ProvinceVal, CountryVal);
                    SetupCityDD(CityVal, CountryVal, ProvinceVal);
                    SetupAddressType(AddressTypeVal);
                }
            }
            else
            {
                SetupAddressType(0);
            }
        }

        protected void SetupAddressType(int SelectAddressTypeVal = 0)
        {
            System.Data.DataTable dtAddressTypes = new System.Data.DataTable();
            WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

            dtAddressTypes = client.GetAddressTypes();

            RadioButtonList rblAddressTypes = (RadioButtonList)dvAddress.FindControl(strCurrentMode + "AddressTypeRadio");

            rblAddressTypes.DataSource = dtAddressTypes;
            rblAddressTypes.DataTextField = "AddressTypeDesc";
            rblAddressTypes.DataValueField = "AddressTypeID";
            rblAddressTypes.DataBind();
            try
            {
                if (SelectAddressTypeVal==0)
                {
                    rblAddressTypes.SelectedIndex = 0;
                }
                else
                {
                    rblAddressTypes.SelectedValue = SelectAddressTypeVal.ToString();
                }
                
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void SetupCountryDD(int SelectCountryVal= 0)
        {
            DropDownList ddCountry = (DropDownList)dvAddress.FindControl("ddCountry" + strCurrentMode);
            ddCountry.AppendDataBoundItems = true;
            try
            {
                System.Data.DataTable dsCountry = new System.Data.DataTable();
                WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

                dsCountry = client.GetCountries();
                ddCountry.DataSource = dsCountry;
                ddCountry.DataTextField = "CountryName";
                ddCountry.DataValueField = "CountryID";
                ddCountry.DataBind();
                ddCountry.SelectedValue = SelectCountryVal.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void SetupProvinceDD(int SelectedProvinceVal = 0, int CountryID = 0)
        {
            DropDownList ddProvince = (DropDownList)dvAddress.FindControl("ddProvince" + strCurrentMode);
            ddProvince.AppendDataBoundItems = true;
            try
            {
                System.Data.DataTable dsProvince = new System.Data.DataTable();
                WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

                dsProvince = client.GetProvinces(CountryID);
                ddProvince.DataSource = dsProvince;
                ddProvince.DataTextField = "ProvinceName";
                ddProvince.DataValueField = "ProvinceID";
                ddProvince.DataBind();
                ddProvince.SelectedValue = SelectedProvinceVal.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void SetupCityDD(int SelectedCityVal = 0, int CountryID = 0, int ProvinceID = 0)
        {
            DropDownList ddCity = (DropDownList)dvAddress.FindControl("ddCity" + strCurrentMode);
            ddCity.AppendDataBoundItems = true;
            try
            {
                System.Data.DataTable dsCity = new System.Data.DataTable();
                WcfCustomersVB.ServiceCustomer client = new WcfCustomersVB.ServiceCustomer();

                dsCity = client.GetCities(CountryID, ProvinceID);
                ddCity.DataSource = dsCity;
                ddCity.DataTextField = "CityName";
                ddCity.DataValueField = "CityID";
                ddCity.DataBind();
                ddCity.SelectedValue = SelectedCityVal.ToString();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dvAddress_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            int lCustomerID = 0;
            int lAddressID = 0;
            int lErrorCode = 0;
            Boolean bSuccess = false;


            bSuccess = SaveAddressByCustomer(null, ref lCustomerID, ref lAddressID, ref lErrorCode, "Insert");

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

        protected void dvAddress_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            dvAddress.DataBind();
        }
    }
}