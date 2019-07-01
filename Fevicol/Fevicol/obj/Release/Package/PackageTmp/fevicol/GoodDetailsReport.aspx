<%@ Page Title="" Language="C#" MasterPageFile="~/Fevicol/InvMasterPage.Master" AutoEventWireup="true" CodeBehind="GoodDetailsReport.aspx.cs" Inherits="Fevicol.Inventory.GoodDetailsReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:CheckBox ID="checkInvDetails" runat="server" Text="Inventory Details"/>
    <label class="col-md-1 control-label">Product Group</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProductGroup_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductGroup" runat="server" ErrorMessage="Please Select Product Group" ForeColor="red" ControlToValidate="ddlProductGroup" InitialValue="" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                    <br />
                                </div>

    <label class="col-md-1 control-label">Product Name</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProducts_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductName" runat="server" ErrorMessage="Please Select Product Name" ForeColor="red" ControlToValidate="ddlProducts" InitialValue="" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                    <br />
                                </div>
</asp:Content>


