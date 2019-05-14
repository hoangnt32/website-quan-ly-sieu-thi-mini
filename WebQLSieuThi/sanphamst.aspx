<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sanphamst.aspx.cs" Inherits="sanphamst" EnableEventValidation="false" %>

<%@ Register Assembly="CKEditor.NET" Namespace="CKEditor.NET" TagPrefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row" style="width:100%;margin:auto">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="sparkline12-list">
                            <div class="sparkline12-graph">
                                <div class="basic-login-form-ad">
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                            <div class="all-form-element-inner">
                                                <form action="#">
                                                    <div class="form-group-inner" style="margin-top:4%">
                                                        <div class="row" >
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Tên sản phẩm</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txttensp" style="height:35px;width:75%" CssClass="form-control" placeholder="Tên sản phẩm (*)"  runat="server"></asp:TextBox>       
                                                                <span style="color:red; position:relative;left:8px; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txttensp" Text="Vui lòng nhập tên sản phẩm." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Loại sản phẩm</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12" >
                                                               <div style="width:75%;margin-left:8px;">
                                                                      
                                                                     <asp:DropDownList ID="cmbloai"  CssClass="chosen-select form-control" TabIndex="-1" runat="server">
                                                                     </asp:DropDownList>
                                                                    
                                                                        </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" >
                                                                <label class="login2 pull-right pull-right-pro">Nhà cung cấp</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                 <div style="width:75%;margin-left:8px">
                                                                      
                                                                     <asp:DropDownList ID="cmbncc" CssClass="chosen-select form-control" TabIndex="-1" runat="server">
                                                                     </asp:DropDownList>
                                                                 </div>   
                                                                 </div>
                                                            </div>
                                                        </div>
                                                    
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Đơn vị tính</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:DropDownList ID="cmbdvt" style="height:35px;width:75%" CssClass="form-control" runat="server" ToolTip="Đơn vị tính">
                                                                     <asp:ListItem>Kg</asp:ListItem>
                                                                      <asp:ListItem>Cái</asp:ListItem>
                                                                      <asp:ListItem>Hộp</asp:ListItem>
                                                                     <asp:ListItem>Chai</asp:ListItem>
                                                                    <asp:ListItem>Gói</asp:ListItem>
                                                                      <asp:ListItem>Thùng</asp:ListItem>
                                                                  </asp:DropDownList>
                                                                  <span style="color:red; position:relative; top:4px;height:35px">
                                                                    
                                                                  </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Giá bán</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txtgiaban" style="height:35px;width:75%" CssClass="form-control" placeholder="Giá bán (*)" runat="server" min="1" TextMode="Number"></asp:TextBox>
                                                                <span style="color:red; position:relative;left:8px; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtgiaban" Text="Vui lòng nhập giá bán." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Hình minh họa</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:FileUpload ID="hinhmh" runat="server" />
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12" style="padding-top:3px">
                                                                <asp:Label ID="lblhinh" Visible="false" runat="server"></asp:Label>
                                                            </div>
                                                                
                                                                <span style="color:red; position:relative;left:-185px; top:4px;height:35px">
                                                                     <asp:RequiredFieldValidator ID="kthmh" runat="server" ControlToValidate="hinhmh" Text="Vui lòng chọn hình minh họa." Display="Dynamic"></asp:RequiredFieldValidator></span>
                                                            </div>
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Mô tả</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <div style="width:75%">
                                                                <CKEditor:CKEditorControl ID="editor"  BasePath="~/Scripts/ckeditor" runat="server"></CKEditor:CKEditorControl>  
                                                            
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Khuyến mãi</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txtkm" style="height:35px;width:75%" CssClass="form-control" placeholder="Khuyến mãi" runat="server" TextMode="Number"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                   
                                                     <div class="form-group-inner">
                                                        <div class="row">
                                                            <div style="margin-top:0.7%; color:red" class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <asp:Label ID="lbltbao" runat="server" CssClass="login2 pull-right pull-right-pro" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                <div style=" margin-bottom:2.5%; margin-top:3%">
                                                    <asp:Button style="padding-left:18px; padding-right:18px;margin-left:25px" ID="btnLuu" runat="server" class="btn btn-primary waves-effect waves-light" Text="Lưu" OnClick="btnLuu_Click"/>
                                                      <asp:Button style="padding-left:18px; padding-right:18px;margin-left:25px" ID="btnCapNhat" runat="server" class="btn btn-primary waves-effect waves-light" Text="Cập nhật" OnClick="btnCapNhat_Click" CausesValidation="False" />
                                                            </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
</asp:Content>

