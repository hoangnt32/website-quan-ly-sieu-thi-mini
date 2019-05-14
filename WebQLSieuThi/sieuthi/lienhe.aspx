<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/BanHangOnl.master" AutoEventWireup="true" CodeFile="lienhe.aspx.cs" Inherits="sieuthi_lienhe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        tr{
            height:35px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="width:90%;margin:30px auto; font-size:14px;font-family:Tahoma;line-height:25px">
       Địa chỉ: 983 - Đại lộ Bình Dương - Thành phố Thủ Dầu Một - Bình Dương<br />
       Hotline: 0983404404 - 0815220200 <br />
       Facebook: <a href="https://www.facebook.com/Siêu-Thị-ABC-2257170260972373" target="_blank">https://www.facebook.com/Siêu-Thị-ABC-2257170260972373</a>
    </p>
    <p style="border:1px solid green;width:95%;margin:auto"></p>
    <p style="width:90%;margin:30px auto;">
        <table style="width:90%;margin:auto">
        <tr>
            <td style="width:120px;">
                <asp:Label ID="Label1" runat="server" Font-Bold="False" Font-Names="Arial" Text="Họ và tên (*)" Font-Size="14px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txthoten" style="padding:1px 3px;" runat="server" Font-Size="14px" Width="400px" Height="22px" ></asp:TextBox>
                
            </td>
            <td style="width:340px"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txthoten" ErrorMessage="Vui lòng nhập Họ và Tên." Font-Names="Arial" Font-Size="13px" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Font-Names="Arial" Text="Số điện thoại" Font-Size="14px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtsdt" style="padding:1px 3px;" runat="server" Font-Size="14px" Width="400px" Height="22px"></asp:TextBox>
                
            </td>
            <td></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Email (*)" Font-Size="14px" ></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtemail" style="padding:1px 3px;" runat="server" Font-Size="14px" Width="400px" Height="22px"></asp:TextBox>               
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtemail" ErrorMessage="Vui lòng nhập Email." Font-Names="Arial" Font-Size="13px" ForeColor="Red" Height="20px" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtemail" ErrorMessage="Email không hợp lệ." Font-Names="Arial" Font-Size="13px" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Height="20px" Display="Dynamic"></asp:RegularExpressionValidator></td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label4" runat="server" Font-Bold="False" Font-Names="Arial" Text="Tiêu đề (*)" Font-Size="14px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txttieude" style="padding:1px 3px;" runat="server" Font-Size="14px" Width="400px" Height="22px"></asp:TextBox>
                
            </td>
            <td><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txttieude" ErrorMessage="Vui lòng nhập Tiêu đề." Font-Names="Arial" Font-Size="13px" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Names="Arial" Text="Nội dung (*)" Font-Size="14px"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtnoidung" style="padding:1px 3px;" runat="server" Font-Size="14px" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
                
             </td>
            <td> <div> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtnoidung" ErrorMessage="Vui lòng nhập Nội dung." Font-Names="Arial" Font-Size="13px" ForeColor="Red" Height="28px" Display="Dynamic"></asp:RequiredFieldValidator></div></td>
        </tr>

    </table>
        <asp:Button ID="btngui" runat="server" Text="Gửi thông tin" OnClick="btngui_Click" BorderWidth="0" style="margin:3% 0 10% 18%; width:120px;height:30px;color:#f8f2f2;background-color:#037a26" />
    </p>
</asp:Content>

