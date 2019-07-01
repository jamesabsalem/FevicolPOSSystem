<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/OrdMasterPage.Master" AutoEventWireup="true" CodeBehind="InvProductReceive.aspx.cs" Inherits="Fevicol.Inventory.InvProductReceive" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/javascript">
    function calcval(txtQuantity, txtUnitPrice, txtTotalAmount) {
        var orderQty = document.getElementById(txtQuantity).value;
        var uPrice = document.getElementById(txtUnitPrice).value;
        var oQty = 0;
        var unitPrice = 0;
        var total = 0;
        if (orderQty.length > 0) {
            oQty = orderQty;
        }if (uPrice.length > 0) {
            unitPrice = uPrice;
        }
        total = parseFloat(oQty) * parseFloat(unitPrice);
        document.getElementById(txtTotalAmount).value = total.toFixed(2);
    }
</script>
<script type="text/javascript">
    function FPPOReport(invoice) {
        window.open("../fevicol/InvReport.aspx?x=" + invoice + "");
    }</script>
<script src="../Scripts/jquery-3.1.1.js"></script>

<dx:ASPxPageControl ID="ReceiveInvoice" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True">
    <TabPages>
        <dx:TabPage Text="Receive Product">
            <ContentCollection>
                <dx:ContentControl ID="CreatePurchesOrder" runat="server">
                    <div class="row">
                        <div class="col-md-12">
                            <label class="col-md-1 control-label">Invoice No</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtReceiveInvoiceNo" runat="server" CssClass="form-control input-group"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorInvoice" runat="server" ErrorMessage="Please Enter Invoice Number" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtReceiveInvoiceNo" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <label class="col-md-1 control-label">Product Group</label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProductGroup_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductGroup" runat="server" ErrorMessage="Please Select Product Group" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlProductGroup" InitialValue="" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <label class="col-md-1 control-label">Product Name</label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlProducts_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductName" runat="server" ErrorMessage="Please Select Product Name" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlProducts" InitialValue="" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <label class="col-md-1 control-label">Product Size</label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlSize" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductSize" runat="server" ErrorMessage="Please Select Product Size" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlSize" InitialValue="" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <label class="col-md-1 control-label">Unit</label>
                            <div class="col-md-2">
                                <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control"></asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="" ID="RequiredFieldValidatorUnit" runat="server" ErrorMessage="Please Select Unit" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlUnit" Display="Dynamic" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <label class="col-md-1 control-label">Quantity</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorQuantity" runat="server" ErrorMessage="Please Enter Quantity" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtQuantity" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorQuantity" runat="server" ErrorMessage="Please Enter Only Numbers" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtQuantity" ValidationExpression="^\d+$" ValidationGroup="productAdd"></asp:RegularExpressionValidator>
                                <br />
                            </div>
                            <label class="col-md-1 control-label">Unit Price</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUnitPrice" runat="server" ErrorMessage="Please Enter Unit Price" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtUnitPrice" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxUnitPrice" runat="server" Enabled="True" 
                                                             TargetControlID="txtUnitPrice" ValidChars="0123456789." >
                                </asp:FilteredTextBoxExtender><br />
                            </div>
                            <label class="col-md-1 control-label">Total Amount</label>
                            <div class="col-md-2">
                                <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lblTotalValue" runat="server" Visible="False"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorTotalValue" runat="server" ErrorMessage="Please Enter Total Price" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtTotalAmount" ValidationGroup="productAdd"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidatorTotalValue" runat="server" ErrorMessage="Please Enter Only Numbers" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtTotalAmount" ValidationExpression="((\d+)((\.\d{1,2})?))$" ValidationGroup="productAdd" Display="Dynamic"></asp:RegularExpressionValidator>
                                <br />
                            </div>
                            <div class="col-md-offset-9 col-md-3" style="text-align: right">
                                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn yellow" OnClick="btnClear_OnClick" />
                                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn green" ValidationGroup="productAdd" OnClick="btnAdd_OnClick" />
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="col-md-12 well Container" style="height: 350px;">
                                <br />
                                <br />
                                <asp:GridView ID="GridItemDetais" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" OnRowDataBound="GridItemDetais_OnRowDataBound" ShowFooter="True">
                                    <AlternatingRowStyle CssClass="gridrowAlternaterow" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Item Details Id" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgroupId" runat="server" Text='<%# Eval("groupId") %>'></asp:Label>
                                                <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                                                <asp:Label ID="lblSizeId" runat="server" Text='<%# Eval("sizeId") %>'></asp:Label>
                                                <asp:Label ID="lblUnitId" runat="server" Text='<%# Eval("unitId") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Group">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgroupName" runat="server" Text='<%# Eval("groupName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product">
                                            <ItemTemplate>
                                                <asp:Label ID="lblProductName" runat="server" Text='<%# Eval("productName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                                <asp:Label ID="lblSizeDes" runat="server" Text='<%# Eval("sizeDes") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Quantity">
                                            <ItemTemplate>
                                                <asp:Label ID="lblQuantity" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUnitDes" runat="server" Text='<%# Eval("unitDes") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit Price">
                                            <ItemTemplate>
                                                <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("unitPrice") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTotalAmount" runat="server" Text='<%# Eval("totalAmount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <HeaderStyle CssClass="gridheader" />
                                    <RowStyle CssClass="gridrow" />
                                </asp:GridView>
                            </div>
                            <div class="col-md-12">
                                <div class="col-md-offset-10 col-md-2" style="text-align: right">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn green" OnClick="btnSave_OnClick" />
                                </div>
                            </div>
                        </div>
                    </div>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
        <dx:TabPage Text="Receive Product Details">
            <ContentCollection>
                <dx:ContentControl ID="PurchesOrderDetails" runat="server">
                    <div class="col-md-12">
                        <div class="col-md-12" style="height: 400px; padding-top: 10px; width: 100%">
                            <dx:ASPxGridView ID="GridGoodsReceiveDetails" runat="server" Width="100%" AutoGenerateColumns="False" Theme="BlackGlass">
                                <Columns>
                                    <dx:GridViewDataColumn Caption="View">
                                        <DataItemTemplate>
                                            <a class="link" style="padding-left: 4px; padding-right: 6px" href="javascript:FPPOReport('<%# Eval("grhId") %>')">View</a>
                                        </DataItemTemplate>
                                    </dx:GridViewDataColumn>
