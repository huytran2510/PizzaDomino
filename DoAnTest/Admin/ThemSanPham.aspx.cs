using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnTest.Admin
{
    public partial class ThemSanPham : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void butAdd_Click(object sender, EventArgs e)
        {
            string conStr = WebConfigurationManager.ConnectionStrings["Pizza"].ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                con.Open();
                using (SqlDataAdapter adapt = new SqlDataAdapter())
                {
                    adapt.SelectCommand = new SqlCommand("SELECT ID, TenSP, Price, maloaiSP,size, Image FROM Products", con);
                    DataTable dt = new DataTable();
                    adapt.Fill(dt);

                    string strFileUpload = "";
                    try
                    {
                        if (upHinh.HasFile)
                        {
                            strFileUpload = "~/images/" + upHinh.FileName;
                            string path = MapPath("/Images/") + upHinh.FileName;
                            upHinh.PostedFile.SaveAs(path);
                        }

                        using (SqlCommand insertCommand = new SqlCommand("INSERT INTO Products (ID, TenSP, Price, maloaiSP,size, Image) VALUES (@ID, @TenSP, @Price, @maloaiSP,@size, @Image)", con))
                        {
                            insertCommand.Parameters.AddWithValue("@ID", txtMaSP.Text);
                            insertCommand.Parameters.AddWithValue("@TenSP", txtTenSP.Text);
                            insertCommand.Parameters.AddWithValue("@Price", Convert.ToDouble(txtDonGia.Text));
                            insertCommand.Parameters.AddWithValue("@maloaiSP", Convert.ToInt32(drpLoai.SelectedValue));
                            insertCommand.Parameters.AddWithValue("@size", drpSize.SelectedValue.ToString());
                            insertCommand.Parameters.AddWithValue("@Image", strFileUpload);

                            int rowsAffected = insertCommand.ExecuteNonQuery();
                            if (rowsAffected > 0)
                            {
                                DataRow row = dt.NewRow();
                                row["ID"] = txtMaSP.Text;
                                row["TenSP"] = txtTenSP.Text;
                                row["Price"] = Convert.ToDouble(txtDonGia.Text);
                                row["maloaiSP"] = Convert.ToInt32(drpLoai.SelectedValue);
                                row["size"] = drpSize.SelectedValue.ToString();
                                row["Image"] = strFileUpload;
                                dt.Rows.Add(row);
                                lblStatus.Text = "Thêm thành công!";
                            }
                            else
                            {
                                lblStatus.Text = "Không thành công!";
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        lblStatus.Text = ex.Message;
                    }
                }
            }

        }
    }
}