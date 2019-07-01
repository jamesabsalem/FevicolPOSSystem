<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/OrdMasterPage.Master" AutoEventWireup="true" CodeBehind="InvoiceCollection.aspx.cs" Inherits="Fevicol.Orders.InvoiceCollection" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div>
                <label class="col-md-1 control-label">Invoice Number</label>
                <div class="col-md-2">
                    <asp:TextBox ID="txtInvoiceNumber" runat="server" CssClass="form-control control-group" AutoPostBack="True" OnTextChanged="txtInvoiceNumber_OnTextChanged" TextMode="Number"></asp:TextBox>
                </div>
                 <label class="col-md-1 control-label">Due Amount</label>
                <div class="col-md-2">
                    <asp:TextBox ID="txtDueAmount" runat="server" CssClass="form-control control-group" Enabled="false"></asp:TextBox>
                </div>
                <label class="col-md-1 control-label">Collection</label>
                <div class="col-md-2">
                    <asp:TextBox ID="txtInvoiceCollection" runat="server" CssClass="form-control control-group"></asp:TextBox>
                </div>
                <div class="col-md-3" style="text-align: left">
                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn green" OnClick="btnSave_OnClick" />
                </div>
            </div>
        </div>
    </div>
    <hr />
    <div class="row">
        <div class="col-md-12">
            <%--  <asp:GridView ID="GridInvoiceCollection" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%">
                <AlternatingRowStyle CssClass="gridrowAlternaterow" />
                <Columns>
                    <asp:TemplateField HeaderText="Invoice NO">
                        <ItemTemplate>
                            <asp:Label ID="lblInvoiceNo" runat="server" Text='<%# Eval("colInvoiceNo") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Dealer Name">
                        <ItemTemplate>
                            <asp:Label ID="lblDealerName" runat="server" Text='<%# Eval("dealerName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Received Amount">
                        <ItemTemplate>
                            <asp:Label ID="lblReceivedAmount" runat="server" Text='<%# Eval("colAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Balance Amount">
                        <ItemTemplate>
                            <asp:Label ID="lblBalanceAmount" runat="server" Text='<%# Eval("invBalanceAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Amount">
                        <ItemTemplate>
                            <asp:Label ID="lblTotalAmount" runat="server" Text='<%# Eval("invhAmount") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                   <asp:TemplateField HeaderText="Received By">
                        <ItemTemplate>
                            <asp:Label ID="lblReceivedDate" runat="server" Text='<%# Eval("userName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Received Date">
                        <ItemTemplate>
                            <asp:Label ID="lblReceivedDate" runat="server" Text='<%# Eval("colCreatedDate") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle CssClass="gridheader" />
                                        <RowStyle CssClass="gridrow" />
            </asp:GridView>--%>
            <dx:ASPxGridView ID="GridInvoiceCollection" runat="server" Width="100%" AutoGenerateColumns="False" Theme="BlackGlass">
                <Columns>
                    <dx:GridViewDataColumn Caption="View">
                        <DataItemTemplate>
                            <%-- <a class="link" style="padding-left: 4px; padding-right: 6px" href="javascript:orderDetailsView('<%# Eval("invhId") %>')">View</a>--%>
                        </DataItemTemplate>
                    </dx:GridViewDataColumn>

                    <dx:GridViewDataColumn FieldName="colInvoiceNo" Caption="Invoice No" SortOrder="Descending" />
                    <dx:GridViewDataColumn FieldName="dealerName" Caption="Dealer Name" />
                    <dx:GridViewDataColumn FieldName="colAmount" Caption="Collected Amount" />
                    <dx:GridViewDataColumn FieldName="invBalanceAmount" Caption="Balance Amount" />
                    <dx:GridViewDataColumn FieldName="invhAmount" Caption="Total Amount" />
                    <dx:GridViewDataColumn FieldName="userName" Caption="Collected By" />
                    <dx:GridViewDataColumn FieldName="colCreatedDate" Caption="Collected Date" />
                </Columns>
            </dx:ASPxGridView>
        </div>
    </div>
</asp:Content>
