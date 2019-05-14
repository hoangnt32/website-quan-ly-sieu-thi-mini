<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/BanHangOnl.master" AutoEventWireup="true" CodeFile="donhuy.aspx.cs" Inherits="sieuthi_donhuy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .row-style-1{
            font-size:14px;
            font-family:Tahoma;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;font-size:20px;font-weight:900;margin-top:4%">THÔNG TIN ĐƠN HÀNG ĐÃ HỦY</div>
    <div class="Cnt_R_C_W wapp100 fl">
        <div style=" overflow-y: hidden; width: 100%; margin:5% 5% 2% 5%;">
            <asp:GridView ID="gvdonhang" runat="server" GridLines="None" ShowHeader="False" AutoGenerateColumns="false" OnRowDataBound="gvdonhang_RowDataBound">
             <Columns>
                <asp:TemplateField>
                <ItemTemplate>
                    <p class="Title_Cnt_R_C_W fl" style="margin-bottom:2%"><img src="../img/logo/titile.png" /><span><asp:Label style="position:relative;top:2%" ID="lbldanhmuc" runat="server" Text='<%# "ĐƠN HÀNG "+ Eval("MaDH") %>'></asp:Label></span>
                        <span style="margin-left:42%"><asp:Label style="position:relative;top:2%;" ID="Label4" runat="server" Text='<%# "NGÀY ĐẶT HÀNG   "+ Eval("NgayDH","{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label></span>
                    </p>
                    <asp:Literal ID="lblMa" Text=<%# Eval("MaDH") %> Visible="false" runat="server"></asp:Literal> 
                    <p>
                        <table style="width: 100%;margin-bottom:2%">
                            <tr class="row-style-1">
                                <td><asp:Label ID="lbltennhan" runat="server" Text='<%# "Họ tên người nhận: "+ Eval("TenNguoiNhan") %>'></asp:Label></td>
                                <td><asp:Label ID="Label2" runat="server" Text='<%# "Số điện thoại người nhận: "+ Eval("SDT") %>'></asp:Label></td>
                               
                            </tr>
                            <tr class="row-style-1">
                                <td><asp:Label ID="Label1" runat="server" Text='<%# "Địa chỉ nhận: "+ Eval("DiaChiNhan") %>'></asp:Label></td>
                                <td><asp:Label ID="Label3" runat="server" Text='<%# "Ngày nhận hàng muộn nhất: "+ Eval("NgayGH","{0:dd/MM/yyyy}") %>'></asp:Label></td>
                                
                            </tr>
                             <tr class="row-style-1">
                                <td><asp:Label ID="Label5" runat="server" Text='<%# "Trạng thái: "+ Eval("TrangThai") %>'></asp:Label></td>
                                <td></td>
                                
                            </tr>
                        </table>
                    </p>   
          <asp:GridView ID="gvgiohang" runat="server" AllowPaging="True" Width="90%" AutoGenerateColumns="False" CellPadding="4" Height="40px" HorizontalAlign="Center" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellSpacing="2">
        <AlternatingRowStyle VerticalAlign="Middle" />
        <Columns>
            <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-ForeColor="White" ItemStyle-Width="200px">
<HeaderStyle ForeColor="White"></HeaderStyle>

<ItemStyle Width="200px"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="Hình minh họa" ItemStyle-Width="100px">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("HinhAnh") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="46px" ImageUrl='<%# Eval("HinhAnh") %>' Width="46px" />
                </ItemTemplate>
                <HeaderStyle ForeColor="White" />
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="DVT" HeaderText="Đơn vị tính" HeaderStyle-ForeColor="White" ItemStyle-Width="90px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="GiaBan" HeaderText="Đơn giá" DataFormatString="{0:#,##0}" HeaderStyle-ForeColor="White" ItemStyle-Width="90px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" HeaderStyle-ForeColor="White" ItemStyle-Width="90px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="KhuyenMai" HeaderText="Khuyến mãi" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0} %" ItemStyle-Width="80px">
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
         <div style="text-align: right; margin-right:5%; margin-top:2%;margin-bottom:2%">
        <asp:Label ID="lbltongcong" runat="server" Font-Size="14px" Text="Tổng Cộng: " Visible="False"></asp:Label>
&nbsp;<asp:Label ID="lbltongthanhtien" runat="server" Font-Size="14px" Visible="False" Font-Bold="True" Font-Italic="False"></asp:Label></div>
             </ItemTemplate>        
     </asp:TemplateField>
   </Columns>
                </asp:GridView>
            
        </div>
    </div>
</asp:Content>

