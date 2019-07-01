using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Repository;

namespace Fevicol.Inventory
{
    public partial class InvReport : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            ReportDataSource rds;
            string invocie = Request.QueryString["x"];
            DataTable dt = new DataTable();
            InvReportViewer.LocalReport.ReportPath = Server.MapPath("~/Reports/InvInvoiceWiseReport.rdlc");

            DataSet ds = _fev.get_Informationdataset("sp_GetGoodsReceiveReport '" + invocie + "'");


            rds = new ReportDataSource("ProductReceived", ds.Tables[0]);
            InvReportViewer.LocalReport.DataSources.Clear();
            InvReportViewer.LocalReport.DataSources.Add(rds);




            byte[] bytes = InvReportViewer.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension, out streamIds, out warnings);
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "application/pdf";
            Response.BinaryWrite(bytes.ToArray());
            Response.End();
        }
    }
}