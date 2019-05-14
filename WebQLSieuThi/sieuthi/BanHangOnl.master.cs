using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BanHangOnl : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["tendn"] != null)
            {
                btndangxuat.Visible = true;
                hldangnhap.Visible = false;
                btndki.Visible = false;
                hldoimatkhau.Visible = true;
                lbltendn.Text = Session["tendn"].ToString();

            }
            else
            {
                btndangxuat.Visible = false;
                hldangnhap.Visible = true;
                btndki.Visible = true;
                hldoimatkhau.Visible = false;
                lbltendn.Text = "";
            }
            if (Session["giohang"] != null)
            {
                DataTable dt = (DataTable)Session["giohang"];
                lblsp.Text = dt.Rows.Count.ToString();
                float tongtien = 0;
                foreach (DataRow row in dt.Rows)
                {
                    row["ThanhTien"] = int.Parse(row["SoLuong"].ToString()) * float.Parse(row["GiaBan"].ToString()) * (1 - float.Parse(row["KhuyenMai"].ToString()) / 100);
                    tongtien += float.Parse(row["ThanhTien"].ToString());
                }
                lbltt.Text = String.Format("{0:#,##0}", float.Parse(tongtien.ToString()));
            }
        }
    }



    protected void btndki_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/dangky.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/trangchu.aspx");
    }

    protected void btngiohang_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/giohang.aspx");
    }

    protected void btndangxuat_Click(object sender, EventArgs e)
    {
        Session["tendn"] = null;
        Response.Redirect("~/trangchu.aspx");
    }



    protected void lbdonhang_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/donhang.aspx");
    }

    protected void btntim_Click(object sender, EventArgs e)
    {
        if(txttk.Text!="")
            Response.Redirect("~/sieuthi/timkiemsp.aspx?tensp="+ txttk.Text.Trim());
        else
            Response.Redirect("~/trangchu.aspx");
        
    }

    protected void lbhoso_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/hoso.aspx");
    }

    protected void lbgioithieu_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/gioithieu.aspx");
    }

    protected void lbllienhe_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/lienhe.aspx");
    }

    protected void Lbhdmh_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/huongdanmuahang.aspx");
    }

    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/sieuthi/donhuy.aspx");
    }
}
