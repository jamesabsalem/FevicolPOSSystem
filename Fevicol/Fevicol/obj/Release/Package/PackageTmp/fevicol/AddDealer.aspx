<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/SetMasterPage.Master" AutoEventWireup="true" CodeBehind="AddDealer.aspx.cs" Inherits="Fevicol.Settings.AddDealer" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <table>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblDealerName" runat="server" Text="Dealer Name" CssClass="control-label form-group"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtDealerName" runat="server" CssClass="form-control form-group"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDealerName" runat="server" ErrorMessage="Required Dealer Name" ControlToValidate="txtDealerName" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="dealer" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorDealerName" runat="server" ControlToValidate="txtDealerName" ValidationExpression="^[\s\S]{2,98}$" ValidationGroup="dealer" ErrorMessage="Minimum 5 and Maximum 98 characters required." SetFocusOnError="True" CssClass="label label-danger"></asp:RegularExpressionValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="reqDealer" TargetControlID="RequiredFieldValidatorDealerName" HighlightCssClass="validatorCalloutHighlight"/>
                    </td>
                    <td style="width: 40%"></td>
                </tr>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblDealerAddress" runat="server" Text="Dealer Address" CssClass="control-label form-group"></asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtDealerAddress" runat="server" CssClass="form-control form-group" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDealerAddress" runat="server" ErrorMessage="Required Dealer Address" ControlToValidate="txtDealerAddress" ValidationGroup="dealer" SetFocusOnError="True" CssClass="label label-danger" Display="None"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidatorDealerAddress" runat="server" ControlToValidate="txtDealerAddress" ValidationExpression="^[\s\S]{2,98}$" ValidationGroup="dealer" ErrorMessage="Minimum 5 and Maximum 98 characters required." SetFocusOnError="True" CssClass="label label-danger"></asp:RegularExpressionValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidatorDealerAddress" HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                    <td style="width: 40%"></td>
                </tr>
                <tr>
                    <td style="width: 30%">
                        <asp:Label ID="lblDealerPhone" runat="server" Text="Dealer Phone No." CssClass="control-label form-group">                   
                        </asp:Label>
                    </td>
                    <td style="width: 30%">
                        <asp:TextBox ID="txtDealerPhone" runat="server" CssClass="form-control form-group"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorDealerPhone" runat="server" ErrorMessage="Required Dealer Phone Number" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="dealer" ControlToValidate="txtDealerPhone" Display="None"></asp:RequiredFieldValidator>
                        <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidatorDealerPhone" HighlightCssClass="validatorCalloutHighlight" />
                    </td>
                    <td style="width: 40%;padding-left: 10px">
                        <asp:Button ID="btnAddDealer" runat="server" Text="Save" CssClass="btn green form-group" OnClick="btnAddDealer_OnClick" ValidationGroup="dealer" />

                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12" style="padding-top: 5px">
            <asp:GridView ID="GridDealerDetails" Width="100%" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridDealerDetails_PageIndexChanging" PageSize="10">
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
                    <asp:TemplateField HeaderText="Dealer Details" Visible="False">
                        <ItemTemplate>
                            <asp:Label ID="lblDealerId" runat="server" Text='<%# Eval("dealerId") %>'></asp:Label>
                            <asp:Label ID="lblUserId" runat="server" Text='<%# Eval("userId") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="#" HeaderStyle-Width="3%">
                        <ItemTemplate>
                            <%# Container.DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name" HeaderStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Label ID="lbldealerName" runat="server" Text='<%# Eval("dealerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Address" HeaderStyle-Width="33%">
                        <ItemTemplate>
                            <asp:Label ID="lbldealerAddress" runat="server" Text='<%# Eval("dealerAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Phone" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lbldealerPhone" runat="server" Text='<%# Eval("dealerPhone") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="User" HeaderStyle-Width="9%">
                        <ItemTemplate>
                            <asp:Label ID="lblProductCreatedDate" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Date" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label ID="lbldealerCreatedDate" runat="server" Text='<%# Eval("dealerCreatedDate", "{0:M-dd-yyyy}") %>'></asp:Label>
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
