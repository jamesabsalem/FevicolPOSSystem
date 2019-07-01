<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Gsolution.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME GLOBAL STYLES -->
    <link href="assets/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
    <link href="assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME GLOBAL STYLES -->
    <!-- BEGIN THEME LAYOUT STYLES -->
    <link href="assets/layouts/layout/css/layout.min.css" rel="stylesheet" type="text/css" />
    <link href="assets/layouts/layout/css/themes/darkblue.min.css" rel="stylesheet" type="text/css" id="style_color" />
    <link href="assets/layouts/layout/css/custom.min.css" rel="stylesheet" type="text/css" />
    <!-- END THEME LAYOUT STYLES -->
    <link rel="shortcut icon" href="favicon.ico" />
     <script type="text/javascript">
        window.history.forward();
    </script>
</head>
<body class="page-header-fixed page-sidebar-closed-hide-logo page-content-white page-full-width">
    <form id="form1" runat="server">
        <div>
            <div class="page-wrapper">
                <!-- BEGIN HEADER -->
                <div class="page-header navbar navbar-fixed-top">
                    <!-- BEGIN HEADER INNER -->
                    <div class="page-header-inner ">
                        <!-- BEGIN LOGO -->
                        
                        <!-- END LOGO -->

                        <!-- END LOGO -->

                        <div class="hor-menu   hidden-sm hidden-xs">
                            <ul class="nav navbar-nav">
                                <li class="classic-menu-dropdown">
                                    <a href="#"><b>Shams Trading Corporation <asp:Label ID="lblCompanyName" runat="server"></asp:Label></b>
                                        <span class="selected"></span>
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <!-- END MEGA MENU -->


                        <!-- BEGIN TOP NAVIGATION MENU -->
                        <div class="top-menu">
                            <ul class="nav navbar-nav pull-right">
                                <!-- BEGIN USER LOGIN DROPDOWN -->
                                <li class="dropdown dropdown-user">
                                    <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                        <asp:Image ID="ImgUser" runat="server" class="img-circle" />
                                        <span class="username username-hide-on-mobile">
                                            <asp:Label ID="lblUserName" runat="server"></asp:Label>
                                        </span>
                                        <i class="fa fa-angle-down"></i>
                                    </a>
                                    <ul class="dropdown-menu dropdown-menu-default">
                                        <li>
                                            <a href="#">
                                                <i class="icon-user"></i>My Profile </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="icon-calendar"></i>My Calendar </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="icon-envelope-open"></i>My Inbox
                                           
                                                <span class="badge badge-danger">3 </span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="#">
                                                <i class="icon-rocket"></i>My Tasks
                                           
                                                <span class="badge badge-success">7 </span>
                                            </a>
                                        </li>
                                        <li class="divider"></li>
                                        <li>
                                            <a href="Lock.aspx">
                                                <i class="icon-lock"></i>Lock Screen </a>
                                        </li>
                                        <li>
                                            <asp:LinkButton ID="lnkBtnLogout" runat="server" OnClick="lnkBtnLogout_OnClick"> <i class="icon-key"></i>Log Out</asp:LinkButton>    
                                        </li>
                                    </ul>
                                </li>
                                <!-- END USER LOGIN DROPDOWN -->
                                <!-- END QUICK SIDEBAR TOGGLER -->
                            </ul>
                        </div>
                        <!-- END TOP NAVIGATION MENU -->
                    </div>
                    <!-- END HEADER INNER -->
                </div>
                <!-- END HEADER -->
                <!-- BEGIN HEADER & CONTENT DIVIDER -->
                <div class="clearfix"></div>
                <!-- END HEADER & CONTENT DIVIDER -->
                <!-- BEGIN CONTAINER -->
                <div class="page-container">
                    <!-- BEGIN SIDEBAR -->

                    <!-- END SIDEBAR -->
                    <!-- BEGIN CONTENT -->
                    <div class="page-content-wrapper">
                        <!-- BEGIN CONTENT BODY -->
                        <div class="page-content">
                          
                            
                            <!-- END PAGE TITLE-->
                            <!-- END PAGE HEADER-->
                            <div class="portlet light bordered">
                                <div class="portlet-title">
                                    <div class="caption">
                                        <i class="icon-bubble font-green-sharp"></i>
                                        <span class="caption-subject font-green-sharp sbold">STC Module</span>
                                    </div>
                                </div>
                                <div class="portlet-body">
                                    <div class="tiles">
                                        <asp:LinkButton ID="lnkBtnOrders" runat="server" OnClick="lnkBtnOrders_OnClick">
                                        <div class="tile double bg-green-turquoise">
                                            <div class="tile-body">
                                                <i class="fa fa-shopping-cart"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Orders</div>
                                                <div class="number">121 </div>
                                            </div>
                                        </div>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkBtnInventatory" runat="server" OnClick="lnkBtnInventatory_OnClick">
                                        <div class="tile double bg-yellow-saffron">
                                            <div class="tile-body">
                                                <i class="fa fa-ambulance"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Inventatory</div>
                                                <div class="number">121 </div>
                                            </div>
                                        </div>
                                        </asp:LinkButton>
                                        <asp:LinkButton ID="lnkBtnSettring" runat="server" OnClick="lnkBtnSettring_OnClick">
                                        <div class="tile double bg-red-sunglo">
                                            <div class="tile-body">
                                                <i class="fa fa-industry"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Setting</div>
                                                <div class="number">121 </div>
                                            </div>
                                        </div>
                                        </asp:LinkButton>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- END CONTENT BODY -->
                    </div>
                    <!-- END CONTENT -->
                    <!-- BEGIN QUICK SIDEBAR -->

                    <!-- END QUICK SIDEBAR -->
                </div>
                <!-- END CONTAINER -->
                <!-- BEGIN FOOTER -->
                <div class="page-footer">
                    <div class="page-footer-inner">
                        2017 &copy; Savvy Tech
                    </div>
                    <div class="scroll-to-top">
                        <i class="icon-arrow-up"></i>
                    </div>
                </div>
                <!-- END FOOTER -->
            </div>
            <!-- BEGIN QUICK NAV -->

            <div class="quick-nav-overlay"></div>
        </div>
    </form>
    <!-- BEGIN CORE PLUGINS -->
    <script src="assets/global/plugins/jquery.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
    <script src="assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
    <!-- END CORE PLUGINS -->
    <!-- BEGIN THEME GLOBAL SCRIPTS -->
    <script src="assets/global/scripts/app.min.js" type="text/javascript"></script>
    <!-- END THEME GLOBAL SCRIPTS -->
    <!-- BEGIN THEME LAYOUT SCRIPTS -->
    <script src="assets/layouts/layout/scripts/layout.min.js" type="text/javascript"></script>
    <script src="assets/layouts/layout/scripts/demo.min.js" type="text/javascript"></script>
    <script src="assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
    <script src="assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
    <!-- END THEME LAYOUT SCRIPTS -->
</body>
</html>
