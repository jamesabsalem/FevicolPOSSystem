<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/SetMasterPage.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="Fevicol.Settings.AddProduct" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12">
            <table>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblProductGroup" runat="server" Text="Product Group Name" CssClass="control-label"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductGroup" runat="server" ErrorMessage="Select Group Name" ControlToValidate="ddlProductGroup" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="product" Display="none"></asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="reqDealer" TargetControlID="RequiredFieldValidatorProductGroup" HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                    <td style="width: 40%"></td>
                </tr>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblProductName" runat="server" Text="Product Name" CssClass="control-label"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control form-group"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductName" runat="server" ErrorMessage="Required Product Name" ControlToValidate="txtProductName" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="product" Display="none"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorProductName" runat="server" ControlToValidate="txtProductName" ValidationExpression="^[\s\S]{2,145}$" ValidationGroup="product" ErrorMessage="Minimum 2 and Maximum 145 characters required." SetFocusOnError="True" CssClass="label label-danger"></asp:RegularExpressionValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidatorProductName" HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                    <td style="width: 40%;padding-left:10px;">
                        <asp:Button ID="btnProductAdd" runat="server" Text="Save" CssClass="btn green" OnClick="btnProductAdd_OnClick" ValidationGroup="product" />
                        <asp:Button ID="btnClean" runat="server" Text="Clean" CssClass="btn yellow" OnClick="btnClean_OnClick" />
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row" style="padding-top: 10px">
        <div class="col-md-12">

                <asp:GridView ID="GridProductDetails" runat="server" CssClass="gridrowAlternaterow" Width="100%" EnableEventValidation="false" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanging="GridProductDetails_PageIndexChanging1" PageSize="15" ViewStateMode="Enabled">
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
                                <asp:Label ID="lblGroupId" runat="server" Text='<%# Eval("productGroupId") %>'></asp:Label>
                                <%--<asp:Label ID="lblProdu" runat="server" Text='<%# Eval("productGroupId") %>'></asp:Label>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#" HeaderStyle-Width="3%">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Product Description" HeaderStyle-Width="38%">
                            <ItemTemplate>
                                <asp:Label ID="lblProductDescription" runat="server" Text='<%# Eval("productDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group Name" HeaderStyle-Width="30%">
                            <ItemTemplate>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("groupDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User" HeaderStyle-Width="9%">
                            <ItemTemplate>
                                <asp:Label ID="lblGroupName" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Date" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:Label ID="lblProductCreatedDate" runat="server" Text='<%# Eval("ProductCreatedDate", "{0:M-dd-yyyy}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%-- Newly Added --%>
                        <asp:TemplateField HeaderText="Edit" HeaderStyle-Width="5%">
                            <ItemTemplate>
                                <asp:ImageButton ID="btnEditSelect" runat="server" ImageUrl="../assets/images/edit.png" Style="height: 14px" OnClick="btnEditSelect_OnClick" />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

        </div>
    </div>

        </asp:Content>
