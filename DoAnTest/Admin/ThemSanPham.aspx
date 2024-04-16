<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ThemSanPham.aspx.cs" Inherits="DoAnTest.Admin.ThemSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ThemSanPham.css" rel="stylesheet" type="text/css" />
    <link href="ChiTietSP.css" rel="stylesheet" type="text/css" />
    <div class="SP">
        <div style="margin-top: 90px; width: 200px; margin-right:20px; background-color:#004666;">
            <asp:Menu ID="Menu1" runat="server" CssClass="menuSP">
                <StaticMenuItemStyle CssClass="menu-action" />
                <DynamicMenuItemStyle CssClass="menu-action" />
                <Items>
                    <asp:MenuItem Text="CHI TIẾT SẢN PHẨM" NavigateUrl="~/Admin/ChiTietSanPham.aspx" Value=""></asp:MenuItem>
                    <asp:MenuItem  Text="THÊM SẢN PHẨM" NavigateUrl="~/Admin/ThemSanPham.aspx" Value=""></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div>
            <h2 style="margin-top: 120px;">THÊM SẢN PHẨM</h2>
            <table style="font-weight: bold;">
                <tr>
                    <td>Mã sản phẩm</td>
                    <td>
                        <asp:TextBox ID="txtMaSP" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Tên sản phẩm</td>
                    <td>
                        <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Đơn giá</td>
                    <td>
                        <asp:TextBox ID="txtDonGia" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>Loại sản phẩm</td>
                    <td>
                        <asp:DropDownList ID="drpLoai" runat="server"
                            DataSourceID="srcLoaiHang"
                            DataTextField="tenloaiSP"
                            DataValueField="ID">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="srcLoaiHang" runat="server"
                            ConnectionString="<%$ ConnectionStrings:Pizza %>"
                            SelectCommand="SELECT ID, tenloaiSP FROM ProductDetails ORDER BY tenloaiSP"></asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>Size</td>
                    <td>
                        <%--<select ID="drSize" runat="server">
                    <option value="SMALL">SMALL</option>
                    <option value="MEDIUM">MEDIUM</option>
                    <option value="LARGE">LARGE</option>
                </select>--%>
                        <asp:DropDownList ID="drpSize" runat="server">
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>SMALL</asp:ListItem>
                            <asp:ListItem>MEDIUM</asp:ListItem>
                            <asp:ListItem></asp:ListItem>
                            <asp:ListItem>LARGE</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Hình sản phẩm</td>
                    <td>
                        <asp:FileUpload ID="upHinh" runat="server" ForeColor="#000099" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td>
                        <asp:Button ID="butAdd" runat="server" Text='Thêm' OnClick="butAdd_Click" CssClass="icon-button" />
                        <asp:Button ID="butCancel" runat="server" Text="Hủy Bỏ" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp; </td>
                    <td>
                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