<%--                                    <dx:GridViewDataColumn Caption="Report">
                                        <DataItemTemplate>
                                            <%--<asp:LinkButton ID="lnkBtnReport" runat="server" CommandArgument='<%# Eval("invhInvoiceNo") %>' OnClick="lnkBtnReport_OnClick">Report</asp:LinkButton>
                                            <a class="link" style="padding-left: 4px; padding-right: 6px" href="javascript:FPPOReport('<%# Eval("grhId") %>')">Report</a>
                                        </DataItemTemplate>
                                    </dx:GridViewDataColumn>--%>
                                    <dx:GridViewDataColumn FieldName="grhInvoiceNo" Caption="Invoice No" SortOrder="Descending" />
                                    <dx:GridViewDataColumn FieldName="grhInvoiceTotalAmount" Caption="Total Amount" />
                                    <dx:GridViewDataColumn FieldName="userName" Caption="Receive By" />
                                    <dx:GridViewDataColumn FieldName="grhCreateDate" Caption="Receive Date" />
                                </Columns>
                                <Settings ShowFilterRow="True" />
                            </dx:ASPxGridView>
                        </div>
                    </div>
                </dx:ContentControl>
            </ContentCollection>
        </dx:TabPage>
    </TabPages>
</dx:ASPxPageControl>
<script>
    //$(document.ready(function() {
    //    var orderQty = $("#txtQuantity").val();
    //    var unitPrice = $("txtUnitPrice").val();
    //    var oQty = 0;
    //    var uPrice = 0;
    //    if (orderQty>0) {
    //        oQty = orderQty;
    //    }
    //    if (unitPrice>0) {
    //        uPrice = unitPrice;
    //    }
    //    var total = parseFloat(oQty) * parseFloat(uPrice);
    //    $("txtQuantity").keyup(function () {
    //        $("txtTotalAmount").value = total;
    //    });
    //    $("txtUnitPrice").keyup(function () {
    //        $("txtTotalAmount").value = total;
    //    });
    //}))
    //$(document).ready(function () {
    //    $("txtQuantity").keyup(function () {
    //        alert("Hello");
    //    });

    //})

</script>
</asp:Content>
