<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="DoAnTest.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="CSS/login.css" rel="stylesheet" type="text/css" />
    <div style="margin-top: 130px; display:flex; flex-direction:row; align-items:center;justify-content:center">
        <div class="imageLogin">

        </div>
        <div class="formLogin">
            <asp:Login ID="Login1" CssClass="login" runat="server" BorderPadding="4"  Font-Size="14px" ForeColor="#333333" PasswordRequiredErrorMessage="Phải nhập mật khẩu!." TextLayout="TextOnTop" TitleText="Đăng Nhập" UserNameRequiredErrorMessage="Phải nhập tên!"
                CreateUserText="Register" CreateUserUrl="~/Register.aspx"
                FailureText="Đăng nhập không thành công. Hãy thử lại!"
                PasswordLabelText="Mật Khẩu:" RememberMeText="Ghi Nhớ Mật Khẩu" Height="200px" Width="200px" LoginButtonText="Đăng Nhập" DestinationPageUrl="~/Admin/ChiTietSanPham.aspx">
                <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
                <LoginButtonStyle Font-Size="13px" />
                <TextBoxStyle Font-Size="13px" />
                <TitleTextStyle  Font-Bold="True" Font-Size="15px" ForeColor="White" />
            </asp:Login>
        </div>
    </div>
</asp:Content>
