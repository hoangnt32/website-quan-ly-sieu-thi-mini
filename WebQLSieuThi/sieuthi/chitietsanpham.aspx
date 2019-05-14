<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/Master.master" AutoEventWireup="true" CodeFile="chitietsanpham.aspx.cs" Inherits="BanHang_chitietsanpham" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="Cnt_R_C_W wapp100 fl">
     <p></p>
    <asp:DataList ID="DataList1" runat="server" OnItemDataBound="DataList1_ItemDataBound" DataKeyField="MaSP" DataSourceID="SqlCTSP" Width="100%">
        <ItemTemplate>
            <div>
                <div style="padding-top:3%;margin-left:3%">
                <asp:Image ID="Image1" runat="server" Height="210px" ImageAlign="Left" ImageUrl='<%# Eval("HinhAnh") %>' Width="210px" />
           </div>
                
            <br />
                <p style="margin-left:35%">
                    <asp:Label ID="TenSP" runat="server" Text='<%# Eval("TenSP") %>' Font-Size="20px" Font-Bold="True"></asp:Label>
                    <p style="font-size: 17px; font-weight: bold;line-height:33px;margin-left:35%">
                    Giá
                    <asp:Label ID="GiaBanLabel" runat="server" Text='<%# Eval("GiaBan","{0:#,##0 đồng}") %>' Font-Size="17px" Font-Bold="True" />
                </p>
                     <p style="font-size: 14px;line-height:33px;margin-left:35%">
                    Khuyến mãi:
                    <asp:Label ID="KhuyenMaiLabel" runat="server" Text='<%# Eval("KhuyenMai","{0:#,##0} %") %>' Font-Size="14px" />
                </p>
                      <p style="font-size: 14px;margin-left:35%; line-height:33px">
                    Đơn vị tính:
                    <asp:Label ID="lblDVT" runat="server" Text='<%# Eval("DVT") %>' Font-Size="14px" />
                </p>
                     <p style="font-size: 14px;margin-left:35%;line-height:30px">
                    <asp:Label ID="lblslc" runat="server" Font-Size="14px" />
                </p>
                     <p style="margin-top:3%;margin-left:35%"><asp:HyperLink ID="hlmuahang"  runat="server" NavigateUrl='<%# "giohang.aspx?them="+Eval("MaSP") %>'><img src="../img/logo/add_cart.png" title="Thêm vào giỏ"  height="40" /></asp:HyperLink>
                         <asp:HyperLink ID="hldathang"  runat="server" NavigateUrl='<%# "giohang.aspx?msp="+Eval("MaSP") %>' ><img src="../img/logo/dat_hang.png" title="Mua ngay"  height="40" /></asp:HyperLink>
                    </p>
                   
                </p>
                
                <br />
                
                    
           </div>
            <div style="clear:both"></div>
            <div style="margin-top:30px;border-top:ridge lime 3px;padding-top:2%;margin-right:15%"></div>
            <div style="padding-bottom:2%;font-family:Tahoma;font-size:15px;font-weight:bold">THÔNG TIN SẢN PHẨM</div>
            <div style="margin-right:3%;text-align:justify;font-size:14px;font-family:Tahoma;color:black">
                <asp:Label ID="ChiTietLabel" runat="server" style="line-height:20px;color:black" Text='<%# Eval("ChiTiet") %>' />
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlCTSP" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [HinhAnh], [MaSP], [TenSP], [GiaBan], [ChiTiet],[DVT],[KhuyenMai] FROM [SanPham] WHERE ([MaSP] = @MaSP)">
        <SelectParameters>
            <asp:QueryStringParameter Name="MaSP" QueryStringField="maSo" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
         </div>
</asp:Content>

