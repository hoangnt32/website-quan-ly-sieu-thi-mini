using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dondathang : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["madh"] != null)
            {
                gvDDH.Visible = false;
                lblten.Text = "Chi Tiết Đơn Đặt Hàng";
                int madh = int.Parse(Request.QueryString["madh"].ToString());
                DataTable dt = kn.GetData("select TinhTrang from DonDatHang where MaDH="+madh);
                if(dt.Rows[0][0].ToString()=="0")
                    btnxacnhan.Visible = true;
            }
            else if(Request.QueryString["id"] != null)
            {
                int ma = int.Parse(Request.QueryString["id"].ToString());
                string s = "delete from DonDatHang where MaDH=" + ma;
                try
                {
                    kn.Execute(s);
                    Response.Write("<script> alert('Xóa thành công.');window.location='dondathang.aspx'; </script>");
                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
            }
            else if (Request.QueryString["timkiemdh"] != null)
            {
                string ngay = Request.QueryString["timkiemdh"].ToString();
                string[] chuoi = ngay.Split('-');
                string[] str = chuoi[0].Split('/');
                string[] str1 = chuoi[1].Split('/');
                string date = str[2] + "-" + str[1] + "-" + str[0];
                string date1 = str1[2] + "-" + str1[1] + "-" + str1[0];
                string sql = "";
                sql = "SELECT *, case when TinhTrang=0 then N'Chưa giao' when TinhTrang=1 then N'Đã giao' else N'Đã hủy' end as TrangThai from DonDatHang where NgayDH between '" + date + "' and '" + date1 + " 23:59:59' order by NgayDH desc";
                DataTable dt = kn.GetData(sql);
                gvDDH.DataSource = dt;
                gvDDH.DataBind();
                if (gvDDH.Rows.Count == 0)
                    lblten.Text = "Kết quả tìm kiếm: Không tìm thấy";
                else lblten.Text = "Kết quả tìm kiếm: " + gvDDH.Rows.Count;
            }
            else if (Request.QueryString["tim_madon"] != null)
            {
                int madon = int.Parse(Request.QueryString["tim_madon"].ToString());
                string sql = "SELECT *, case when TinhTrang=0 then N'Chưa giao' when TinhTrang=1 then N'Đã giao' else N'Đã hủy' end as TrangThai from DonDatHang where MaDH=" + madon +"  order by NgayDH desc";
                DataTable dt = kn.GetData(sql);
                gvDDH.DataSource = dt;
                gvDDH.DataBind();
                if (gvDDH.Rows.Count == 0)
                    lblten.Text = "Kết quả tìm kiếm: Không tìm thấy";
                else lblten.Text = "Kết quả tìm kiếm: " + gvDDH.Rows.Count;
            }
            else if (Request.QueryString["tim_sdt"] != null)
            {
                string sdt = Request.QueryString["tim_sdt"].ToString();
                string sql = "SELECT *, case when TinhTrang=0 then N'Chưa giao' when TinhTrang=1 then N'Đã giao' else N'Đã hủy' end as TrangThai from DonDatHang where SDT='" + sdt + "'  order by NgayDH desc";
                DataTable dt = kn.GetData(sql);
                gvDDH.DataSource = dt;
                gvDDH.DataBind();
                if (gvDDH.Rows.Count == 0)
                    lblten.Text = "Kết quả tìm kiếm: Không tìm thấy";
                else lblten.Text = "Kết quả tìm kiếm: " + gvDDH.Rows.Count;
            }
            else
            {
                lblten.Text = "Danh Sách Đơn Đặt Hàng";
                string sql = "select *, case when TinhTrang=0 then N'Chưa giao' when TinhTrang=1 then N'Đã giao' else N'Đã hủy' end TrangThai from DonDatHang";
                DataTable dt = kn.GetData(sql);
                gvDDH.DataSource = dt;
                gvDDH.DataBind();
                gvCTDH.Visible = false;
            }
        }
    }

    protected void btnxacnhan_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["madh"] != null)
        {
            int madh = int.Parse(Request.QueryString["madh"].ToString());
            string sql = "update DonDatHang set TinhTrang=1 where MaDH=" + madh;
            try
            {
                kn.Execute(sql);
                Response.Redirect("dondathang.aspx");
            }
            catch
            {

            }
        }
    }

    protected void gvDDH_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDDH.PageIndex = e.NewPageIndex;
        lblten.Text = "Danh Sách Đơn Đặt Hàng";
        string sql = "select *, case when TinhTrang=0 then N'Chưa giao' when TinhTrang=1 then N'Đã giao' else N'Đã hủy' end TrangThai from DonDatHang";
        DataTable dt = kn.GetData(sql);
        gvDDH.DataSource = dt;
        gvDDH.DataBind();
        gvCTDH.Visible = false;
    }
}