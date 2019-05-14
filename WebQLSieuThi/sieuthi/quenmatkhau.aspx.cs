using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Net;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class sieuthi_quenmatkhau : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public string TaoLaiMatKhau(int dodaimatkhau)
    {
        string s = "abcdefghijk0123456789mnopqrstuvwxyz";
        Random randNum = new Random();
        char[] chars = new char[dodaimatkhau];
        for (int i = 0; i < dodaimatkhau; i++)
        {
            chars[i] = s[(int)((s.Length) * randNum.NextDouble())];
        }
        return new string(chars);
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
    CSDL kn = new CSDL();
    private void CapNhatMatKhau(int MaND,string MatKhau)
    {
        try
        {
            string sql = "update TaiKhoan set MatKhau='" + MatKhau.Trim() + "' where MaND=" + MaND;
            kn.Execute(sql);
        }
        catch
        {
            
        }
    }
    private DataTable LayMaND(string Email)
    {
        string s = "select MaKH from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) TT where Email='" + Email.Trim() + "'";
        return kn.GetData(s);
    }
    private string NoiDungMail()
    {
        string NoiDung = "";
        string MatKhauMoi = "";
        DataTable dtb = LayMaND(txtEmail.Text.Trim());
        if (dtb.Rows.Count > 0)
        {
            int mand = int.Parse(dtb.Rows[0][0].ToString());
            NoiDung = "Đây là mail gửi đến từ website của Siêu thị ABC..<br>";
            MatKhauMoi = TaoLaiMatKhau(8);
            NoiDung += "Mật khẩu mới của bạn là: " + MatKhauMoi;
            CapNhatMatKhau(mand, MaHoaMatKhau(MatKhauMoi));
            NoiDung += "<br>Sau khi đăng nhập bạn nên đổi lại mật khẩu để tiện cho việc đăng nhập lần tiếp theo.";
            NoiDung += "<br><br><hr>Vui lòng không trả lời mail này!";
        }
        return NoiDung;
    }

    protected void btnGuiYeuCau_Click(object sender, EventArgs e)
    {
        DataTable dtb = LayMaND(txtEmail.Text.Trim());
        if (dtb.Rows.Count > 0)
        {
            MailMessage mail = new MailMessage();
            MailAddress fromAddress = new MailAddress("nguyenhoang2797@gmail.com");
            MailAddress toAddress = null;
            mail.From = fromAddress;
            try
            {
                toAddress = new MailAddress(txtEmail.Text);
                mail.Subject = "Reset mật khẩu";
                mail.Body = NoiDungMail();
                mail.To.Add(toAddress);
                mail.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.Credentials =
                new System.Net.NetworkCredential("nguyenhoang2797@gmail.com", "nguyenhoang97");
                smtpClient.Send(mail);
                Response.Write("<script>alert('Chúng tôi đã gửi mật khẩu cho bạn.\\n\\n Vui lòng kiểm tra mail để lấy lại mật khẩu!');window.location='../dangnhap.aspx';</script>");


            }
            catch
            {
                Response.Write("<script>alert('Yêu cầu reset mật khẩu thất bại.')</script>");
                
            }
        }
        else
        {
            lbltbloi.Text = "Mai chưa đăng ký.";
        }
    }
}