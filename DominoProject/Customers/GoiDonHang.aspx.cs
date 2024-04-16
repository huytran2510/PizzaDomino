using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnTest
{
    public partial class GoiDonHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.PreviousPage != null)
            {
                TextBox txtHoTen = (TextBox)Session["txtTen"];
                TextBox txtDienThoai = (TextBox)Session["txtSDT"];
                TextBox txtDiaChi = (TextBox)Session["txtDiaChi"];
                TextBox txtGhiChu = (TextBox)Session["txtGhiChu"];
                string maDH = (string)Session["maDH"];
                lblThongBao.Text = "<br />Xin chào (anh/chị) " + txtHoTen.Text + ",<br />";
                lblThongBao.Text += "Quý khách vừa đặt thành công các sản phẩm của shop. ";
                lblThongBao.Text += "Số điện thoại của quý khách là: " + txtDienThoai.Text + "<br>";
                lblThongBao.Text += "Mã đơn hàng của quý khách là: " + maDH + ".<br />";
                lblThongBao.Text += "Sản phẩm sẽ được giao đến địa chỉ của quý khách tại ";
                lblThongBao.Text += txtDiaChi.Text;
                lblThongBao.Text += " trong 30-60 phút sắp tới. <br />";
                lblThongBao.Text += " Sau khi nhận hàng quý khách sau khi nhận hàng vui lòng lấy mã đơn hàng vào trang web để xác nhận đơn hàng.<br />";
                lblThongBao.Text += "Mọi thông tin về đơn hàng sẽ được gửi tới email của quý khách, ";
                lblThongBao.Text += "vui lòng kiểm tra email để biết thêm chi tiết.<br />";
                lblThongBao.Text += "Cảm ơn quý khách đã tin tưởng và giao dịch tại shop.<br />";
                lblThongBao.Text += "Mọi thắc mắc vui lòng liên hệ: xxxx xxxx.<br /><br />";
            }
        }
    }
}