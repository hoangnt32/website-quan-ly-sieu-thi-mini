using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class themphieunhap : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["manvien"] != null)
            {
                txtmanv.Text = Session["manvien"].ToString();
                txtngnhap.Text = String.Format("{0:dd/MM/yyyy HH:mm:ss}", DateTime.Now);
                LoadCmb("select MaSP,TenSP from SanPham", "TenSP", "MaSP", cmbmasp, "--- Sản phẩm ---");
                if (Request.QueryString["sp"] != null)
                {
                    try
                    {
                        int masp = int.Parse(Request.QueryString["sp"].ToString());
                        string sql = "select TenSP from SanPham where MaSP=" + masp;
                        DataTable dt1 = kn.GetData(sql);
                        string tensp = dt1.Rows[0][0].ToString();
                        float dongia = float.Parse(Session["dongia"].ToString());
                        int soluong = int.Parse(Session["soluong"].ToString());
                        string ghichu = Session["ghichu"].ToString();
                        ThemCTPN(masp, tensp, dongia, soluong,ghichu);
                    }
                    catch
                    {
                        Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                    }
                    Session["soluong"] = 0;
                    Session["dongia"] = 0;
                }
                if (Session["ctpn"] != null)
                {
                    float tongtien = 0;
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["ctpn"];
                    foreach (DataRow row in dt.Rows)
                    {
                        row["ThanhTien"] = float.Parse(row["SoLuong"].ToString()) * float.Parse(row["DonGia"].ToString());
                        tongtien += float.Parse(row["ThanhTien"].ToString());
                        lblthanhtien.Text = String.Format("{0:#,##0}", tongtien) + " đồng";
                    }
                    gvCTPN.DataSource = dt;
                    gvCTPN.DataBind();
                    btnHuy.Visible = true;
                    btninphieu.Visible = true;
                    lbltc.Visible = true;
                    lblthanhtien.Visible = true;
                    btncapnhat.Visible = true;
                }
                else
                {
                    Session["soluong"] = null;
                    Session["ghichu"] = null;
                    Session["dongia"] = null;
                    btnHuy.Visible = false;
                    btninphieu.Visible = false;
                    lbltc.Visible = false;
                    lblthanhtien.Visible = false;
                    btncapnhat.Visible = false;
                }

            }
            else
                Response.Redirect("dangnhap.aspx");

        }
    }
    private void ThemCTPN(int masp, string tensp, float dongia, int soluong, string ghichu)
    {
        DataTable dt;
        if (Session["ctpn"] == null)
        {
            dt = new DataTable();
            dt.Columns.Add("MaSP");
            dt.Columns.Add("TenSP");
            dt.Columns.Add("DonGia");
            dt.Columns.Add("SoLuong");
            dt.Columns.Add("ThanhTien");
            dt.Columns.Add("GhiChu");
        }
        else
            dt = (DataTable)Session["ctpn"];
        int dong = SPDaCo(masp, dt);
        if (dong != -1)
        {
            dt.Rows[dong]["SoLuong"] = Convert.ToInt32(dt.Rows[dong]["SoLuong"]) + soluong;
        }
        else
        {
            DataRow dr = dt.NewRow();
            dr["MaSP"] = masp;
            dr["TenSP"] = tensp;
            dr["DonGia"] = dongia;
            dr["SoLuong"] = soluong;
            dr["ThanhTien"] = dongia * soluong;
            dr["GhiChu"]=ghichu;
            dt.Rows.Add(dr);
        }
        Session["ctpn"] = dt;
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


    protected void btnGhi_Click(object sender, EventArgs e)
    {
        if (int.Parse(txtsoluong.Text) <= 0)
            Response.Write("<script> alert('Số lượng phải lớn hơn 0.') </script>");
        else
        if (float.Parse(txtdongia.Text) <= 0)
            Response.Write("<script> alert('Đơn giá phải lớn hơn 0.') </script>");
        else
        {
            string sql = "select GiaBan from SanPham where MaSP=" + int.Parse(cmbmasp.SelectedValue);
            DataTable dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                float giaban = float.Parse(dt.Rows[0][0].ToString());
                if (float.Parse(txtdongia.Text) > giaban)
                    Response.Write("<script> alert('Sản phẩm có giá bán là " + String.Format("{0:#,##0}", giaban) + " VND. Đơn giá nhập phải nhỏ hơn đơn giá bán.') </script>");
                else
                {
                    Session["soluong"] = int.Parse(txtsoluong.Text);
                    Session["dongia"] = int.Parse(txtdongia.Text);
                    Session["ghichu"] = txtghichu.Text;
                    Response.Redirect("themphieunhap.aspx?sp=" + int.Parse(cmbmasp.SelectedValue.ToString()));
                }
            }
            else
                Response.Write("<script> alert('Vui lòng chọn sản phẩm.') </script>");

        }
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
    protected void btncapnhat_Click(object sender, EventArgs e)
    {
        if (Session["ctpn"] != null)
        {
            DataTable dt = (DataTable)Session["ctpn"];
            foreach (GridViewRow r in gvCTPN.Rows)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToString(gvCTPN.DataKeys[r.DataItemIndex].Value) == dr["MaSP"].ToString())
                    {
                        TextBox sl = (TextBox)r.Cells[3].FindControl("txtsoluong");
                        if(sl.Text=="")
                            Response.Write("<script> alert('Số lượng không được rỗng.');window.location='themphieunhap.aspx'; </script>");
                        else
                        if (Convert.ToInt32(sl.Text) <= 0)
                        {
                            Response.Write("<script> alert('Số lượng phải lớn hơn 0.');window.location='themphieunhap.aspx'; </script>");
                        }
                        else
                            dr["SoLuong"] = sl.Text;
                        break;

                    }
                }
            }
            Session["ctpn"] = dt;
            Response.Write("<script> alert('Cập nhật thành công.');window.location='themphieunhap.aspx'; </script>");
        }


    }

    protected void btnHuy_Click(object sender, EventArgs e)
    {
        Session["ctpn"] = null;
        Response.Redirect("~/themphieunhap.aspx");
    }

    protected void btninphieu_Click(object sender, EventArgs e)
    {
        if (Session["ctpn"] != null)
        {
            string sql = "select MaNV from NhanVien where MaNV=" + int.Parse(Session["manvien"].ToString());
            DataTable dt;
            dt = kn.GetData(sql);
            if (dt.Rows.Count > 0)
            {
                try
                {
                    themPN_CTPN(dt);
                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
            }
            else
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
        else
            Response.Redirect("themphieunhap.aspx");
    }
    public void themPN_CTPN(DataTable dt)
    {
        if (Request.QueryString["xuatpn"] == null)
        {
            float tongtien = 0;
            DataTable dtTT = new DataTable();
            dtTT = (DataTable)Session["ctpn"];
            foreach (DataRow row in dtTT.Rows)
            {
                row["ThanhTien"] = float.Parse(row["SoLuong"].ToString()) * float.Parse(row["DonGia"].ToString());
                tongtien += float.Parse(row["ThanhTien"].ToString());
            }
            int manv = int.Parse(Session["manvien"].ToString().Trim());
            float trigia = tongtien;
            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = @"insert into PhieuNhap values(" + manv + ",@ngaynhap,0)";
            cmd.Parameters.Add("@ngaynhap", SqlDbType.DateTime);
            cmd.Parameters["@ngaynhap"].Value = DateTime.Now;
            cmd.ExecuteNonQuery();
            con.Close();
            string s = "select max(MaPhieu) from PhieuNhap where MaNV=" + int.Parse(dt.Rows[0][0].ToString());
            int mapn = int.Parse(kn.GetData(s).Rows[0][0].ToString());
            DataTable dtPN = new DataTable();
            dtPN = (DataTable)Session["ctpn"];
            int masp, soluong;
            float dongia;
            string ghichu;
            for (int i = 0; i < dtPN.Rows.Count; i++)
            {
                masp = int.Parse(dtPN.Rows[i]["MaSP"].ToString());
                soluong = int.Parse(dtPN.Rows[i]["SoLuong"].ToString());
                dongia = float.Parse(dtPN.Rows[i]["DonGia"].ToString());
                ghichu = dtPN.Rows[i]["GhiChu"].ToString();
                kn.Execute("insert into CTPhieuNhap values (" + mapn + "," + masp + "," + soluong + "," + dongia + ",0,N'" + ghichu + "')");

            }
           
          
        }
        Session["ctpn"] = null;
        Response.Redirect("themphieunhap.aspx");
    }


    protected void gvCTPN_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Xoa")
        {
            int index = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["ctpn"];
                dt.Rows.RemoveAt(index);
                Session["ctpn"] = dt;
                if (dt.Rows.Count == 0)
                {
                    Session["ctpn"] = null;
                }
                Response.Redirect("~/themphieunhap.aspx");



            }
            catch
            {
                Response.Redirect("~/themphieunhap.aspx");
            }
        }
    }
}