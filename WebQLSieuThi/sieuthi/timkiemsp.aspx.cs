using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sieuthi_timkiemsp : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (dlistSP.Items.Count != 0)
            lbldanhmuc.Text = "Kết quả tìm kiếm: " + dlistSP.Items.Count;
        else
            lbldanhmuc.Text = "Kết quả tìm kiếm: 0";
    }
}