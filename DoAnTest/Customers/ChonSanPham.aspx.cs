using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace DoAnTest
{
    public partial class ChonSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string masp = "";
            if (Request.QueryString["ID"] != null)
                masp = Request.QueryString["ID"];
            Session["ID"] = masp;
            LoadSP(masp);
        }
        protected void LoadSP(string masp)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Pizza"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            SqlDataAdapter adapt = new SqlDataAdapter("SELECT ID, TenSP, price, maloaiSP, image FROM Products WHERE ID = @ID", con);
            adapt.SelectCommand.Parameters.AddWithValue("@ID", masp);
            DataTable dt = new DataTable();
            adapt.Fill(dt);
            if (dt.Rows.Count == 0)
                return;
            lblTenSP.Text = dt.Rows[0]["TenSP"].ToString();
            //lblMasp.Text =  dt.Rows[0]["ID"].ToString();
            lblDonGia.Text = string.Format(new CultureInfo("vi-VN"), "{0:C0}", dt.Rows[0]["Price"]);
            image.ImageUrl = dt.Rows[0]["image"].ToString();
            image.Height = 200;
            image.Width = 220;
            ViewState["Products"] = dt;
            Image1.Visible = false;
        }

        protected void butInsert_Click(object sender, EventArgs e)
        {
            DataTable dtSP = (DataTable)ViewState["Products"];
            DataTable dtGH;     // Gio hang
            int Soluong = 0;
            if (Session["GioHang"] == null)    // tao gio hang
            {
                dtGH = new DataTable();
                dtGH.Columns.Add("ID");
                dtGH.Columns.Add("TenSP");
                dtGH.Columns.Add("image");
                dtGH.Columns.Add("Price");
                dtGH.Columns.Add("SoLuong");
                dtGH.Columns.Add("TongTien");
            }
            else // lay gio hang tu Session
                dtGH = (DataTable)Session["GioHang"];
            string masp = (string)Session["ID"];
            int pos = TimSP(masp, dtGH);        // tim vi tri san pham trong gio hang
            if (pos != -1)  // neu tim thay tai vi tri pos
            {
                //cap nhat lai cot so luong, tong tien
                Soluong = Convert.ToInt32(dtGH.Rows[pos]["SoLuong"]) + int.Parse(txtSoluong.Text);
                dtGH.Rows[pos]["SoLuong"] = Soluong;
                dtGH.Rows[pos]["TongTien"] = Convert.ToDouble(dtSP.Rows[0]["Price"]) * Soluong;
            }
            else    //san pham chua co trong gio hang: Them vao gio hang
            {
                Soluong = int.Parse(txtSoluong.Text);
                DataRow dr = dtGH.NewRow();
                dr["ID"] = dtSP.Rows[0]["ID"];
                dr["TenSP"] = dtSP.Rows[0]["TenSP"];
                dr["Price"] = dtSP.Rows[0]["Price"];
                dr["image"] = dtSP.Rows[0]["image"];
                dr["SoLuong"] = int.Parse(txtSoluong.Text);
                dr["TongTien"] = Convert.ToDouble(dtSP.Rows[0]["Price"]) * Soluong;
                //thêm dòng mới vào giỏ hàng
                dtGH.Rows.Add(dr);
            }
            //lưu gio hang vao session
            Session["GioHang"] = dtGH;
            Response.Redirect("GioHang.aspx");
        }

        public static int TimSP(string masp, DataTable dt)
        {
            int pos = -1;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                if (dt.Rows[i]["ID"].ToString().ToLower() == masp.ToLower())
                {
                    pos = i;
                    break;
                }
            }
            return pos;
        }

        protected void btnDecrement_Click(object sender, EventArgs e)
        {
            
            if (int.TryParse(txtSoluong.Text, out int a))
            {
                a--;
                if (a < 1)
                {
                    txtSoluong.Text = 1.ToString();
                    UpdateTotalPrice(1);
                }
                else
                {
                    txtSoluong.Text = a.ToString();
                    UpdateTotalPrice(a);
                }
            }
        }
        private void UpdateTotalPrice(int quantity)
        {
            // Lấy giá tiền từ ViewState
            if (ViewState["Products"] is DataTable dt && dt.Rows.Count > 0)
            {
                double dongia = Convert.ToDouble(dt.Rows[0]["price"]);
                double totalPrice = dongia * quantity;
                //lblDonGia.Text = "Đơn Giá: " + String.Format("{0:0,000} VNĐ", totalPrice);
                lblDonGia.Text = string.Format(new CultureInfo("vi-VN"), "{0:C0}", totalPrice);
            }
        }

        protected void btnIncrement_Click(object sender, EventArgs e)
        {
            if (int.TryParse(txtSoluong.Text, out int a))
            {
                a++; // Tăng số lượng lên 1 đơn vị
                txtSoluong.Text = a.ToString(); // Cập nhật số lượng trên TextBox
                UpdateTotalPrice(a); // Cập nhật giá tiền tổng cộng
            }
        }
    }
}