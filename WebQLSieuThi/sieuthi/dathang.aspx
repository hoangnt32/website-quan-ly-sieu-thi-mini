<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/BanHangOnl.master" AutoEventWireup="true" CodeFile="dathang.aspx.cs" Inherits="BanHang_dathang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 140px;
        }
        td{
            font-size:13.5px;
            height:30px;
        }
        .dki{
           padding:3px;
           width:100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;font-size:20px;font-weight:900;margin-top:4%;margin-bottom:2%">THÔNG TIN ĐƠN ĐẶT HÀNG</div>
    <div class="Cnt_R_C_W wapp100 fl">
        <p class="Title_Cnt_R_C_W fl"><img src="../img/logo/titile.png" /><span><asp:Label style="position:relative;top:2%" ID="lbldanhmuc" runat="server" Text="THÔNG TIN SẢN PHẨM"></asp:Label></span></p>
        <div style=" overflow-y: hidden; width: 100%; margin:5% 5% 2% 5%;">
             <asp:GridView ID="gvgiohang" runat="server" AllowPaging="True" Width="90%" AutoGenerateColumns="False" CellPadding="4" Height="40px" HorizontalAlign="Center" DataKeyNames="MaSP" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
        <AlternatingRowStyle VerticalAlign="Middle" />
        <Columns>
            <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" HeaderStyle-ForeColor="White" ItemStyle-Width="100px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle CssClass="item" HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-ForeColor="White" ItemStyle-Width="200px">
<HeaderStyle ForeColor="White"></HeaderStyle>

<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Hình minh họa" ItemStyle-Width="100px">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Hinh") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="46px" ImageUrl='<%# Eval("Hinh") %>' Width="46px" />
                </ItemTemplate>
                <HeaderStyle ForeColor="White" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" HeaderStyle-ForeColor="White" ItemStyle-Width="90px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="GiaBan" HeaderText="Đơn giá" HeaderStyle-ForeColor="White" ItemStyle-Width="90px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" HeaderStyle-ForeColor="White" ItemStyle-Width="90px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="KhuyenMai" HeaderText="Khuyến mãi" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0 %}" ItemStyle-Width="80px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ThanhTien" HeaderText="Thành Tiền" DataFormatString="{0:#,##0.##}" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="110px">
<HeaderStyle ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" Width="110px"></ItemStyle>
             </asp:BoundField>
          
        </Columns>
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle Height="40px" Wrap="True" BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle Height="30px" HorizontalAlign="Justify" VerticalAlign="Middle" BackColor="White" ForeColor="#003399" CssClass="item" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>
        </div>
         <div style="text-align: right; margin-right:5%;">
        <asp:Label ID="lbltongcong" runat="server" Font-Size="14px" Text="Tổng Cộng: " Visible="False"></asp:Label>
&nbsp;<asp:Label ID="lbltongthanhtien" runat="server" Font-Size="14px" Visible="False" Font-Bold="True" Font-Italic="False"></asp:Label></div>
    </div>
    <div class="Cnt_R_C_W wapp100 fl">
        <p class="Title_Cnt_R_C_W fl"><img src="../img/logo/titile.png" /><span><asp:Label style="position:relative;top:2%" ID="Label1" runat="server" Text="THÔNG TIN GIAO HÀNG"></asp:Label></span></p>
        <div style="margin-left:10%;margin-right:10%;margin-top:10%;margin-bottom:10%; border:1px solid green;padding-top:5%;padding-bottom:5%">
    <table style="width: 80%;margin:auto;">
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lblten" runat="server" Text="Họ tên người nhận"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txthoten" CssClass="dki" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator style="padding:0px 5px; font-size:12px; color:red" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập họ tên." ControlToValidate="txthoten" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
            
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label2" runat="server" Text="Địa chỉ"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtdiachi" CssClass="dki" runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator style="padding:0px 5px; font-size:12px; color:red" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập địa chỉ nhận hàng." ControlToValidate="txtdiachi" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
          
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label3" runat="server" Text="Điện thoại"></asp:Label>
            </td>
            <td>
            <asp:TextBox ID="txtdt" CssClass="dki" runat="server" MaxLength="10"></asp:TextBox>
                 <asp:RequiredFieldValidator style="padding:0px 5px; font-size:12px; color:red" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập số điện thoại." ControlToValidate="txtdt" Display="Dynamic"></asp:RequiredFieldValidator>
            </td>
           
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label10" runat="server" Text="Hình thức giao hàng"></asp:Label>
            </td>
            <td>
                <asp:DropDownList CssClass="dki" Width="102%"  ID="cmbhtgh" runat="server" >
                    <asp:ListItem>Nhận tại siêu thị</asp:ListItem>
                    <asp:ListItem Selected="True">Giao tận nơi</asp:ListItem>
                </asp:DropDownList>
            </td>
        
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label9" runat="server" Text="Hình thức thanh toán"></asp:Label>
            </td>
            <td>
                <asp:Label ID="txthttt" CssClass="dki" Text="Thanh toán sau khi nhận hàng" runat="server"></asp:Label>
            </td>
        </tr>
         <tr>
            <td class="auto-style1" style="color:red">
                <asp:Label ID="lblthongbao" runat="server" Text=""></asp:Label>
            </td>
            <td>
                
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="Label5" runat="server" Text=""></asp:Label>
            </td>
            <td>
                <asp:Button ID="btndathang" style="padding:5px;margin-top:5%" runat="server" Text="Đặt hàng" OnClick="btndathang_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
    </table>
        </div>
    </div>
</asp:Content>

