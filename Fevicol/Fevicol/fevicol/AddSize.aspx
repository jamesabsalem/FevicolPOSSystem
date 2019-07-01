<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/SetMasterPage.Master" AutoEventWireup="true" CodeBehind="AddSize.aspx.cs" Inherits="Fevicol.Settings.AddSize" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="portlet-title">
        <div class="row">
            <div class="col-md-12">

                <table>
                    <tr>
                        <td style="width: 30%">
                            <asp:Label ID="lblProduct" runat="server" Text="Product Name" CssClass="control-label form-group"></asp:Label>
                        </td>
                        <td style="width: 30%">
                            <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorProduct" runat="server" ErrorMessage="Select Product Name" ControlToValidate="ddlProduct" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="size" Display="none"></asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender runat="Server" ID="reqDealer" TargetControlID="RequiredFieldValidatorProduct" HighlightCssClass="validatorCalloutHighlight" />
                        </td>
                        <td style="width: 40%"></td>
                    </tr>
                    <tr>
                        <td style="width: 30%">
                            <asp:Label ID="lblSize" runat="server" Text="Product Size" CssClass="control-label form-group"></asp:Label>
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="txtProductSize" runat="server" CssClass="form-control form-group"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductName" runat="server" ErrorMessage="Required Size Name" ControlToValidate="txtProductSize" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="size" Display="none"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatorProductName" runat="server" ControlToValidate="txtProductSize" ValidationExpression="^[\s\S]{2,98}$" ValidationGroup="size" ErrorMessage="Minimum 2 and Maximum 98 characters required." ForeColor="red" Display="none"></asp:RegularExpressionValidator>
                            <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidatorProductName" HighlightCssClass="validatorCalloutHighlight" />
                             <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2" TargetControlID="RegularExpressionValidatorProductName" HighlightCssClass="validatorCalloutHighlight" />
                        </td>
                        <td style="width: 40%;padding-left:5px;">
                            <asp:Button ID="btnAddSize" runat="server" Text="Save" CssClass="btn green form-group" OnClick="btnAddSize_OnClick" ValidationGroup="size" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: 5px">
        <div class="col-md-12">
            <asp:GridView ID="GridSizeDetails" runat="server" Width="100%" CellPadding="4" CssClass="gridrowAlternaterow" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" PageSize="15" OnPageIndexChanging="GridSizeDetails_PageIndexChanging">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" CssClass="gridViewPager td" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />

                <Columns>
                    <asp:TemplateField HeaderText="Products Details" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                            <asp:Label ID="lblSizeId" runat="server" Text='<%# Eval("sizeId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#" HeaderStyle-Width="3%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Product Description" HeaderStyle-Width="42%">
                        <ItemTemplate>
                            <asp:Label ID="lblProductDescription" runat="server" Text='<%# Eval("productDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Size Description" HeaderStyle-Width="20%">
                        <ItemTemplate>
                            <asp:Label ID="lblsizeDescription" runat="server" Text='<%# Eval("sizeDescription") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User Name" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" HeaderStyle-Width="15%">
                        <ItemTemplate>
                            <asp:Label ID="lblProductCreatedDate" runat="server" Text='<%# Eval("sizeCreatedDate", "{0:M-dd-yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--Start Newly Added --%>
                    <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="5%">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnEditSelect" runat="server" ImageUrl="../assets/images/edit.png" Style="height: 14px" OnClick="btnEditSelect_OnClick" />
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:TemplateField>
                    <%-- End Newly Added --%>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
