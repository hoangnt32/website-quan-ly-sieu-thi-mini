using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class trangchu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CSDL kn = new CSDL();
        if (!IsPostBack)
        {
            SqlConnection conn = new SqlConnection(kn.chuoiketnoi);
            conn.Open();
            string cho = "select * from SanPham";
            SqlDataAdapter adap = new SqlDataAdapter(cho, conn);
            DataTable tbble = new DataTable();
            adap.Fill(tbble);
            CollectionPager1.PageSize = 9;
            CollectionPager1.DataSource = tbble.DefaultView;
            CollectionPager1.BindToControl = DLtcsp;
            DLtcsp.DataSource = CollectionPager1.DataSourcePaged;
            conn.Close();
            conn.Dispose();
            if (dlspkm.Items.Count == 0)
            {
                dlspkm.Visible = false;
                lbltieude.Visible = false;
                imgicon.Visible = false;
            }
        }
    }
}