<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="ChiTietSanPham.aspx.cs" Inherits="DoAnTest.Admin.ChiTietSanPham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="ChiTietSP.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <div class="SP">
        <div class="menua" style="">
            <asp:Menu ID="Menu1" runat="server" CssClass="menuSP">
                <StaticMenuItemStyle CssClass="menu-action" />
                <DynamicMenuItemStyle CssClass="menu-action" />
                <Items>
                    <asp:MenuItem Text="CHI TIẾT SẢN PHẨM" ImageUrl="~/Images/product.png" NavigateUrl="~/Admin/ChiTietSanPham.aspx" Value=""></asp:MenuItem>
                    <asp:MenuItem Text="THÊM SẢN PHẨM" ImageUrl="~/Images/add-product.png" NavigateUrl="~/Admin/ThemSanPham.aspx" Value=""></asp:MenuItem>
                </Items>
            </asp:Menu>
        </div>
        <div>
            <h2 style="margin-top: 100px;">DANH MỤC SẢN PHẨM</h2>
            <br />
            <div class="custom-dropdown">
                <i class="fas fa-chevron-down"></i>
                <asp:DropDownList ID="drpLoai" runat="server" AutoPostBack="True"
                    DataSourceID="srcLoai" DataTextField="tenloaiSP" DataValueField="ID">
                </asp:DropDownList>
            </div>
            <br />
            <asp:SqlDataSource ID="srcLoai" runat="server"
                ConnectionString="<%$ ConnectionStrings:pizzaConnectionString3 %>"
                SelectCommand="SELECT * FROM ProductDetails" ProviderName="<%$ ConnectionStrings:pizzaConnectionString3.ProviderName %>"></asp:SqlDataSource>
            <br />
            <div class="table-wrapper">
                <asp:GridView ID="GridView1" runat="server" CssClass="CTSP" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="srcMatHang" AllowPaging="True">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="Mã Sản Phẩm" ReadOnly="True" SortExpression="ID" />
                        <asp:BoundField DataField="tenSP" HeaderText="Tên Sản Phẩm" SortExpression="tenSP" />
                        <asp:BoundField DataField="price" HeaderText="Đơn Giá" SortExpression="price" DataFormatString="{0:N0} VNĐ" />
                        <asp:TemplateField HeaderText="Image">
                            <ItemTemplate>
                                <asp:Image ID="imgImage" CssClass="imageSP" runat="server" ImageUrl='<%# Eval("image") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="srcMatHang" runat="server"
                ConnectionString="<%$ ConnectionStrings:Pizza %>"
                DeleteCommand="DELETE FROM Products WHERE ID = @ID"
                SelectCommand="SELECT ID, tenSP, size, price, image FROM Products where maloaiSP = @maloaiSP"
                UpdateCommand="UPDATE SanPham SET TenSP = @TenSP, price = @price WHERE ID = @ID">
                <DeleteParameters>
                    <asp:Parameter Name="ID" Type="String" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="drpLoai" Name="maloaiSP"
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="TenSP" Type="String" />
                    <%--<asp:Parameter Name="DonViTinh" />--%>
                    <asp:Parameter Name="Price" Type="Double" />
                    <asp:Parameter Name="ID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </div>
</asp:Content>
