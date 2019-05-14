using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sieuthi_doimatkhau : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["tendn"] == null)
                Response.Redirect("/dangnhap.aspx");
        }
    }
    CSDL kn = new CSDL();

    protected void btndoimk_Click(object sender, EventArgs e)
    {
        string sql;
        sql = "select * from TaiKhoan where TenND=" + int.Parse(Session["tendn"].ToString()) + " and MatKhau='" + MaHoaMatKhau(txtmkcu.Text.Trim()) + "'";
        DataTable dt = kn.GetData(sql);
        if (dt.Rows.Count > 0)
        {
            try
            {
                sql = "update TaiKhoan set MatKhau='" + MaHoaMatKhau(txtmkmoi.Text.Trim()) + "' where TenND=" + int.Parse(Session["tendn"].ToString());
                kn.Execute(sql);
                Response.Write("<script type='text/javascript'>alert('Đổi mật khẩu thành công.');window.location='../dangnhap.aspx';</script>");
            }
            catch
            {
                lbltbloi.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
            }
        }
        else
            lbltbloi.Text = "Mật khẩu cũ không đúng.";
    }
    public string MaHoaMatKhau(string password)
    {
        UnicodeEncoding mahoa = new UnicodeEncoding();
        Byte[] hashBytes = mahoa.GetBytes(password);
        // Compute the SHA-1 hash 
        SHA1CryptoServiceProvider sha1 = new SHA1CryptoServiceProvider();
        Byte[] cryptPassword = sha1.ComputeHash(hashBytes);
        return BitConverter.ToString(cryptPassword);
    }
}