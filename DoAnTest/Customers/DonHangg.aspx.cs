using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DoAnTest.Services;
using DoAnTest.DTO;

namespace DoAnTest
{
    public partial class DonHangg : System.Web.UI.Page
    {
        DataTable dt;
        OrderServices orderServices;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadData();
        }
        protected void LoadData()
        {
            if (Session["GioHang"] != null)
            {
                DataTable dt = (DataTable)Session["GioHang"];
                dlstDonHang.DataSource = dt;
                dlstDonHang.DataBind();

                if (Session["tong"] != null)
                {
                    double tong = (double)Session["tong"];
                    double giamgia = 0.0;
                    if (Session["khuyenmai"] != null)
                    {
                        // Kiểm tra và chuyển đổi giá trị "khuyenmai" thành kiểu double
                        if (double.TryParse(Session["khuyenmai"].ToString(), out giamgia))
                        {

                            // Áp dụng giảm giá nếu có
                            double tienGiam = tong * giamgia;

                            // Hiển thị số tiền được giảm
                            lblDiscount.Text = "Số tiền được giảm: " + String.Format("{0:0,000}", tienGiam);

                            // Hiển thị tổng tiền trên giỏ hàng là giá trị đã giảm giá
                            lblTongTien.Text = "Tổng tiền trên giỏ hàng là: " + String.Format("{0:0,000}", tong - tienGiam);
                            Session["TongTien"] = tong - tienGiam;
                        }
                    }
                    else
                    {
                        // Xử lý khi Session "khuyenmai" không tồn tại
                        lblTongTien.Text = "Tổng tiền trên giỏ hàng là: " + String.Format("{0:0,000}", tong);
                        Session["TongTien"] = tong;
                    }
                }
                else
                {
                    // Xử lý khi Session "tong" không tồn tại
                    lblDiscount.Text = "Lỗi khi xử lý tổng giá trị.";
                    lblTongTien.Text = "Không có sản phẩm trong giỏ hàng.";
                }
            }
            else
            {
                // Xử lý khi Session "GioHang" không tồn tại
                lblDiscount.Text = "Không có sản phẩm trong giỏ hàng.";
                lblTongTien.Text = "Không có sản phẩm trong giỏ hàng.";
            }
        }

        protected void butDongY_Click(object sender, EventArgs e)
        {
            DateTime d = DateTime.Now;
            string maDonHang = d.Day.ToString() + d.Month.ToString() +
                (d.Year % 100).ToString() + d.Hour.ToString() +
                d.Minute.ToString() + d.Second.ToString();
            Session["txtTen"] = txtTen;
            Session["txtEmail"] = txtEmail;
            Session["txtSDT"] = txtSDT;
            Session["txtDiaChi"] = txtDiaChi;
            Session["txtGio"] = txtGio;
            Session["txtGhiChu"] = txtGhiChu;
            Session["maDH"] = maDonHang;
            SendConfirmationEmail(txtEmail.Text, maDonHang);

            // Chuyển hướng đến trang cảm ơn
            Server.Transfer("~/Customers/GoiDonHang.aspx");
        }
        private void SendConfirmationEmail(string recipientEmail, string maDonHang)
        {
            string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\pizza.mdf;Integrated Security=True;Connect Timeout=30";
            var customerDTO = new CustomerDTO
            {
                Name = txtTen.Text,
                Address = txtDiaChi.Text,
                Phone = txtSDT.Text
            };
            DataTable dt = (DataTable)Session["GioHang"];

            // Khởi tạo List<OrderDetailsDTO>
            List<OrderDetailsDTO> gioHangList = new List<OrderDetailsDTO>();

            // Chuyển đổi dữ liệu từ DataTable sang List<OrderDetailsDTO>
            foreach (DataRow row in dt.Rows)
            {
                OrderDetailsDTO orderDetail = new OrderDetailsDTO
                {
                    ProductID = row["ID"].ToString(),
                    Quantity = Convert.ToInt32(row["SoLuong"])
                    // Thêm các thuộc tính khác nếu cần
                };

                gioHangList.Add(orderDetail);
            }
            var orderDTO = new OrderDTO
            {
                ID = maDonHang,
                Date = DateTime.Now,
                TotalPrice = Convert.ToInt32(Session["TongTien"].ToString()),
                OrderDetails = gioHangList
            };
            OrderServices orderServices = new OrderServices(connectionString);
            // Gọi phương thức AddCustomerOrder
            try
            {
                // Gọi phương thức AddCustomerOrder
                orderServices.AddCustomerOrder(customerDTO, orderDTO, lblStatus);
                // Handle success
            }
            catch (Exception ex)
            {
                // Handle exception (log it, show user-friendly message, etc.)
                lblStatus.Text = maDonHang;
            }
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(recipientEmail);
                mail.From = new MailAddress("hung.to@ou.edu.vn");
                mail.Subject = "Gởi từ shop Bán Hàng Trực Tuyến";
                mail.Body = "Đơn hàng có mã là: " + maDonHang + " sẽ được gởi đến quý khách " +
                            Session["txtTen"].ToString() + ". Xin cám ơn!";

                SmtpClient client = new SmtpClient();
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.EnableSsl = true;
                client.Credentials = new NetworkCredential("huy251003@gmail.com", "amrudzgsjnorekxw");
                
                client.Send(mail);
            }
            catch (SmtpFailedRecipientException ex)
            {
                lblStatus.Text = "Mail không được gởi! " + ex.FailedRecipient;
            }
            
        }
    }
}