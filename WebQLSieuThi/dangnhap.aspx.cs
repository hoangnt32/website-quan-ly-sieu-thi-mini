using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dangnhap : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtusername.Focus();
        if (!IsPostBack)
        {
            Session["manvien"] = null;
            Session["ten"] = null;
            Session["tendn"] = null;
        }
    }

    protected void btndangnhap_Click(object sender, EventArgs e)
    {
        try
        {
            string sql = "select LoaiND from TaiKhoan where TenND='" + txtusername.Text.Trim() + "' and MatKhau='" + MaHoaMatKhau(txtpassword.Text) + "'";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                Session["chucvu"] = dt.Rows[0][0].ToString();
                if (Session["chucvu"].ToString() == "Khách hàng")
                {
                    Session["tendn"] = txtusername.Text.Trim();
                    Response.Redirect("~/trangchu.aspx");
                }
                else
                {
                    string sql1 = "select TenNV from NhanVien where MaNV=" + int.Parse(txtusername.Text.Trim());
                    DataTable dt1 = kn.GetData(sql1);
                    if (dt1.Rows.Count > 0)
                    {
                        Session["manvien"] = int.Parse(txtusername.Text.Trim());
                        Session["ten"] = dt1.Rows[0][0].ToString();
                    }
                    Response.Redirect("qlsieuthi.aspx");
                }
            }

            else
            {
                lbltbloi.Text = "Username hoặc Password không đúng ";
                txtpassword.Text = "";


            }


        }
        catch
        {
            lbltbloi.Text = "Username hoặc Password không đúng ";
            txtpassword.Text = "";
        }
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