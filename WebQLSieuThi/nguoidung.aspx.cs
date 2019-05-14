using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class nguoidung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["manvien"] == null)
                Response.Redirect("dangnhap.aspx");
            LoadNguoiDung();
        }
       
    }
    CSDL kn = new CSDL();

    protected void LoadNguoiDung()
    {
        gvNguoiDung.DataSource = kn.GetData("select * from TaiKhoan");
        gvNguoiDung.DataBind();
    }



    protected void gvNguoiDung_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNguoiDung.PageIndex = e.NewPageIndex;
        LoadNguoiDung();
    }
}