<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="chitiethoadon.aspx.cs" Inherits="chitiethoadon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Chi Tiết Hóa Đơn</h4>
                           <div class="add-product">
                               <a href="themhoadon.aspx" class="btn btn-primary waves-effect waves-light">Thêm hóa đơn</a>
                            </div>
                            <div class="asset-inner">
                                <asp:GridView ID="gvCTHD" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlCTHD" OnRowDataBound="gvCTHD_RowDataBound" DataKeyNames="MaHD,MaSP" >
                                   <Columns>
                                   <asp:BoundField DataField="MaHD" HeaderText="Mã hóa đơn" HeaderStyle-ForeColor="White" ReadOnly="True" >
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
                                <asp:SqlDataSource ID="SqlCTHD" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT CTHoaDon.MaHD,SanPham.MaSP, SanPham.TenSP, CTHoaDon.SoLuong, CTHoaDon.DonGia, CTHoaDon.ThanhTien, CTHoaDon.GhiChu FROM SanPham INNER JOIN CTHoaDon ON SanPham.MaSP = CTHoaDon.MaSP WHERE (CTHoaDon.MaHD = @MaHD)" DeleteCommand="DELETE FROM CTHoaDon WHERE (MaHD=@MaHD) AND (MaSP = @MaSP)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaHD" Type="Int32" />
                                        <asp:Parameter Name="MaSP" Type="Int32" />
                                    </DeleteParameters>
                                    <SelectParameters>
                                        <asp:QueryStringParameter Name="MaHD" QueryStringField="mahd" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                                 <asp:LinkButton ID="xuathd" runat="server" style="margin:3%" CssClass="btn btn-primary waves-effect waves-light" OnClick="xuathd_Click">Xuất hóa đơn</asp:LinkButton>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

