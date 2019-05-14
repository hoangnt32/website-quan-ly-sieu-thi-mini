<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="inhoadon.aspx.cs" Inherits="inhoadon" %>

<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.2.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Quản lý Siêu Thị</title>
 <!-- custom-theme -->
</head>
<body>
    <form id="form1" runat="server">
    <div style="margin:auto; width:80%">
    <dx:ASPxDocumentViewer ID="ReportHoaDon" runat="server"></dx:ASPxDocumentViewer>
        </div>
    </form>
</body>
</html>

