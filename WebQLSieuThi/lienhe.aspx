<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="lienhe.aspx.cs" Inherits="lienhe" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>
                                <asp:Label ID="Label1" runat="server" Text="Liên Hệ"></asp:Label></h4>

                           <div class="add-product">
                              
                            </div>
                            <div class="asset-inner">
                                <asp:GridView ID="gvLH" style="margin-left:3%; margin-top:3%" DataSourceID="SqlLienHe" OnRowDataBound="gvLH_RowDataBound" runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaLH" AllowSorting="True" AllowPaging="True">
                                   <Columns>
                                   <asp:BoundField DataField="MaLH" HeaderText="Mã số" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="HoTen" HeaderText="Họ và Tên" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-ForeColor="White" >
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
                                        <asp:TemplateField HeaderText="Ngày gửi">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtnglap" runat="server" Text='<%# Bind("NgayGui","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgayGui", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                      
                                        <asp:BoundField DataField="TT" HeaderText="Trạng thái" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnXem"   runat="server" CausesValidation="false" CommandName="Xem" Text="Xem" NavigateUrl='<%# "lienhe.aspx?malh="+Eval("MaLH") %>'></asp:HyperLink>
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
                                <asp:SqlDataSource ID="SqlLienHe" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" SelectCommand="SELECT *, case when TrangThai=0 then N'Chưa phản hồi' else N'Đã phản hồi' end as TT from LienHe" DeleteCommand="DELETE FROM LienHe WHERE (MaLH = @MaLH)">
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaLH" Type="Int32" />
                                    </DeleteParameters>
                                </asp:SqlDataSource>
                                <div>
             <div style="width:90%;margin:auto;line-height:30px;">                      
        <div>
                <asp:Label ID="hoten" runat="server" Font-Bold="False" Font-Names="Arial" Text="Họ và tên:" Font-Size="14px"></asp:Label>
            
                <asp:Label ID="lblhoten" style="padding:1px 3px;font-weight:600" runat="server" Font-Size="14px" Height="22px" ></asp:Label>
                
           </div>
        <div>
                <asp:Label ID="email" runat="server" Text="Email:" Font-Size="14px" ></asp:Label>
            
                <asp:Label ID="lblemail" style="padding:1px 3px;font-weight:600" runat="server" Font-Size="14px" Height="22px"></asp:Label>               
          </div>
                 <div>
                <asp:Label ID="cauhoi" runat="server" Font-Bold="False" Font-Names="Arial" Text="Câu hỏi: " Font-Size="14px"></asp:Label>
            
                <asp:Label ID="lblcauhoi" style="padding:1px 3px;font-weight:600" runat="server" Font-Size="14px" Height="22px"></asp:Label>
                </div>
                <div>
                <asp:Label ID="traloi" runat="server" Font-Bold="False" Font-Names="Arial" Text="Trả lời" Font-Size="14px"></asp:Label>
                </div>
                <asp:TextBox ID="txtnoidung" style="padding:1px 3px;" runat="server" Font-Size="14px" Height="150px" TextMode="MultiLine" Width="400px"></asp:TextBox>
    <div style="margin-left:1%"> <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtnoidung" ErrorMessage="Vui lòng nhập Nội dung." Font-Names="Arial" Font-Size="13px" ForeColor="Red" Height="28px" Display="Dynamic"></asp:RequiredFieldValidator></div></td>
        
                                    <asp:Button ID="btngui" runat="server" Text="Gửi phản hồi" OnClick="btngui_Click" BorderWidth="0" style="margin:3% 0 10% 1%; width:120px;height:30px;color:#f8f2f2;background-color:#084598" />
                                </div>
                                    </div>
                                 <asp:GridView ID="gvLHTK" style="margin-left:3%; margin-top:3%" runat="server"  AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaLH" AllowSorting="True" AllowPaging="True">
                                   <Columns>
                                   <asp:BoundField DataField="MaLH" HeaderText="Mã số" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:BoundField DataField="HoTen" HeaderText="Họ và Tên" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                       <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-ForeColor="White" >
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
                                        <asp:TemplateField HeaderText="Ngày gửi">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtnglap" runat="server" Text='<%# Bind("NgayGui","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("NgayGui", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                            <HeaderStyle ForeColor="White" />
                                            <ItemStyle Height="20px" />
                                       </asp:TemplateField>
                                      
                                        <asp:BoundField DataField="TT" HeaderText="Trạng thái" HeaderStyle-ForeColor="White" DataFormatString="{0:#,##0.##}" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       <ItemStyle Height="20px" />
                                       </asp:BoundField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="btnXem"   runat="server" CausesValidation="false" CommandName="Xem" Text="Xem" NavigateUrl='<%# "lienhe.aspx?malh="+Eval("MaLH") %>'></asp:HyperLink>
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="hlXoa" NavigateUrl=<%# "javascript:xacnhanxoa('lienhe.aspx?id="+ Eval("MaLH")+"')" %> runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:HyperLink>
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

                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    <script language="javascript">
        function xacnhanxoa(str) {
            ok = confirm("Ban có chắc xóa?")
            if (ok != "0")
                window.location = str
        }
    </script>
</asp:Content>

