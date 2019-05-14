using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sanpham : System.Web.UI.Page
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        //    if (Session["ten"] == null)
        //        Response.Redirect("dangnhap.aspx");
        //    txtkm.Text = "0";
        //    LoadCmb("select MaLoai,TenLoai from LoaiSP", "TenLoai", "MaLoai",cmbloai,"Loại sản phẩm");
        //    LoadCmb("select MaNCC,TenNCC from NhaCungCap", "TenNCC", "MaNCC", cmbncc,"Nhà cung cấp");
        }
        
    }
    protected void LoadCmb( string sql, string textfield, string valuefield, DropDownList cmb, string name)
    {
        DataTable dt = kn.GetData(sql);
        DataTable dt1 = new DataTable();
        dt1.Columns.Add(valuefield);
        dt1.Columns.Add(textfield);
        DataRow dr = dt1.NewRow();
        dr[valuefield] = 1;
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

        
    }



    protected void gvSanPham_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception != null)
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
        {
            lbltb.Text = "";
            Response.Write("<script> alert('Xóa thành công.') </script>");
        }
    }

   

    

    //protected void gvSanPham_RowUpdating(object sender, GridViewUpdateEventArgs e)
    //{
    //    int masp = int.Parse(gvSanPham.DataKeys[e.RowIndex].Value.ToString());
    //    string tensp = (gvSanPham.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
    //    string maloai = (gvSanPham.Rows[e.RowIndex].Cells[2].FindControl("cmbmaloai") as DropDownList).SelectedValue;
    //    string mancc = (gvSanPham.Rows[e.RowIndex].Cells[3].FindControl("cmbmancc") as DropDownList).SelectedValue;
    //    string dvt = (gvSanPham.Rows[e.RowIndex].Cells[4].FindControl("cmbdvt") as DropDownList).Text;
    //    string soluong = (gvSanPham.Rows[e.RowIndex].Cells[5].Controls[0] as TextBox).Text;
    //    string giaban = (gvSanPham.Rows[e.RowIndex].Cells[6].FindControl("txtgiaban") as TextBox).Text;
    //    string khuyenmai = (gvSanPham.Rows[e.RowIndex].Cells[7].FindControl("txtkm") as TextBox).Text;
      
    //    try
    //    {
    //        if (tensp == "")
    //            Response.Write("<script> alert('Tên không được rỗng.') </script>");
    //        else if (maloai == "")
    //            Response.Write("<script> alert('Loại sản phẩm không được rỗng.') </script>");
    //        else if (mancc == "")
    //            Response.Write("<script> alert('Nhà cung cấp không được rỗng.') </script>");
    //        else if (dvt == "")
    //            Response.Write("<script> alert('Đơn vị tính không được rỗng.') </script>");
    //        else if (soluong == "")
    //            Response.Write("<script> alert('Số lượng không được rỗng.') </script>");
    //        else if (giaban == "")
    //            Response.Write("<script> alert('Giá bán không được rỗng.') </script>");
    //        else if (khuyenmai == "")
    //            Response.Write("<script> alert('Khuyến mãi không được rỗng.') </script>");
    //        else
    //        {
    //            lbltb.Text = "";
    //            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
    //            con.Open();
    //            SqlCommand cmd = new SqlCommand();
    //            cmd.Connection = con;
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            cmd.CommandText = "Proc_CapNhatSP";
    //            cmd.Parameters.Add("@MaSP", SqlDbType.Int).Value = masp;
    //            cmd.Parameters.Add("@TenSP", SqlDbType.NVarChar, 50).Value = tensp.Trim();
    //            cmd.Parameters.Add("@MaLoai", SqlDbType.Int).Value = int.Parse(maloai.Trim());
    //            cmd.Parameters.Add("@MaNCC", SqlDbType.Int).Value = int.Parse(mancc.Trim());
    //            cmd.Parameters.Add("@DVT", SqlDbType.NVarChar, 10).Value = dvt.Trim();
    //            cmd.Parameters.Add("@HinhAnh", SqlDbType.VarChar,100).Value = soluong.Trim();
    //            cmd.Parameters.Add("@GiaBan", SqlDbType.Float).Value = Convert.ToDecimal(giaban);
    //            cmd.Parameters.Add("@KhuyenMai", SqlDbType.Int).Value = Convert.ToInt32(khuyenmai);
    //            cmd.ExecuteNonQuery();
    //            con.Close();
    //            gvSanPham.EditIndex = -1;
    //        }

    //    }
    //    catch
    //    {
    //       lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
    //    }

    //}

    //protected void gvSanPham_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    //{
    //    gvSanPham.EditIndex = -1;
    //}

    protected void gvSanPham_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của sản phẩm có mã= " + DataBinder.Eval(e.Row.DataItem, "MaSP") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }


        }
    }
}