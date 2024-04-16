using DoAnTest.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnTest
{
    public partial class GioHang : System.Web.UI.Page
    {
        DataTable dt = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }
        protected void LoadData()
        {
            dt = (DataTable)Session["GioHang"];
            grdGioHang.DataSource = dt;
            grdGioHang.DataBind();
            if (dt != null)
            {
                double tong = TinhTongTien(dt);
                Session["tong"] = tong ;     // lưu để truyền qua trang DonHang.aspx
                lblTongTien.Text = String.Format("{0:0,000}", tong);
            }
        }
        protected double TinhTongTien(DataTable dt)
        {
            if (dt == null)
                return 0;
            double sum = 0;
            foreach (DataRow row in dt.Rows)
                sum += Convert.ToDouble(row["TongTien"]);
            return sum ;
        }

        protected void grdGioHang_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void grdGioHang_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            dt = (DataTable)Session["GioHang"];
            GridViewRow row = grdGioHang.Rows[e.RowIndex];
            TextBox txtSoluong = (TextBox)(row.Cells[5].Controls[0]);
            int Soluong = Convert.ToInt32(txtSoluong.Text);
            dt.Rows[row.DataItemIndex]["SoLuong"] = txtSoluong.Text;
            dt.Rows[row.DataItemIndex]["TongTien"] =
                Convert.ToDouble(dt.Rows[row.DataItemIndex]["Price"]) * Soluong;
                grdGioHang.EditIndex = -1;
            Session["GioHang"] = dt;
            LoadData();
        }

        protected void grdGioHang_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdGioHang.EditIndex = e.NewEditIndex;
            LoadData();
        }

        protected void grdGioHang_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            dt = (DataTable)Session["GioHang"];
            GridViewRow row = grdGioHang.Rows[e.RowIndex];
            dt.Rows[row.DataItemIndex].Delete();
            grdGioHang.EditIndex = -1;
            Session["GioHang"] = dt;
            LoadData();
        }

        protected void grdGioHang_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grdGioHang.EditIndex = -1;
            LoadData();
        }


        protected void butDathang_Click(object sender, EventArgs e)
        {
            dt = (DataTable)Session["GioHang"];
        }
    }
}