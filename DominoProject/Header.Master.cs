using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnTest
{
    public partial class Header : System.Web.UI.MasterPage
    {
        DataTable dt = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["GioHang"] != null)
            {
                dt = (DataTable)Session["GioHang"];
                int rowCount = dt.Rows.Count;
                lbSoluong.Text = $"<i class='fa fa-shopping-cart'></i> {rowCount}";
            }
        }
    }
}