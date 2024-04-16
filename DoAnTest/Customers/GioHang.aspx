<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="DoAnTest.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../CSS/Giohang.css" rel="stylesheet" type="text/css" />
    <div class="cartDetail">
        <h2>GIỎ HÀNG</h2>
        <asp:GridView ID="grdGioHang" runat="server" CssClass="tableGioHang" OnRowCancelingEdit="grdGioHang_RowCancelingEdit" OnRowDeleting="grdGioHang_RowDeleting" OnRowEditing="grdGioHang_RowEditing" OnRowUpdating="grdGioHang_RowUpdating" OnSelectedIndexChanged="grdGioHang_SelectedIndexChanged" AutoGenerateColumns="False">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" CancelText="Hủy Bỏ" DeleteText="Xóa" EditText="Sửa" UpdateText="Cập nhật">
                    <HeaderStyle />
                </asp:CommandField>
                <asp:CommandField ShowEditButton="True" CancelText="Hủy Bỏ" DeleteText="Xóa"
                    EditText="Sửa" UpdateText="Cập Nhật">
                    <HeaderStyle />
                </asp:CommandField>
                <asp:BoundField DataField="ID" HeaderText="Mã Hàng">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="TenSP" HeaderText="Tên Hàng">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Price" DataFormatString="{0:0,000}" HeaderText="Đơn Giá">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SoLuong" HeaderText="Số Lượng">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="TongTien" HeaderText="Thành Tiền"
                    DataFormatString="{0:0,000}">
                    <HeaderStyle />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        <br />
        <div style="display: flex; flex-direction: row; font-weight: bold; margin-left: 780px;">
            <asp:Label runat="server">Total Price</asp:Label>
            <asp:Label ID="lblTongTien" CssClass="lblTongTien" runat="server" Style="font-size: 14px; margin-left: 30px"></asp:Label>
        </div>
        <br />
        <br />
        <div style="display: flex; flex-direction: row;">
            <asp:LinkButton ID="butMuahang" runat="server" Width="170px" Height="40px" PostBackUrl="~/ThucDon.aspx" CssClass="muahang" Style="font-size: 14px; display: flex; align-items: center; justify-content: center; font-weight: bold">
            <i class="bi bi-arrow-left-circle"></i>&ensp;
            Tiếp Tục Mua Hàng
            </asp:LinkButton>
            &nbsp;
        <asp:LinkButton ID="butDathang" runat="server" Height="40px" Width="100px" OnClick="butDathang_Click" CssClass="muahang" Style="font-size: 14px; display: flex; align-items: center; justify-content: center; font-weight: bold" PostBackUrl="~/Customers/DonHangg.aspx">
        <i class="bi bi-cart-check-fill"></i>&ensp;
        Đặt Hàng
        </asp:LinkButton>
        </div>
    </div>
</asp:Content>
