<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="DonHangg.aspx.cs" Inherits="DoAnTest.DonHangg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../CSS/Giohang.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/DonHang.css" rel="stylesheet" type="text/css" />
    <div style="display: flex; margin-top: 120px;">
        <div>
            <div class="thongtinNhanHang">
                <div class="thongtinNguoiDung">
                    <h4>Thông tin người dùng</h4>
                    <h4>Tên khách hàng*</h4>
                    <asp:TextBox ID="txtTen" Placeholder="Nhập tên khách hàng" CssClass="textbox" runat="server"></asp:TextBox>
                    <h4>Email</h4>
                    <asp:TextBox ID="txtEmail" Placeholder="Nhập email của bạn" CssClass="textbox" runat="server"></asp:TextBox><br />
                    <span style="font-size: 12px; color: #717273; font-weight: bold;">Kiểm tra đơn hàng ở hộp thư đến hoặc thư mục spam</span>
                    <h4>Số điện thoại*</h4>
                    <asp:TextBox ID="txtSDT" Placeholder="Nhập số điện thoại của bạn để đặt hàng" CssClass="textbox" runat="server"></asp:TextBox>
                </div>
                <div class="thongtinDatHang">
                    <h4>Thông tin đặt hàng</h4>
                    <h4>Địa chỉ</h4>
                    <asp:TextBox ID="txtDiaChi" Placeholder="Nhập địa chỉ giao hàng" CssClass="textbox" runat="server"></asp:TextBox>
                    <h4>Ghi Chú</h4>
                    <asp:TextBox ID="txtGhiChu" Placeholder="Nhập ghi chú" CssClass="textbox" runat="server"></asp:TextBox>
                    <h4>Giờ nhận hàng</h4>
                    <asp:TextBox ID="txtGio" Placeholder="Nhập giờ nhận hàng" CssClass="textbox" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="pt">
                <div class="column">
                    <div class="radio">
                        <asp:RadioButton GroupName="radio" ID="RadioButton1" runat="server" /><span><image class="image-size" src="https://img.dominos.vn/icon-payment-method-atm.png"></image>ATM</span>
                    </div>
                    <div class="radio">
                        <asp:RadioButton GroupName="radio" ID="RadioButton2" runat="server" /><span><image class="image-size" src="https://img.dominos.vn/icon-payment-method-mo-mo.png"></image>Ví MoMo</span>
                    </div>
                    <div class="radio">
                        <asp:RadioButton GroupName="radio" ID="RadioButton3" runat="server" /><span><image class="image-size" src="https://img.dominos.vn/shoppepay.png"></image>Ví ShoppeePay</span>
                    </div>
                </div>
                <div class="column">
                    <div class="radio">
                        <asp:RadioButton GroupName="radio" ID="RadioButton4" runat="server" /><span><image class="image-size" src="https://img.dominos.vn/icon-payment-method-credit.png"></image>Thẻ tín dụng/Ghi nợ</span>
                    </div>
                    <div class="radio">
                        <asp:RadioButton GroupName="radio" ID="RadioButton5" runat="server" /><span><image class="image-size" src="https://img.dominos.vn/icon-payment-method-zalo-pay.png"></image>Ví ZaloPay</span>
                    </div>
                    <div class="radio">
                        <asp:RadioButton GroupName="radio" ID="RadioButton6" runat="server" /><span><image class="image-size" src="https://img.dominos.vn/cash.png"></image>Tiền mặt</span>
                    </div>
                </div>
            </div>
            <asp:Button ID="butDongY" runat="server"
                Text="Thanh Toán"
                CssClass="btnNhanHang"
                OnClick="butDongY_Click" />
            &nbsp; 
                        <asp:Label ID="lblStatus" runat="server"
                            ForeColor="#0033CC" Style="font-size: 14px">
                        </asp:Label>
        </div>
        <div>
            <asp:DataList ID="dlstDonHang" runat="server" RepeatDirection="Vertical">
                <ItemTemplate>
                    <div class="product-item" style="font-family:">
                        <div style="display:flex;flex-direction:row;">
                            <asp:Label ID="lblSoLuong" runat="server" Text='<%# Eval("SoLuong") %>'></asp:Label>&nbsp; X &nbsp;
                            <div style=" width:250px">
                            <asp:Label ID="lblTenSP" runat="server" Text='<%# Eval("TenSP") %>'></asp:Label>
                            </div>
                            <asp:Label ID="lblTien" runat="server" Text='<%# String.Format("{0:0,000.00} VNĐ", Eval("TongTien")) %>'></asp:Label>
                        </div>
                        <div style="display:flex; align-items:center; justify-content:center;">
                            <asp:Image ID="imgProduct" runat="server" ImageUrl='<%# Eval("Image") %>' CssClass="imgProduct" Width="200px" Height="140px" />
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            <asp:Label ID="lblDiscount" runat="server"  Style="font-size: 14px"></asp:Label>
            <asp:Label ID="lblTongTien" runat="server"  Style="font-size: 14px"></asp:Label>
        </div>
    </div>

</asp:Content>
