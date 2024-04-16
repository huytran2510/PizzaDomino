using DoAnTest.DTO;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace DoAnTest.Services
{
    public class OrderServices
    {
        private string _connectionString;
        public OrderServices(string connectionString)
        {
            _connectionString = connectionString;
        }
        public void AddCustomerOrder(CustomerDTO customerDTO, OrderDTO orderDTO, Label lblStatus)
        {
            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                connection.Open();

                // Thêm khách hàng
                using (SqlCommand cmd = new SqlCommand("INSERT INTO Customers (name, address, phone) OUTPUT INSERTED.ID VALUES (@Name, @Address, @Phone);", connection))
                {
                    cmd.Parameters.AddWithValue("@Name", customerDTO.Name);
                    cmd.Parameters.AddWithValue("@Address", customerDTO.Address);
                    cmd.Parameters.AddWithValue("@Phone", customerDTO.Phone.Trim());

                    int customerID = Convert.ToInt32(cmd.ExecuteScalar());

                    // Thêm đơn hàng
                    using (SqlCommand orderCmd = new SqlCommand("INSERT INTO Orders (ID, Date, TotalPrice, id_customer, status) VALUES (@ID, @Date, @TotalPrice, @CustomerID,@status);", connection))
                    {
                        orderCmd.Parameters.AddWithValue("@ID", orderDTO.ID);
                        orderCmd.Parameters.AddWithValue("@Date", orderDTO.Date);
                        orderCmd.Parameters.AddWithValue("@TotalPrice", orderDTO.TotalPrice);
                        orderCmd.Parameters.AddWithValue("@CustomerID", customerID);
                        orderCmd.Parameters.AddWithValue("@status", "Đang vận chuyển");

                        try
                        {
                            orderCmd.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            lblStatus.Text=($"Error inserting order: {ex.Message}");
                            // Handle the error (possibly throw or log)
                            return;
                        }

                        // Thêm chi tiết đơn hàng
                        foreach (var orderDetailDTO in orderDTO.OrderDetails)
                        {
                            using (SqlCommand detailCmd = new SqlCommand("INSERT INTO OrderDetails (id_product, So_Luong, id_order) VALUES (@ProductID, @Quantity, @OrderID);", connection))
                            {
                                detailCmd.Parameters.AddWithValue("@ProductID", orderDetailDTO.ProductID);
                                detailCmd.Parameters.AddWithValue("@Quantity", orderDetailDTO.Quantity);

                                try
                                {
                                    detailCmd.Parameters.AddWithValue("@OrderID", orderDTO.ID);
                                    detailCmd.ExecuteNonQuery();
                                }
                                catch (Exception ex)
                                {
                                    lblStatus.Text = ($"Error inserting order detail: {ex.Message}");
                                    // Handle the error (possibly throw or log)
                                    return;
                                }
                            }
                        }
                    }
                }
            }
        }

    }
}