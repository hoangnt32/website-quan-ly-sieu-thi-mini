<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/Master.master" AutoEventWireup="true" CodeFile="trangchu.aspx.cs" Inherits="trangchu" %>

<%@ Register Assembly="CollectionPager" Namespace="SiteUtils" TagPrefix="cc1" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="Side wapp100 fl">
        <img src="../img/banner_.JPG" />
    </div><!-- End .Slide -->
     <div class="Cnt_R_C_W wapp100 fl">
     <p class="Title_Cnt_R_C_W fl"><img src="img/logo/titile.png" /><span>Sản phẩm mới</span></p>
            <asp:DataList ID="dlistSP" runat="server" DataSourceID="SqlSanPham" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="MaSP">
                <ItemTemplate>
                     <div style="text-align:center;margin:20px;height:300px;width:200px; border:1px solid black">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "sieuthi/chitietsanpham.aspx?maSo="+Eval("MaSP") %>'>      
                    <asp:Image style="text-align:center;padding:10px" ID="Image1" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' Width="180px" Height="170px" />
                    <br /><p style="text-align:center;line-height:25px" class="sp">
                        </asp:HyperLink>
                    <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        </p>
                 
                         <p style="text-align:center" class="sp">
                    Giá :
                    <asp:Label ID="GiaBanLabel" runat="server"  Text='<%#String.Format("{0:#,##0}",Eval("GiaBan"))+" đồng" %>' />
                             </p>
                          
                          <p style="margin-top:20px"><asp:HyperLink ID="hlmuahang"  runat="server" NavigateUrl='<%# "~/sieuthi/giohang.aspx?msp="+Eval("MaSP") %>'><img src="img/logo/dat_hang.png"  height="40px" title="Mua ngay" /></asp:HyperLink></p>
                    </div>
                       
                         
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT top 3 [MaSP], [TenSP], [GiaBan], [HinhAnh] FROM [SanPham] order by MaSP desc"></asp:SqlDataSource>
         </div>
     <div class="Cnt_R_C_W wapp100 fl">
     <p class="Title_Cnt_R_C_W fl"><img src="img/logo/titile.png" /><span>Sản phẩm bán chạy</span></p>
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlSPBC" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="MaSP">
                <ItemTemplate>
                   
                     <div style="text-align:center;margin:20px;height:300px;width:200px; border:1px solid black">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "sieuthi/chitietsanpham.aspx?maSo="+Eval("MaSP") %>'>      
                    <asp:Image style="text-align:center;padding:10px" ID="Image1" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' Width="180px" Height="170px" />
                    <br /><p style="text-align:center;line-height:25px" class="sp">
                        </asp:HyperLink>
                    <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        </p>
                 
                         <p style="text-align:center" class="sp">
                    Giá :
                    <asp:Label ID="GiaBanLabel" runat="server"  Text='<%#String.Format("{0:#,##0}",Eval("GiaBan"))+" đồng" %>' />
                             </p>
                          
                          <p style="margin-top:20px"><asp:HyperLink ID="hlmuahang"  runat="server" NavigateUrl='<%# "~/sieuthi/giohang.aspx?msp="+Eval("MaSP") %>'><img src="../img/logo/dat_hang.png"  height="40px" title="Mua ngay" /></asp:HyperLink></p>
                    </div>
                       
                         
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSPBC" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT top 3 SanPham.[MaSP], [TenSP], [GiaBan], [HinhAnh], Sum(SoLuong) as SLBan FROM [SanPham],[CTHoaDon] where SanPham.MaSP=CTHoaDon.MaSP group by SanPham.[MaSP], [TenSP], [GiaBan], [HinhAnh] order by Sum(SoLuong) desc "></asp:SqlDataSource>
         </div>
         <div class="Cnt_R_C_W wapp100 fl">
     <p class="Title_Cnt_R_C_W fl">
         <asp:Image ID="imgicon" runat="server" ImageUrl="~/img/logo/titile.png" /><asp:Label ID="lbltieude" runat="server" Text="Sản phẩm khuyến mãi"></asp:Label></p>
            <asp:DataList ID="dlspkm" runat="server" DataSourceID="SqlSPKM" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="MaSP">
                <ItemTemplate>
                     <div style="text-align:center;margin:20px;height:300px;width:200px; border:1px solid black">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "sieuthi/chitietsanpham.aspx?maSo="+Eval("MaSP") %>'>      
                    <asp:Image style="text-align:center;padding:10px" ID="Image1" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' Width="180px" Height="170px" />
                    <br /><p style="text-align:center;line-height:25px" class="sp">
                        </asp:HyperLink>
                    <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        </p>
                 
                         <p style="text-align:center" class="sp">
                    Giá :
                    <asp:Label ID="GiaBanLabel" runat="server"  Text='<%#String.Format("{0:#,##0}",Eval("GiaBan"))+" đồng" %>' />
                             </p>
                          
                          <p style="margin-top:20px"><asp:HyperLink ID="hlmuahang"  runat="server" NavigateUrl='<%# "~/sieuthi/giohang.aspx?msp="+Eval("MaSP") %>'><img src="../img/logo/dat_hang.png"  height="40px" title="Mua ngay" /></asp:HyperLink></p>
                    </div>
                       
                         
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSPKM" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT * from SanPham where KhuyenMai<>0 "></asp:SqlDataSource>
         </div>
          <div class="Cnt_R_C_W wapp100 fl">
                <p class="Title_Cnt_R_C_W fl"><img src="img/logo/titile.png" /><span>Tất cả sản phẩm</span></p>
                 <asp:DataList ID="DLtcsp" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="MaSP">
                <ItemTemplate>
                   
                     <div style="text-align:center;margin:20px;height:300px;width:200px; border:1px solid black">
                            <asp:HyperLink ID="hlchitiet" runat="server" NavigateUrl='<%# "sieuthi/chitietsanpham.aspx?maSo="+Eval("MaSP") %>'>      
                    <asp:Image style="text-align:center;padding:10px" ID="Image1" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' Width="180px" Height="170px" />
                    <br /><p style="text-align:center;line-height:25px" class="sp">
                        </asp:HyperLink>
                    <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        </p>
                 
                         <p style="text-align:center" class="sp">
                    Giá :
                    <asp:Label ID="GiaBanLabel" runat="server"  Text='<%#String.Format("{0:#,##0}",Eval("GiaBan"))+" đồng" %>' />
                             </p>
                          
                          <p style="margin-top:20px"><asp:HyperLink ID="hlmuahang"  runat="server" NavigateUrl='<%# "~/sieuthi/giohang.aspx?msp="+Eval("MaSP") %>'><img src="../img/logo/dat_hang.png" height="40px" title="Mua ngay" /></asp:HyperLink></p>
                    </div>  
                </ItemTemplate>
            </asp:DataList>
              <div style="text-align:center;font-family:Tahoma;font-size:14px;">
              <cc1:CollectionPager ID="CollectionPager1" runat="server" LabelText="" ResultsFormat="" BackText="" NextText=""></cc1:CollectionPager>
              </div>
          </div>
</asp:Content>

