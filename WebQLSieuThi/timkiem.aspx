<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="timkiem.aspx.cs" Inherits="timkiem" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Kết quả tìm kiếm</h4>
                             <div class="add-product" style="text-align:center;">
                                <asp:Label  ID="lblkqtimkiem" runat="server" Font-Bold="True"></asp:Label> 
                            </div>
                            <div class="asset-inner">
                                <!-- Tim kiem nhan vien -->
                                <asp:GridView ID="gvTimKiem" style="margin-left:3%" runat="server" AutoGenerateColumns="False" CellPadding="4" OnRowCancelingEdit="gvTimKiem_RowCancelingEdit" OnRowDeleted="gvTimKiem_RowDeleted" OnRowEditing="gvTimKiem_RowEditing" OnRowUpdated="gvTimKiem_RowUpdated" OnRowUpdating="gvTimKiem_RowUpdating" DataKeyNames="MaNV">
                                    <Columns>
                                   <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenNV" HeaderText="Họ Tên" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Ngày Sinh">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtngsinh" data-mask="99/99/9999" runat="server" Text='<%# Bind("NgaySinh","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgaySinh", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Giới Tính">
                                           <EditItemTemplate>
                                               <asp:DropDownList ID="cmbgt" runat="server" SelectedValue='<%# Bind("GioiTinh") %>'>
                                                   <asp:ListItem>Nam</asp:ListItem>
                                                   <asp:ListItem>Nữ</asp:ListItem>
                                               </asp:DropDownList>
                                           </EditItemTemplate>
                                           <ItemTemplate>
                                               <asp:Label ID="Label1" runat="server" Text='<%# Bind("GioiTinh") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                        <asp:BoundField DataField="DiaChi" HeaderText="Địa Chỉ" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Số Điện Thoại">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtsodt" runat="server" Text='<%# Bind("SDT") %>' MaxLength="10"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Email">
                                              <EditItemTemplate>
                                                <asp:TextBox ID="txtemail" runat="server" Text='<%# Bind("Email") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Chức Vụ">
                                            <EditItemTemplate>
                                                <asp:DropDownList ID="cmbcv" runat="server" SelectedValue='<%# Bind("ChucVu") %>'>
                                                    <asp:ListItem>Admin</asp:ListItem>
                                                    <asp:ListItem>Nhân viên kho</asp:ListItem>
                                                    <asp:ListItem>Nhân viên bán hàng</asp:ListItem>
                                                </asp:DropDownList>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("ChucVu") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                        <asp:BoundField DataField="Luong" HeaderText="Lương" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                      
                                        <asp:CommandField CausesValidation="False" ShowEditButton="True" CancelText="Hủy" EditText="Sửa" UpdateText="Lưu" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlXoa" runat="server" CausesValidation="False" NavigateUrl=<%# "javascript:xacnhanxoa('timkiem.aspx?id="+ Eval("MaNV")+"',"+Eval("MaNV")+")" %> Text="Xóa"></asp:HyperLink>
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
                                
                                
                                <!-- Tim kiem khach hang -->
                                <asp:GridView ID="gvTKkhachhang" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaKH" OnRowCancelingEdit="gvTKkhachhang_RowCancelingEdit" OnRowDeleted="gvTKkhachhang_RowDeleted" OnRowEditing="gvTKkhachhang_RowEditing" OnRowUpdated="gvTKkhachhang_RowUpdated" OnRowUpdating="gvTKkhachhang_RowUpdating" >
                                   <Columns>
                                   <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenKH" HeaderText="Họ Tên" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Số Điện Thoại">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email">
                                             <EditItemTemplate>
                                                <asp:TextBox ID="txtemail" TextMode="Email" runat="server" Text='<%# Bind("Email") %>' ></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="email" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                        <asp:CommandField CausesValidation="False" ShowEditButton="True" CancelText="Hủy" EditText="Sửa" UpdateText="Lưu" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlXoa" runat="server" CausesValidation="False" NavigateUrl=<%# "javascript:xacnhanxoa('timkiem.aspx?id_="+ Eval("MaKH")+"',"+Eval("MaKH")+")" %> Text="Xóa"></asp:HyperLink>
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
                                <!-- Tim kiem nha cung cap -->
                                <asp:GridView ID="gvNhaCC" style="margin-left:1%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaNCC" OnRowDeleted="gvNhaCC_RowDeleted" OnRowEditing="gvNhaCC_RowEditing" OnRowUpdated="gvNhaCC_RowUpdated" OnRowUpdating="gvNhaCC_RowUpdating" OnRowCancelingEdit="gvNhaCC_RowCancelingEdit">
                                   <Columns>
                                   <asp:BoundField DataField="MaNCC" HeaderText="Mã nhà cung cấp" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenNCC" HeaderText="Tên nhà cung cấp" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                       <asp:BoundField DataField="DiaChi" HeaderText="Địa chỉ" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Số Điện Thoại">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtsodt" runat="server" Text='<%# Bind("SDT") %>' MaxLength="10"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       
                                        <asp:CommandField CausesValidation="False" ShowEditButton="True" CancelText="Hủy" EditText="Sửa" UpdateText="Lưu" />
                                        <asp:TemplateField ShowHeader="False">
                                           <ItemTemplate>
                                                <asp:HyperLink ID="hlXoa" runat="server" CausesValidation="False" NavigateUrl=<%# "javascript:xacnhanxoa1('timkiem.aspx?idncc="+ Eval("MaNCC")+"',"+Eval("MaNCC")+")" %> Text="Xóa"></asp:HyperLink>
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
                                
                                <!-- Tìm kiếm loại sản phẩm -->
                                <asp:GridView ID="gvLoaiSP" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaLoai" DataSourceID="SqlTimKiemLoaiSP" OnRowCancelingEdit="gvLoaiSP_RowCancelingEdit" OnRowDataBound="gvLoaiSP_RowDataBound" OnRowDeleted="gvLoaiSP_RowDeleted" OnRowEditing="gvLoaiSP_RowEditing" OnRowUpdated="gvLoaiSP_RowUpdated" OnRowUpdating="gvLoaiSP_RowUpdating" >
                                   <Columns>
                                   <asp:BoundField DataField="MaLoai" HeaderText="Mã Loại" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenLoai" HeaderText="Tên Loại" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>                                   
                                        <asp:CommandField CausesValidation="False" ShowEditButton="True" CancelText="Hủy" EditText="Sửa" UpdateText="Lưu" />
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
                                <asp:SqlDataSource ID="SqlTimKiemLoaiSP" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [LoaiSP] WHERE [MaLoai] = @MaLoai" InsertCommand="INSERT INTO [LoaiSP] ([TenLoai]) VALUES (@TenLoai)" SelectCommand="SELECT * FROM [LoaiSP] WHERE ([TenLoai] LIKE '%' + @TenLoai + '%')" UpdateCommand="UPDATE [LoaiSP] SET [TenLoai] = @TenLoai WHERE [MaLoai] = @MaLoai">
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaLoai" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="TenLoai" Type="String" />
                                    </InsertParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="TenLoai" QueryStringField="loaisp" Type="String" />
                                    </SelectParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="TenLoai" Type="String" />
                                        <asp:Parameter Name="MaLoai" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                                <!-- Tim kiem san pham -->
                                 <asp:GridView ID="gvSanPham" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaSP" DataSourceID="SqlSanPham" OnRowDataBound="gvSanPham_RowDataBound" OnRowDeleted="gvSanPham_RowDeleted">
                                   <Columns>
                                   <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                       <asp:TemplateField HeaderText="Mã loại">
                                           <ItemTemplate>
                                               <asp:Label ID="Label5" runat="server" Text='<%# Bind("MaLoai") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Mã nhà cung cấp">
                                           <ItemTemplate>
                                               <asp:Label ID="Label6" runat="server" Text='<%# Bind("MaNCC") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Đơn vị tính">
                                           <ItemTemplate>
                                               <asp:Label ID="Label10" runat="server" Text='<%# Bind("DVT") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Giá bán">
                                           <ItemTemplate>
                                               <asp:Label ID="Label11" runat="server" Text='<%# Bind("GiaBan", "{0:#,##0.##}") %>'></asp:Label>
                                           </ItemTemplate>
                                           <HeaderStyle ForeColor="White" />
                                       </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Khuyến mãi">
                                           <ItemTemplate>
                                               <asp:Label ID="Label12" runat="server" Text='<%# Bind("KhuyenMai", "{0:#,##0.##}") %>'></asp:Label>
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
                                <asp:SqlDataSource ID="SqlSanPham" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [SanPham] WHERE [MaSP] = @MaSP" SelectCommand="SELECT [MaSP], [TenSP], [MaLoai], [MaNCC], [DVT], [GiaBan], [KhuyenMai] FROM [SanPham] WHERE ([TenSP] LIKE '%' + @TenSP + '%')" >
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaSP" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="TenSP" QueryStringField="tensp" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <!-- tim kiem nguoi dung -->
                                 <asp:GridView ID="gvNguoiDung" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="TenND" >
                                   <Columns>
                                     <asp:BoundField DataField="MaND" HeaderText="ID" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                   <asp:BoundField DataField="TenND" HeaderText="Tên người dùng" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                       
                                      <asp:BoundField DataField="LoaiND" HeaderText="Loại người dùng" HeaderStyle-ForeColor="White" ReadOnly="True">
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>
                                       
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
                                
                                <!-- Tim kiem hoa don -->
                                <asp:GridView ID="gvHD" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaHD" DataSourceID="SqlHoaDon" OnRowDataBound="gvHD_RowDataBound" OnRowDeleted="gvHD_RowDeleted">
                                   <Columns>
                                   <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="MaKH" HeaderText="Mã khách hàng" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="TenKH" HeaderText="Tên khách hàng" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Số Điện Thoại">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SDT") %>' MaxLength="10" TextMode="Number"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Ngày Lập">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtnglap" runat="server" Text='<%# Bind("NgayBan","{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("NgayBan", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                        <asp:BoundField DataField="TriGia" HeaderText="Trị giá" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnXem"   runat="server" CausesValidation="false" CommandName="Xem" Text="Xem" NavigateUrl='<%# "chitiethoadon.aspx?mahd="+Eval("MaHD") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnXoa" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Height="20px" />
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
                                <asp:SqlDataSource ID="SqlHoaDon" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT HoaDon.MaHD, HoaDon.MaKH, KhachHang.TenKH, KhachHang.SDT, HoaDon.MaNV, HoaDon.NgayBan,HoaDon.TriGia FROM HoaDon INNER JOIN KhachHang ON HoaDon.MaKH = KhachHang.MaKH WHERE (KhachHang.SDT = @SDT OR HoaDon.MaHD=@SDT) order by MaHD desc" DeleteCommand="DELETE FROM HoaDon WHERE (MaHD = @MaHD)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaHD" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="SDT" QueryStringField="tukhoa" Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                <!-- Phieu nhap -->
                                 <asp:GridView ID="gvPN" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaPhieu" DataSourceID="SqlPhieuNhap" AllowPaging="True" OnRowDataBound="gvPN_RowDataBound" >
                                   <Columns>
                                   <asp:BoundField DataField="MaPhieu" HeaderText="Mã phiếu nhập" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="MaNV" HeaderText="Mã nhân viên" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Ngày Lập">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NgayNhap","{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("NgayNhap", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                        <asp:BoundField DataField="TriGia" HeaderText="Trị giá" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnXem"   runat="server" CausesValidation="false" CommandName="Xem" Text="Xem" NavigateUrl='<%# "chitietphieunhap.aspx?mapn="+Eval("MaPhieu") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnXoa" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:LinkButton>
                                            </ItemTemplate>
                                            <ItemStyle Height="20px" />
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
                                <asp:SqlDataSource ID="SqlPhieuNhap" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [PhieuNhap] WHERE [MaPhieu] = @MaPhieu" SelectCommand="SELECT MaPhieu, MaNV, NgayNhap, TriGia FROM PhieuNhap WHERE (MaPhieu = @MaPhieu)" >
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaPhieu" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="MaPhieu" QueryStringField="mapn" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                               
                               
                            </div>
                            <asp:Label style="color:red;padding:10px; position:relative; top:7px" ID="lbltb" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script language="javascript">
        function xacnhanxoa(str,ma) {
            ok = confirm("Bạn chắc chắn muốn xóa người dùng có mã "+ma+"?")
            if (ok != "0")
                window.location = str
        }
        function xacnhanxoa1(str, ma) {
            ok = confirm("Bạn chắc chắn muốn xóa nhà cung cấp có mã " + ma + "?")
            if (ok != "0")
                window.location = str
        }
    </script>
</asp:Content>

