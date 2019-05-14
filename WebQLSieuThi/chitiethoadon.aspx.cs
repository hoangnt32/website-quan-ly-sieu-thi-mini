using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chitiethoadon : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Session["ten"] == null)
            {
                Response.Redirect("dangnhap.aspx");
            }
        if (Request.QueryString["mahd"] != null)
        {
            int maso = int.Parse(Request.QueryString["mahd"].ToString());
            DataTable dt = kn.GetData("select * from CTHoaDon where MaHD=" + maso);
            if (dt.Rows.Count <= 0)
            {
                kn.Execute("delete from HoaDon where MaHD=" + maso);
                xuathd.Visible = false;
            }
        }

    }

    protected void gvCTHD_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa chi tiết hóa đơn có mã sản phẩm= " + DataBinder.Eval(e.Row.DataItem, "MaSP") + " ?');");
            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
    }

    protected void xuathd_Click(object sender, EventArgs e)
    {
        if(Request.QueryString["mahd"]!=null)
        {
            int ma = int.Parse(Request.QueryString["mahd"].ToString());
            Redirect rd = new Redirect();
            rd.ChuyenTrang("inhoadon.aspx?xuathd=" + ma,"_blank","");
        }
    }
    
}