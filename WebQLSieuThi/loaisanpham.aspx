<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="loaisanpham.aspx.cs" Inherits="loaisanpham" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="product-status mg-b-15">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="product-status-wrap">
                            <h4>Danh Sách Dah Mục</h4>
                            <div class="add-product">
           
                               <input style="position:relative;left:87%;bottom:42px" id="btnthemloaisp" class="btn btn-primary waves-effect waves-light" type="button" value="Thêm danh mục" />
                            </div>
                            <div class="asset-inner">
                                <asp:GridView ID="gvLoaiSP" style="margin-left:3%" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="MaLoai" DataSourceID="SqlLoaiSP" OnRowCancelingEdit="gvLoaiSP_RowCancelingEdit" OnRowDataBound="gvLoaiSP_RowDataBound" OnRowDeleted="gvLoaiSP_RowDeleted" OnRowEditing="gvLoaiSP_RowEditing" OnRowUpdated="gvLoaiSP_RowUpdated" OnRowUpdating="gvLoaiSP_RowUpdating" >
                                   <Columns>
                                   <asp:BoundField DataField="MaLoai" HeaderText="Mã Danh Mục" HeaderStyle-ForeColor="White" ReadOnly="True" >
<HeaderStyle ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle"></HeaderStyle>
                                       </asp:BoundField>
                                        <asp:BoundField DataField="TenLoai" HeaderText="Tên Danh Mục" HeaderStyle-ForeColor="White" >
<HeaderStyle ForeColor="White"></HeaderStyle>
                                       </asp:BoundField>                                   
                                        <asp:CommandField CausesValidation="False" ShowEditButton="True" CancelText="Hủy" EditText="Sửa" UpdateText="Lưu" />
                                        <asp:TemplateField ShowHeader="False">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnXoa" runat="server" CausesValidation="False" CommandName="Delete" Text="Xóa"></asp:LinkButton>
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
                                <asp:SqlDataSource ID="SqlLoaiSP" runat="server" ConnectionString="<%$ ConnectionStrings:conn %>" DeleteCommand="DELETE FROM [LoaiSP] WHERE [MaLoai] = @MaLoai" InsertCommand="INSERT INTO [LoaiSP] ([TenLoai]) VALUES (@TenLoai)" SelectCommand="SELECT * FROM [LoaiSP]" UpdateCommand="UPDATE [LoaiSP] SET [TenLoai] = @TenLoai WHERE [MaLoai] = @MaLoai">
                                    <DeleteParameters>
                                        <asp:Parameter Name="MaLoai" Type="Int32" />
                                    </DeleteParameters>
                                    <InsertParameters>
                                        <asp:Parameter Name="TenLoai" Type="String" />
                                    </InsertParameters>
                                    <UpdateParameters>
                                        <asp:Parameter Name="TenLoai" Type="String" />
                                        <asp:Parameter Name="MaLoai" Type="Int32" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>
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
                                                                <asp:TextBox ID="txttenlsp" style="height:35px;position:relative;left:-25px;" CssClass="form-control" placeholder="Tên danh mục (*)" runat="server"></asp:TextBox>       
                                                                <span style="color:red; position:relative; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttenlsp" Text="Vui lòng nhập tên danh mục." Display="Dynamic"></asp:RequiredFieldValidator></span>
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
        document.querySelector('#btnthemloaisp').onclick = function () {
            dialog.showModal();
        };
        document.querySelector('#btntrove').onclick = function () {
            dialog.close();
        };
    </script>
</asp:Content>

