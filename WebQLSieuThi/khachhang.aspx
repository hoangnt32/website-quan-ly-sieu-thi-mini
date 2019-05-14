<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="khachhang.aspx.cs" Inherits="khachhang" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Danh Sách Khách Hàng</h4>
                             <div class="add-product">
           
                               <input style="position:relative;left:87%;bottom:42px" id="btnthemkh" class="btn btn-primary waves-effect waves-light" type="button" value="Thêm khách hàng" />
                            </div>
                            <div class="asset-inner">
                                 <asp:GridView ID="gvKhachhang" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaKH" OnRowCancelingEdit="gvKhachhang_RowCancelingEdit" OnRowEditing="gvKhachhang_RowEditing" OnRowUpdated="gvKhachhang_RowUpdated" OnRowUpdating="gvKhachhang_RowUpdating" OnRowDeleted="gvKhachhang_RowDeleted" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvKhachhang_PageIndexChanging">
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
                                                <asp:HyperLink ID="hlXoa" runat="server" CausesValidation="False" NavigateUrl=<%# "javascript:xacnhanxoa('khachhang.aspx?id="+ Eval("MaKH")+"',"+Eval("MaKH")+")" %> Text="Xóa"></asp:HyperLink>
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
    <div class="single-pro-review-area mt-t-30 mg-b-15">
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
                                                            <div class="form-group" style="margin-top:0px">
                                                               <asp:TextBox ID="txtsdt" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Số điện thoại (*)" runat="server" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                                               <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtsdt" Text="Vui lòng nhập số điện thoại." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>   
                                                           
                                                              <div class="form-group">
                                                                 <asp:TextBox ID="txttenkh" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Tên khách hàng (*)" runat="server"></asp:TextBox>       
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttenkh" Text="Vui lòng nhập tên khách hàng." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                               
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
        document.querySelector('#btnthemkh').onclick = function () {
            dialog.showModal();
        };
        document.querySelector('#btntrove').onclick = function () {
            dialog.close();
        };
    </script>
     <script language="javascript">
        function xacnhanxoa(str,ma) {
            ok = confirm("Bạn chắc chắn muốn xóa khách hàng có mã "+ma+"?")
            if (ok != "0")
                window.location = str
        }
    </script>
</asp:Content>

