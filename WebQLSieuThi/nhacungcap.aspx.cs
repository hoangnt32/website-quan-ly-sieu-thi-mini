using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class nhacungcap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ten"] == null)
                Response.Redirect("dangnhap.aspx");
            else
                LoadNCC();
            if (Request.QueryString["id"] != null)
            {
                int mancc = int.Parse(Request.QueryString["id"].ToString());
                string s = "delete from NhaCungCap where MaNCC=" + mancc;
                try
                {
                    kn.Execute(s);
                    Response.Write("<script> alert('Xóa nhà cung cấp thành công.');window.location='nhacungcap.aspx'; </script>");
                }
                catch
                {
                    Response.Write("<script> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
                }
            }
        }
    }
    CSDL kn = new CSDL();
    protected void LoadNCC()
    {
        gvNhaCC.DataSource = kn.GetData("select * from NhaCungCap");
        gvNhaCC.DataBind();
    }

    public static bool IsValidPhone(string value)
    {
        string pattern = @"^0\d{9}$";
        return Regex.IsMatch(value, pattern);
    }
    protected void btnLuu_Click(object sender, EventArgs e)
    {
        if(IsValidPhone(txtsdt.Text.Trim()))
            try
            {
                SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Proc_ThemNCC";
                cmd.Parameters.Add("@TenNCC", SqlDbType.NVarChar, 50).Value = txttenncc.Text.Trim();
                cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = txtdiachi.Text.Trim();
                cmd.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = txtsdt.Text.Trim();
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script type='text/javascript'>alert('Thêm nhà cung cấp thành công');window.location='nhacungcap.aspx';</script>");
            }
            catch
            {
                Response.Write("<script type='text/javascript'> alert('Đã xảy ra lỗi. Vui lòng kiểm tra lại.') </script>");
            }
        else
        {
            Response.Write("<script type='text/javascript'> alert('Số điện thoại không hợp lệ. Vui lòng kiểm tra lại.') </script>");
        }
    }


    protected void gvNhaCC_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvNhaCC.EditIndex = -1;
        LoadNCC();
    }

    protected void gvNhaCC_RowDeleted(object sender, GridViewDeletedEventArgs e)
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

    protected void gvNhaCC_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvNhaCC.EditIndex = e.NewEditIndex;
        LoadNCC();
    }

    protected void gvNhaCC_RowUpdated(object sender, GridViewUpdatedEventArgs e)
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

    protected void gvNhaCC_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int makh = int.Parse(gvNhaCC.DataKeys[e.RowIndex].Value.ToString());
        string tenncc = (gvNhaCC.Rows[e.RowIndex].Cells[1].Controls[0] as TextBox).Text;
        string diachi = (gvNhaCC.Rows[e.RowIndex].Cells[2].Controls[0] as TextBox).Text;
        string sdt = (gvNhaCC.Rows[e.RowIndex].Cells[3].FindControl("txtsodt") as TextBox).Text;
        try
        {
            if (tenncc == "")
                Response.Write("<script> alert('Tên không được rỗng.') </script>");
            else if (diachi == "")
                Response.Write("<script> alert('Địa chỉ không được rỗng.') </script>");
            else if (sdt == "")
                Response.Write("<script> alert('Số điện thoại không được rỗng.') </script>");
            else if(IsValidPhone(sdt))
            {
                lbltb.Text = "";
                SqlConnection con = new SqlConnection(kn.chuoiketnoi);
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.Connection = con;
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = "Proc_CapNhatNCC";
                cmd.Parameters.Add("@MaNCC", SqlDbType.Int).Value = makh;
                cmd.Parameters.Add("@TenNCC", SqlDbType.NVarChar, 50).Value = tenncc.Trim();
                cmd.Parameters.Add("@DiaChi", SqlDbType.NVarChar, 200).Value = diachi.Trim();
                cmd.Parameters.Add("@SDT", SqlDbType.VarChar, 10).Value = sdt.Trim();
                cmd.ExecuteNonQuery();
                con.Close();
                gvNhaCC.EditIndex = -1;
                LoadNCC();
            }
            else
                Response.Write("<script> alert('Số điện thoại không hợp lệ. Vui lòng kiểm tra lại.') </script>");

        }
        catch
        {
            lbltb.Text = "Đã xảy ra lỗi. Vui lòng kiểm tra lại.";
        }
    }

    protected void gvNhaCC_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNhaCC.PageIndex = e.NewPageIndex;
        LoadNCC();
    }
}