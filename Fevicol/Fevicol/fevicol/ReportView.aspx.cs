using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.Reporting.WebForms;
using Repository;

namespace Fevicol.Orders
{
    public partial class ReportView : System.Web.UI.Page
    {
        private readonly Fev _fev = new Fev();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Report();
            }
        }

        void Report()
        {
            try
            {
                Warning[] warnings;
                string[] streamIds;
                string mimeType = string.Empty;
                string encoding = string.Empty;
                string extension = string.Empty;
                ReportDataSource rds;

                if (Session["Fevicol"].ToString() == "FevicolReport")
                {
                    FevicoReportAll.LocalReport.ReportPath = Server.MapPath("~/Reports/SalesOrderDetails.rdlc");
                    DataSet ds = _fev.get_Informationdataset("sp_SalesDatailsReport " + Session["Dealer"]+ "," + Session["Group"]+ "," + Session["Product"]+ "," + Session["Size"]+ "," + Session["SalesPerson"] +",'"+ Session["fromDate"] +"','"+ Session["toDate"]+"'");
                    rds = new ReportDataSource("SalesDetails", ds.Tables[0]);
                    FevicoReportAll.LocalReport.DataSources.Clear();
                    FevicoReportAll.LocalReport.DataSources.Add(rds);
                }

                byte[] bytes = FevicoReportAll.LocalReport.Render("PDF", null, out mimeType, out encoding, out extension,
                    out streamIds, out warnings);
                Response.Clear();
                Response.Buffer = true;
                Response.ContentType = "application/pdf";
                Response.BinaryWrite(bytes.ToArray());
                Response.End();
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                throw;
            }
            finally
            {
                Session["SalesPerson"] = null;
                Session["Dealer"] = null;
                Session["Group"] = null;
                Session["Product"] = null;
                Session["Size"] = null;
                Session["SalesPerson"] = null;
            }
        }
    }
   
}