using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sieuthi_donhuy : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    int makh;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["tendn"] != null)
        {
            string sql = "select dh.*, case when TinhTrang=0 then N'Chưa giao' when TinhTrang=1 then N'Đã giao' else N'Đã hủy' end as TrangThai "
                + " from KhachHang kh, DonDatHang dh where kh.MaKH=dh.MaKH and kh.SDT='" + Session["tendn"].ToString() +
                "' and TinhTrang = -1 order by MaDH desc";
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                gvdonhang.DataSource = dt;
                gvdonhang.DataBind();

            }
            
        }

        else
            Response.Write("<script type='text/javascript' language='javascript'>alert('Bạn cần đăng nhập để xem thông tin đơn hàng.');window.location='../dangnhap.aspx';</script>");
    }
    protected void gvdonhang_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex < 0) return;
        GridView gvgiohang = (GridView)e.Row.FindControl("gvgiohang");
        Literal lblMa = (Literal)e.Row.FindControl("lblMa");
        Label lbltongthanhtien = (Label)e.Row.FindControl("lbltongthanhtien");
        Label lbltongcong = (Label)e.Row.FindControl("lbltongcong");
        string sql = "select MaKH from KhachHang where SDT='" + Session["tendn"].ToString() + "'";
        DataTable dt = kn.GetData(sql);
        if (dt.Rows.Count > 0)
        {
            float tongtien = 0;
            makh = int.Parse(dt.Rows[0][0].ToString());
            sql = "select * from SanPham sp, CTDonDatHang ct"
                + " ,DonDatHang ddh where ddh.MaDH=ct.MaDH and sp.MaSP=ct.MaSP and ddh.MaDH=" + int.Parse(lblMa.Text);
            dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
                foreach (DataRow row in dt.Rows)
                {
                    row["ThanhTien"] = int.Parse(row["SoLuong"].ToString()) * float.Parse(row["GiaBan"].ToString()) * (1 - float.Parse(row["KhuyenMai"].ToString()) / 100);
                    tongtien += float.Parse(row["ThanhTien"].ToString());
                }
            lbltongthanhtien.Text = String.Format("{0:#,##0}", tongtien) + " đồng";
            gvgiohang.DataSource = dt;
            gvgiohang.DataBind();
            lbltongcong.Visible = true;
            lbltongthanhtien.Visible = true;
        }
        else
            Response.Redirect("~/sieuthi/giohang.aspx");
    }
}