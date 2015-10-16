<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Customer.Master" AutoEventWireup="true" CodeBehind="MaintainAddress.aspx.cs" Inherits="Customer.Customer.MaintainAddress" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cusMainContent" runat="server">
    <h1>Customer Maintain</h1>
    <p>Below you can update and view a customer or create a new customer.
        <br />
    </p>                   
    <asp:Label ID="MessageLabel" Text="" runat="server"></asp:Label>
    <asp:HiddenField ID="AddressIDValue" runat="server" /> 
    <asp:HiddenField ID="CustomerIDValue" runat="server" /> 
    <asp:DetailsView ID="dvAddress" runat="server" DataKeyNames="CustomerID,AddressID"
            BorderColor="DarkSlateGray" BorderStyle="Solid" BorderWidth="1px"
            CellPadding="6" ForeColor="#333333"  AutoGenerateRows="false"
            GridLines="None" AllowPaging="false"
            OnItemUpdating="dvAddress_ItemUpdating"
            OnItemInserting="dvAddress_ItemInserting"
            OnModeChanging="dvAddress_ModeChanging"
            OnModeChanged="dvAddress_ModeChanged"
            OnItemUpdated="dvAddress_ItemUpdated">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <Fields>
                <asp:TemplateField HeaderText="Customer ID" Visible="false" InsertVisible="false"  ControlStyle-Width="400px">
                    <ItemTemplate>
                        <asp:Label ID="CustomerIDLabel" Text='<%# Eval("CustomerID") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Address ID" Visible="false" InsertVisible="false" >
                    <ItemTemplate>
                        <asp:Label ID="AddressIDLabel" Text='<%# Eval("AddressID") %>' runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>   
                <asp:TemplateField HeaderText="Address Type">
                    <ItemTemplate>
                        <asp:Label ID="AddressTypeLabel" runat="server" Text='<%# Bind("AddressTypeDesc") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:RadioButtonList ID="EditAddressTypeRadio" CellPadding="1" CellSpacing="1" RepeatDirection="Horizontal" runat="server"></asp:RadioButtonList>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:RadioButtonList ID="InsertAddressTypeRadio" CellPadding="1" CellSpacing="1" RepeatDirection="Horizontal" runat="server"></asp:RadioButtonList>
                    </InsertItemTemplate>                    
                </asp:TemplateField>       
                <asp:TemplateField HeaderText="Address">           
                    <ItemTemplate>
                        <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditAddressTextBox" runat="server" Text='<%# Bind("Address") %>' MaxLength="255" Rows="2" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="EditAddressTextBox" 
                            ErrorMessage="Address is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditAddress">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertAddressTextBox" runat="server" Text='<%# Bind("Address") %>' MaxLength="255" Rows="2" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="InsertAddressTextBox" 
                            ErrorMessage="Address is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertAddress">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>     
                <asp:TemplateField HeaderText="Country">           
                    <ItemTemplate>
                        <asp:Label ID="CountryLabel" runat="server" Text='<%# Bind("CountryName") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:DropDownList id="ddCountryEdit" runat="server" DataValueField="CountryID" datatextfield="CountryName" AutoPostBack="true" OnSelectedIndexChanged="ddCountryEdit_SelectedIndexChanged">
                            <asp:ListItem Text = "--Select Country--" Value = ""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddCountryEdit" 
                            ErrorMessage="Country is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditAddress">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList id="ddCountryInsert" runat="server" DataValueField="CountryID" datatextfield="CountryName" AutoPostBack="true" OnSelectedIndexChanged="ddCountryInsert_SelectedIndexChanged">
                            <asp:ListItem Text = "--Select Country--" Value = ""></asp:ListItem>
                        </asp:DropDownList>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ddCountryInsert" 
                            ErrorMessage="Country is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertAddress">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>  
               <asp:TemplateField HeaderText="Province">           
                    <ItemTemplate>
                        <asp:Label ID="ProvinceLabel" runat="server" Text='<%# Bind("ProvinceName") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:DropDownList id="ddProvinceEdit" runat="server" DataValueField="ProvinceID" datatextfield="ProvinceName" AutoPostBack="true" OnSelectedIndexChanged="ddProvinceEdit_SelectedIndexChanged">
                             <asp:ListItem Text = "--Select Province--" Value = ""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddProvinceEdit" 
                            ErrorMessage="Province is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditAddress">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList id="ddProvinceInsert" runat="server" DataValueField="ProvinceID" datatextfield="ProvinceName" AutoPostBack="true" OnSelectedIndexChanged="ddProvinceInsert_SelectedIndexChanged">
                            <asp:ListItem Text = "--Select Province--" Value = ""></asp:ListItem>
                        </asp:DropDownList>                        
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddProvinceInsert" 
                            ErrorMessage="Province is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertAddress">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>                   
               <asp:TemplateField HeaderText="City">           
                    <ItemTemplate>
                        <asp:Label ID="CityLabel" runat="server" Text='<%# Bind("CityName") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:DropDownList id="ddCityEdit" runat="server" DataValueField="CityID" datatextfield="CityName">
                            <asp:ListItem Text = "--Select City--" Value = ""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddCityEdit" 
                            ErrorMessage="City is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditAddress">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:DropDownList id="ddCityInsert" runat="server" DataValueField="CityID" datatextfield="CityName">
                            <asp:ListItem Text = "--Select City--" Value = ""></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="ddCityInsert" 
                            ErrorMessage="City is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertAddress">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField> 
                <asp:TemplateField HeaderText="Post Code">           
                    <ItemTemplate>
                        <asp:Label ID="PostCodeLabel" runat="server" Text='<%# Bind("PostCode") %>'></asp:Label>
                    </ItemTemplate>                                                                             
                    <EditItemTemplate>
                        <asp:TextBox ID="EditPostCodeTextBox" runat="server" Text='<%# Bind("PostCode") %>' MaxLength="10" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="EditPostCodeTextBox" 
                            ErrorMessage="Post Code is required." CssClass="Validator" Display="Dynamic" ValidationGroup="EditAddress">*Required
                        </asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:TextBox ID="InsertPostCodeTextBox" runat="server" Text='<%# Bind("PostCode") %>' MaxLength="10" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="InsertPostCodeTextBox" 
                            ErrorMessage="Post Code is required." CssClass="Validator" Display="Dynamic" ValidationGroup="InsertAddress">*Required
                        </asp:RequiredFieldValidator>
                    </InsertItemTemplate>
                </asp:TemplateField>  
                <asp:TemplateField>
                    <EditItemTemplate>
                        <asp:Button ID="btnAddressUpdate" runat="server" CausesValidation="True"  ValidationGroup="EditAddress"
                        CommandName="Update" Text="Update" OnClick="btnAddressUpdate_Click"  />
                        &nbsp;<asp:Button ID="btnAddressCancelUpdate" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" OnClick="btnAddressCancelUpdate_Click" />
                    </EditItemTemplate>
                    <InsertItemTemplate>
                        <asp:Button ID="btnAddressInsert" runat="server" CausesValidation="True"  ValidationGroup="InsertAddress"
                        CommandName="Insert" Text="Insert" OnClick="btnAddressInsert_Click" />
                        &nbsp;<asp:Button ID="btnAddressCancelInsert" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Cancel" OnClick="btnAddressCancelInsert_Click" />
                    </InsertItemTemplate>
                    <ItemTemplate>
                        <asp:Button ID="btnAddressEdit" runat="server" CausesValidation="False" 
                            CommandName="Edit" Text="Edit" OnClick="btnAddressEdit_Click"/> 
                        &nbsp;<asp:Button ID="btnAddressCancel" runat="server" CausesValidation="False" 
                        CommandName="Cancel" Text="Back" OnClick="btnAddressCancel_Click" />
            </ItemTemplate>
                </asp:TemplateField>
            </Fields>
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#999999" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
</asp:Content>
