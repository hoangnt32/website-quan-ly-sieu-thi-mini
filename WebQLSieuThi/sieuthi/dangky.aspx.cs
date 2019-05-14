using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BanHang_dangky : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    CSDL kn = new CSDL();
    protected void btndangki_Click(object sender, EventArgs e)
    {
        string sql="select * from TaiKhoan where TenND='"+txttendn.Text.Trim()+"'";
        DataTable dt = kn.GetData(sql);
        if (dt.Rows.Count > 0)
            lbltbloi.Text = "Số điện thoại đã đăng ký.";
        else
        {
            sql = "select MaKH from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB where Email='"+txtemail.Text.Trim()+"'";
            dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
                lbltbloi.Text = "Email đã tồn tại.";
            else
            {
                sql = "select MaKH from KhachHang where SDT='" + txttendn.Text.Trim() + "'";
                dt = kn.GetData(sql);
                if (dt.Rows.Count > 0)
                {
                    try
                    {
                        sql = "update KhachHang set TenKH= N'" + txthoten.Text.Trim() + "',Email='" + txtemail.Text.Trim() + "' where SDT='" + txttendn.Text.Trim() + "'";
                        kn.Execute(sql);
                        sql = "insert into TaiKhoan values(" + int.Parse(dt.Rows[0][0].ToString()) + ",'" + txttendn.Text.Trim() + "','" + MaHoaMatKhau(txtmk.Text.Trim()) + "',N'Khách hàng')";
                        kn.Execute(sql);
                        Response.Write("<script> alert('Đăng ký thành công.'); window.location='../dangnhap.aspx'; </script>");
                    }
                    catch
                    {
                        Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                    }
                }
                else
                    try
                    {
                        sql = "insert into KhachHang values(N'" + txthoten.Text.Trim() + "','" + txttendn.Text.Trim() + "','" + txtemail.Text.Trim() + "')";
                        kn.Execute(sql);
                        dt = kn.GetData("select MaKH from KhachHang where SDT= '" + txttendn.Text.Trim() + "'");
                        if (dt.Rows.Count > 0)
                        {
                            sql = "insert into TaiKhoan values(" + int.Parse(dt.Rows[0][0].ToString()) + ",'" + txttendn.Text.Trim() + "','" + MaHoaMatKhau(txtmk.Text.Trim()) + "',N'Khách hàng')";
                            kn.Execute(sql);
                        }
                        Response.Write("<script> alert('Đăng ký thành công.'); window.location='../dangnhap.aspx'; </script>");
                    }
                    catch
                    {
                        Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                    }
            }
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