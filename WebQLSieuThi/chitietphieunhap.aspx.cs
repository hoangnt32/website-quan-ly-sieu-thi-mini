using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chitietphieunhap : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            if (Session["ten"] == null)
            {
                Response.Redirect("dangnhap.aspx");
            }
        if (Request.QueryString["mapn"] != null)
        {
            int maso = int.Parse(Request.QueryString["mapn"].ToString());
            DataTable dt = kn.GetData("select * from CTPhieuNhap where MaPhieu=" + maso);
            if (dt.Rows.Count <= 0)
            {
                kn.Execute("delete from PhieuNhap where MaPhieu=" + maso);
                xuathd.Visible = false;
            }
        }
    }

    protected void gvCTPN_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa chi tiết phiếu nhập có mã sản phẩm= " + DataBinder.Eval(e.Row.DataItem, "MaSP") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
    }

    protected void xuathd_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["mapn"] != null)
        {
            int ma = int.Parse(Request.QueryString["mapn"].ToString());
            Redirect rd = new Redirect();
            rd.ChuyenTrang("inhoadon.aspx?xuatpn=" + ma, "_blank", "");
        }
    }
}