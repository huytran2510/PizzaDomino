<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ChonSanPham.aspx.cs" Inherits="DoAnTest.ChonSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../CSS/ThucDon.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/ChonSP.css" rel="stylesheet" type="text/css" />
    <div class="cart" style="border: 1px solid #dee2e6; height: 100%;">
        <div>
            <asp:Image ID="Image1" src="https://dominos.vn/img/illustration/empty-cart.svg" runat="server" />
            <p>Xin mời bạn mua hàng</p>
        </div>
        <div id="productDetailsModal" class="modal">
            <div class="modal-content">
                <div class="imgCSP">
                    <asp:Image ID="image" CssClass="imgSP" runat="server" />
                </div>
                <div class="thongtinCSP">
                    <div style="width: 330px; height: 70px;">
                        <asp:Label ID="lblTenSP" runat="server"></asp:Label>
                    </div>
                    <%--<asp:Label ID="lblMasp" runat="server"></asp:Label>--%>
                    <div class="soluong">
                        <asp:Button ID="btnDecrement" runat="server" Text="-" OnClick="btnDecrement_Click" />
                        <%--<button id="btnDecrement" class="button">-</button>--%>
                        <asp:TextBox ID="txtSoluong" CssClass="textbox" value="1" runat="server" Width="40px">
                        </asp:TextBox>
                        <%--<button id="btnIncrement" class="button">+</button>--%>
                        <asp:Button ID="btnIncrement" runat="server" Text="+" OnClick="btnIncrement_Click" />
                    </div>
                    <asp:Label ID="lblDonGia"  runat="server"></asp:Label>
                </div>
            </div>
            <asp:Button ID="butInsert" CssClass="btnGioHang" runat="server" Text="Thêm Vào Giỏ Hàng" OnClick="butInsert_Click"  />
        </div>
    </div>
    <script type="text/javascript">
        const txtNumber = document.getElementById("<%= txtSoluong.ClientID %>");
        const btnIncrement = document.getElementById("btnIncrement");
        const btnDecrement = document.getElementById("btnDecrement");

        btnIncrement.addEventListener("click", function () {
            const currentValue = parseInt(txtNumber.value);
            if (currentValue >= 0) {
                txtNumber.value = currentValue + 1;
            }
        });

        btnDecrement.addEventListener("click", function () {
            const currentValue = parseInt(txtNumber.value);
            if (currentValue > 0) {
                txtNumber.value = currentValue - 1;
            }
        });
    </script>
</asp:Content>
