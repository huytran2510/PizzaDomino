using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnTest
{
    public partial class TheoDoiDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            string madonhang = txtMaDH.Text;

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus" && GridView1.Rows.Count > 0)
            {
                int rowIndex = 0; // Assuming you want to update the first row

                // Check if DataKeys is not null and has items
                if (GridView1.DataKeys != null && GridView1.DataKeys.Count > 0)
                {
                    // Check if rowIndex is within the valid range
                    if (rowIndex >= 0 && rowIndex < GridView1.DataKeys.Count)
                    {
                        // Get the DataKey value from the first row
                        string orderId = GridView1.DataKeys[rowIndex].Value.ToString();

                        // Set the new status value (you may retrieve this value from somewhere)
                        string newStatus = "Đã Xác Nhận Đơn Hàng";

                        SqlDataSource1.UpdateParameters["NewStatus"].DefaultValue = newStatus;
                        SqlDataSource1.UpdateParameters["ID"].DefaultValue = orderId;

                        SqlDataSource1.Update();
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Invalid rowIndex");
                    }
                }
                else
                {
                    System.Diagnostics.Debug.WriteLine("DataKeys is null or empty");
                }
            }
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string status = DataBinder.Eval(e.Row.DataItem, "status").ToString();
                if (status == "Đã Xác Nhận Đơn Hàng")
                {
                    e.Row.Cells[e.Row.Cells.Count - 1].Visible = false;
                }
            }
        }

    }
}