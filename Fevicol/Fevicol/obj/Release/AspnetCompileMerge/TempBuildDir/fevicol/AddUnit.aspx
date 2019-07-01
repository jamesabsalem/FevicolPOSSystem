<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/SetMasterPage.Master" AutoEventWireup="true" CodeBehind="AddUnit.aspx.cs" Inherits="Fevicol.Settings.AddUnit" %>

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
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorProduct" runat="server" ErrorMessage="Select Product Name" ControlToValidate="ddlProduct" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="unit" Display="none"></asp:RequiredFieldValidator>
                            <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidatorProduct" HighlightCssClass="validatorCalloutHighlight" />
                        </td>
                        <td style="width: 40%"></td>
                    </tr>
                    <tr>
                        <td style="width: 30%">
                            <asp:Label ID="lblUnit" runat="server" Text="Unit" CssClass="control-label form-group"></asp:Label>
                        </td>
                        <td style="width: 30%">
                            <asp:TextBox ID="txtUnit" runat="server" CssClass="form-control form-group"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatortxtUnit" runat="server" ErrorMessage="Required Unit Name" ControlToValidate="txtUnit" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="unit" Display="none"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidatortxtUnit" runat="server" ControlToValidate="txtUnit" ValidationExpression="^[\s\S]{2,98}$" ValidationGroup="unit" ErrorMessage="Minimum 2 and Maximum 98 characters required." ForeColor="red" Display="none"></asp:RegularExpressionValidator>
                            <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidatortxtUnit" HighlightCssClass="validatorCalloutHighlight" />
                            <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender3" TargetControlID="RegularExpressionValidatortxtUnit" HighlightCssClass="validatorCalloutHighlight" />
                        </td>
                        <td style="width: 40%;padding-left:10px">
                            <asp:Button ID="btnAddUnit" runat="server" Text="Save" CssClass="btn green" OnClick="btnAddUnit_OnClick" ValidationGroup="unit" />
                        </td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: .5cm">
        <div class="col-md-12">

                <asp:GridView ID="GridUnitDetails" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" CssClass="gridrowAlternaterow" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridUnitDetails_PageIndexChanging" PageSize="15">
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
                                <asp:Label ID="lblUnitId" runat="server" Text='<%# Eval("uintId") %>'></asp:Label>
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
                        <asp:TemplateField HeaderText="Unit Description" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <asp:Label ID="lblunitDescription" runat="server" Text='<%# Eval("unitDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" HeaderStyle-Width="15%">
                            <ItemTemplate>
                                <asp:Label ID="lblProductCreatedDate" runat="server" Text='<%# Eval("unitCreatedDate", "{0:M-dd-yyyy}") %>'></asp:Label>
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
