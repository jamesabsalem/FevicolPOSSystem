<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/OrdMasterPage.Master" AutoEventWireup="true" CodeBehind="ProductsOrder.aspx.cs" Inherits="Fevicol.Orders.ProductsOrder" %>

<%@ Register Assembly="DevExpress.Web.v16.2, Version=16.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit, Version=17.1.0.0, Culture=neutral, PublicKeyToken=28f01b0e84b6d53e" %>


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
            }
            if (uPrice.length > 0) {
                unitPrice = uPrice;
            }
            total = parseFloat(oQty) * parseFloat(unitPrice);
            document.getElementById(txtTotalAmount).value = total.toFixed(2);
        }
    </script>
    <script type="text/javascript">

        function FPPOReport(invoice) {
            window.open("OrderReport.aspx?x=" + invoice + "");
        }
        function orderDetailsView(invoiceNo) {
            $("#hdrtxt").html("Order Details");
            $("#ifupldfile").attr("src", "OrderDetailsView.aspx?x=" + invoiceNo + "");
            var bid = $find('ppadditm');
            bid.show();
        }
    </script>
    <script src="../Scripts/jquery-3.1.1.js"></script>

    <dx:ASPxPageControl ID="PurchesInvoice" runat="server" ActiveTabIndex="0" EnableHierarchyRecreation="True">
        <TabPages>
            <dx:TabPage Text="Create Purches Order">
                <ContentCollection>
                    <dx:ContentControl ID="CreatePurchesOrder" runat="server">
                        <div>
                            <div class="col-md-12 well">
                                <label class="col-md-1 control-label form-group">Dealer Name</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlDealer" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorProductGroup" runat="server" ErrorMessage="Please Select Delaler" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlDealer" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="reqDealer" TargetControlID="RequiredFieldValidatorProductGroup" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <label class="col-md-1 control-label form-group">Product Group</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="form-control form-group" OnSelectedIndexChanged="ddlProductGroup_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Select Product Group" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlProductGroup" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender1" TargetControlID="RequiredFieldValidator1" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <label class="col-md-1 control-label form-group">Product Name</label>
                                <div class="col-md-2">

                                    <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control form-group" OnSelectedIndexChanged="ddlProducts_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Select Product Name" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlProducts" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender2" TargetControlID="RequiredFieldValidator2" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <label class="col-md-1 control-label form-group">Product Size</label>
                                <div class="col-md-2">

                                    <asp:DropDownList ID="ddlSize" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Select Product Size" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlSize" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender3" TargetControlID="RequiredFieldValidator3" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <label class="col-md-1 control-label form-group">Unit</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlUnit" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Select Product Unit" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlUnit" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender4" TargetControlID="RequiredFieldValidator7" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <label class="col-md-1 control-label form-group">Quantity</label>
                                <div class="col-md-2">

                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control form-group"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Insert Quantity" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtQuantity" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender5" TargetControlID="RequiredFieldValidator4" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <label class="col-md-1 control-label form-group">Unit Price</label>
                                <div class="col-md-2">

                                    <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control form-group"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Insert Unit Price" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="txtUnitPrice" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender6" TargetControlID="RequiredFieldValidator5" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <label class="col-md-1 control-label form-group">Total Amount</label>
                                <div class="col-md-2">
                                    <asp:TextBox ID="txtTotalAmount" runat="server" CssClass="form-control form-group"></asp:TextBox>
                                    <asp:Label ID="lblTotalValue" runat="server" Visible="False"></asp:Label>
                                </div>
                                <label class="col-md-1 control-label form-group">Sales Person</label>
                                <div class="col-md-2">
                                    <asp:DropDownList ID="ddlSalesPerson" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Select Product Group" SetFocusOnError="True" CssClass="label label-danger" ControlToValidate="ddlSalesPerson" InitialValue="" ValidationGroup="ProductOrder" Display="None"></asp:RequiredFieldValidator>
                                    <asp:ValidatorCalloutExtender runat="Server" ID="ValidatorCalloutExtender7" TargetControlID="RequiredFieldValidator6" HighlightCssClass="validatorCalloutHighlight" />
                                </div>
                                <div class="col-md-offset-6 col-md-3" style="text-align: right">
                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn yellow" OnClick="btnClear_OnClick" />
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn green" OnClick="btnAdd_OnClick" ValidationGroup="ProductOrder" />
                                </div>
                            </div>
                            <div class="col-md-12 well" style="height: 350px;">
                                <asp:GridView ID="GridItemDetais" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="100%" OnRowDataBound="GridItemDetais_OnRowDataBound" ShowFooter="True">
                                    <AlternatingRowStyle CssClass="gridrowAlternaterow" />
                                    <Columns>
                                        <asp:TemplateField HeaderText="Item Details Id" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGroupId" runat="server" Text='<%# Eval("groupId") %>'></asp:Label>
                                                <asp:Label ID="lblProductId" runat="server" Text='<%# Eval("productId") %>'></asp:Label>
                                                <asp:Label ID="lblSizeId" runat="server" Text='<%# Eval("sizeId") %>'></asp:Label>
                                                <asp:Label ID="lblUnitId" runat="server" Text='<%# Eval("unitId") %>'></asp:Label>
                                                <asp:Label ID="lblPerson" runat="server" Text='<%# Eval("personId") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sales Person">
                                            <ItemTemplate>
                                                <asp:Label ID="lblPersonName" runat="server" Text='<%# Eval("personName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Group">
                                            <ItemTemplate>
                                                <asp:Label ID="lblGroupName" runat="server" Text='<%# Eval("groupName") %>'></asp:Label>
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
                                    <asp:Button ID="btnAllClear" runat="server" Text="Clear" CssClass="btn btn green" OnClick="btnAllClear_OnClick" />
                                    <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn green" OnClick="btnSave_OnClick" />
                                </div>
                            </div>
                        </div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <%--<dx:TabPage Text="Order Details">
                <ContentCollection>
                    <dx:ContentControl ID="PurchesOrderDetails" runat="server">
                        <div>
                            <div class="col-md-12">
                                <dx:ASPxGridView ID="GridInvoiceDetails" runat="server" Width="100%" AutoGenerateColumns="False" Theme="BlackGlass">
                                    <Columns>
                                        <dx:GridViewDataColumn Caption="Report">
                                            <DataItemTemplate>
                                                <a class="link" style="padding-left: 4px; padding-right: 6px" href="javascript:FPPOReport('<%# Eval("invhId") %>')">Report</a>
                                            </DataItemTemplate>
                                        </dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn FieldName="invhId" Caption="Invoice No" SortOrder="Descending" />
                                        <dx:GridViewDataColumn FieldName="dealerName" Caption="Dealer Name" />
                                        <dx:GridViewDataColumn FieldName="dealerAddress" Caption="Delear Address" />
                                        <dx:GridViewDataColumn FieldName="invhAmount" Caption="Total Amount" />
                                        <dx:GridViewDataColumn FieldName="userName" Caption="Created By" />
                                        <dx:GridViewDataColumn FieldName="invhCreatedDate" Caption="Created Date" />
                                    </Columns>
                                    <Settings ShowFilterRow="True" />
                                </dx:ASPxGridView>
                            </div>
                        </div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>--%>
            <dx:TabPage Text="Order Details">
                <ContentCollection>
                    <dx:ContentControl ID="PurchesOrderDetails" runat="server">
                        <div class="col-md-12">
                                <dx:ASPxGridView ID="GridInvoiceDetails" runat="server" Width="100%" AutoGenerateColumns="False">
                                    <Columns>
                                        <%--<dx:GridViewDataColumn Caption="View">
                                            <DataItemTemplate>
                                                <a class="link" style="padding-left: 4px; padding-right: 6px" href="javascript:orderDetailsView('<%# Eval("invhId") %>')">View</a>
                                            </DataItemTemplate>
                                        </dx:GridViewDataColumn>--%>
                                        <dx:GridViewDataColumn Caption="View">
                                            <DataItemTemplate>
                                                <%--<asp:LinkButton ID="lnkBtnReport" runat="server" CommandArgument='<%# Eval("invhInvoiceNo") %>' OnClick="lnkBtnReport_OnClick">Report</asp:LinkButton>--%>
                                                <a class="link" style="padding-left: 4px; padding-right: 6px" href="javascript:FPPOReport('<%# Eval("invhId") %>')">View</a>
                                            </DataItemTemplate>
                                        </dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn FieldName="invhId" Caption="Invoice No" SortOrder="Descending" />
                                        <dx:GridViewDataColumn FieldName="dealerName" Caption="Dealer Name" />
                                        <dx:GridViewDataColumn FieldName="dealerAddress" Caption="Delear Address" />
                                        <dx:GridViewDataColumn FieldName="invhAmount" Caption="Total Amount" />
                                        <dx:GridViewDataColumn FieldName="userName" Caption="Created By" />
                                        <dx:GridViewDataColumn FieldName="invhCreatedDate" Caption="Created Date" />
                                    </Columns>
                                    <Settings ShowFilterRow="True" />
                                </dx:ASPxGridView>
                            </div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
