<%@ Page Title="" Language="C#" MasterPageFile="~/sieuthi/Master.master" AutoEventWireup="true" CodeFile="danhmuc.aspx.cs" Inherits="BanHang_danhmuc" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="Cnt_R_C_W wapp100 fl">
     <p class="Title_Cnt_R_C_W fl"><img src="../img/icontitle.png" /><span><asp:Label style="position:relative;top:2%" ID="lbldanhmuc" runat="server" Text="Label"></asp:Label></span></p>
            <asp:DataList ID="dlistSP" runat="server" DataSourceID="SqlSanPham" RepeatColumns="3" RepeatDirection="Horizontal" DataKeyField="MaSP">
                <ItemTemplate>
                   
                     <div style="text-align:center;margin:20px;height:300px;width:200px; border:1px solid black">
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "chitietsanpham.aspx?maSo="+Eval("MaSP") %>'>      
                    <asp:Image style="text-align:center;padding:10px" ID="Image1" runat="server" ImageUrl='<%# Eval("HinhAnh") %>' Width="180px" Height="170px" />
                    <br /><p style="text-align:center;line-height:25px" class="sp">
                        </asp:HyperLink>
                    <asp:Label ID="TenSPLabel" runat="server" Text='<%# Eval("TenSP") %>' />
                        </p>
                 
                         <p style="text-align:center" class="sp">
                    Giá :
                    <asp:Label ID="GiaBanLabel" runat="server"  Text='<%#String.Format("{0:#,##0}",Eval("GiaBan"))+" đồng" %>' />
                             </p>
                          
                          <p style="margin-top:20px">
                              <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# "giohang.aspx?msp="+Eval("MaSP") %>'><img src="../img/logo/dat_hang.png" height="40" title="Mua hàng" /></asp:HyperLink></p>
                    </div>
                       
                         
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT [MaSP], [TenSP], [GiaBan], [HinhAnh] FROM [SanPham] WHERE ([MaLoai] = @MaLoai)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="MaLoai" QueryStringField="maloai" Type="Int32" />
                </SelectParameters>
          </asp:SqlDataSource>
         </div>
</asp:Content>

