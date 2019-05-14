<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/BanHangOnl.master" AutoEventWireup="true" CodeFile="huongdanmuahang.aspx.cs" Inherits="sieuthi_huongdanmuahang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .hd{
            font-size:15px;
            font-weight:bold;
            margin-bottom:3%;
            margin-top:3%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:90%;margin:5% auto">
        <p style="text-align:center;font-size:20px;font-weight:bold;">HƯỚNG DẪN MUA HÀNG</p>
        <p class="hd">Bước 1: Tìm kiếm sản phẩm cần mua</p>
        <p style="text-align:center"><img src="../img/hdmuahang/timkiem.png" /></p>
        <p class="hd">Bước 2: Nhấn vào "Mua Ngay", chuyển đến trang Giỏ hàng, bạn có thể tùy chỉnh số lượng mua</p>
        <p style="text-align:center"><img src="../img/hdmuahang/giohang.png" /></p>
        <p class="hd">Bước 3: Nhập thông tin giao hàng và nhấn "Đặt hàng"</p>
        <p style="text-align:center"><img src="../img/hdmuahang/thongtingiaohang.png" /></p>
        <p class="hd">Bước 4: Xem lại thông tin đặt hàng trong "Đơn hàng của tôi"</p>
        <p style="text-align:center"><img src="../img/hdmuahang/donhang.png" /></p>
    </div>
</asp:Content>

