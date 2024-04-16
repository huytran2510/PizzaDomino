<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="KhuyenMai.aspx.cs" Inherits="DoAnTest.KhuyenMai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/KhuyenMai.css" rel="stylesheet" type="text/css" />
    <div class="background-km">
        <div>
            <img src="https://img.dominos.vn/BANNER+PROMOTION+-+MGW+11+(1).png">
        </div>
        <div style="display: flex; align-items: center; justify-content: center;">
            <div class="content">
                <h1>MEGA WEEK - GIẢM 50% TỔNG HÓA ĐƠN</h1>
                <hr>
                <br>
                <p>
                    * Giảm 50% tổng hóa đơn khi mua từ 2 Pizza size M/L.
                </p>
                <p>
                    * Áp dụng giảm cho pizza, món phụ và thức uống (Trừ các
                sản phẩm sau: Viền xúc xích, Viền xúc xích phô mai, Extra Cheese, Mỳ Ý
                Dăm Bông & Nấm Xốt Kem, Bánh Sô-Cô-La Đút Lò).
                </p>
                <p>
                    * Áp dụng từ 06/11 đến
            12/11/2023 khi Dùng bữa tại chỗ, Mua mang về hoặc Giao hàng tận nơi trên
            toàn hệ thống cửa hàng Domino's Pizza (trừ cửa hàng sân bay).
                </p>
                <asp:Button ID="Button1" runat="server" Text="Đặt ngay" CssClass="btnKm"  OnClick="Button1_Click" />
            </div>
            <div style="height:380px; width: 5px; background-color:#e31837; border-top-right-radius: 10px;
        border-bottom-right-radius: 10px;">

            </div>
        </div>
    </div>
</asp:Content>
