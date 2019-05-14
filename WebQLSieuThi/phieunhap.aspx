<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="phieunhap.aspx.cs" Inherits="phieunhap" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Danh Sách Phiếu Nhập</h4>
                           <div class="add-product">
                               <a href="themphieunhap.aspx" class="btn btn-primary waves-effect waves-light">Thêm phiếu</a>
                            </div>
                            <div class="asset-inner">
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
                                                <asp:TextBox ID="txtnglap" runat="server" Text='<%# Bind("NgayNhap","{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgayNhap", "{0:dd/MM/yyyy HH:mm:ss}") %>'></asp:Label>
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
                                <asp:SqlDataSource ID="SqlPhieuNhap" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [PhieuNhap] WHERE [MaPhieu] = @MaPhieu" InsertCommand="INSERT INTO [PhieuNhap] ([MaNV], [NgayNhap], [TriGia]) VALUES (@MaNV, @NgayNhap, @TriGia)" SelectCommand="SELECT * FROM [PhieuNhap]" UpdateCommand="UPDATE [PhieuNhap] SET [MaNV] = @MaNV, [NgayNhap] = @NgayNhap, [TriGia] = @TriGia WHERE [MaPhieu] = @MaPhieu">
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaPhieu" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="MaNV" Type="Int32" />
                                        <asp:Parameter Name="NgayNhap" Type="DateTime" />
                                        <asp:Parameter Name="TriGia" Type="Double" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="MaNV" Type="Int32" />
                                        <asp:Parameter Name="NgayNhap" Type="DateTime" />
                                        <asp:Parameter Name="TriGia" Type="Double" />
                                        <asp:Parameter Name="MaPhieu" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
</asp:Content>

