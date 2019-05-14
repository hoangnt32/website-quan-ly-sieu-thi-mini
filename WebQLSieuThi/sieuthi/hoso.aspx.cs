using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sieuthi_hoso : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["tendn"] != null)
            {
                DataTable dt = kn.GetData("select TenKH,SDT,Email from KhachHang where SDT ='" + Session["tendn"].ToString()+"'");
                if (dt.Rows.Count > 0)
                {
                    txttendn.Text = dt.Rows[0][1].ToString();
                    txthoten.Text = dt.Rows[0][0].ToString();
                    txtemail.Text = dt.Rows[0][2].ToString();
                    lblemail.Text = txtemail.Text;
                }
            }
            else
            {
                Response.Redirect("../dangnhap.aspx");
            }

        }
    }

    protected void btncapnhat_Click(object sender, EventArgs e)
    {
        try
        {
            if (lblemail.Text != txtemail.Text.Trim())
            {
                string sql = "select MaKH from (select MaKH,Email from KhachHang union select MaNV,Email from NhanVien) DB where Email='" + txtemail.Text.Trim() + "'";
                DataTable dt = kn.GetData(sql);
                if (dt.Rows.Count > 0)
                    lbltbloi.Text = "Email đã tồn tại.";
                else
                {
                    CapNhatTT();
                }
            }
            else
            {
                CapNhatTT();
            }
        }
        catch
        {
            Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.');</script>");
        }
    }
    private void CapNhatTT()
    {
        string sql = "update KhachHang set TenKH=N'" + txthoten.Text.Trim() + "', Email='" + txtemail.Text.Trim() + "' where SDT='" + Session["tendn"].ToString() + "'";
        kn.Execute(sql);
        Response.Write("<script> alert('Cập nhật thông tin thành công.');window.location='hoso.aspx';</script>");
    }
}