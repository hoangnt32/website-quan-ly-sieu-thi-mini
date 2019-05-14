using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage2 : System.Web.UI.MasterPage
{
    CSDL kn = new CSDL();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["ten"] == null)
            {
                Response.Redirect("dangnhap.aspx");
            }
            else
            {
                if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nhanvien.aspx" || Request.QueryString["manv"] != null)
                {
                    txttimkiem.Attributes.Add("placeholder", "Nhập mã cần tìm...");
                    txttimkiem.Attributes.Add("type", "Number");

                }
                else if(HttpContext.Current.Request.Url.Segments[1].ToString() == "nguoidung.aspx" || Request.QueryString["tennd"] != null)
                {
                    txttimkiem.Attributes.Add("placeholder", "Nhập tên người dùng cần tìm...");
                    txttimkiem.Attributes.Add("type", "Number");
                }
                else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "hoadon.aspx" || Request.QueryString["tukhoa"] != null)
                {
                    txttimkiem.Attributes.Add("placeholder", "Nhập mã hoặc số điện thoại cần tìm...");
                    txttimkiem.Attributes.Add("type", "Number");
                }
                else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nhacungcap.aspx" || Request.QueryString["nhacc"] != null)
                {
                    txttimkiem.Attributes.Add("placeholder", "Nhập mã hoặc tên nhà cung cấp...");
                }
                else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "khachhang.aspx" || Request.QueryString["makh"] != null)
                {
                    txttimkiem.Attributes.Add("placeholder", "Nhập mã hoặc số điện thoại cần tìm...");
                    txttimkiem.Attributes.Add("type", "Number");
                }
                else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "phieunhap.aspx" || Request.QueryString["mapn"] != null
                    || HttpContext.Current.Request.Url.Segments[1].ToString() == "phieuxuat.aspx" || Request.QueryString["mapx"] != null)
                {
                    txttimkiem.Attributes.Add("placeholder", "Nhập mã phiếu cần tìm...");
                    txttimkiem.Attributes.Add("type", "Number");
                }

                else if (Request.QueryString["bc"] != null)
                {
                    if (Request.QueryString["bc"].ToString() != "tonkho")
                    {
                        txttimkiem.Visible = false;
                        btntimkiem.Visible = false;
                        lbltk.Visible = true;
                        cmbtk.Visible = true;
                        cmbtk.Items.Add("--- Chọn ---");
                        cmbtk.Items.Add("Mã sản phẩm");
                        cmbtk.Items.Add("Mã khách hàng");
                        cmbtk.Items.Add("Khoảng thời gian");

                    }
                    else
                    {
                        txttimkiem.Visible = true;
                        btntimkiem.Visible = true;
                        txttimkiem.Attributes.Add("placeholder", "Nhập mã hoặc tên sản phẩm cần tìm...");
                    }
                }
                
                else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "ThongKeKH.aspx")
                {
                    txttimkiem.Visible = false;
                    btntimkiem.Visible = false;
                    lbltk.Visible = true;
                    cmbtk.Visible = true;
                    cmbtk.Items.Add("--- Chọn ---");
                    cmbtk.Items.Add("Mã khách hàng");
                    cmbtk.Items.Add("Khoảng thời gian");
                }
                else if (Request.QueryString["malh"] != null || Request.QueryString["madh"] != null)
                {
                    txttimkiem.Visible = false;
                    btntimkiem.Visible = false;
                }
                else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "lienhe.aspx" && Request.QueryString["malh"] == null)
                {
                    txttimkiem.Visible = false;
                    btntimkiem.Visible = false;
                    lbltk.Visible = true;
                    cmbtk.Visible = true;
                    cmbtk.Items.Add("--- Chọn ---");
                    cmbtk.Items.Add("Mã liên hệ");
                    cmbtk.Items.Add("Email");
                    cmbtk.Items.Add("Khoảng thời gian");
                }
                else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "dondathang.aspx" && Request.QueryString["madh"] == null)
                {
                    txttimkiem.Visible = false;
                    btntimkiem.Visible = false;
                    lbltk.Visible = true;
                    cmbtk.Visible = true;
                    cmbtk.Items.Add("--- Chọn ---");
                    cmbtk.Items.Add("Mã đơn hàng");
                    cmbtk.Items.Add("Số điện thoại");
                    cmbtk.Items.Add("Khoảng thời gian");

                }
                else
                    txttimkiem.Attributes.Add("placeholder", "Nhập tên cần tìm...");
            
            }
       
           
            if (Request.QueryString["timkiemdt"] != null)
            {
                string ngay = Request.QueryString["timkiemdt"].ToString();
                string[] chuoi = ngay.Split('-');
                start.Text = chuoi[0];
                end.Text = chuoi[1];
                lbltk.Visible = true;
                cmbtk.Visible = true;
                start.Visible = true;
                end.Visible = true;
                lblto.Visible = true;
                btnLoc.Visible = true;
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                cmbtk.Items.Add("--- Chọn ---");
                cmbtk.Items.Add("Mã sản phẩm");
                cmbtk.Items.Add("Mã khách hàng");
                cmbtk.Items.Add("Khoảng thời gian");
                cmbtk.Text = "Khoảng thời gian";
            }
            else if (Request.QueryString["timkiemds"] != null)
            {
                string ngay = Request.QueryString["timkiemds"].ToString();
                string[] chuoi = ngay.Split('-');
                start.Text = chuoi[0];
                end.Text = chuoi[1];
                lbltk.Visible = true;
                cmbtk.Visible = true;
                start.Visible = true;
                end.Visible = true;
                lblto.Visible = true;
                btnLoc.Visible = true;
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                cmbtk.Items.Add("--- Chọn ---");
                cmbtk.Items.Add("Mã sản phẩm");
                cmbtk.Items.Add("Mã khách hàng");
                cmbtk.Items.Add("Khoảng thời gian");
                cmbtk.Text = "Khoảng thời gian";
            }
            else if (Request.QueryString["timkiem"] != null)
            {
                string ngay = Request.QueryString["timkiem"].ToString();
                string[] chuoi = ngay.Split('-');
                start.Text = chuoi[0];
                end.Text = chuoi[1];
                cmbtk.Visible = true;
                start.Visible = true;
                end.Visible = true;
                lblto.Visible = true;
                btnLoc.Visible = true;
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                cmbtk.Text = "Khoảng thời gian";
            }
            else if (Request.QueryString["timkiemtk"] != null)
            {
                txttimkiem.Attributes.Add("placeholder", "Nhập mã hoặc tên sản phẩm cần tìm...");
            }
            else if (Request.QueryString["timkiemlh"] != null)
            {
                string ngay = Request.QueryString["timkiemlh"].ToString();
                string[] chuoi = ngay.Split('-');
                start.Text = chuoi[0];
                end.Text = chuoi[1];
                lbltk.Visible = true;
                cmbtk.Visible = true;
                start.Visible = true;
                end.Visible = true;
                lblto.Visible = true;
                btnLoc.Visible = true;
                cmbtk.Text = "Khoảng thời gian";
            }
            else if (Request.QueryString["timkiemdh"] != null)
            {
                string ngay = Request.QueryString["timkiemdh"].ToString();
                string[] chuoi = ngay.Split('-');
                start.Text = chuoi[0];
                end.Text = chuoi[1];
                lbltk.Visible = true;
                cmbtk.Visible = true;
                start.Visible = true;
                end.Visible = true;
                lblto.Visible = true;
                btnLoc.Visible = true;
                cmbtk.Text = "Khoảng thời gian";
                
            }
            else if (Request.QueryString["tim_madon"] != null)
            {
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                lbltk.Visible = true;
                cmbtk.Visible = true;
                txtgtri.Visible = true;
                btntim.Visible = true;
                cmbtk.Text = "Mã đơn hàng";
                txtgtri.Attributes.Add("placeholder", "Nhập mã đơn cần tìm...");
                txtgtri.Attributes.Add("type", "Number");
            }
            else if (Request.QueryString["tim_malh"] != null)
            {
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                lbltk.Visible = true;
                cmbtk.Visible = true;
                txtgtri.Visible = true;
                btntim.Visible = true;
                cmbtk.Text = "Mã liên hệ";
                txtgtri.Attributes.Add("placeholder", "Nhập mã liên hệ cần tìm...");
                txtgtri.Attributes.Add("type", "Number");
            }
            else if (Request.QueryString["tim_email"] != null)
            {
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                lbltk.Visible = true;
                cmbtk.Visible = true;
                txtgtri.Visible = true;
                btntim.Visible = true;
                cmbtk.Text = "Email";
                txtgtri.Attributes.Add("placeholder", "Nhập email cần tìm...");
                txtgtri.Attributes.Add("type", "singleline");
            }
            else if (Request.QueryString["tim_sdt"] != null)
            {
                lbltk.Visible = true;
                cmbtk.Visible = true;
                txtgtri.Visible = true;
                btntim.Visible = true;
                cmbtk.Text = "Số điện thoại";
                txtgtri.Attributes.Add("placeholder", "Nhập số điện thoại cần tìm...");
            }
            else if (Request.QueryString["tim_kh"] != null)
            {
                lbltk.Visible = true;
                cmbtk.Visible = true;
                txtgtri.Visible = true;
                btntim.Visible = true;
                cmbtk.Text = "Mã khách hàng";
                txtgtri.Attributes.Add("placeholder", "Nhập mã khách hàng cần tìm...");
            }
            else if (Request.QueryString["tim_sp"] != null || Request.QueryString["ma_sp"] != null)
            {
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                lbltk.Visible = true;
                cmbtk.Visible = true;
                txtgtri.Visible = true;
                btntim.Visible = true;
                cmbtk.Items.Add("--- Chọn ---");
                cmbtk.Items.Add("Mã sản phẩm");
                cmbtk.Items.Add("Mã khách hàng");
                cmbtk.Items.Add("Khoảng thời gian");
                cmbtk.Text = "Mã sản phẩm";
                txtgtri.Attributes.Add("placeholder", "Nhập mã sản phẩm cần tìm...");
                txtgtri.Attributes.Add("type", "Number");
            }
            else if (Request.QueryString["kh"] != null || Request.QueryString["ma_kh"] != null)
            {
                txttimkiem.Visible = false;
                btntimkiem.Visible = false;
                lbltk.Visible = true;
                cmbtk.Visible = true;
                txtgtri.Visible = true;
                btntim.Visible = true;
                cmbtk.Items.Add("--- Chọn ---");
                cmbtk.Items.Add("Mã sản phẩm");
                cmbtk.Items.Add("Mã khách hàng");
                cmbtk.Items.Add("Khoảng thời gian");
                cmbtk.Text = "Mã khách hàng";
                txtgtri.Attributes.Add("placeholder", "Nhập mã khách hàng cần tìm...");
                txtgtri.Attributes.Add("type", "Number");
            }

        }

    }



    protected void btntimkiem_Click(object sender, ImageClickEventArgs e)
    {
        if (txttimkiem.Text == "")
        {
           if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nhanvien.aspx" || Request.QueryString["manv"]!=null)
                Response.Redirect("nhanvien.aspx");
          else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "khachhang.aspx" || Request.QueryString["makh"] != null)
                Response.Redirect("khachhang.aspx");
         else   if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nhacungcap.aspx" || Request.QueryString["nhacc"] != null)
                Response.Redirect("nhacungcap.aspx");
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "loaisanpham.aspx" || Request.QueryString["loaisp"] != null)
                Response.Redirect("loaisanpham.aspx");
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "sanpham.aspx" || Request.QueryString["tensp"] != null)
                Response.Redirect("sanpham.aspx");
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nguoidung.aspx" || Request.QueryString["tennd"] != null)
                Response.Redirect("nguoidung.aspx");
           else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "hoadon.aspx" || Request.QueryString["tukhoa"] != null)
                Response.Redirect("hoadon.aspx");
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "phieunhap.aspx" || Request.QueryString["mapn"] != null)
                Response.Redirect("phieunhap.aspx");
          else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "baocao.aspx")
                Response.Redirect("baocao.aspx?bc=tonkho");
         
        }
        else
        {
            if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nhanvien.aspx" || Request.QueryString["manv"] != null)
                Response.Redirect("timkiem.aspx?manv="+ int.Parse(txttimkiem.Text));
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "khachhang.aspx" || Request.QueryString["makh"] != null)
                Response.Redirect("timkiem.aspx?makh=" + int.Parse(txttimkiem.Text));
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nhacungcap.aspx" || Request.QueryString["nhacc"] != null)
                Response.Redirect("timkiem.aspx?nhacc=" + txttimkiem.Text.Trim());
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "loaisanpham.aspx" || Request.QueryString["loaisp"] != null)
                Response.Redirect("timkiem.aspx?loaisp=" + txttimkiem.Text.Trim());
           else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "sanpham.aspx" || Request.QueryString["tensp"] != null)
                Response.Redirect("timkiem.aspx?tensp=" + txttimkiem.Text.Trim());
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "nguoidung.aspx" || Request.QueryString["tennd"] != null)
                Response.Redirect("timkiem.aspx?tennd=" +txttimkiem.Text.Trim());
          else  if (HttpContext.Current.Request.Url.Segments[1].ToString() == "hoadon.aspx" || Request.QueryString["tukhoa"] != null)
                Response.Redirect("timkiem.aspx?tukhoa=" + txttimkiem.Text.Trim());
           else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "phieunhap.aspx" || Request.QueryString["mapn"] != null)
                Response.Redirect("timkiem.aspx?mapn=" + int.Parse(txttimkiem.Text));
           else if (HttpContext.Current.Request.Url.Segments[1].ToString() == "baocao.aspx")
                Response.Redirect("baocao.aspx?timkiemtk=" + txttimkiem.Text.Trim());

        }
    }

    protected void btnLoc_Click(object sender, EventArgs e)
    {
        DateTime ngaybd = Convert.ToDateTime(start.Text);
        DateTime ngaykt = Convert.ToDateTime(end.Text);
        if (ngaybd > ngaykt)
            Response.Write("<script>alert('Ngày kết thúc tìm kiếm phải lớn hơn ngày bắt đầu.')</script>");
        else
        {
            if (Request.QueryString["bc"] != null)
            {
                if (Request.QueryString["bc"].ToString() == "doanhthu")
                    Response.Redirect("baocao.aspx?timkiemdt=" + start.Text + "-" + end.Text);
                else
                    if (Request.QueryString["bc"].ToString() == "doanhso" || Request.QueryString["timkiemds"] != null)
                    Response.Redirect("baocao.aspx?timkiemds=" + start.Text + "-" + end.Text);

            }
            else 
                if(Request.QueryString["kh"] != null || Request.QueryString["tim_sp"] != null)
            {
                Response.Redirect("baocao.aspx?timkiemdt=" + start.Text + "-" + end.Text);
            }
            else
                if (Request.QueryString["ma_kh"] != null || Request.QueryString["ma_sp"] != null)
            {
                Response.Redirect("baocao.aspx?timkiemds=" + start.Text + "-" + end.Text);
            }
            else
            {
                if (Request.QueryString["timkiemdt"] != null)
                    Response.Redirect("baocao.aspx?timkiemdt=" + start.Text + "-" + end.Text);
                else if (Request.QueryString["timkiemds"] != null)
                    Response.Redirect("baocao.aspx?timkiemds=" + start.Text + "-" + end.Text);

            }
            if (HttpContext.Current.Request.Url.Segments[1].ToString() == "ThongKeKH.aspx")
            {
                Response.Redirect("ThongKeKH.aspx?timkiem=" + start.Text + "-" + end.Text);
            }
            if (HttpContext.Current.Request.Url.Segments[1].ToString() == "lienhe.aspx")
            {
                Response.Redirect("lienhe.aspx?timkiemlh=" + start.Text + "-" + end.Text);
            }
            if (HttpContext.Current.Request.Url.Segments[1].ToString() == "dondathang.aspx")
            {
                Response.Redirect("dondathang.aspx?timkiemdh=" + start.Text + "-" + end.Text);
            }
        }
    }

    protected void cmbtk_TextChanged(object sender, EventArgs e)
    {
        if(cmbtk.Text=="Mã đơn hàng")
        {
            txtgtri.Attributes.Add("placeholder", "Nhập mã đơn cần tìm...");
            txtgtri.Attributes.Add("type", "Number");
            txtgtri.Visible = true;
            btntim.Visible = true;
            start.Visible = false;
            end.Visible = false;
            lblto.Visible = false;
            btnLoc.Visible = false;
        }
        else
            if (cmbtk.Text == "Số điện thoại")
        {
            txtgtri.Attributes.Add("placeholder", "Nhập số điện thoại cần tìm...");
            txtgtri.Visible = true;
            btntim.Visible = true;
            start.Visible = false;
            end.Visible = false;
            lblto.Visible = false;
            btnLoc.Visible = false;
        }
        else
            if (cmbtk.Text == "Khoảng thời gian")
        {
            txtgtri.Visible = false;
            btntim.Visible = false;
            start.Visible = true;
            end.Visible = true;
            lblto.Visible = true;
            btnLoc.Visible = true;
        }
        else
            if (cmbtk.Text == "Mã sản phẩm")
        {
            txtgtri.Attributes.Add("placeholder", "Nhập mã sản phẩm cần tìm...");
            txtgtri.Attributes.Add("type", "Number");
            txtgtri.Attributes.Add("min", "1");
            txtgtri.Visible = true;
            btntim.Visible = true;
            start.Visible = false;
            end.Visible = false;
            lblto.Visible = false;
            btnLoc.Visible = false;
        }
        else
            if (cmbtk.Text == "Mã khách hàng")
        {
            txtgtri.Attributes.Add("placeholder", "Nhập mã khách hàng cần tìm...");
            txtgtri.Attributes.Add("type", "Number");
            txtgtri.Visible = true;
            btntim.Visible = true;
            start.Visible = false;
            end.Visible = false;
            lblto.Visible = false;
            btnLoc.Visible = false;
        }
        else
            if (cmbtk.Text == "Mã liên hệ")
        {
            txtgtri.Attributes.Add("placeholder", "Nhập mã liên hệ cần tìm...");
            txtgtri.Attributes.Add("type", "Number");
            txtgtri.Visible = true;
            btntim.Visible = true;
            start.Visible = false;
            end.Visible = false;
            lblto.Visible = false;
            btnLoc.Visible = false;
        }
        else
            if (cmbtk.Text == "Email")
        {
            txtgtri.Attributes.Add("placeholder", "Nhập email cần tìm...");
            txtgtri.Attributes.Add("type", "singleline");
            txtgtri.Visible = true;
            btntim.Visible = true;
            start.Visible = false;
            end.Visible = false;
            lblto.Visible = false;
            btnLoc.Visible = false;
        }
    }

    protected void btntim_Click(object sender, EventArgs e)
    {
        if (cmbtk.Text == "Mã đơn hàng")
            Response.Redirect("dondathang.aspx?tim_madon=" + int.Parse(txtgtri.Text));
        if (cmbtk.Text == "Số điện thoại")
            Response.Redirect("dondathang.aspx?tim_sdt=" + txtgtri.Text.Trim());
        if (Request.QueryString["bc"] != null)
        {
            if (cmbtk.Text == "Mã sản phẩm" && Request.QueryString["bc"] == "doanhthu" || Request.QueryString["tim_sp"] != null)
                Response.Redirect("baocao.aspx?tim_sp=" + int.Parse(txtgtri.Text));
            if (cmbtk.Text == "Mã khách hàng" && HttpContext.Current.Request.Url.Segments[1].ToString() == "ThongKeKH.aspx")
                Response.Redirect("ThongKeKH.aspx?tim_kh=" + int.Parse(txtgtri.Text));
            if (cmbtk.Text == "Mã khách hàng" && Request.QueryString["bc"] == "doanhthu" || Request.QueryString["kh"] != null)
                Response.Redirect("baocao.aspx?kh=" + int.Parse(txtgtri.Text));
            if (cmbtk.Text == "Mã khách hàng" && Request.QueryString["bc"] == "doanhso" || Request.QueryString["ma_kh"] != null)
                Response.Redirect("baocao.aspx?ma_kh=" + int.Parse(txtgtri.Text));
            if (cmbtk.Text == "Mã sản phẩm" && Request.QueryString["bc"] == "doanhso" || Request.QueryString["ma_sp"] != null)
                Response.Redirect("baocao.aspx?ma_sp=" + int.Parse(txtgtri.Text));
        }
        else
        {
            if(cmbtk.Text=="Mã sản phẩm" && (Request.QueryString["tim_sp"] != null || Request.QueryString["kh"] !=null || Request.QueryString["timkiemdt"] != null))
                Response.Redirect("baocao.aspx?tim_sp=" + int.Parse(txtgtri.Text));
            if (cmbtk.Text == "Mã khách hàng" && (Request.QueryString["tim_sp"] != null || Request.QueryString["kh"] != null || Request.QueryString["timkiemdt"] != null))
                Response.Redirect("baocao.aspx?kh=" + int.Parse(txtgtri.Text));
            if (cmbtk.Text == "Mã sản phẩm" && (Request.QueryString["ma_sp"] != null || Request.QueryString["ma_kh"] != null || Request.QueryString["timkiemds"] != null))
                Response.Redirect("baocao.aspx?ma_sp=" + int.Parse(txtgtri.Text));
            if (cmbtk.Text == "Mã khách hàng" && (Request.QueryString["ma_sp"] != null || Request.QueryString["ma_kh"] != null || Request.QueryString["timkiemds"] != null))
                Response.Redirect("baocao.aspx?ma_kh=" + int.Parse(txtgtri.Text));
        }
        if (cmbtk.Text == "Mã khách hàng" && HttpContext.Current.Request.Url.Segments[1].ToString() == "ThongKeKH.aspx" || Request.QueryString["makh"] != null)
        {
            Response.Redirect("ThongKeKH.aspx?tim_kh=" + int.Parse(txtgtri.Text));
        }
        if (cmbtk.Text == "Mã liên hệ")
            Response.Redirect("lienhe.aspx?tim_malh=" + int.Parse(txtgtri.Text));
        if (cmbtk.Text == "Email")
            Response.Redirect("lienhe.aspx?tim_email=" + txtgtri.Text.Trim());
    }
}
