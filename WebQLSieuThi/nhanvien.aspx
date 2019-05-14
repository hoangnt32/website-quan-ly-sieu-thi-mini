<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="nhanvien.aspx.cs" Inherits="nhanvien" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Danh Sách Nhân Viên</h4>
                            <div class="add-product">
           
                               <input style="position:relative;left:87%;bottom:42px" id="btnthemnv" class="btn btn-primary waves-effect waves-light" type="button" value="Thêm nhân viên" />
                            </div>
                            <div class="asset-inner">
                               <asp:GridView ID="gvNhanvien" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnPageIndexChanging="gvNhanvien_PageIndexChanging" DataKeyNames="MaNV" OnRowCancelingEdit="gvNhanvien_RowCancelingEdit" OnRowEditing="gvNhanvien_RowEditing" OnRowUpdating="gvNhanvien_RowUpdating" OnRowUpdated="gvNhanvien_RowUpdated" OnRowDeleted="gvNhanvien_RowDeleted">
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
                                                <asp:HyperLink ID="hlXoa" runat="server" CausesValidation="False" NavigateUrl=<%# "javascript:xacnhanxoa('nhanvien.aspx?id="+ Eval("MaNV")+"',"+Eval("MaNV")+")" %> Text="Xóa"></asp:HyperLink>
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
                                                              
                            </div>
                            <asp:Label style="color:red;padding:10px; position:relative; top:7px" ID="lbltb" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
     <dialog style="min-width:35%; border:1px solid white; border-radius: 5px; box-shadow: 3px 5px 5px gray;">
    <div class="single-pro-review-area mt-t-30 mg-b-15" style="height:auto;">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-payment-inner-st">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="review-content-section">
                                                <div class="row">
                                                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                                        <div class="devit-card-custom">
                                                            <div class="form-group" style="margin-top:0px;">
                                                                <asp:TextBox ID="txttennv" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Tên nhân viên (*)" runat="server"></asp:TextBox>       
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttennv" Text="Vui lòng nhập tên nhân viên." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>   
                                                            <div class="input-mark-inner mg-b-22">
                                                                <asp:TextBox ID="txtngsinh" style="height:35px;position:relative;left:-25px;" CssClass="form-control" data-mask="99/99/9999" placeholder="Ngày sinh (*)" runat="server"></asp:TextBox>
                                                                
                                                                 <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" style="height:10px" runat="server" ControlToValidate="txtngsinh" Text="Vui lòng nhập ngày sinh." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                             <div class="form-group">
                                                                  <asp:DropDownList ID="cmbgtinh" style="height:35px;position:relative;left:-25px;" CssClass="form-control" runat="server" ToolTip="Giới tính">
                                                                      <asp:ListItem>Giới tính</asp:ListItem>
                                                                      <asp:ListItem>Nam</asp:ListItem>
                                                                      <asp:ListItem>Nữ</asp:ListItem>
                                                                  </asp:DropDownList>
                                                                  <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="cmbgtinh" Text="Vui lòng chọn giới tính." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                            <div class="form-group">
                                                               <asp:TextBox ID="txtdiachi" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Địa chỉ (*)" runat="server"></asp:TextBox>
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtdiachi" Text="Vui lòng nhập địa chỉ." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                              <div class="form-group">
                                                               <asp:TextBox ID="txtsdt" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Số điện thoại (*)" runat="server" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                                               <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtsdt" Text="Vui lòng nhập số điện thoại." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                              <div class="form-group">
                                                               <asp:TextBox ID="txtemail" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Email (*)" runat="server" TextMode="Email"></asp:TextBox>
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtemail" Text="Vui lòng nhập email." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                              <div class="form-group">
                                                                  <asp:DropDownList style="height:35px;position:relative;left:-25px;" ID="cmbchucvu" CssClass="form-control" runat="server" ToolTip="Chức vụ">
                                                                      <asp:ListItem>Chức vụ</asp:ListItem>
                                                                      <asp:ListItem>Admin</asp:ListItem>
                                                                      <asp:ListItem>Nhân viên kho</asp:ListItem>
                                                                      <asp:ListItem>Nhân viên bán hàng</asp:ListItem>
                                                                  </asp:DropDownList>
                                                               
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Vui lòng chọn chức vụ." ControlToValidate="cmbchucvu" Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                              <div class="form-group">
                                                               <asp:TextBox ID="txtluong" style="height:35px;position:relative;left:-25px;" min="0" CssClass="form-control" placeholder="Lương nhân viên (*)" runat="server" TextMode="Number"></asp:TextBox>
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtluong" Text="Vui lòng nhập lương nhân viên." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                              <div class="form-group">
                                                                <asp:Label style="position:relative;top:4%; color:red" ID="lblthongbao" runat="server" Text=""></asp:Label>
                                                            </div>
                                                           
                                                            <div style=" margin-top:25px">
                                                             <asp:Button style="padding-left:18px; padding-right:18px;margin-bottom:0px" ID="btnLuu" runat="server" class="btn btn-primary waves-effect waves-light" Text="Lưu" OnClick="btnLuu_Click" />
                                                             <input style="margin-right:10px;" id="btntrove" class="btn btn-primary waves-effect waves-light" type="button" value="Trở về" />
                                                            
                                                            
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
        </div>
            </dialog>
   
    <script>
        var dialog = document.querySelector('dialog');
        document.querySelector('#btnthemnv').onclick = function () {
            dialog.showModal();
        };
       
        document.querySelector('#btntrove').onclick = function () {
            dialog.close();
        };
    </script>
     <script language="javascript">
        function xacnhanxoa(str,ma) {
            ok = confirm("Bạn chắc chắn muốn xóa nhân viên có mã "+ma+"?")
            if (ok != "0")
                window.location = str
        }
    </script>
</asp:Content>

