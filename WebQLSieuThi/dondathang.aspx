<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="dondathang.aspx.cs" Inherits="dondathang" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>
                                <asp:Label ID="lblten" runat="server" Text=""></asp:Label></h4>
                            <div class="asset-inner">
                                <asp:GridView ID="gvDDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaDH" AllowSorting="True" AllowPaging="True" OnPageIndexChanging="gvDDH_PageIndexChanging" >
                                   <Columns>
                                   <asp:BoundField DataField="MaDH" HeaderText="Mã đơn" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="MaKH" HeaderText="Mã KH" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="TenNguoiNhan" HeaderText="Tên người nhận" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="DiaChiNhan" HeaderText="Địa chỉ nhận" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField HeaderText="Số điện thoại">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtsodt" runat="server" Text='<%# Bind("SDT") %>' MaxLength="10" TextMode="Number"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày đặt hàng">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtnglap" runat="server" Text='<%# Bind("NgayDH","{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgayDH", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Ngày giao" HeaderStyle-Width="30px" ItemStyle-Width="30px">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtnggiao" runat="server" Text='<%# Bind("NgayGH","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblnggiao" runat="server" Text='<%# Bind("NgayGH", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                        <asp:BoundField DataField="TriGia" HeaderText="Trị giá" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="HTGiaoHang" HeaderText="Hình thức giao" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TrangThai" HeaderText="Trạng thái" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnXem" runat="server" CausesValidation="false" CommandName="Xem" Text="Xem" NavigateUrl='<%# "dondathang.aspx?madh="+Eval("MaDH") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlXoa" NavigateUrl=<%# "javascript:xacnhanxoa('dondathang.aspx?id="+ Eval("MaDH")+"',"+Eval("MaDH")+")" %> runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:HyperLink>
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
                
                                <asp:GridView ID="gvCTDH" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlCTDH" DataKeyNames="MaDH,MaSP" >
                                   <Columns>
                                   <asp:BoundField DataField="MaDH" HeaderText="Mã đơn hàng" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                         <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="SoLuong" HeaderText="Số lượng" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
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
                                <asp:SqlDataSource ID="SqlCTDH" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT CTDonDatHang.*,SanPham.TenSP FROM SanPham INNER JOIN CTDonDatHang ON SanPham.MaSP = CTDonDatHang.MaSP WHERE (CTDonDatHang.MaDH = @MaDH)">
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="MaDH" QueryStringField="madh" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                  <asp:Button style="margin-top:2%" ID="btnxacnhan" Visible="false" CssClass="btn btn-primary waves-effect waves-light" runat="server" Text="Xác nhận đã giao" OnClick="btnxacnhan_Click" CausesValidation="False" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script language="javascript">
        function xacnhanxoa(str,ma) {
            ok = confirm("Bạn chắc chắn muốn xóa tất cả dữ liệu của đơn hàng có mã "+ma+"?")
            if (ok != "0")
                window.location = str
        }
    </script>
</asp:Content>

