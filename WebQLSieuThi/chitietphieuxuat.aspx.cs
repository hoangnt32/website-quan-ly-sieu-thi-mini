using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chitietphieuxuat : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Session["tendn"] == null)
            {
                Response.Redirect("dangnhap.aspx");
            }
        if (Request.QueryString["mapx"] != null)
        {
            int maso = int.Parse(Request.QueryString["mapx"].ToString());
            DataTable dt = kn.GetData("select * from CTPhieuXuat where MaPhieu=" + maso);
            if (dt.Rows.Count <= 0)
            {
                kn.Execute("delete from PhieuXuat where MaPhieu=" + maso);
                xuathd.Visible = false;
            }
        }
    }
    protected void gvCTPX_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa chi tiết phiếu xuất có mã sản phẩm= " + DataBinder.Eval(e.Row.DataItem, "MaSP") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
    }

    protected void xuathd_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["mapx"] != null)
        {
            int ma = int.Parse(Request.QueryString["mapx"].ToString());
            Redirect rd = new Redirect();
            rd.ChuyenTrang("inhoadon.aspx?xuatpx=" + ma, "_blank", "");
        }
    }
}