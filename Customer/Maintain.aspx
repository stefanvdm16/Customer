<%@ Page Title="Customer Maintain" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="Maintain.aspx.cs" Inherits="Customer.Customer.Maintain" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cusMainContent" runat="server">
    <asp:Label ID="MessageLabel" Text="" runat="server"></asp:Label>
    <asp:HiddenField ID="CustomerIDValue" runat="server" /> 
    <h1>Customer Maintain</h1>
    <p>Below you can update and view a customer or create a new customer.
        <br />
    </p>                   
    <asp:DetailsView ID="dvCustomer" runat="server" DataKeyNames="CustomerID"         
            CellPadding="6" ForeColor="#333333"  AutoGenerateRows="false" BorderColor="DarkSlateGray" BorderStyle="Solid" BorderWidth="1px"
            GridLines="None" AllowPaging="false"
            OnItemUpdating="dvCustomer_ItemUpdating1"
            OnItemInserting="dvCustomer_ItemInserting"
            OnModeChanging="dvCustomer_ModeChanging"
            OnModeChanged="dvCustomer_ModeChanged"
            OnItemUpdated="dvCustomer_ItemUpdated">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:TemplateField HeaderText="Customer ID" Visible="True" InsertVisible="True" ControlStyle-Width="400px">
                    <ItemTemplate>
                        <asp:Label ID="CustomerIDLabel" Text='<%# Eval("CustomerID") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="First Name">           
                    <ItemTemplate>
                        <asp:Label ID="FirstNameLabel" runat="server" Text='<%# Bind("FirstName") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditFirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' MaxLength="100" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EditFirstNameTextBox" 
                            ErrorMessage="Firstname is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditCustomer">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertFirstNameTextBox" runat="server" Text='<%# Bind("FirstName") %>' MaxLength="100" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="InsertFirstNameTextBox" 
                            ErrorMessage="Firstname is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertCustomer">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Surname">           
                    <ItemTemplate>
                        <asp:Label ID="SurnameLabel" runat="server" Text='<%# Bind("Surname") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditSurnameTextBox" runat="server" Text='<%# Bind("Surname") %>' MaxLength="100" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="EditSurnameTextBox" 
                            ErrorMessage="Surname is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditCustomer">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertSurnameTextBox" runat="server" Text='<%# Bind("ContSurnameactName") %>' MaxLength="100" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="InsertSurnameTextBox" 
                            ErrorMessage="Surname is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertCustomer">*Required
                        </asp:RequiredFieldValidator></InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Known Name">           
                    <ItemTemplate>
                        <asp:Label ID="KnownNameLabel" runat="server" Text='<%# Bind("KnownName") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditKnownNameTextBox" runat="server" Text='<%# Bind("KnownName") %>' MaxLength="200" /></EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertKnownNameTextBox" runat="server" Text='<%# Bind("KnownName") %>' MaxLength="200" /></InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Birth Date">           
                    <ItemTemplate>
                        <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Bind("BirthDate","{0:D}") %>' DataFormatString="{0:D}" HtmlEncodeFormatString="true"></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditBirthDateTextBox" ReadOnly="true" runat="server" Text='<%# Bind("BirthDate","{0:D}") %>' DataFormatString="{0:D}" HtmlEncodeFormatString="true" />
                        <asp:LinkButton ID="EditBirthDateLinkButton" runat="server" onclick="EditBirthDateLinkButton_Click">PickDate...</asp:LinkButton>
                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EditBirthDateTextBox" 
                            ErrorMessage="Birth Date is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditCustomer">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertBirthDateTextBox" ReadOnly="true" runat="server" Text='<%# Bind("BirthDate","{0:D}") %>' DataFormatString="{0:D}" HtmlEncodeFormatString="true" />
                        <asp:LinkButton ID="InsertBirthDateLinkButton" runat="server" onclick="InsertBirthDateLinkButton_Click">PickDate...</asp:LinkButton>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="InsertBirthDateTextBox" 
                            ErrorMessage="Birth Date is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertCustomer">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="ID Number">           
                    <ItemTemplate>
                        <asp:Label ID="IDNumberLabel" runat="server" Text='<%# Bind("IDNumber") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditIDNumberTextBox" runat="server" Text='<%# Bind("IDNumber") %>' MaxLength="13" />
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="EditIDNumberTextBox" 
                            ErrorMessage="ID Number is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditCustomer">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertIDNumberTextBox" runat="server" Text='<%# Bind("IDNumber") %>' MaxLength="13" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="InsertIDNumberTextBox" 
                            ErrorMessage="ID Number is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertCustomer">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Email Address">           
                    <ItemTemplate>
                    <asp:Label ID="EmailAddressLabel" runat="server" Text='<%# Bind("EmailAddress") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                    <asp:TextBox ID="EditEmailAddressTextBox" runat="server" Text='<%# Bind("EmailAddress") %>' MaxLength="100" /></EditItemTemplate>
                    <InsertItemTemplate>
                    <asp:TextBox ID="InsertEmailAddressTextBox" runat="server" Text='<%# Bind("EmailAddress") %>' MaxLength="100" /></InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Contact Number(H)">           
                    <ItemTemplate>
                        <asp:Label ID="ContactNumberHomeLabel" runat="server" Text='<%# Bind("ContactNumberHome") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditContactNumberHomeTextBox" runat="server" Text='<%# Bind("ContactNumberHome") %>' MaxLength="30" /></EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertContactNumberHomeTextBox" runat="server" Text='<%# Bind("ContactNumberHome") %>' MaxLength="30" /></InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField HeaderText="Contact Number(M)">           
                    <ItemTemplate>
                        <asp:Label ID="ContactNumberMobileLabel" runat="server" Text='<%# Bind("ContactNumberMobile") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditContactNumberMobileTextBox" runat="server" Text='<%# Bind("ContactNumberMobile") %>' MaxLength="30" /></EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertContactNumberMobileTextBox" runat="server" Text='<%# Bind("ContactNumberMobile") %>' MaxLength="30" /></InsertItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Number(W)">           
                    <ItemTemplate>
                        <asp:Label ID="ContactNumberWorkLabel" runat="server" Text='<%# Bind("ContactNumberWork") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditContactNumberWorkTextBox" runat="server" Text='<%# Bind("ContactNumberWork") %>' MaxLength="30" /></EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertContactNumberWorkTextBox" runat="server" Text='<%# Bind("ContactNumberWork") %>' MaxLength="30" /></InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdateCustomer" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" OnClick="btnUpdateCustomer_Click" ValidationGroup="EditCustomer"  />
                        &nbsp;<asp:Button ID="btnCancelCustomerUpdate" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" OnClick="btnCancelCustomerUpdate_Click" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Button ID="btnInsertCustomer" runat="server" CausesValidation="True"  ValidationGroup="InsertCustomer"
                        CommandName="Insert" Text="Insert" OnClick="btnInsertCustomer_Click" />
                        &nbsp;<asp:Button ID="btnCancelCustomerInsert" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" OnClick="btnCancelCustomerInsert_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnEditCustomer" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" OnClick="btnEditCustomer_Click"/> 
                        &nbsp;<asp:Button ID="btnCancelCustomer" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Back" OnClick="btnCancelCustomer_Click" />
            </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        <h3>Customer Linked Addresses</h3>
        <p>Below is a list of linked addresses to the customer.
            <br />
        </p>      
        <asp:HyperLink ID="InsertAddressLink" Text="Create New Address for Customer" runat="server" Visible="true" OnPreRender="InsertAddressLink_PreRender"></asp:HyperLink>
        <br />
        <asp:GridView ID="gvAddresses" runat="server" AutoGenerateColumns="false" 
            CssClass="Grid" AlternatingRowStyle-CssClass="alt" 
            OnRowEditing="gvAddresses_RowEditing" OnRowDeleting="gvAddresses_RowDeleting" DataKeyNames="AddressID,CustomerID" Width="800px">
            <Columns>
                <asp:BoundField DataField="CustomerID" HeaderText="Customer #" />
                <asp:BoundField DataField="AddressID" HeaderText="Address #" />
                <asp:BoundField DataField="Address" HeaderText="Address" />
                <asp:BoundField DataField="CountryName" HeaderText="Country" />
                <asp:BoundField DataField="ProvinceName" HeaderText="Province" />
                <asp:BoundField DataField="CityName" HeaderText="City" />
                <asp:BoundField DataField="PostCode" HeaderText="Post Code" />
                <asp:BoundField DataField="DateCreated" HeaderText="Date Linked" DataFormatString="{0:g}" HtmlEncodeFormatString="true" />
                <asp:CommandField ShowCancelButton="False" ShowDeleteButton="True" ShowEditButton="True" />                
            </Columns>
            <EmptyDataTemplate>There are no results....</EmptyDataTemplate>
        </asp:GridView>
        
    <div>
        <asp:Calendar ID="calBirthDate" runat="server" Visible="False" OnSelectionChanged="calBirthDate_SelectionChanged" BorderColor="Black" BorderStyle="Solid" style="Z-INDEX: 101; LEFT: 650px; POSITION: absolute; TOP: 150px;"  >
            <OtherMonthDayStyle ForeColor="Gray" />
            <TitleStyle ForeColor="Black" />
            <DayStyle />

        </asp:Calendar>
    </div>
    <br /><br /><br />
</asp:Content>

