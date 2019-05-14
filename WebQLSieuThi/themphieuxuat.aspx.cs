using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class themphieuxuat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["tendn"] != null)
            {
                txtmanv.Text = Session["tendn"].ToString();
                txtngnhap.Text = String.Format("{0:dd/MM/yyyy HH:mm:ss}", DateTime.Now);
                LoadCmb("select MaSP,TenSP from SanPham", "TenSP", "MaSP", cmbmasp, "--- Sản phẩm ---");
                if (Request.QueryString["sp"] != null)
                {
                    try
                    {
                        int masp = int.Parse(Request.QueryString["sp"].ToString());
                        string sql = "select TenSP,GiaNhap from CTPhieuNhap ct,SanPham sp" +
                            " where sp.MaSP=ct.MaSP and ct.MaSP=" + masp + " and MaPhieu=" +
                                    "(select Max(MaPhieu) from CTPhieuNhap)";
                        DataTable dt1 = kn.GetData(sql);
                        string tensp = dt1.Rows[0][0].ToString();
                        float dongia = float.Parse(dt1.Rows[0][1].ToString());
                        int soluong = int.Parse(Session["soluong"].ToString());
                        string ghichu = Session["ghichu"].ToString();
                        ThemCTPX(masp, tensp, dongia, soluong, ghichu);
                    }
                    catch
                    {
                        Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                    }
                    Session["soluong"] = 0;
                    
                }
                if (Session["ctpx"] != null)
                {
                    float tongtien = 0;
                    DataTable dt = new DataTable();
                    dt = (DataTable)Session["ctpx"];
                    foreach (DataRow row in dt.Rows)
                    {
                        row["ThanhTien"] = float.Parse(row["SoLuong"].ToString()) * float.Parse(row["DonGia"].ToString());
                        tongtien += float.Parse(row["ThanhTien"].ToString());
                        lblthanhtien.Text = String.Format("{0:0,0}", tongtien) + " đồng";
                    }
                    gvCTPX.DataSource = dt;
                    gvCTPX.DataBind();
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
    private void ThemCTPX(int masp, string tensp, float dongia, int soluong, string ghichu)
    {
        DataTable dt;
        if (Session["ctpx"] == null)
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
            dt = (DataTable)Session["ctpx"];
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
            dr["GhiChu"] = ghichu;
            dt.Rows.Add(dr);
        }
        Session["ctpx"] = dt;
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
        if (txtsoluong.Text == "")
        {
            Response.Write("<script> alert('Số lượng phải lớn hơn 0.') </script>");
           
        }
        else
        if (int.Parse(txtsoluong.Text) <= 0)
            Response.Write("<script> alert('Số lượng phải lớn hơn 0.') </script>");
        else
        {
            Session["soluong"] = int.Parse(txtsoluong.Text);
            Session["ghichu"] = txtghichu.Text;
            Response.Redirect("themphieuxuat.aspx?sp=" + int.Parse(cmbmasp.SelectedValue.ToString()));
        }

    }
    CSDL kn =new CSDL();
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
        if (Session["ctpx"] != null)
        {
            DataTable dt = (DataTable)Session["ctpx"];
            foreach (GridViewRow r in gvCTPX.Rows)
            {
                foreach (DataRow dr in dt.Rows)
                {
                    if (Convert.ToString(gvCTPX.DataKeys[r.DataItemIndex].Value) == dr["MaSP"].ToString())
                    {
                        TextBox sl = (TextBox)r.Cells[3].FindControl("txtsoluong");

                        if (Convert.ToInt32(sl.Text) <= 0)
                        {
                            Response.Write("<script> alert('Số lượng phải lớn hơn 0.');window.location='themphieuxuat.aspx'; </script>");
                        }
                        else
                            dr["SoLuong"] = sl.Text;
                        break;

                    }
                }
            }
            Session["ctpx"] = dt;
            Response.Write("<script> alert('Cập nhật thành công.');window.location='themphieuxuat.aspx'; </script>");
        }


    }

    protected void btnHuy_Click(object sender, EventArgs e)
    {
        Session["ctpx"] = null;
        Response.Redirect("~/themphieuxuat.aspx");
    }

    protected void btninphieu_Click(object sender, EventArgs e)
    {
        if (Session["ctpx"] != null)
        {
            
            try
            {
                themPX_CTPX();
            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        }
        else
        {
            Response.Write("<script> alert('Vui lòng kiểm tra lại thông tin.') </script>");
        }
       
    }
    public void themPX_CTPX()
    {
        if (Request.QueryString["xuatpx"] == null)
        {
            int manv = int.Parse(Session["tendn"].ToString().Trim());
            try
            {
                SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = @"insert into PhieuXuat values(" + manv + ",@ngayxuat,0)";
                cmd.Parameters.Add("@ngayxuat", SqlDbType.DateTime);
                cmd.Parameters["@ngayxuat"].Value = DateTime.Now;
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
            try
            {
                string s = "select max(MaPhieu) from PhieuXuat where MaNV=" + manv;
                int mapx = int.Parse(kn.GetData(s).Rows[0][0].ToString());
                DataTable dtPN = new DataTable();
                dtPN = (DataTable)Session["ctpx"];
                int masp, soluong;
                string ghichu;
                for (int i = 0; i < dtPN.Rows.Count; i++)
                {
                    masp = int.Parse(dtPN.Rows[i]["MaSP"].ToString());
                    soluong = int.Parse(dtPN.Rows[i]["SoLuong"].ToString());
                    ghichu = dtPN.Rows[i]["GhiChu"].ToString();
                    kn.Execute("insert into CTPhieuXuat values (" + mapx + "," + masp + "," + soluong + ",0,N'" + ghichu + "')");

                }
            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }


        }
        Session["ctpx"] = null;
        Response.Redirect("~/themphieuxuat.aspx");
    }


    protected void gvCTPX_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Xoa")
        {
            int index = int.Parse(e.CommandArgument.ToString());
            try
            {
                DataTable dt = (DataTable)Session["ctpx"];
                dt.Rows.RemoveAt(index);
                Session["ctpx"] = dt;
                if (dt.Rows.Count == 0)
                {
                    Session["ctpx"] = null;
                }
                Response.Redirect("~/themphieuxuat.aspx");



            }
            catch
            {
                Response.Redirect("~/themphieuxuat.aspx");
            }
        }
    }
}