<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="DoAnTest.TrangChu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body {
            overflow: hidden;
        }

        #image-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            align-items: center;
            justify-content: center;
            z-index: 9999;
        }

        #background-image {
            max-width: 40%;
            max-height: 60%;
        }

        #close-button {
            position: absolute;
            top: 90px;
            right: 580px;
            cursor: pointer;
            color: white;
            font-size: 26px;
            background-color: #e31837;
            width: 40px;
            text-align: center;
        }
    </style>
    <link href="CSS/css.css" rel="stylesheet" type="text/css" />
    <div class="container">
        <div>
            <div class="order-button" style="font-weight: bold" onclick="scrollToOrderSection(this)">
                Đặt hàng
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-down"
            viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z" />
        </svg>
            </div>
        </div>
        <div class="image-container">
            <div class="image-slider">
                <asp:Image ID="Image1" runat="server" src="https://img.dominos.vn/BANNER+WEB+-+MGW+11+(2).jpg" alt="Your Image" />
            </div>
        </div>
        <div class="order-section">
            <div class="header-dish">
                <div>
                    <p>Hôm Nay Ăn Gì ?</p>
                </div>
                <div style="margin-left: 30px; border-bottom: 2px solid red; cursor: pointer">
                    <p>Best Seller</p>
                </div>
            </div>
            <hr style="width: 850px" />
            <div class="data-list">
                &nbsp;<asp:DataList ID="DataList1" runat="server" class="data-list-item" DataSourceID="SqlDataSource1" RepeatColumns="4">
                    <ItemTemplate>
                        &nbsp;
                        <asp:ImageButton ID="ImageButton1" CssClass="img" runat="server" Height="120px" ImageUrl='<%# Eval("image") %>' PostBackUrl='<%# "~/Customers/ChonSanPham.aspx?ID=" + Eval("ID") %>' Width="200px" />
                        <br />
                        <div style="height: 30px">
                            <asp:Label ID="tenSPLabel" runat="server" Text='<%# Eval("tenSP") %>' />
                        </div>
                        <br />
                        <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size")  %> ' />
                        <asp:Label ID="priceLabel" runat="server" CssClass="price" Text='<%# Eval("price", "{0:N0}₫") %>' />
                    </ItemTemplate>
                </asp:DataList>
            </div>
            <div style="display: flex; align-items: center; justify-content: center;">
                <asp:Button ID="btnThucDon" CssClass="btnThucDon" runat="server" Text="Xem Thêm" OnClick="Button1_Click" />
            </div>
            <div class="dish-content">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:pizzaConnectionString %>" SelectCommand="SELECT ID, [tenSP],size, [price], [image] FROM [Products] WHERE ([bestSeller] = @bestSeller)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="1" Name="bestSeller" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div id="image-overlay">
        <div id="close-button" onclick="closeImage()">X</div>
        <img id="background-image" src="https://img.dominos.vn/BANNER+POPUP+-+MGW+11.jpg" alt="Background Image">
    </div>
    <script>
        function closeImage() {
            const imageOverlay = document.getElementById('image-overlay');
            imageOverlay.style.display = 'none';
            document.body.style.overflow = 'auto'; // Bật lại cuộn trang web
        }

        function scrollToOrderSection(button) {
            const orderSection = document.querySelector('.order-section');
            if (orderSection) {
                orderSection.scrollIntoView({ behavior: 'smooth' });
            }
            button.style.display = 'none'; // Ẩn nút khi click vào nó
        }

        const orderButton = document.querySelector('.order-button');
        const orderSection = document.querySelector('.order-section');

        window.addEventListener('scroll', () => {
            if (orderButton && orderSection) {
                const orderButtonRect = orderButton.getBoundingClientRect();
                const orderSectionRect = orderSection.getBoundingClientRect();
                if (orderButtonRect.top >= orderSectionRect.top) {
                    orderButton.style.display = 'none'; // Khi cuộn đủ xa, ẩn nút
                }
            }
        });
    </script>
</asp:Content>
