using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
            if (Session["ten"] != null)
            {
                lbltennd.Text = Session["ten"].ToString();
                if (Session["chucvu"] != null)
                {
                    if (Session["chucvu"].ToString() == "Nhân viên kho")
                    {
                        hldt.Visible = false;
                        hlds.Visible = false;
                        hlhd.Visible = false;
                        hlhoadon.Visible = false;
                        hlkhachhang.Visible = false;
                        hlkh.Visible = false;
                        hlnhanvien.Visible = false;
                        hlnv.Visible = false;
                        hlnguoidung.Visible = false;
                        hlnd.Visible = false;
                        hldondathang.Visible = false;
                        hlqlnd.Visible = false;
                        qlbh.Visible = false;
                        hllienhe.Visible = false;
                        hldt.Visible = false;
                        hlds.Visible = false;
                        hlthongke.Visible = false;
                        
                    }
                    if (Session["chucvu"].ToString() == "Nhân viên bán hàng")
                    {
                        
                        hltkho.Visible = false;
                        hlnhanvien.Visible = false;
                        hlnv.Visible = false;
                        hlnguoidung.Visible = false;
                        hlnd.Visible = false;
                        hltk.Visible = false;
                        hlncc.Visible = false;
                        hlnhacc.Visible = false;
                        hlphieunhap.Visible = false;
                        hlsanpham.Visible = false;
                        hlsp.Visible = false;
                        hlloaisp.Visible = false;
                        hllsp.Visible = false;
                        hlpn.Visible = false;
                        hlqlsp.Visible = false;
                        hlqlnh.Visible = false;
                        hltkho.Visible = false;
                        hltk.Visible = false;
                        hllienhe.Visible = false;

                    }
                }
            }
            else
                Response.Redirect("dangnhap.aspx");
        }
    }

    CSDL kn = new CSDL();

    protected void hldangxuat_Click(object sender, EventArgs e)
    {
        Session["ten"] = null;
        Session["manvien"] = null;
        Session["cthd"] = null;
        Response.Redirect("~/trangchu.aspx");
    }
}
