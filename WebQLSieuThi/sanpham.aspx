<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="sanpham.aspx.cs" Inherits="sanpham" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Danh Sách Sản Phẩm</h4>
                            <div class="add-product">
                               <a href="sanphamst.aspx" class="btn btn-primary waves-effect waves-light">Thêm sản phẩm</a>
                            </div>
                            <div class="asset-inner">
                                <asp:GridView ID="gvSanPham" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaSP" DataSourceID="SqlSanPham" OnRowDataBound="gvSanPham_RowDataBound" OnRowDeleted="gvSanPham_RowDeleted" AllowPaging="True">
                                   <Columns>
                                   <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                       <asp:TemplateField HeaderText="Mã loại">
                                           <ItemTemplate>
                                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("MaLoai") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Mã nhà cung cấp">
                                           <ItemTemplate>
                                               <asp:Label ID="Label3" runat="server" Text='<%# Bind("MaNCC") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Đơn vị tính">
                                           <ItemTemplate>
                                               <asp:Label ID="Label2" runat="server" Text='<%# Bind("DVT") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Giá bán">
                                           <ItemTemplate>
                                               <asp:Label ID="Label5" runat="server" Text='<%# Bind("GiaBan", "{0:#,##0.##}") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Khuyến mãi">
                                           <ItemTemplate>
                                               <asp:Label ID="Label6" runat="server" Text='<%# Bind("KhuyenMai", "{0:#,##0.##} %") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
                                       </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnSua" NavigateUrl='<%# "sanphamst.aspx?masp="+Eval("MaSP") %>' runat="server" CausesValidation="false" CommandName="Sua" Text="Sửa"></asp:HyperLink>
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnXoa" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:LinkButton>
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                    </Columns>
                                   <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                   <HeaderStyle BackColor="#3333ff" Font-Bold="True" ForeColor="#99CCCC" HorizontalAlign="Center" />
                                   <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Center" />
                                   <RowStyle BackColor="White" ForeColor="#003399" />
                                   <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                   <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                   <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                   <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                   <SortedDescendingHeaderStyle BackColor="#002876" />
                               </asp:GridView> 
                                <asp:SqlDataSource ID="SqlSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [SanPham] WHERE [MaSP] = @MaSP" SelectCommand="SELECT [MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [GiaBan], [KhuyenMai] FROM [SanPham]" >
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaSP" Type="Int32" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </div>
                            <asp:Label style="color:red;padding:10px; position:relative; top:7px" ID="lbltb" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   
</asp:Content>

