<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Fevicol.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Login</title>

    <meta content="width=device-width, initial-scale=1" name="viewport" />
    <meta content="#1 selling multi-purpose bootstrap admin theme sold in themeforest marketplace packed with angularjs, material design, rtl support with over thausands of templates and ui elements and plugins to power any type of web applications including saas and admin dashboards. Preview page of Theme #1 for "
        name="description" />
    <meta content="" name="author" />
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <link href="assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="assets/pages/css/login.min.css" rel="stylesheet" type="text/css" />
    <!-- END PAGE LEVEL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
</head>
<body class="login">
    <form id="form1" runat="server">
        <div>
            <!-- BEGIN LOGO -->
            <div class="logo" style="color: aliceblue">
               
                   <h3>Shams Trading Corporation</h3>
            </div>
            <!-- END LOGO -->
            <!-- BEGIN LOGIN -->
            <div class="content">
                <!-- BEGIN LOGIN FORM -->
                <div class="login-form" action="index.html" method="post">
                    <h3 class="form-title font-green">Sign In</h3>
                    <div class="alert">
                        <asp:Label ID="lblLoginMessage" runat="server" CssClass="alert alert-danger" Visible="False">
                                 <button class="close" data-close="alert"></button>
                        </asp:Label>
                    </div>
                    <div class="form-group">
                        <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                        <label class="control-label visible-ie8 visible-ie9">Username</label>
                        <asp:TextBox ID="txtUserName" runat="server" placeholder="Username" CssClass="form-control form-control-solid placeholder-no-fix"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label class="control-label visible-ie8 visible-ie9">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" placeholder="Password" CssClass="form-control form-control-solid placeholder-no-fix" TextMode="Password"></asp:TextBox>
                    </div>
                    <div class="form-actions">
                        <asp:Button ID="btnLogin" runat="server" Text="Login"  CssClass="btn green uppercase" OnClick="btnLogin_OnClick"/>
                    </div>

                </div>

            </div>
            <div class="copyright">2017 © Shams Trading Corporation</div>
        </div>
    </form>
    <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN PAGE LEVEL PLUGINS -->
    <script src="assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-validation/js/additional-methods.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN PAGE LEVEL SCRIPTS -->
    <script src="assets/pages/scripts/login.min.js" type="text/javascript"></script>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <!-- END THEME LAYOUT SCRIPTS -->
    <!-- BEGIN CORE PLUGINS -->
</body>
</html>
