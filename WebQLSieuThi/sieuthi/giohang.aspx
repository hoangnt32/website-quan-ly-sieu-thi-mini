<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/BanHangOnl.master" AutoEventWireup="true" CodeFile="giohang.aspx.cs" Inherits="BanHang_giohang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;">
        <asp:Label style="font-family:Tahoma;font-size:20px;position:relative;top:50px;font-weight:bold;" ID="lbltb" runat="server"></asp:Label>
    </div>
    <div style=" overflow-y: hidden; width: 100%; margin:5%">
    <asp:GridView ID="gvgiohang" runat="server" AllowPaging="True" Width="90%" AutoGenerateColumns="False" CellPadding="4" Height="40px" HorizontalAlign="Center" DataKeyNames="MaSP" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellSpacing="2" OnRowCommand="gvgiohang_RowCommand">
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
            <asp:TemplateField HeaderText="Số lượng" HeaderStyle-ForeColor="White" ItemStyle-Width="70px">
                <ItemTemplate>
                    <asp:TextBox ID="txtsoluong" min="1" runat="server" Text='<%# Eval("SoLuong") %>' TextMode="Number" Width="32px"></asp:TextBox>
                </ItemTemplate>

<HeaderStyle ForeColor="White"></HeaderStyle>
                <ItemStyle HorizontalAlign="Center" />
            </asp:TemplateField>
            <asp:BoundField DataField="KhuyenMai" HeaderText="Khuyến mãi" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0 %}" ItemStyle-Width="80px">
<HeaderStyle ForeColor="White"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="ThanhTien" HeaderText="Thành Tiền" DataFormatString="{0:#,##0}" HeaderStyle-ForeColor="White" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="110px">
<HeaderStyle ForeColor="White"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" Width="110px"></ItemStyle>
             </asp:BoundField>
            <asp:ButtonField CommandName="Xoa" Text="Xóa" ItemStyle-HorizontalAlign="Center" />
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
    <div>
         <div style="text-align: right; margin-right:5%;">
        <asp:Label ID="lbltongcong" runat="server" Font-Size="14px" Text="Tổng Cộng: " Visible="False"></asp:Label>
&nbsp;<asp:Label ID="lbltongthanhtien" runat="server" Font-Size="14px" Visible="False" Font-Bold="True" Font-Italic="False"></asp:Label></div>
    <div style="margin-top:2%;margin-bottom:5%;text-align: center;">
        <asp:Button ID="btnmuahang" runat="server" OnClick="btnmuahang_Click" Text="Đặt Hàng" Font-Size="14px" Visible="False" BackColor="#000066" BorderColor="White" Font-Bold="True" ForeColor="White" Height="30px" Width="100px" style="margin-right: 20px; border-radius:5px 5px" />
         <asp:Button ID="btncapnhat" runat="server" Text="Cập Nhật" OnClick="btncapnhat_Click" Font-Size="14px" Visible="False" BackColor="#000066" BorderColor="White" Font-Bold="True" ForeColor="White" Height="30px" Width="100px" style="margin-right: 20px;border-radius:5px 5px" />
         <asp:Button ID="btnxoa" runat="server" Text="Xóa Giỏ Hàng" OnClick="btnxoa_Click" Font-Size="14px"  Visible="False" BackColor="#000066" BorderColor="White" Font-Bold="True" ForeColor="White" Height="30px" Width="120px" style="margin-right: 20px; padding:5px;border-radius:5px 5px" />
    </div>
    <div style="margin-top:2%;margin-bottom:5%;text-align:right;padding-right:5%">
         <asp:HyperLink ID="btntieptucmua" runat="server" Visible="False" NavigateUrl="~/trangchu.aspx" Font-Size="14px" Font-Italic="True" CssClass="tieptucmua" ForeColor="#006600">Tiếp tục mua >></asp:HyperLink>
    </div>    
    </div>
    
</asp:Content>

