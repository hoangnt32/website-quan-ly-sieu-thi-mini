<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="doimatkhau.aspx.cs" Inherits="doimatkhau" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="error-pagewrap">
		<div class="error-page-int" >
  
        <div style="margin-top:10%">
				<h3>ÐỔI MẬT KHẨU</h3>
			</div>
			<div class="content-error" style="margin-bottom:10%">
				<div class="hpanel">
                    <div class="panel-body"style="padding-left: 30px;padding-right:30px">
                            <div class="form-group"style="height:53px">
                                <label class="control-label">Mật khẩu cũ</label>
                                <asp:TextBox style="height:35px" ID="txtmkcu" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                            <div>
                                <asp:RequiredFieldValidator style="position:relative;color:red;bottom:6px;height:35px" ID="RequiredFieldValidator1" runat="server" Text="Vui lòng nhập mật khẩu cũ." ControlToValidate="txtmkcu" Font-Size="13px" Display="Dynamic"></asp:RequiredFieldValidator></div>
                             <div class="form-group"style="height:53px" >
                                <label class="control-label" >Mật khẩu mới</label>
                                <asp:TextBox ID="txtmkmoi" style="height:35px" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                        <div>
                                <asp:RequiredFieldValidator style="position:relative;color:red;bottom:6px;height:35px" ID="RequiredFieldValidator2" runat="server" Text="Vui lòng nhập mật khẩu mới." ControlToValidate="txtmkmoi" Font-Size="13px" Display="Dynamic"></asp:RequiredFieldValidator></div>
                             <div class="form-group"style="height:53px">
                                <label class="control-label" >Nhập lại mật khẩu mới</label>
                                <asp:TextBox ID="txtnlmkmoi" style="height:35px" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            </div>
                         <div>
                                <asp:RequiredFieldValidator style="position:relative;color:red;bottom:6px;height:35px" ID="RequiredFieldValidator3" runat="server" Text="Vui lòng nhập lại mật khẩu." ControlToValidate="txtmkmoi" Font-Size="13px" Display="Dynamic"></asp:RequiredFieldValidator></div>
                       <div> <asp:CompareValidator ID="CompareValidator1" style="position:relative;color:red;bottom:5px;height:35px" runat="server" ControlToCompare="txtmkmoi" ControlToValidate="txtnlmkmoi" Font-Size="13px" Text="Mật khẩu không khớp."></asp:CompareValidator></div>
                        <div>
                            <asp:Label ID="lbltbao" runat="server" style="position:relative;color:red;bottom:15px;height:35px" Text=""></asp:Label></div>
                        <asp:Button ID="btndoimatkhau" CssClass="btn btn-success btn-block loginbtn" style="padding-top:12px; padding-bottom:12px; margin-bottom:2%" runat="server" Text="Ðổi mật khẩu" OnClick="btndoimatkhau_Click" />
                        
                          
                       
                    </div>
                </div>
			</div>
			</div>
            </div>              
   
</asp:Content>

