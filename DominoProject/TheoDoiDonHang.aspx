<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="TheoDoiDonHang.aspx.cs" Inherits="DoAnTest.TheoDoiDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/TheoDoiDonHang.css" rel="stylesheet" type="text/css" />
    <div class="container-tddh">
        <div class="image-tddh">
            <img src="https://dominos.vn/img/stock-stracking.png">
        </div>
        <div>
            <div class="form-search">
                <asp:TextBox ID="txtMaDH" AutoPostBack="true" placeholder="Vui lòng nhập mã đơn hàng của bạn" CausesValidation="true" runat="server"></asp:TextBox>
                <asp:ImageButton ID="ImageButton1" ImageUrl="/Images/search.png" runat="server" OnClick="ImageButton1_Click" />
                <br />
                <div>
                    <asp:RequiredFieldValidator
                        ID="RequiredFieldValidator1"
                        runat="server"
                        ControlToValidate="txtMaDH"
                        Display="Dynamic"
                        ErrorMessage="Vui lòng nhập mã đơn hàng."
                        ForeColor="Red">
                    </asp:RequiredFieldValidator>
                </div>
            </div>
            <div>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Pizza %>"
                    SelectCommand="SELECT o.[ID], o.[date], o.[totalPrice], c.Name, o.[status] FROM [Orders] o JOIN [Customers] c ON o.id_customer = c.ID WHERE (o.[ID] = @ID)"
                    UpdateCommand="UPDATE Orders SET [status] = @NewStatus WHERE [ID] = @ID">
                    <UpdateParameters>
                        <asp:Parameter Name="NewStatus" Type="String" />
                        <asp:Parameter Name="ID" Type="String" />
                    </UpdateParameters>
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtMaDH" DefaultValue="" Name="ID" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <asp:GridView CssClass="butonConfirm" ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand" DataKeyNames="ID" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" PagerSettings-Mode="Numeric">
        <Columns>
            <asp:BoundField DataField="ID" HeaderText="Mã Đơn Hàng" SortExpression="ID" />
            <asp:BoundField DataField="date" HeaderText="Ngày Đặt Hàng" SortExpression="date" />
            <asp:BoundField DataField="totalPrice" HeaderText="Tổng Giá Tiền" SortExpression="totalPrice" DataFormatString="{0:N0}₫" />
            <asp:BoundField DataField="Name" HeaderText="Tên Khách Hàng" SortExpression="Name" />
            <asp:BoundField DataField="status" HeaderText="Trạng Thái Đơn hàng" SortExpression="status" />
            <asp:ButtonField ButtonType="Button" CommandName="UpdateStatus" Text="Xác Nhận Đơn Hàng" />
        </Columns>
    </asp:GridView>
</asp:Content>
