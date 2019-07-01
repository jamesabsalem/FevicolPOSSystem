<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/OrdMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderAllReport.aspx.cs" Inherits="Fevicol.Orders.OrderAllReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--*********************************************************************--%>




    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="../assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="../assets/global/plugins/clockface/css/clockface.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->

    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <%--*********************************************************************--%>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light portlet-fit bordered">
                <div class="portlet-title">
                    <div class="caption">
                        <span class="caption-subject bold font-green uppercase fa-align-center">All Report
                        </span>
                    </div>
                </div>
                <div class="portlet-body">

                        <asp:RadioButton ID="rbSalesDetails" runat="server" CssClass="radio" GroupName="a" Text="Sales Details Report" />
          
                  <%--  <div class="col-md-4">
                        <asp:RadioButton ID="rbSalesSummary" runat="server" CssClass="radio" GroupName="a" Text="Sales Summery Report" />
                    </div>
                    <div class="col-md-4">
                        <asp:RadioButton ID="rdAllReport" runat="server" CssClass="radio" GroupName="a" Text="All Details Report" />
                    </div>--%>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-offset-3 col-md-6">
                <label class="col-md-6 control-label form-group">Dealer Name</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlDealer" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                </div>
                <label class="col-md-6 control-label form-group">Product Group</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlProductGroup" runat="server" CssClass="form-control form-group" OnSelectedIndexChanged="ddlProductGroup_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>
                <label class="col-md-6 control-label form-group">Product Name</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control form-group" OnSelectedIndexChanged="ddlProducts_OnSelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                </div>
                <label class="col-md-6 control-label form-group">Product Size</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlSize" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                </div>
                <label class="col-md-6 control-label form-group">Sales Person</label>
                <div class="col-md-6">
                    <asp:DropDownList ID="ddlSalesPerson" runat="server" CssClass="form-control form-group"></asp:DropDownList>
                </div>
                <div class="col-md-6">
                    <label class="control-label form-group">Date Range</label>
                </div>
                <div class="col-md-6">
                    <div class="input-group input-large date-picker input-daterange" data-date="10/11/2012" data-date-format="mm/dd/yyyy">
                        <asp:TextBox ID="fromDate" runat="server" type="text" class="form-control form-group" name="from" Width="170px"></asp:TextBox>
                        <span class="input-group-addon">to </span>
                        <asp:TextBox ID="toDate" runat="server" type="text" class="form-control form-group" name="to" Width="170px"></asp:TextBox>
                    </div>
                </div>
                <div class="col-md-6" style="text-align: right">
                    <br/>
                    <asp:Button ID="btnClear" CssClass="btn btn green" runat="server" Text="Clear" OnClick="btnClear_OnClick" />
                    <asp:Button ID="btnGenerateReport" runat="server" Text="Generate Report" CssClass="btn btn green" OnClick="btnGenerateReport_OnClick" />
                </div>
            </div>
        </div>
    </div>
    <%--*********************************************************************--%>
    
    <script src="../assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="../assets/global/plugins/moment.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
    <script src="../assets/global/plugins/clockface/js/clockface.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="../assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="../assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME LAYOUT SCRIPTS -->

    <%--**********************************************************************--%>
</asp:Content>
