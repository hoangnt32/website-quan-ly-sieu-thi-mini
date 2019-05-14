using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BanHang_giohang : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["giohang"] == null)
        {
            lbltb.Text = "Giỏ hàng trống";
            btntieptucmua.Visible = true;
        }
        else
            lbltb.Text = "";
        if (!IsPostBack)
        {
            int masp;
            if (Request.QueryString["msp"] != null)
            {
                masp = int.Parse(Request.QueryString["msp"]);
                LayThongTinSP_ThemGio(masp);                      
            }
            if (Request.QueryString["them"] != null)
            {
                masp = int.Parse(Request.QueryString["them"]);
                LayThongTinSP_ThemGio(masp);
                Response.Write("<script type='text/javascript'>alert('Thêm giỏ hàng thành công.');window.location='chitietsanpham.aspx?maSo="+ masp+"';</script>");
            }
            if (Session["giohang"] != null)
            {
                DataTable dt = new DataTable();
                dt = (DataTable)Session["giohang"];
                float tongtien = 0;
                foreach (DataRow row in dt.Rows)
                {
                    row["ThanhTien"] = int.Parse(row["SoLuong"].ToString()) * float.Parse(row["GiaBan"].ToString()) * (1- float.Parse(row["KhuyenMai"].ToString())/100);
                    tongtien += float.Parse(row["ThanhTien"].ToString());
                    lbltongthanhtien.Text = String.Format("{0:#,##0}", double.Parse(tongtien.ToString())) + " đồng";
                }
                gvgiohang.DataSource = dt;
                gvgiohang.DataBind();
                btnmuahang.Visible = true;
                btncapnhat.Visible = true;
                btntieptucmua.Visible = true;
                btnxoa.Visible = true;
                lbltongcong.Visible = true;
                lbltongthanhtien.Visible = true;
            }

        }
    }
    private void LayThongTinSP_ThemGio(int masp)
    {
        string s = "select TenSP,HinhAnh,DVT,GiaBan,SoLuong,KhuyenMai,ThanhTien from SanPham left join CTHoaDon on  SanPham.MaSP=CTHoaDon.MaSP where SanPham.MaSP=" + masp;
        DataTable dt = kn.GetData(s);
        string tensp = dt.Rows[0][0].ToString();
        string hinh = dt.Rows[0][1].ToString();
        float dongia = float.Parse(dt.Rows[0][3].ToString());
        string dvt = dt.Rows[0][2].ToString();
        float khuyenmai = float.Parse(dt.Rows[0][5].ToString());
        int soluong = 1;
        ThemGioHang(masp, tensp, hinh, dvt, dongia, khuyenmai, soluong);
    } 
    private void ThemGioHang(int masp, string tensp, string hinh, string dvt, float dongia, float khuyenmai, int soluong)
    {
        DataTable dt = new DataTable();
        int slton = 0;
        string ktrsl = "Select SoLuongNhap-SoLuongBan as SLT from R_TonKho where TenSP= (select TenSP from SanPham where MaSP=" + masp+")";
        DataTable ktsl = kn.GetData(ktrsl);
        if (ktsl.Rows.Count>0)
            slton = int.Parse(ktsl.Rows[0][0].ToString());
        if (Session["giohang"] == null)
        {
            if (slton > 0)
            {

                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("Hinh");
                dt.Columns.Add("GiaBan");
                dt.Columns.Add("DVT");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("KhuyenMai");
                dt.Columns.Add("ThanhTien");
            }
            else
                Response.Write("<script type='text/javascript'>alert('Sản phẩm đã tạm thời hết hàng. Xin Quý khách vui lòng chọn sản phẩm khác.');</script>");
        }
        else
            dt = (DataTable)Session["giohang"];
        int dong = SPDaCo(masp, dt);
        if (dong != -1)
        {
            if (Convert.ToInt32(dt.Rows[dong]["SoLuong"].ToString()) < slton)
            {
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + soluong;
            }
            else
                Response.Write("<script type='text/javascript'>alert('Số lượng mua vượt quá số lượng còn.');window.location='giohang.aspx';</script>");

        }
        else
        {
            if (slton > 0)
            {
                DataRow dr = dt.NewRow();
                dr["MaSP"] = masp;
                dr["TenSP"] = tensp;
                dr["Hinh"] = hinh;
                dr["GiaBan"] = dongia;
                dr["DVT"] = dvt;
                dr["SoLuong"] = soluong;
                dr["KhuyenMai"] = khuyenmai;
                dr["ThanhTien"] = dongia * soluong * (1-khuyenmai/100);
                dt.Rows.Add(dr);
            }
            else
                Response.Write("<script type='text/javascript'>alert('Sản phẩm đã tạm thời hết hàng. Xin Quý khách vui lòng chọn sản phẩm khác.');</script>");
        }
        Session["giohang"] = dt;
        lbltb.Text = "";
    }

    private int SPDaCo(int masp, DataTable dt)
    {
        int dong = -1;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            if (dt.Rows[i]["MaSP"].ToString() == masp.ToString())
            {
                dong = i;
                break;
            }
        }
        return dong;
    }

    protected void btncapnhat_Click(object sender, EventArgs e)
    {
        int soluongton = 0;
        DataTable dt = (DataTable)Session["giohang"];
        foreach (GridViewRow row in gvgiohang.Rows)
        {
            foreach (DataRow dr in dt.Rows)
            {
                if (Convert.ToString(gvgiohang.DataKeys[row.DataItemIndex].Value) == dr["MaSP"].ToString())
                {
                    string ktrsoluong = "Select SoLuongNhap-SoLuongBan as SLT from R_TonKho where TenSP= (select TenSP from SanPham where MaSP=" + Convert.ToInt32(dr["MaSP"].ToString()) + ")";
                    DataTable ktsl = kn.GetData(ktrsoluong);
                    if (ktsl.Rows.Count > 0)
                        soluongton = int.Parse(ktsl.Rows[0][0].ToString());
                    TextBox txtsl = (TextBox)row.Cells[5].FindControl("txtsoluong");
                    if (txtsl.Text == "")
                        Response.Write("<script type='text/javascript'>alert('Vui lòng nhập số lượng'); window.location='giohang.aspx';</script>");
                    else if (Convert.ToInt32(txtsl.Text) > soluongton)
                    {
                        Response.Write("<script type='text/javascript'>alert('Cập nhật thất bại. Số lượng mua vượt quá số lượng còn (hiện còn " + soluongton.ToString() + ") '); window.location='giohang.aspx';</script>");
                    }
                    else if(Convert.ToInt32(txtsl.Text) <=0)
                        Response.Write("<script type='text/javascript'>alert('Số lượng phải lớn hơn 0'); window.location='giohang.aspx';</script>");
                    else
                    dr["SoLuong"] = txtsl.Text;
                    break;
                }
            }
        }
        Session["giohang"] = dt;
        Response.Write("<script type='text/javascript'>alert('Cập nhật thành công.'); window.location='giohang.aspx';</script>");
    }

    protected void btnxoa_Click(object sender, EventArgs e)
    {
        Session["giohang"] = null;
        btnmuahang.Visible = false;
        btncapnhat.Visible = false;
        btntieptucmua.Visible = false;
        btnxoa.Visible = false;
        lbltongcong.Visible = false;
        lbltongthanhtien.Visible = false;
        Response.Redirect("~/trangchu.aspx");
    }

    protected void gvgiohang_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Xoa")
        {
            int index = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["giohang"];
                dt.Rows.RemoveAt(index);
                Session["giohang"] = dt;
                if (dt.Rows.Count == 0)
                {
                    Session["giohang"] = null;
                    btnmuahang.Visible = false;
                    btncapnhat.Visible = false;
                    btntieptucmua.Visible = false;
                    btnxoa.Visible = false;
                    lbltongcong.Visible = false;
                    lbltongthanhtien.Visible = false;
                    Response.Redirect("~/trangchu.aspx");
                }
                else
                    Response.Redirect("~/sieuthi/giohang.aspx");
            }
            catch
            {
                Response.Redirect("~/sieuthi/giohang.aspx");
            }
        }
    }

    protected void btnmuahang_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/dathang.aspx");
    }
}