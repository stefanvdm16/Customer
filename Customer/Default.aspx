<%@ Page Title="Customers" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Customer.Customer.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cusMainContent" runat="server">
    <h1>Customer Maintain</h1>
    <p>Below you will see a list of available customers. 
        You will have the ability to create, edit and delete customers. 
        You will also be able to view the details of the customer and create, edit and delete address details for each customer.
        <br />
    </p>
        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false" 
            CssClass="Grid" AlternatingRowStyle-CssClass="alt"
            OnRowEditing="gvCustomers_RowEditing" OnRowDeleting="gvCustomers_RowDeleting" DataKeyNames="CustomerID">
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="Customer #" />
                <asp:BoundField DataField="FirstName" HeaderText="Firstname" />
                <asp:BoundField DataField="Surname" HeaderText="Lastname" />
                <asp:BoundField DataField="BirthDate" HeaderText="DOB" DataFormatString="{0:D}" HtmlEncodeFormatString="true" SortExpression="BirthDate" />
                <asp:BoundField DataField="ContactNumberMobile" HeaderText="Mobile" />
                <asp:BoundField DataField="DateLastUpdated" HeaderText="Last Updated" DataFormatString="{0:g}" HtmlEncodeFormatString="true" />
                <asp:CommandField ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" />                
            </Columns>
            <EmptyDataTemplate>There are no results....</EmptyDataTemplate>
        </asp:GridView>
    <asp:HyperLink ID="InsertLink" NavigateUrl="~/Customer/Maintain.aspx?CustID=0" Text="Create New Customer" runat="server" Visible="true"></asp:HyperLink>
    </asp:Content>
