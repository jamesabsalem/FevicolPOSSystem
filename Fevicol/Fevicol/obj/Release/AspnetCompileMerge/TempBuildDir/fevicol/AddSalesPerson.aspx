<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/SetMasterPage.Master" AutoEventWireup="true" CodeBehind="AddSalesPerson.aspx.cs" Inherits="Fevicol.Settings.AddSalesPerson" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
        <div class="col-md-12" style="width:100%">
            <table>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblSalesPersonName" runat="server" Text="Person Name" CssClass="control-label form-group"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtSalesPersonName" runat="server" CssClass="form-control form-group"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter The Person Name." SetFocusOnError="True" ControlToValidate="txtSalesPersonName" ValidationGroup="a" CssClass="label label-danger" Display="none"></asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="reqDealer" TargetControlID="RequiredFieldValidator1" HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                    <td style="width: 40%"></td>
                </tr>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblPhoneNo" runat="server" Text="Phone Number" CssClass="control-label form-group"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtPhoneNo" runat="server" CssClass="form-control form-group"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter The Phone Number." SetFocusOnError="True" ControlToValidate="txtPhoneNo" ValidationGroup="a" CssClass="label label-danger" Display="none"></asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator2" HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                    <td style="width: 40%"></td>
                </tr>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblAddress" runat="server" Text="Address" CssClass="control-label form-group"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control form-group"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter The Address." SetFocusOnError="True" ControlToValidate="txtAddress" ValidationGroup="a" CssClass="label label-danger" Display="none"></asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidator3" HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                    <td style="width: 40%; padding-left: 10px">
                        <asp:Button ID="btnAddPerson" runat="server" Text="Save" CssClass="btn green" OnClick="btnAddPerson_OnClick" ValidationGroup="a" />
                    </td>
                </tr>
            </table>
        </div>

    </div>
    <div class="row" style="padding-top: 10px">
        <div class="col-md-12">
            <asp:GridView ID="GridSalesPersonDetails" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridSalesPersonDetails_OnPageIndexChanging" PageSize="15">
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerSettings Mode="NumericFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Prev" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" CssClass="gridViewPager td" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />


                <Columns>
                    <asp:TemplateField HeaderText="Sales Persons Details" Visible="False">
                        <ItemTemplate>
                            <%--<asp:Label ID="lblDealerId" runat="server" Text='<%# Eval("dealerId") %>'></asp:Label>--%>
                            <asp:Label ID="lblSalesPersonId" runat="server" Text='<%# Eval("salesPersonId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#" HeaderStyle-Width="3%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" HeaderStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Label ID="lblSalesPersonName" runat="server" Text='<%# Eval("salesPersonName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" HeaderStyle-Width="33%">
                        <ItemTemplate>
                            <asp:Label ID="lblSalesPersonAddress" runat="server" Text='<%# Eval("salesPersonAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lblSalesPersonPhone" runat="server" Text='<%# Eval("salesPersonPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User" HeaderStyle-Width="9%">
                        <ItemTemplate>
                            <asp:Label ID="lblProductCreatedDate" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lblSalesPersonCreatedDate" runat="server" Text='<%# Eval("salesPersonCreateDate", "{0:M-dd-yyyy}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

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
