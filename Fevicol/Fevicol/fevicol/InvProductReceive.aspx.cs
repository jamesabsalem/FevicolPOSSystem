using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;
using Repository;

namespace Fevicol.Inventory
{
    public partial class InvProductReceive : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindProductGroup();
                BindInvoiceDetails();
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
            txtQuantity.Attributes.Add("onkeyup", "javascript:calcval('" + txtQuantity.ClientID + "','" + txtUnitPrice.ClientID + "','" + txtTotalAmount.ClientID + "')");
            txtUnitPrice.Attributes.Add("onkeyup", "javascript:calcval('" + txtQuantity.ClientID + "','" + txtUnitPrice.ClientID + "','" + txtTotalAmount.ClientID + "')");
        }
        void BindProductGroup()
        {
            ddlProductGroup.DataSource = _fev.get_InformationdataTable("sp_getProductGroup");
            ddlProductGroup.DataTextField = "groupDescription";
            ddlProductGroup.DataValueField = "groupId";
            ddlProductGroup.DataBind();
            ddlProductGroup.Items.Insert(0, new ListItem("Select Group", string.Empty));
            ddlProductGroup.SelectedIndex = 0;
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
        void BindSize()
        {
            ddlSize.DataSource = _fev.get_InformationdataTable("sp_GetSizeForDropdownlistProductWise " + ddlProducts.SelectedValue);
            ddlSize.DataTextField = "sizeDescription";
            ddlSize.DataValueField = "sizeId";
            ddlSize.DataBind();
            ddlSize.Items.Insert(0, new ListItem("Select Size", string.Empty));
        }
        void BindUnit()
        {
            ddlUnit.DataSource = _fev.get_InformationdataTable("sp_GetUnitProductWise " + ddlProducts.SelectedValue);
            ddlUnit.DataTextField = "unitDescription";
            ddlUnit.DataValueField = "uintId";
            ddlUnit.DataBind();
            ddlUnit.Items.Insert(0, new ListItem("Select Unit", string.Empty));
        }


        protected void ddlProducts_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlProducts.SelectedValue) && ddlProducts.SelectedValue != "Select Product")
            {
                BindSize();
                BindUnit();
            }
            else
            {
                ddlProducts.SelectedIndex = 0;
                ddlSize.Items.Clear();
                ddlUnit.Items.Clear();
            }
        }
        public void BindGrid(int count, int groupId, string groupName, int productId, string productName, int sizeId, string sizeDes, int unitId, string unitDes, string quantity, string unitPrice, string totalAmount)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new DataColumn("groupId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("groupName", typeof(string)));
            dt.Columns.Add(new DataColumn("productId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("productName", typeof(string)));
            dt.Columns.Add(new DataColumn("sizeId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("sizeDes", typeof(string)));
            dt.Columns.Add(new DataColumn("unitId", typeof(Int32)));
            dt.Columns.Add(new DataColumn("unitDes", typeof(string)));
            dt.Columns.Add(new DataColumn("quantity", typeof(Int32)));
            dt.Columns.Add(new DataColumn("unitPrice", typeof(string)));
            dt.Columns.Add(new DataColumn("totalAmount", typeof(string)));
            if (ViewState["CurrentData"] != null)
            {
                for (int i = 0; i < count; i++)
                {
                    dt = (DataTable)ViewState["CurrentData"];
                    if (dt.Rows.Count > 0)
                    {
                        dr = dt.NewRow();
                        dr[0] = dt.Rows[0][0].ToString();
                    }
                }
                dr = dt.NewRow();
                dr["groupId"] = groupId;
                dr["groupName"] = groupName;
                dr["productId"] = productId;
                dr["productName"] = productName;
                dr["sizeId"] = sizeId;
                dr["sizeDes"] = sizeDes;
                dr["unitId"] = unitId;
                dr["unitDes"] = unitDes;
                dr["quantity"] = quantity;
                dr["unitPrice"] = unitPrice;
                dr["totalAmount"] = totalAmount;
                dt.Rows.Add(dr);
            }
            else
            {
                dr = dt.NewRow();
                dr["groupId"] = groupId;
                dr["groupName"] = groupName;
                dr["productId"] = productId;
                dr["productName"] = productName;
                dr["sizeId"] = sizeId;
                dr["sizeDes"] = sizeDes;
                dr["unitId"] = unitId;
                dr["unitDes"] = unitDes;
                dr["quantity"] = quantity;
                dr["unitPrice"] = unitPrice;
                dr["totalAmount"] = totalAmount;
                dt.Rows.Add(dr);
            }
            if (ViewState["CurrentData"] != null)
            {
                GridItemDetais.DataSource = ViewState["CurrentData"];
                GridItemDetais.DataBind();
            }
            else
            {
                GridItemDetais.DataSource = dt;
                GridItemDetais.DataBind();
            }
            ViewState["CurrentData"] = dt;
        }
        protected void btnAdd_OnClick(object sender, EventArgs e)
        {
            string str = txtTotalAmount.Text;
            DataTable dtbmf = (DataTable)ViewState["CurrentData"];
            if (Session["EditRow"] != null)
            {
                int rno = int.Parse(Session["EditRow"].ToString());
                dtbmf.Rows.RemoveAt(rno);
                Session["EditRow"] = null;
            }
            DataTable dt = (DataTable)ViewState["CurrentData"];
            int cont = 1;
            int existrow = 0;
            if (ViewState["CurrentData"] != null)
            {
                if (dt.Rows.Count > 0)
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        string groupId = dt.Rows[i]["groupId"].ToString();
                        string productId = dt.Rows[i]["productId"].ToString();
                        string sizeId = dt.Rows[i]["sizeId"].ToString();
                        string unitId = dt.Rows[i]["unitId"].ToString();

                        if (groupId == ddlProductGroup.SelectedValue && productId == ddlProducts.SelectedValue && sizeId == ddlSize.SelectedValue && unitId == ddlUnit.SelectedValue)
                        {
                            existrow = 1;
                            GridItemDetais.Rows[i].BackColor = System.Drawing.Color.DeepPink;
                            var title = "Oops...";
                            var text = "Product already Exists!";
                            var type = "error";
                            ScriptManager.RegisterStartupScript(this, GetType(), "Popup", "sweetAlert('" + title + "', '" + text + "', '" + type + "');", true);
                        }
                    }
                }
            }
            if (existrow < 1)
            {
                if (Convert.ToDecimal(txtQuantity.Text) > 0)
                {
                    BindGrid(cont, int.Parse(ddlProductGroup.SelectedValue), ddlProductGroup.SelectedItem.ToString(), int.Parse(ddlProducts.SelectedValue), ddlProducts.SelectedItem.ToString(), int.Parse(ddlSize.SelectedValue), ddlSize.SelectedItem.ToString(), int.Parse(ddlUnit.SelectedValue), ddlUnit.SelectedItem.ToString(), txtQuantity.Text.Trim(), txtUnitPrice.Text.Trim(), txtTotalAmount.Text);
                    Clear();
                }
            }
        }
        void Clear()
        {
            ddlProducts.SelectedIndex = -1;
            ddlSize.SelectedIndex = -1;
            ddlUnit.SelectedIndex = -1;
            //ddlProductGroup.SelectedIndex = -1;
            txtQuantity.Text = "";
            txtUnitPrice.Text = "";
            txtTotalAmount.Text = "";
            txtReceiveInvoiceNo.Enabled = false;
        }
        protected void btnSave_OnClick(object sender, EventArgs e)
        {
            if (GridItemDetais.Rows.Count > 0)
            {
                //DataTable tdInvoce = _fev.get_InformationdataTable("sp_GetInvoiceParameter");
                //string invoiceNo = tdInvoce.Rows[0]["invoiceNo"].ToString();
                //int invoice = Convert.ToInt32(invoiceNo) + 1;
                bool message = false;
                string headerId = _fev.ProductReceiveSave(txtReceiveInvoiceNo.Text.Trim().ToUpper(), Convert.ToDecimal(lblTotalValue.Text.Trim()),
                    Convert.ToInt32(Session["UserId"].ToString()));
                for (int i = 0; i < GridItemDetais.Rows.Count; i++)
                {
                    Label lblgroupId = (Label)GridItemDetais.Rows[i].FindControl("lblgroupId");
                    Label lblProductId = (Label)GridItemDetais.Rows[i].FindControl("lblProductId");
                    Label lblSizeId = (Label)GridItemDetais.Rows[i].FindControl("lblSizeId");
                    Label lblUnitId = (Label)GridItemDetais.Rows[i].FindControl("lblUnitId");
                    Label lblQuantity = (Label)GridItemDetais.Rows[i].FindControl("lblQuantity");
                    Label lblUnitPrice = (Label)GridItemDetais.Rows[i].FindControl("lblUnitPrice");
                    message = _fev.GoodsReceiveDetailsSave(Convert.ToInt32(headerId.ToString()),Convert.ToInt32(lblgroupId.Text),Convert.ToInt32(lblProductId.Text),Convert.ToInt32(lblSizeId.Text),Convert.ToInt32(lblUnitId.Text),Convert.ToInt32(lblQuantity.Text),Convert.ToDecimal(lblUnitPrice.Text), Convert.ToInt32(Session["UserId"].ToString()));
                }
                if (message)
                {
                    GridItemDetais.DataSource = "";
                    GridItemDetais.DataBind();
                    BindInvoiceDetails();
                    txtReceiveInvoiceNo.Enabled = true;
                    InitialField();
                    Session["Flag"] = 1;
                    Session["title"] = "Added";
                    Session["text"] = "Products has been succesfully Added";
                    Session["type"] = "success";
                    Response.Redirect(Request.Url.AbsoluteUri);
                }
            }
        }
        decimal _totalval = 0;
        protected void GridItemDetais_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Attributes.Add("style", "text-align:center");
                Label lblValue = (Label)e.Row.FindControl("lblTotalAmount");
                _totalval = _totalval + decimal.Parse(lblValue.Text);
            }
            GridItemDetais.Columns[7].FooterText = _totalval.ToString();
            lblTotalValue.Text = _totalval.ToString();
        }

        void BindInvoiceDetails()
        {
            GridGoodsReceiveDetails.DataSource = _fev.get_InformationdataTable("sp_GetGoodsReceiveHeader");
            GridGoodsReceiveDetails.DataBind();
        }


        protected void lnkBtnReport_OnClick(object sender, EventArgs e)
        {
            ASPxGridView grid = (ASPxGridView)sender;
            //string keyValue = grid.GetRowValues(e.VisibleIndex, "EmployeeID").ToString();

            //GridViewRow grdRow = (GridViewRow)((LinkButton)sender).NamingContainer;
            LinkButton lnkBtnReport = grid.FindControl("lnkBtnReport") as LinkButton;
            Session["InvoiceNo"] = lnkBtnReport.Text;
            Session["Param"] = "Invoice";
            //runjQueryCode("window.open('../Orders/OrderReport.aspx','popup','location=1,status=1,left=0,top=0,scrollbars=1,width=970,height=600')");
            ScriptManager.RegisterStartupScript(this, typeof(string), "OPEN_WINDOW", "var Mleft = (screen.width/2)-(760/2);var Mtop = (screen.height/2)-(700/2);window.open( '../Inventory/InvReport.aspx?', null, 'height=700,width=760,status=yes,toolbar=no,scrollbars=yes,menubar=no,location=no,top=\'+Mtop+\', left=\'+Mleft+\'' );", true);//without parameter
        }
        private void runjQueryCode(string jsCodetoRun)
        {
            ScriptManager requestSM = ScriptManager.GetCurrent(this);
            if (requestSM != null && requestSM.IsInAsyncPostBack)
            {
                ScriptManager.RegisterClientScriptBlock(this,
                                                        typeof(Page),
                                                        Guid.NewGuid().ToString(),
                                                        getjQueryCode(jsCodetoRun),
                                                        true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(typeof(Page),
                                                       Guid.NewGuid().ToString(),
                                                       getjQueryCode(jsCodetoRun),
                                                       true);
            }
        }
        private string getjQueryCode(string jsCodetoRun)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.AppendLine("$(document).ready(function() {");
            sb.AppendLine(jsCodetoRun);
            sb.AppendLine(" });");
            return sb.ToString();
        }

        protected void ddlProductGroup_OnSelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ddlProductGroup.SelectedValue) && ddlProductGroup.SelectedValue != "Select Group")
            {
                BindProduct();
            }
            else
            {
                ddlProductGroup.SelectedIndex = 0;
                ddlProducts.Items.Clear();
                ddlSize.Items.Clear();
                ddlUnit.Items.Clear();
            }
        }

        protected void btnClear_OnClick(object sender, EventArgs e)
        {
            txtReceiveInvoiceNo.Enabled = true;
            txtReceiveInvoiceNo.Text = "";
            InitialField();
        }
        void InitialField()
        {
            ddlProductGroup.SelectedIndex = 0;
            ddlProducts.Items.Clear();
            ddlSize.Items.Clear();
            ddlUnit.Items.Clear();
            txtQuantity.Text = "";
            txtUnitPrice.Text = "";
            txtTotalAmount.Text = "";
        }
    }
}