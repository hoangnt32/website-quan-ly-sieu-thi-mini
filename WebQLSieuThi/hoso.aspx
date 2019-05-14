<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hoso.aspx.cs" Inherits="hoso" EnableEventValidation="false" %>

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
                                                                <label class="login2 pull-right pull-right-pro">Tên đăng nhập</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txttendn" style="width:75%" CssClass="form-control" runat="server" Enabled="False"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Họ tên</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txthoten" style="width:75%" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Ngày sinh</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                 <asp:TextBox ID="txtngsinh" style="width:75%" data-mask="99/99/9999" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Giới tính</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:DropDownList ID="cmbgtinh" style="width:75%" CssClass="form-control" runat="server">
                                                                    <asp:ListItem Selected="True">Nam</asp:ListItem>
                                                                    <asp:ListItem>Nữ</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Địa chỉ</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txtdiachi" style="width:75%" CssClass="form-control" runat="server"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Số điện thoại</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txtsdt" style="width:75%" CssClass="form-control" runat="server" TextMode="Phone" MaxLength="10"></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                     <asp:Label ID="lblsdt" Visible="false" CssClass="form-control" runat="server" ></asp:Label>
                                                     <div class="form-group-inner">
                                                        <div class="row">
                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <label class="login2 pull-right pull-right-pro">Email</label>
                                                            </div>
                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                                                                <asp:TextBox ID="txtemail" style="width:75%" CssClass="form-control" runat="server" ></asp:TextBox>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <asp:Label ID="lblemail" Visible="false" CssClass="form-control" runat="server" ></asp:Label>
                                                     <div class="form-group-inner">
                                                        <div class="row">
                                                            <div style="margin-top:0.7%; color:red" class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                                <asp:Label ID="lbltbao" runat="server" CssClass="login2 pull-right pull-right-pro" Text=""></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                <div style=" margin-bottom:2.5%; margin-top:3%">
                                                    <asp:Button style="padding-left:18px; padding-right:18px;margin-left:25px" ID="btncapnhat" runat="server" class="btn btn-primary waves-effect waves-light" Text="Cập nhật" CausesValidation="False" OnClick="btncapnhat_Click" />
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

