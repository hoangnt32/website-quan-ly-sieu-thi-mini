<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="hoadon.aspx.cs" Inherits="hoadon" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     
        <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Danh Sách Hóa Đơn</h4>

                           <div class="add-product">
                               <a href="themhoadon.aspx" class="btn btn-primary waves-effect waves-light">Thêm hóa đơn</a>
                            </div>
                            <div class="asset-inner">
                                <asp:GridView ID="gvHD" style="margin-left:3%; margin-top:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaHD" DataSourceID="SqlHoaDon" AllowSorting="True" OnRowDataBound="gvHD_RowDataBound" OnRowCommand="gvHD_RowCommand" AllowPaging="True">
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
                                                <asp:TextBox ID="txtsodt" runat="server" Text='<%# Bind("SDT") %>' MaxLength="10" TextMode="Number"></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("SDT") %>'></asp:Label>
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
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgayBan", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
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
                                <asp:SqlDataSource ID="SqlHoaDon" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT HoaDon.MaHD, HoaDon.MaKH, KhachHang.TenKH, KhachHang.SDT, HoaDon.MaNV, HoaDon.NgayBan,HoaDon.TriGia FROM HoaDon INNER JOIN KhachHang ON HoaDon.MaKH = KhachHang.MaKH" DeleteCommand="DELETE FROM HoaDon WHERE (MaHD = @MaHD)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaHD" Type="Int32" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
</asp:Content>

