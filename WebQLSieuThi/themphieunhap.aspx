<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="themphieunhap.aspx.cs" Inherits="themphieunhap" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="content-error">
				<div class="hpanel">
                    <div class="panel-body"style="padding-left: 30px;padding-right:30px;margin-left:35px;">
                        <div><h4 style="font-size:25px">Thông tin phiếu nhập</h4></div>
                        <div style="width:30%; float:left;padding-left:20px">
                               <div class="form-group" style="padding-top:20px">
                                    <label>Mã nhân viên</label>
                                    <asp:TextBox ID="txtmanv" CssClass="form-control"  runat="server" Enabled="false"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Ngày nhập</label>
                                    <asp:TextBox ID="txtngnhap" CssClass="form-control" Enabled="false" runat="server"></asp:TextBox>
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
                                     <asp:RequiredFieldValidator style="padding:3%;position:relative;top:4px; font-size:13px; color:red;" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập số lượng." ControlToValidate="txtsoluong" Display="Dynamic"></asp:RequiredFieldValidator>      
                                </div>
                                <div class="form-group">
                                    <label>Đơn giá</label>
                                    <asp:TextBox ID="txtdongia" min="1" CssClass="form-control"  runat="server" TextMode="Number"></asp:TextBox>
                                     <asp:RequiredFieldValidator style="padding:3%;position:relative;top:4px; font-size:13px; color:red;" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập đơn giá." ControlToValidate="txtdongia" Display="Dynamic"></asp:RequiredFieldValidator>      
                                </div>
                                 <div class="form-group">
                                    <label>Ghi chú</label>
                                    <asp:TextBox ID="txtghichu" CssClass="form-control"  runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group" style="padding-left:3px;">
                                    <asp:Button ID="btnGhi" style="padding-left:18px;padding-right:18px;" CssClass="btn btn-success loginbtn" runat="server" Text="Thêm" OnClick="btnGhi_Click"></asp:Button>
                                </div>
                                </div>
                        <div style="float:right;width:70%">
             <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                 <div class="form-group" style="padding-top:10px">
                   
                      <asp:GridView ID="gvCTPN" runat="server" AutoGenerateColumns="False" Width="100%" CellPadding="4" DataKeyNames="MaSP" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" OnRowCommand="gvCTPN_RowCommand">
                         <Columns>
                             <asp:BoundField DataField="MaSP" HeaderText="Mã sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                             <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                             <asp:BoundField DataField="DonGia" HeaderText="Đơn giá" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                             <asp:TemplateField HeaderText="Số lượng" HeaderStyle-ForeColor="White">
                                 <ItemTemplate>
                                     <asp:TextBox ID="txtsoluong" runat="server" Text='<%# Eval("SoLuong") %>' TextMode="Number" Width="40px"></asp:TextBox>
                                 </ItemTemplate>
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:TemplateField>
                             <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" DataFormatString="{0:#,##0.##}" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                             </asp:BoundField>
                               <asp:BoundField DataField="GhiChu" HeaderText="Ghi chú" HeaderStyle-ForeColor="White" >
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
                    <asp:Button ID="btninphieu" style="padding-left:18px;padding-right:18px;margin-right:8px" CssClass="btn btn-success loginbtn" runat="server" Text="Lưu phiếu" OnClick="btninphieu_Click" CausesValidation="False"></asp:Button>
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

