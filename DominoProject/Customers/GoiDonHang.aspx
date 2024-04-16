<%@ Page Title="" Language="C#" MasterPageFile="~/Header.Master" AutoEventWireup="true" CodeBehind="GoiDonHang.aspx.cs" Inherits="DoAnTest.GoiDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>THÔNG BÁO</h2>
    <div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
        <div style="background-color: lightgoldenrodyellow; font-size: 16px; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);">
            <asp:Label ID="lblThongBao" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
