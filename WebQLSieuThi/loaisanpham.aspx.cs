using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class loaisanpham : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ten"] == null)
                Response.Redirect("dangnhap.aspx");
        }
    }

    protected void gvLoaiSP_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            try
            {
                LinkButton btnX = (LinkButton)e.Row.FindControl("btnXoa");
                btnX.Attributes.Add("onclick", "return confirm('Bạn chắc chắn muốn xóa tất cả dữ liệu của loại sản phẩm có mã= " + DataBinder.Eval(e.Row.DataItem, "MaLoai") + " ?');");

            }
            catch
            {
                Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }


        }
    }

    protected void gvLoaiSP_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        lbltb.Text = "";
        gvLoaiSP.EditIndex = -1;
    }

    protected void gvLoaiSP_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

    protected void gvLoaiSP_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLoaiSP.EditIndex = e.NewEditIndex;
    }
    CSDL kn = new CSDL();
    protected void gvLoaiSP_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int maloai = int.Parse(gvLoaiSP.DataKeys[e.RowIndex].Value.ToString());
        string tenloai = (gvLoaiSP.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        try
        {
            if (tenloai == "")
                Response.Write("<script> alert('Tên không được rỗng.') </script>");
            else
            {
                lbltb.Text = "";
                SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Proc_CapNhatLoaiSP";
                cmd.Parameters.Add("@MaLoai", SqlDbType.Int).Value = maloai;
                cmd.Parameters.Add("@TenLoai", SqlDbType.NVarChar, 50).Value = tenloai.Trim();
                cmd.ExecuteNonQuery();
                con.Close();
                gvLoaiSP.EditIndex = -1;
            }

        }
        catch
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
    }

    protected void gvLoaiSP_RowUpdated(object sender, GridViewUpdatedEventArgs e)
    {
        if (e.Exception != null)
        {
            e.KeepInEditMode = true;
            e.ExceptionHandled = true;
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
        else
            lbltb.Text = "";
    }

    protected void btnLuu_Click(object sender, EventArgs e)
    {
        try
        {
            SqlConnection con = new SqlConnection(kn.chuoiketnoi);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "Proc_ThemLoaiSP";
            cmd.Parameters.Add("@TenLoai", SqlDbType.NVarChar, 50).Value = txttenlsp.Text.Trim();
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script type='text/javascript'>alert('Thêm loại sản phẩm thành công');window.location='loaisanpham.aspx';</script>");
        }
        catch
        {
            Response.Write("<script type='text/javascript'> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
        }
    }
}