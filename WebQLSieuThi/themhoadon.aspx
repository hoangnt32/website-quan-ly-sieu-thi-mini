<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="themhoadon.aspx.cs" Inherits="themhoadon" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="content-error">
				<div class="hpanel">
                    <div class="panel-body"style="padding-left: 30px;padding-right:30px">
                        <div><h4 style="font-size:25px">Thông tin hóa đơn</h4></div>
                        <div style="width:35%; float:left;padding-left:20px">
                                <div class="form-group" style="padding-top:20px">
                                    <label>Mã nhân viên</label>
                                     <asp:TextBox ID="txtmanv" CssClass="form-control"  runat="server" Enabled="False"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Số điện thoại khách hàng</label>
                                     <asp:TextBox ID="txtmakh" CssClass="form-control"  runat="server" AutoPostBack="True" OnTextChanged="txtmakh_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator style="padding:3%;position:relative;top:4px; font-size:13px; color:red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập số điện thoại." ControlToValidate="txtmakh" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                              <div class="form-group">
                                    <label>Tên khách hàng</label>
                                     <asp:TextBox ID="txttenkh" CssClass="form-control"  runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator style="padding:3%;position:relative;top:4px; font-size:13px; color:red;" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập tên khách hàng." ControlToValidate="txttenkh" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                     <div class="chosen-select-single mg-b-20">
                                          <label>Sản phẩm</label>
                                         <asp:DropDownList ID="cmbmasp" CssClass="chosen-select form-control" TabIndex="-1" runat="server">
                                         </asp:DropDownList>
                                         <asp:RequiredFieldValidator style="padding:3%;position:relative;top:4px; font-size:13px; color:red;" ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng chọn sản phẩm." ControlToValidate="cmbmasp" Display="Dynamic"></asp:RequiredFieldValidator>      
                                            </div>
                                </div>
                                <div class="form-group">
                                    <label>Số lượng</label>
                                    <asp:TextBox ID="txtsoluong" min="1" CssClass="form-control"  runat="server" TextMode="Number"></asp:TextBox>
                                    <asp:RequiredFieldValidator style="padding:3%;position:relative;top:4px; font-size:13px; color:red;" ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập số lượng." ControlToValidate="txtsoluong" Display="Dynamic"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group" style="padding-left:3px;">
                                    <asp:Button ID="btnGhi" style="padding-left:18px;padding-right:18px;" CssClass="btn btn-success loginbtn" runat="server" Text="Thêm" OnClick="btnGhi_Click"></asp:Button>
                                </div>
                                </div>
        <div style="float:right;width:60%">
             <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                 <div class="form-group" style="padding-top:10px">
                     <asp:GridView ID="gvCTHD" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="4" OnRowCommand="gvCTHD_RowCommand" DataKeyNames="MaSP" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px">
                         <Columns>
                             <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                             <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                             <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" DataFormatString="{0:#,##0.##}" HeaderStyle-ForeColor="White">
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Số lượng" HeaderStyle-ForeColor="White">
                                 <ItemTemplate>
                                     <asp:TextBox ID="txtsoluong" runat="server" Text='<%# Eval("SoLuong") %>' TextMode="Number" Width="48px"></asp:TextBox>
                                 </ItemTemplate>
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:TemplateField>
                             <asp:TemplateField HeaderText="Khuyến mãi" HeaderStyle-ForeColor="White">
                                 <ItemTemplate>
                                     <asp:Label ID="txtkm" runat="server" Text='<%# Eval("KhuyenMai") %>' TextMode="Number" Width="28px" Height="18px" style="margin-left: 3px"></asp:Label>
                                     &nbsp;
                                 </ItemTemplate>
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:TemplateField>
                             <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" DataFormatString="{0:#,##0.##}" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                             <asp:ButtonField CommandName="Xoa" Text="Xóa" ButtonType="Image" HeaderText="Xóa" ImageUrl="~/images/delete.png" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:ButtonField>
                         </Columns>
                         <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                         <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                         <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                         <RowStyle BackColor="White" ForeColor="#003399" />
                         <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                         <SortedAscendingCellStyle BackColor="#EDF6F6" />
                         <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                         <SortedDescendingCellStyle BackColor="#D6DFDF" />
                         <SortedDescendingHeaderStyle BackColor="#002876" />
                     </asp:GridView>
                 </div>
           
                 <div class="form-group" style="padding-left:15px;padding-right:20px">
                  <asp:Label ID="lbltc" runat="server" Text="Tổng cộng"></asp:Label>
                  <asp:Label ID="lblthanhtien" style="float:right" runat="server" Text="Thành tiền"></asp:Label>
                </div>
            
             <div class="row" style="float:right" >
                 <div class="form-group" style="padding-left:40px;padding-right:20px">
                    <asp:Button ID="btnLuu" style="padding-left:18px;padding-right:18px;margin-right:8px" CssClass="btn btn-success loginbtn" runat="server" Text="Xuất hóa đơn" OnClick="btnLuu_Click" CausesValidation="False"></asp:Button>
                     <asp:Button ID="btncapnhat" style="padding-left:18px;padding-right:18px;margin-right:8px" CssClass="btn btn-success loginbtn" runat="server" Text="Cập nhật" OnClick="btncapnhat_Click" CausesValidation="False"></asp:Button>
                    <asp:Button ID="btnHuy" style="padding-left:18px;padding-right:18px;margin-right:8px" CssClass="btn btn-success loginbtn" runat="server" Text="Hủy" OnClick="btnHuy_Click" CausesValidation="False"></asp:Button>
                 </div>
            </div>
        </div>      
      </div>
           </div>                  
        </div>   
    </div>
            </div>
                        </div>
                    </div>
        </div>                   
                
</asp:Content>

