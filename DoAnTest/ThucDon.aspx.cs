using DoAnTest.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DoAnTest
{
    public partial class ThucDon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        
        protected void Page_PreRender(object sender, EventArgs e)
        {
            Menu menu = (Menu)this.Master.FindControl("menu2");
            if (menu != null && menu.SelectedValue != "")
            {
                string cmdStr = "SELECT ID, tenSP, size, price, image FROM Products WHERE maloaiSP = " +
                    Convert.ToInt32(menu.SelectedValue).ToString() + " ORDER BY tenSP";
                srcLoai.SelectCommand = cmdStr;
                lstSanPham.DataBind();
            }
        }

        protected void Menu2_MenuItemClick(object sender, MenuEventArgs e)
        {
            int maloaiSP = Convert.ToInt32(Menu2.SelectedItem.Value);

            srcLoai.SelectParameters["maloaiSP"].DefaultValue = maloaiSP.ToString();
        }
       
    }
}