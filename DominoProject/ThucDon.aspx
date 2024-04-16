<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ThucDon.aspx.cs" Inherits="DoAnTest.ThucDon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/ThucDon.css" rel="stylesheet" type="text/css" />
    <div style="margin-top: 100px;" class="thucdon">
        <div class="container-thucdon">
            <div class="menuThucDon">
                <asp:Menu ID="Menu2" runat="server" OnMenuItemClick="Menu2_MenuItemClick">
                    <StaticMenuItemStyle CssClass="menuThucDon" />
                    <DynamicMenuItemStyle CssClass="menuThucDon" />
                    <Items>
                        <asp:MenuItem Text="Khuyến mãi mỗi ngày" ImageUrl="~/Images/discount.png" NavigateUrl="~/KhuyenMai.aspx" Value="" >
                        </asp:MenuItem>
                        <asp:MenuItem Text="Pizza" ImageUrl="~/Images/pizza.png" Value="1"></asp:MenuItem>
                        <asp:MenuItem Text="Món phụ" ImageUrl="~/Images/food.png" Value="2"></asp:MenuItem>
                        <asp:MenuItem Text="Tráng miệng" ImageUrl="~/Images/sweets.png" Value="3"></asp:MenuItem>
                        <asp:MenuItem Text="Thức uống" ImageUrl="~/Images/water-bottle.png" Value="4"></asp:MenuItem>
                    </Items>
                </asp:Menu>
            </div>
            <div class="listThucDon">
                <div class="data-list">
                    <asp:DataList ID="lstSanPham" class="data-list-item" runat="server" DataSourceID="srcLoai" RepeatColumns="5" HorizontalAlign="Justify" DataKeyField="ID" DataMember="DefaultView" EnableTheming="True">
                        <ItemTemplate>
                            &nbsp;
                            <asp:ImageButton ID="ImageButton1" CssClass="img" Height="120px" Width="200px" runat="server"
                                PostBackUrl='<%# "~/Customers/ChonSanPham.aspx?ID=" + Eval("ID") %>'
                                ImageUrl='<%# Eval("image") %>' />
                            <div style="height: 60px; width: 200px">
                                <asp:HyperLink ID="HyperLink1" CssClass="hyperlinkSP" runat="server" Text='<%# Eval("tenSP") %>' NavigateUrl='<%# "~/Customers/ChonSanPham.aspx?ID=" + Eval("ID") %>'>HyperLink</asp:HyperLink>
                            </div>
                            <br />
                            <asp:Label ID="sizeLabel" runat="server" Text='<%# Eval("size") %>' />
                            <br />
                                <asp:Label ID="priceLabel" runat="server" CssClass="price" Text='<%# Eval("price", "{0:N0}₫") %>' />
                            <hr />
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>

        </div>
    </div>
    <asp:SqlDataSource ID="srcLoai" runat="server" ConnectionString="<%$ ConnectionStrings:pizzaConnectionString2 %>"
        SelectCommand="SELECT ID, tenSP, size, price, image FROM Products where maloaiSP = @maloaiSP ORDER By tenSP">
        <SelectParameters>
            <asp:Parameter Name="maloaisp" Type="Int32" DefaultValue="1" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
