<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/BanHangOnl.master" AutoEventWireup="true" CodeFile="hoso.aspx.cs" Inherits="sieuthi_hoso" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
.login-page {
  width: 460px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 460px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family: "Roboto", sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 14px;
}
.form .btn {
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .message a:hover {
  color: #035313;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
.hoso{
  position:relative;
  font-size:14px;
  font-family:Tahoma;
  bottom:5px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-page">
  <div class="form">
    <form class="login-form">
        <div>
            <asp:Label CssClass="hoso" style="position:relative;left:-135px;" ID="sdt" runat="server" Text="Tên đăng nhập"></asp:Label>
         <asp:TextBox ID="txttendn" placeholder="Số điện thoại"  runat="server" Enabled="False"></asp:TextBox>
      <div style="position:relative;bottom:7px;font-size:14px; color:red;">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập tên đăng nhập." ControlToValidate="txttendn" Display="Dynamic"></asp:RequiredFieldValidator>
      </div>
            </div>
        <asp:Label CssClass="hoso" style="position:relative;left:-160px;" ID="Label1" runat="server" Text="Họ tên"></asp:Label>
      <asp:TextBox ID="txthoten" placeholder="Họ tên" runat="server"></asp:TextBox>
      <div style="position:relative;bottom:7px;font-size:14px; color:red;">
      <asp:RequiredFieldValidator ID="tbuser" runat="server" ErrorMessage="Vui lòng nhập họ tên." ControlToValidate="txthoten" Display="Dynamic"></asp:RequiredFieldValidator>
      </div>
        <asp:Label CssClass="hoso" style="position:relative;left:-165px;" ID="Label2" runat="server" Text="Email"></asp:Label>
       <asp:TextBox ID="txtemail" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
         <asp:Label ID="lblemail" runat="server" Visible="False"></asp:Label>
      <div style="position:relative;bottom:7px;font-size:14px; color:red;">
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập email." ControlToValidate="txtemail" Display="Dynamic"></asp:RequiredFieldValidator>
      </div>
      <asp:Button CssClass="btn" ID="btncapnhat" OnClick="btncapnhat_Click" runat="server" Text="Cập nhật" /> 
      <p>
        <asp:Label style="font-size:14px; color:red;position:relative;bottom:8px" ID="lbltbloi" runat="server" Text=""></asp:Label>
    </p>
    </form>
  </div>
</div>
</asp:Content>

