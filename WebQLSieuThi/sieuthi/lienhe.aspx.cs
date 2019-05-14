using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sieuthi_lienhe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    CSDL kn = new CSDL();
    protected void btngui_Click(object sender, EventArgs e)
    {
        string hoten = txthoten.Text.Trim();
        string sdt = txtsdt.Text.Trim();
        string email = txtemail.Text.Trim();
        string tieude = txttieude.Text.Trim();
        string noidung = txtnoidung.Text;
        string sql = "insert into LienHe values(N'"+hoten+"','"+email+"','"+sdt+"',N'"+noidung+"',default,0)";
        try
        {
            kn.Execute(sql);
            Response.Write("<script> alert('Gửi thông tin thành công. Chúng tôi sẽ phải hồi cho bạn trong thời gian sớm nhất.');window.location='lienhe.aspx'; </script>");
        }
        catch
        {
            Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
        }
    }
}