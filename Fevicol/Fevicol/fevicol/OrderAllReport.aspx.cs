using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Repository;

namespace Fevicol.Orders
{
    public partial class OrderAllReport : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDealer();
                BindProductGroup();
                BindSalesPerson();
                fromDate.Text = "";
                toDate.Text = "";
            }
        }
        void BindDealer()
        {
            ddlDealer.DataSource = _fev.get_InformationdataTable("sp_GetDealer");
            ddlDealer.DataTextField = "dealerName";
            ddlDealer.DataValueField = "dealerId";
            ddlDealer.DataBind();
            ddlDealer.Items.Insert(0, new ListItem("Select Dealer", string.Empty));
            ddlDealer.SelectedIndex = 0;
        }
        void BindProductGroup()
        {
            ddlProductGroup.DataSource = _fev.get_InformationdataTable("sp_getProductGroup");
            ddlProductGroup.DataTextField = "groupDescription";
            ddlProductGroup.DataValueField = "groupId";
            ddlProductGroup.DataBind();
            ddlProductGroup.Items.Insert(0, new ListItem("Select Product Group", string.Empty));
            ddlProductGroup.SelectedIndex = 0;
        }

        protected void ddlProductGroup_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlProductGroup.SelectedValue))
            {
                BindProduct();
            }
        }
        void BindProduct()
        {
            ddlProducts.DataSource = _fev.get_InformationdataTable("sp_GetProductForDropdownlistGroupWise " + ddlProductGroup.SelectedValue);
            ddlProducts.DataTextField = "productDescription";
            ddlProducts.DataValueField = "productId";
            ddlProducts.DataBind();
            ddlProducts.Items.Insert(0, new ListItem("Select Product", string.Empty));
            ddlProducts.SelectedIndex = 0;
        }
        protected void ddlProducts_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlProducts.SelectedValue))
                BindSize();
        }
        void BindSize()
        {
            ddlSize.DataSource = _fev.get_InformationdataTable("sp_GetSizeForDropdownlistProductWise " + ddlProducts.SelectedValue);
            ddlSize.DataTextField = "sizeDescription";
            ddlSize.DataValueField = "sizeId";
            ddlSize.DataBind();
            ddlSize.Items.Insert(0, new ListItem("Select Size", string.Empty));
        }
        void BindSalesPerson()
        {
            ddlSalesPerson.DataSource = _fev.get_InformationdataTable("sp_GetSalesPerson");
            ddlSalesPerson.DataTextField = "salesPersonName";
            ddlSalesPerson.DataValueField = "salesPersonId";
            ddlSalesPerson.DataBind();
            ddlSalesPerson.Items.Insert(0, new ListItem("Select Sales Person", string.Empty));
            ddlSalesPerson.SelectedIndex = 0;
        }

        protected void btnClear_OnClick(object sender, EventArgs e)
        {
            Clear();
        }

        void Clear()
        {
            ddlProductGroup.SelectedIndex = -1;
            ddlProducts.SelectedIndex = -1;
            ddlSize.SelectedIndex = -1;
            ddlDealer.SelectedIndex = -1;
            ddlSalesPerson.SelectedIndex = -1;
            rbSalesDetails.Checked = false;
            //rbSalesSummary.Checked = false;
            //rdAllReport.Checked = false;
            fromDate.Text = "";
            toDate.Text = "";
        }

        protected void btnGenerateReport_OnClick(object sender, EventArgs e)
        {
            if (rbSalesDetails.Checked)
            {
                //****************************************Begin Paramiter Collection******************************************************
                if (!string.IsNullOrEmpty(ddlDealer.SelectedValue))
                {
                    Session["Dealer"] = ddlDealer.SelectedValue;
                }
                else
                {
                    Session["Dealer"] = 0;
                }
                if (!string.IsNullOrEmpty(ddlProductGroup.SelectedValue))
                {
                    Session["Group"] = ddlProductGroup.SelectedValue;
                }
                else
                {
                    Session["Group"] = 0;
                }
                if (!string.IsNullOrEmpty(ddlProducts.SelectedValue))
                {
                    Session["Product"] = ddlProducts.SelectedValue;
                }
                else
                {
                    Session["Product"] = 0;
                }
                if (!string.IsNullOrEmpty(ddlSize.SelectedValue))
                {
                    Session["Size"] = ddlSize.SelectedValue;
                }
                else
                {
                    Session["Size"] = 0;
                }
                if (!string.IsNullOrEmpty(ddlSalesPerson.SelectedValue))
                {
                    Session["SalesPerson"] = ddlSalesPerson.SelectedValue;
                }
                else
                {
                    Session["SalesPerson"] = 0;
                }
                if (!string.IsNullOrEmpty(fromDate.Text) && !string.IsNullOrEmpty(toDate.Text))
                {
                    Session["fromDate"] = fromDate.Text;
                    Session["toDate"] = toDate.Text;
                }
                //****************************************End Paramiter Collection******************************************************
                if (rbSalesDetails.Checked)
                {
                    Session["Fevicol"] = "FevicolReport";
                }

                ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW",
                "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( 'ReportView.aspx?', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );",
                true);
            }
        }
    }
}