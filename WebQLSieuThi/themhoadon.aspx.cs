using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class themhoadon : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            if (Session["manvien"] != null)
            {
                txtmanv.Text = Session["manvien"].ToString();
                LoadCmb("select MaSP,TenSP from SanPham", "TenSP", "MaSP", cmbmasp, "--- Sản phẩm ---");
                if (Request.QueryString["sp"] != null)
                {
                    try
                    {
                        int masp = int.Parse(Request.QueryString["sp"].ToString());
                        string sql = "select TenSP,GiaBan,KhuyenMai from SanPham where MaSP=" + masp;
                        DataTable dt1 = kn.GetData(sql);
                        string tensp = dt1.Rows[0][0].ToString();
                        float dongia = float.Parse(dt1.Rows[0][1].ToString());
                        int soluong = int.Parse(Session["soluong"].ToString());
                        float khuyenmai = float.Parse(dt1.Rows[0][2].ToString());
                        ThemCTHD(masp, tensp, dongia, soluong,khuyenmai);
                    }
                    catch
                    {
                        Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                    }
                    Session["soluong"] = 0;
                }
                if (Session["cthd"] != null)
                {
                    float tongtien = 0;
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["cthd"];
                    foreach (DataRow row in dt.Rows)
                    {
                        row["ThanhTien"] = int.Parse(row["SoLuong"].ToString()) * float.Parse(row["DonGia"].ToString())*(1-(float.Parse(row["KhuyenMai"].ToString())/100));
                        tongtien += float.Parse(row["ThanhTien"].ToString());
                        lblthanhtien.Text = String.Format("{0:#,##0}", tongtien) + " đồng";
                    }
                    gvCTHD.DataSource = dt;
                    gvCTHD.DataBind();
                    txtmakh.Enabled = false;
                    txttenkh.Enabled = false;
                    txttenkh.Text = Session["tenkh"].ToString();
                    txtmakh.Text = Session["sdt"].ToString();
                    btnHuy.Visible = true;
                    btnLuu.Visible = true;
                    lbltc.Visible = true;
                    lblthanhtien.Visible = true;
                    btncapnhat.Visible = true;
                }
                else
                {
                    Session["soluong"] = null;
                    Session["sdt"] = null;
                    Session["tenkh"] = null;
                    btnHuy.Visible = false;
                    btnLuu.Visible = false;
                    lbltc.Visible = false;
                    lblthanhtien.Visible = false;
                    btncapnhat.Visible = false;
                }

            }
            else
                Response.Redirect("dangnhap.aspx");

        }
       
       
    }
    public static bool IsValidPhone(string value)
    {
        string pattern = @"^0\d{9}$";
        return Regex.IsMatch(value, pattern);
    }
    private void ThemCTHD(int masp, string tensp, float dongia, int soluong, float khuyenmai)
    {
        DataTable dt =new DataTable();
        int slton = 0;
        string ktrsl = "Select SoLuongNhap-SoLuongBan as SLT from R_TonKho where MaSP=" + masp;
        DataTable ktsl = kn.GetData(ktrsl);
        if (ktsl.Rows.Count > 0)
            slton = int.Parse(ktsl.Rows[0][0].ToString());
        if (Session["cthd"] == null)
        {
            if (slton > 0)
            {
                dt.Columns.Add("MaSP");
                dt.Columns.Add("TenSP");
                dt.Columns.Add("DonGia");
                dt.Columns.Add("SoLuong");
                dt.Columns.Add("KhuyenMai");
                dt.Columns.Add("ThanhTien");
                txtmakh.Enabled = true;
                txttenkh.Enabled = true;
            }
            else
                Response.Write("<script type='text/javascript'>alert('Sản phẩm đã tạm thời hết hàng. Xin Quý khách vui lòng chọn sản phẩm khác.');</script>");
        }
        else
            dt = (DataTable)Session["cthd"];
        int dong = SPDaCo(masp, dt);
        if (dong != -1)
        {
            if (Convert.ToInt32(dt.Rows[dong]["SoLuong"].ToString()) < slton)
                dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + soluong;
            else
                Response.Write("<script type='text/javascript'>alert('Số lượng mua vượt quá số lượng còn (hiện còn "+slton+").');</script>");

        }
        else
        {
            if (slton > 0)
                if (slton >= soluong)
                {
                    DataRow dr = dt.NewRow();
                    dr["MaSP"] = masp;
                    dr["TenSP"] = tensp;
                    dr["DonGia"] = dongia;
                    dr["SoLuong"] = soluong;
                    dr["KhuyenMai"] = khuyenmai;
                    dr["ThanhTien"] = dongia * soluong * (1 - khuyenmai / 100);
                    dt.Rows.Add(dr);
                }
                else
                    Response.Write("<script type='text/javascript'>alert('Số lượng mua vượt quá số lượng còn (hiện còn " + slton + ").');</script>");
            else
                Response.Write("<script type='text/javascript'>alert('Sản phẩm đã tạm thời hết hàng. Xin Quý khách vui lòng chọn sản phẩm khác.');</script>");
        }
        Session["cthd"] = dt;
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

    protected void txtmakh_Load(object sender, EventArgs e)
    {
        
    }
    CSDL kn = new CSDL();
    protected void txtmakh_TextChanged(object sender, EventArgs e)
    {
        string sql = "select TenKH from KhachHang where SDT='" + txtmakh.Text + "'";
        DataTable dt = kn.GetData(sql);
        if (dt.Rows.Count > 0)
        {
            txttenkh.Text = dt.Rows[0][0].ToString();
            Session["sdt"] = txtmakh.Text;
            Session["tenkh"] = txttenkh.Text;
        }
        else
        {
            txttenkh.Text = "";
            
        }
    }

  
    protected void btnGhi_Click(object sender, EventArgs e)
    {
       if (IsValidPhone(txtmakh.Text.Trim()))
         if (int.Parse(txtsoluong.Text) <= 0)
                Response.Write("<script> alert('Số lượng phải lớn hơn 0.') </script>");
        else
        {
            Session["soluong"] = int.Parse(txtsoluong.Text);
            Session["tenkh"] = txttenkh.Text;
            Session["sdt"] = txtmakh.Text;
            Response.Redirect("themhoadon.aspx?sp=" + int.Parse(cmbmasp.SelectedValue.ToString()));
        }
       else
           Response.Write("<script> alert('Số điện thoại không hợp lệ.') </script>");

    }

    protected void gvCTHD_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Xoa")
        {
            int index = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["cthd"];
                dt.Rows.RemoveAt(index);
                Session["cthd"] = dt;
                if (dt.Rows.Count == 0)
                {
                    Session["cthd"] = null;
                }
                Response.Redirect("~/themhoadon.aspx");



            }
            catch
            {
                Response.Redirect("~/themhoadon.aspx");
            }
        }
    }

    protected void btnHuy_Click(object sender, EventArgs e)
    {
        Session["cthd"] = null;
        Response.Redirect("~/themhoadon.aspx");
    }
    protected void LoadCmb(string sql, string textfield, string valuefield, DropDownList cmb, string name)
    {
        DataTable dt = kn.GetData(sql);
        DataTable dt1 = new DataTable();
        dt1.Columns.Add(valuefield);
        dt1.Columns.Add(textfield);
        DataRow dr = dt1.NewRow();
        dr[valuefield] = 0;
        dr[textfield] = name;
        dt1.Rows.Add(dr);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow dr1 = dt.Rows[i];
            dt1.ImportRow(dr1);
        }

        cmb.DataSource = dt1;
        cmb.DataTextField = textfield;
        cmb.DataValueField = valuefield;
        cmb.DataBind();
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if (Session["cthd"] != null)
        {
            string sql = "select MaKH from KhachHang where SDT='" + Session["sdt"].ToString() + "'";
            DataTable dt;
            dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                int makh= int.Parse(dt.Rows[0][0].ToString()); 
                try
                {
                    kn.Execute("update KhachHang set TenKH=N'" + Session["tenkh"].ToString().Trim() + "' where MaKH=" + makh);
                    themHD_CTHD(dt);
                    string sqlHD = "select Max(MaHD) from R_HoaDon where SDT='" + Session["sdt"].ToString() + "'";
                    dt = kn.GetData(sqlHD);
                    if (dt.Rows.Count > 0)
                    {
                        gvCTHD.Visible = false;
                        btnHuy.Visible = false;
                        btncapnhat.Visible = false;
                        btnLuu.Visible = false;
                        lbltc.Visible = false;
                        lblthanhtien.Visible = false;
                        txtmakh.Enabled = true;
                        txttenkh.Enabled = true;
                        txttenkh.Text = "";
                        txtmakh.Text = "";
                        Redirect rd = new Redirect();
                        //     rd.ChuyenTrang("themhoadon.aspx", "", "");
                        rd.ChuyenTrang("inhoadon.aspx?xuathd=" + int.Parse(dt.Rows[0][0].ToString()), "_blank", "");
                    }


                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
            }
            else
            {
                try
                {
                    SqlConnection conKH = new SqlConnection(kn.chuoiketnoi);
                    conKH.Open();
                    SqlCommand cmdKH = new SqlCommand();
                    cmdKH.Connection = conKH;
                    cmdKH.CommandType = CommandType.StoredProcedure;
                    cmdKH.CommandText = "Proc_ThemKH";
                    cmdKH.Parameters.Add("@TenKH", SqlDbType.NVarChar, 50).Value = Session["tenkh"].ToString().Trim();
                    cmdKH.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = Session["sdt"].ToString().Trim();
                    cmdKH.Parameters.Add("@Email", SqlDbType.VarChar, 100).Value = "";
                    cmdKH.ExecuteNonQuery();
                    conKH.Close();
                    dt = kn.GetData(sql);
                    themHD_CTHD(dt);
                    string sqlHD = "select Max(MaHD) from R_HoaDon where SDT='" + Session["sdt"].ToString() + "'";
                    dt = kn.GetData(sqlHD);
                    if (dt.Rows.Count > 0)
                    {
                        Redirect rd = new Redirect();
                        //  rd.ChuyenTrang("themhoadon.aspx", "", "");
                        rd.ChuyenTrang("inhoadon.aspx?xuathd=" + int.Parse(dt.Rows[0][0].ToString()), "_blank", "");
                       
                    }
                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }

            }

        }
        else
            Response.Redirect("themhoadon.aspx");
        Session["cthd"] = null;
    }
    public void themHD_CTHD(DataTable dt)
    {
        if (Request.QueryString["xuathd"] == null)
        {
            float tongtien = 0;
            DataTable dtTT = new DataTable();
            dtTT = (DataTable)Session["cthd"];
            foreach (DataRow row in dtTT.Rows)
            {
                row["ThanhTien"] = int.Parse(row["SoLuong"].ToString()) * float.Parse(row["DonGia"].ToString()) * (1 - (float.Parse(row["KhuyenMai"].ToString()) / 100));
                tongtien += float.Parse(row["ThanhTien"].ToString());
            }
            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ThemHD";
            cmd.Parameters.Add("@manv", SqlDbType.Int).Value = int.Parse(Session["manvien"].ToString().Trim());
            cmd.Parameters.Add("@makh", SqlDbType.Int).Value = int.Parse(dt.Rows[0][0].ToString());
            cmd.Parameters.Add("@ngayban", SqlDbType.DateTime).Value = DateTime.Now;
            cmd.ExecuteNonQuery();
            con.Close();
            string s = "select max(MaHD) from HoaDon where MaKH=" + int.Parse(dt.Rows[0][0].ToString());
            int mahd = int.Parse(kn.GetData(s).Rows[0][0].ToString());
            DataTable dtHD = new DataTable();
            dtHD = (DataTable)Session["cthd"];
            int masp, soluong;
            float dongia;
            string ghichu, khuyenmai;
            for (int i = 0; i < dtHD.Rows.Count; i++)
            {
                masp = int.Parse(dtHD.Rows[i]["MaSP"].ToString());
                soluong = int.Parse(dtHD.Rows[i]["SoLuong"].ToString());
                dongia = float.Parse(dtHD.Rows[i]["DonGia"].ToString());
                khuyenmai = dtHD.Rows[i]["KhuyenMai"].ToString();
                ghichu = khuyenmai == "0" ? "" : "Giảm " + khuyenmai + "%";
                con.Open();
                cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Proc_ThemCTHD";
                cmd.Parameters.Add("@mahd", SqlDbType.Int).Value = mahd;
                cmd.Parameters.Add("@masp", SqlDbType.Int).Value = masp;
                cmd.Parameters.Add("@soluong", SqlDbType.Int).Value = soluong;
                cmd.Parameters.Add("@dongia", SqlDbType.Float).Value = dongia;
                cmd.Parameters.Add("@ghichu", SqlDbType.NVarChar, 1000).Value = ghichu;
                cmd.ExecuteNonQuery();
                con.Close();

            }
            Session["cthd"] = null;
            //      Response.Redirect("themhoadon.aspx");
        }
    }

    protected void btncapnhat_Click(object sender, EventArgs e)
    {
        if (Session["cthd"] != null)
        {
            int soluongton = 0;
            DataTable dt = (DataTable)Session["cthd"];
            foreach (GridViewRow r in gvCTHD.Rows)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToString(gvCTHD.DataKeys[r.DataItemIndex].Value) == dr["MaSP"].ToString())
                    {
                        string ktrsoluong = "Select SoLuongNhap-SoLuongBan as SLT from R_TonKho where TenSP= (select TenSP from SanPham where MaSP=" + Convert.ToInt32(dr["MaSP"].ToString()) + ")";
                        DataTable ktsl = kn.GetData(ktrsoluong);
                        if (ktsl.Rows.Count > 0)
                            soluongton = int.Parse(ktsl.Rows[0][0].ToString());
                        TextBox sl = (TextBox)r.Cells[3].FindControl("txtsoluong");
                        if (sl.Text == "")
                            Response.Write("<script type='text/javascript'>alert('Vui lòng nhập số lượng'); window.location='themhoadon.aspx';</script>");
                        else if (Convert.ToInt32(sl.Text) <= 0)
                        {
                            Response.Write("<script> alert('Số lượng phải lớn hơn 0.');window.location='themhoadon.aspx'; </script>");
                        }
                        else if (Convert.ToInt32(sl.Text) > soluongton)
                        {
                            Response.Write("<script type='text/javascript'>alert('Cập nhật thất bại. Số lượng mua vượt quá số lượng còn (hiện còn " + soluongton.ToString() + ") '); window.location='themhoadon.aspx';</script>");
                        }
                        else
                            dr["SoLuong"] = sl.Text;
                        break;

                    }
                }
            }
            Session["cthd"] = dt;
            Response.Write("<script> alert('Cập nhật thành công.');window.location='themhoadon.aspx'; </script>");
        }
    

    }

    protected void btnLuu_Load(object sender, EventArgs e)
    {
        
    }
}