<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="Customer.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="Customers" runat="server">
    <div>
        
        <h1>Welcome to Project CF</h1>
        <h3>Below you will see a list of available customers. You will have the ability to create, edit and delete customers. You will also be able to view the details of the customer and create, edit and delete address details for each customer.<br />
            
        </h3>        
        <div>
            <asp:HyperLink ID="CreateCustomerLink" runat="server" NavigateUrl="~/Customer.aspx?Action=Create">Create New Customer</asp:HyperLink>
            <asp:GridView ID="GridView1" runat="server">                
                <Columns>
                    <asp:TemplateField>
                      <ItemTemplate>
                        <asp:DynamicHyperLink runat="server" 
                          ID="EditHyperLink" 
                          Action="Edit" 
                          Text="Edit"/>
                      </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                      <ItemTemplate>
                        <asp:DynamicHyperLink runat="server" 
                          ID="DeleteHyperLink" 
                          Action="Delete" 
                          Text="Delete"/>
                      </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>There are no results....</EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
    
        
    
    </form>
    </body>
</html>
