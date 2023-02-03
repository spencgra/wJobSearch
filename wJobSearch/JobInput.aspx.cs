using DevExpress.Web;
using System;

namespace wJobSearch
{
    public partial class JobInput : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    MasterGrid.DataBind();
            //    MasterGrid.DetailRows.ExpandRow(0);
            //}
        }

        protected void DetailGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["JobID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
    }
}