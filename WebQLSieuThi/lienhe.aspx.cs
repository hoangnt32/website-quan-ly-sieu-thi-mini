using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class lienhe : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["malh"] != null)
            {
                gvLH.Visible = false;
                Label1.Text = "Nội Dung";
                int malh = int.Parse(Request.QueryString["malh"].ToString());
                string sql = "select * from LienHe where MaLH=" + malh;
                DataTable dt = kn.GetData(sql);
                if (dt.Rows.Count>0)
                {
                    lblhoten.Text = dt.Rows[0]["HoTen"].ToString();
                    lblemail.Text= dt.Rows[0]["Email"].ToString();
                    lblcauhoi.Text= dt.Rows[0]["NoiDung"].ToString();
                    if(dt.Rows[0]["TrangThai"].ToString()=="True")
                    {
                        traloi.Visible = false;
                        btngui.Visible = false;
                        txtnoidung.Visible = false;
                    }
                }
            }
            else if (Request.QueryString["timkiemlh"] != null)
            {
                gvLH.Visible = false;
                lblcauhoi.Visible = false;
                lblemail.Visible = false;
                lblhoten.Visible = false;
                email.Visible = false;
                cauhoi.Visible = false;
                hoten.Visible = false;
                traloi.Visible = false;
                txtnoidung.Visible = false;
                btngui.Visible = false;
                Label1.Text = "Tìm kiếm";
                string ngay = Request.QueryString["timkiemlh"].ToString();
                string[] chuoi = ngay.Split('-');
                string[] str = chuoi[0].Split('/');
                string[] str1 = chuoi[1].Split('/');
                string date = str[2] + "-" + str[1] + "-" + str[0];
                string date1 = str1[2] + "-" + str1[1] + "-" + str1[0];
                string sql = "";
                sql = "SELECT *, case when TrangThai=0 then N'Chưa phản hồi' else N'Đã phản hồi' end as TT from LienHe where NgayGui between '" + date + "' and '" + date1 + " 23:59:59' order by NgayGui desc";
                DataTable dt = kn.GetData(sql);
                gvLHTK.DataSource = dt;
                gvLHTK.DataBind();
                if (gvLHTK.Rows.Count == 0)
                    Label1.Text = "Tìm kiếm: Không tìm thấy";
            }
            else if (Request.QueryString["tim_malh"] != null)
            {
                int malh = int.Parse(Request.QueryString["tim_malh"].ToString());
                gvLH.Visible = false;
                lblcauhoi.Visible = false;
                lblemail.Visible = false;
                lblhoten.Visible = false;
                email.Visible = false;
                cauhoi.Visible = false;
                hoten.Visible = false;
                traloi.Visible = false;
                txtnoidung.Visible = false;
                btngui.Visible = false;
                Label1.Text = "Tìm kiếm";
                string sql = "SELECT *, case when TrangThai=0 then N'Chưa phản hồi' else N'Đã phản hồi' end as TT from LienHe where MaLH="+malh +" order by NgayGui desc";
                DataTable dt = kn.GetData(sql);
                gvLHTK.DataSource = dt;
                gvLHTK.DataBind();
                if (gvLHTK.Rows.Count == 0)
                    Label1.Text = "Tìm kiếm: Không tìm thấy";
            }
            else if (Request.QueryString["tim_email"] != null)
            {
                string txtemail = Request.QueryString["tim_email"].ToString();
                gvLH.Visible = false;
                lblcauhoi.Visible = false;
                lblemail.Visible = false;
                lblhoten.Visible = false;
                email.Visible = false;
                cauhoi.Visible = false;
                hoten.Visible = false;
                traloi.Visible = false;
                txtnoidung.Visible = false;
                btngui.Visible = false;
                Label1.Text = "Tìm kiếm";
                string sql = "SELECT *, case when TrangThai=0 then N'Chưa phản hồi' else N'Đã phản hồi' end as TT from LienHe where Email like '%" + txtemail + "%' order by NgayGui desc";
                DataTable dt = kn.GetData(sql);
                gvLHTK.DataSource = dt;
                gvLHTK.DataBind();
                if (gvLHTK.Rows.Count == 0)
                    Label1.Text = "Tìm kiếm: Không tìm thấy";
            }
            else
            {
                lblcauhoi.Visible = false;
                lblemail.Visible = false;
                lblhoten.Visible = false;
                email.Visible = false;
                cauhoi.Visible = false;
                hoten.Visible = false;
                traloi.Visible = false;
                txtnoidung.Visible = false;
                btngui.Visible = false;
            }
            if (Request.QueryString["id"] != null)
            {
                int ma = int.Parse(Request.QueryString["id"].ToString());
                string s = "delete from LienHe where MaLH=" + ma;
                try
                {
                    kn.Execute(s);
                    Response.Write("<script> alert('Xóa thành công.');window.location='lienhe.aspx'; </script>");
                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
            }

        }
    }

    protected void btngui_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["malh"] != null)
        {
            int malh = int.Parse(Request.QueryString["malh"].ToString());
            MailMessage mail = new MailMessage();
            MailAddress fromAddress = new MailAddress("nguyenhoang2797@gmail.com");
            MailAddress toAddress = null;
            mail.From = fromAddress;
            try
            {
                toAddress = new MailAddress(lblemail.Text, lblhoten.Text);
                mail.Subject = "Phản hồi cho câu hỏi của bạn";
                string gt = "Chào bạn,<br>"
                            + "Siêu thị ABC xin chân thành cảm ơn bạn đã quan tâm đến siêu thị của chúng tôi<br>"
                            + "Và với câu hỏi của bạn:<br>"
                            + lblcauhoi.Text + "<br>"
                            + "Chúng tôi xin được trả lời như sau:<br>"
                            + txtnoidung.Text + "<br>"
                            + "Chúc bạn một ngày tốt lành. Cảm ơn bạn.";
                mail.Body = gt;
                mail.To.Add(toAddress);
                mail.IsBodyHtml = true;
                SmtpClient smtpClient = new SmtpClient();
                smtpClient.Host = "smtp.gmail.com";
                smtpClient.Port = 587;
                smtpClient.EnableSsl = true;
                smtpClient.Credentials =
                new System.Net.NetworkCredential("nguyenhoang2797@gmail.com", "nguyenhoang97");
                smtpClient.Send(mail);
                string sql = "update LienHe set TrangThai=1 where MaLH="+malh;
                kn.Execute(sql);
                Response.Write("<script> alert('Gửi phản hồi thành công.');window.location='lienhe.aspx'; </script>");
            }

            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
    }

    protected void gvLH_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của liên hệ có mã= " + DataBinder.Eval(e.Row.DataItem, "MaLH") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
    }
}