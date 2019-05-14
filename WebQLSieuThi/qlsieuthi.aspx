<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="qlsieuthi.aspx.cs" Inherits="qlsieuthi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-top:5%">
    <div class="analytics-sparkle-area">
                <div class="container-fluid">
                    <div class="row" style="margin-bottom:30px">
                        
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Danh mục</h5>
                                    <h2><span class="counter">
                                        <asp:Label ID="lbldm" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Nhà cung cấp</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblncc" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Sản phẩm</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblsp" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Phiếu nhập</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblpn" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                     </div>
                     <div class="row" style="margin-bottom:30px">
                        
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Đơn đặt hàng</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblddh" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Doanh thu</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lbldt" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees">VND</span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Doanh số</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblds" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees">sản phẩm</span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Lượng khách mua hàng</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblluongkhachmh" runat="server"></asp:Label>
                                    </span> <span class="tuition-fees">
                                        khách hàng</span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                         </div>
                     <div class="row" style="margin-bottom:30px">
                         
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Nhân viên</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblnv" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Khách hàng</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lblkh" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Tài khoản</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lbltk" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                         <div class="col-lg-3 col-md-6 col-sm-6 col-xs-12">
                            <div class="analytics-sparkle-line reso-mg-b-30">
                                <div class="analytics-content">
                                    <h5>Liên hệ</h5>
                                    <h2><span class="counter">
                                    <asp:Label ID="lbllh" runat="server" Text=""></asp:Label>
                                    </span> <span class="tuition-fees"></span></h2>
                                    <span class="text-success"></span>
                                    <div class="progress m-b-0">
                                        <div style="border-bottom:3px solid #1B86F7"> </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                    <div style="margin-bottom:10%"></div>
               </div>
       </div>
</div>
</asp:Content>

