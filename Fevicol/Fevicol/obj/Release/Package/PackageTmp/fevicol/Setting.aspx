<%@ Page Title="" Language="C#" MasterPageFile="~/fevicol/OrdMasterPage.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="Fevicol.Settings.Setting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel ID="UpdatePanelSalesPerson" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="tiles" style="background-color: white">
                <asp:LinkButton ID="lnkBtnAddUser" runat="server" OnClientClick="OpenModal('AddUser.aspx','Add User')">
                                        <div class="tile bg-green-turquoise">
                                            <div class="tile-body">
                                                <i class="fa fa-user-plus"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Add User</div>
                                               
                                            </div>
                                        </div>
                </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnAddDealer" runat="server" OnClientClick="OpenModal('AddDealer.aspx','Add Dealer')">
                                        <div class="tile bg-yellow-saffron">
                                            <div class="tile-body">
                                                <i class="fa fa-users"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Add Dealer</div>
                                               
                                            </div>
                                        </div>
                </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnAddProductGroup" runat="server" OnClientClick="OpenModal('AddGroup.aspx','Add Group')">
                                        <div class="tile  bg-blue-madison">
                                            <div class="tile-body">
                                                <i class="fa fa-object-group"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Add Product Group</div>
                                               
                                            </div>
                                        </div>
                </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnAddProduct" runat="server" OnClientClick="OpenModal('AddProduct.aspx','Add Product')">
                                        <div class="tile bg-purple-studio">
                                            <div class="tile-body">
                                                <i class="fa fa-cart-plus"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Add Products</div>
                                                
                                            </div>
                                        </div>
                </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnAddSize" runat="server" OnClientClick="OpenModal('AddSize.aspx','Add Size')">
                                        <div class="tile bg-grey-cascade">
                                            <div class="tile-body">
                                                <i class="fa fa-industry"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Add Size</div>
                                               
                                            </div>
                                        </div>
                </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnAddUnit" runat="server" OnClientClick="OpenModal('AddUnit.aspx','Add Unit')">
                                        <div class="tile bg-green">
                                            <div class="tile-body">
                                                <i class="fa fa-balance-scale"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Add Unit</div>
                                                
                                            </div>
                                        </div>
                </asp:LinkButton>
                <asp:LinkButton ID="lnkBtnAddSalesPerson" runat="server" OnClientClick="OpenModal('AddSalesPerson.aspx','Add Sales Person')">
                                        <div class="tile bg-red">
                                            <div class="tile-body">
                                                <i class="fa fa fa-male"></i>
                                            </div>
                                            <div class="tile-object">
                                                <div class="name">Add Salesman</div>
                                                
                                            </div>
                                        </div>
                </asp:LinkButton>
            </div>
            <div class="modal fade" tabindex="-1" id="full" role="dialog" aria-labelledby="myLargeModalLabel">
                <div class="modal-dialog modal-full" role="document">
                    <div class="modal-content" style="background: white">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 id="modalTitle" class="modal-title"></h4>
                        </div>
                        <div class="modal-body">
                            <iframe id="iFrameForPage" height="650" allowtransparency="true" frameborder="0" scrolling="yes" style="width: 100%;" src=""></iframe>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn dark btn-outline" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>
            <style>
                #full .modal-dialog {
                    width: 90%;
                    height: 90%;
                }
            </style>
            <script>
                function OpenModal(pageToOpen, title) {
                    var modelTitleDiv = document.getElementById("modalTitle");
                    modelTitleDiv.textContent = "" + title;

                    var iframeForPage = document.getElementById('iFrameForPage');
                    iframeForPage.setAttribute('src', pageToOpen);
                    $('#full').modal('show');
                }
            </script>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
