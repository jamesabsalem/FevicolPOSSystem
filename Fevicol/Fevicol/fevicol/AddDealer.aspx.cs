using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repository;

namespace Fevicol.Settings
{
    public partial class AddDealer : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                GetDealerDetails();
                if (Session["Flag"] != null)
                {
                    int messagePrint = (int)Session["Flag"];
                    if (messagePrint == 1)
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "swal('" + Session["title"] + "', '" + Session["text"] + "', '" + Session["type"] + "');", true);
                        Session["Flag"] = null;
                        Session["title"] = null;
                        Session["text"] = null;
                        Session["type"] = null;
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "sweetAlert('" + Session["title"] + "', '" + Session["text"] + "', '" + Session["type"] + "');", true);
                        Session["Flag"] = null;
                        Session["title"] = null;
                        Session["text"] = null;
                        Session["type"] = null;
                    }
                }
            }
        }

        protected void btnAddDealer_OnClick(object sender, EventArgs e)
        {
            if (btnAddDealer.Text == "Save")
            {
                if (!string.IsNullOrEmpty(txtDealerName.Text.Trim()) &&
                    !string.IsNullOrEmpty(txtDealerAddress.Text.Trim()) &&
                    !string.IsNullOrEmpty(txtDealerPhone.Text.Trim()))
                {
                    bool checkMessage = _fev.CheckDealer(txtDealerName.Text.Trim().ToUpper());

                    if (!checkMessage)
                    {


                        bool message = _fev.DealerSave(txtDealerName.Text.Trim(), txtDealerAddress.Text.Trim(),
                            txtDealerPhone.Text.Trim(),
                            Convert.ToInt32(Session["UserId"].ToString()));
                        if (message)
                        {
                            Session["Flag"] = 1;
                            Session["title"] = "Added";
                            Session["text"] = "Dealer info Added succesfully..";
                            Session["type"] = "success";
                            GetDealerDetails();
                            Response.Redirect(Request.Url.AbsoluteUri);
                        }
                        ClearTextField();
                    }
                    else
                    {
                        Session["Flag"] = 0;
                        Session["title"] = "Oops...";
                        Session["text"] = "Dealer info already Exists!";
                        Session["type"] = "error";
                        Response.Redirect(Request.Url.AbsoluteUri);
                    }
                }
            }
            else
            {
                bool message = _fev.DealerUpdate(Convert.ToInt32(Session["dealerId"].ToString()), txtDealerName.Text.Trim(), txtDealerAddress.Text.Trim(),
                    txtDealerPhone.Text.Trim(), Convert.ToInt32(Session["UserId"]));
                if (message)
                {
                    Session["Flag"] = 1;
                    Session["title"] = "Updated";
                    Session["text"] = "Dealer info Updated succesfully..";
                    Session["type"] = "success";
                    GetDealerDetails();
                    btnAddDealer.Text = "Save";
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
                ClearTextField();

            }


        }

        void GetDealerDetails()
        {
            GridDealerDetails.DataSource = _fev.get_InformationdataTable("sp_GetDealerDetails");
            GridDealerDetails.DataBind();
        }

        void ClearTextField()
        {
            txtDealerName.Text = "";
            txtDealerPhone.Text = "";
            txtDealerAddress.Text = "";
            btnAddDealer.Text = "Save";
        }

        protected void GridDealerDetails_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridDealerDetails.DataSource = _fev.get_InformationdataTable("sp_GetDealerDetails");
            GridDealerDetails.PageIndex = e.NewPageIndex;
            GridDealerDetails.DataBind();
        }

        protected void btnEditSelect_OnClick(object sender, ImageClickEventArgs e)
        {
            GridViewRow ro = ((ImageButton)sender).Parent.Parent as GridViewRow;
            Label dealerId = (Label)ro.FindControl("lblDealerId");
            Label dealerName = (Label)ro.FindControl("lbldealerName");
            Label dealerAddress = (Label)ro.FindControl("lbldealerAddress");
            Label dealerPhone = (Label)ro.FindControl("lbldealerPhone");

            Session["dealerId"] = dealerId.Text;
            txtDealerName.Text = dealerName.Text;
            txtDealerAddress.Text = dealerAddress.Text;
            txtDealerPhone.Text = dealerPhone.Text;
            btnAddDealer.Text = "Update";
        }
    }
}