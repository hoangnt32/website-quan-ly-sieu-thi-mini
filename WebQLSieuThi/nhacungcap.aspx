<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="nhacungcap.aspx.cs" Inherits="nhacungcap" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Danh Sách Nhà Cung Cấp</h4>
                            <div class="add-product">
                               <input style="position:relative;left:85%;bottom:42px" id="btnthemncc" class="btn btn-primary waves-effect waves-light" type="button" value="Thêm nhà cung cấp" />
                            </div>
                            <div class="asset-inner">
                                 <asp:GridView ID="gvNhaCC" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaNCC" OnRowCancelingEdit="gvNhaCC_RowCancelingEdit" OnRowDeleted="gvNhaCC_RowDeleted" OnRowEditing="gvNhaCC_RowEditing" OnRowUpdated="gvNhaCC_RowUpdated" OnPageIndexChanging="gvNhaCC_PageIndexChanging" OnRowUpdating="gvNhaCC_RowUpdating" AllowPaging="True">
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
                                                <asp:HyperLink ID="hlXoa" runat="server" CausesValidation="False" NavigateUrl=<%# "javascript:xacnhanxoa('nhacungcap.aspx?id="+ Eval("MaNCC")+"',"+Eval("MaNCC")+")" %> Text="Xóa"></asp:HyperLink>
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
                                                                <asp:TextBox ID="txttenncc" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Tên nhà cung cấp (*)" runat="server"></asp:TextBox>       
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttenncc" Text="Vui lòng nhập tên nhà cung cấp." Display="Dynamic"></asp:RequiredFieldValidator></span>
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
        document.querySelector('#btnthemncc').onclick = function () {
            dialog.showModal();
        };
        document.querySelector('#btntrove').onclick = function () {
            dialog.close();
        };
    </script>
    <script language="javascript">
        function xacnhanxoa(str,ma) {
            ok = confirm("Bạn chắc chắn muốn xóa nhà cung cấp có mã "+ma+"?")
            if (ok != "0")
                window.location = str
        }
    </script>
</asp:Content>

