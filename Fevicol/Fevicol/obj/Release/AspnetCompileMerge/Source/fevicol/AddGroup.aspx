<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/SetMasterPage.Master" AutoEventWireup="true" CodeBehind="AddGroup.aspx.cs" Inherits="Fevicol.Settings.AddGroup" EnableViewState="true" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function DisableBackButton() {
            window.history.forward();
        }
        DisableBackButton();
        window.onload = DisableBackButton;
        window.onpageshow = function (evt) { if (evt.persisted) DisableBackButton() }
        window.onunload = function () { void (0) }
    </script>
   
    <div class="row">
        <div class="col-md-8">
            <div class="col-md-4">
                <asp:Label ID="lblProductGroup" runat="server" Text="Product Group" CssClass="control-label form-group"></asp:Label>
            </div>
            <div class="col-md-4">
                <asp:TextBox ID="txtProductGroup" runat="server" CssClass="form-control  form-group"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductGroup" runat="server" ErrorMessage="Required Group Name" ControlToValidate="txtProductGroup" SetFocusOnError="True" CssClass="label label-danger" ValidationGroup="group" Display="none"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidatorProductGroup" runat="server" ControlToValidate="txtProductGroup" ValidationExpression="^[\s\S]{2,98}$" ValidationGroup="group" ErrorMessage="Minimum 2 and Maximum 98 characters required." SetFocusOnError="True" CssClass="label label-danger"></asp:RegularExpressionValidator>
                   <asp:ValidatorCalloutExtender runat="Server" ID="reqDealer" TargetControlID="RequiredFieldValidatorProductGroup" HighlightCssClass="validatorCalloutHighlight"/>
            </div>
            <div class="col-md-4" style="text-align: right">
                <asp:Button ID="btnAddProductGroup" runat="server" ValidationGroup="group" Text="Save" CssClass="btn green" OnClick="btnAddProductGroup_OnClick" />
            </div>
        </div>
    </div>
    <div class="row" style="padding-top: 1px">
        <div class="col-md-12">
                <asp:GridView ID="GridProductGroup" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" AutoGenerateColumns="False" GridLines="None" CssClass="gridrowAlternaterow" AllowPaging="True" OnPageIndexChanging="GridProductGroup_PageIndexChanging" PageSize="15">
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
                        <asp:TemplateField HeaderText="Products Group Details" Visible="False">
                            <ItemTemplate>
                                <asp:Label ID="lblGroupId" runat="server" Text='<%# Eval("groupId") %>'></asp:Label>
                                <asp:Label ID="lblCretedBy" runat="server" Text='<%# Eval("groupCreateBy") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#" HeaderStyle-Width="3%">
                            <ItemTemplate>
                                <%# Container.DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Group Name" HeaderStyle-Width="50%">
                            <ItemTemplate>
                                <asp:Label ID="lblGroupName" runat="server" Text='<%# Eval("groupDescription") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User" HeaderStyle-Width="20%">
                            <ItemTemplate>
                                <asp:Label ID="lblUserName" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Date" HeaderStyle-Width="22%">
                            <ItemTemplate>
                                <asp:Label ID="lblProductCreatedDate" runat="server" Text='<%# Eval("groupCreateDate", "{0:M-dd-yyyy}") %>'></asp:Label>
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
