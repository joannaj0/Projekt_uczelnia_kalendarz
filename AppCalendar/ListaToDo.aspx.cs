using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using System.Data.Entity.Core.Objects;
using System.Data.Entity.Core;
using System.Windows;

namespace AppCalendar
{
    public partial class ListaToDo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int user_id = Int32.Parse(Session["user_id"].ToString());

            if (Session["DarkMode"] == null)
            {
                Session["DarkMode"] = true;
            }

            var dc = DataContextSingleton.GetInstance();
            var wydarzenia = dc.Tabela_Wydarzenia.Where(w => w.Id_Uzytkownika == user_id).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();
            ListView.DataSource = wydarzenia;
            ListView.DataBind();
        }

        protected void UsunButtonW_Click(object sender, EventArgs e)
        {
            int user_id = Int32.Parse(Session["user_id"].ToString());
     
            int id = Convert.ToInt32((sender as Button).CommandArgument);

            var dc = DataContextSingleton.GetInstance();
            var wydarzenie = dc.Tabela_Wydarzenia.FirstOrDefault(w => w.Id == id);

            if (wydarzenie != null)
            {
                dc.Tabela_Wydarzenia.DeleteOnSubmit(wydarzenie);
                dc.SubmitChanges();

                var wydarzenia = dc.Tabela_Wydarzenia.Where(w => w.Id_Uzytkownika == user_id).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();
                ListView.DataSource = wydarzenia;
                ListView.DataBind();
            }
        }

        protected void EdytujButtonW_Click(object sender, EventArgs e)
        {
            Button edytujButton = (Button)sender;
            string id = edytujButton.CommandArgument;
            Response.Redirect("EdycjaDanych.aspx?id=" + id);
        }

        protected void Mode_Click(object sender, EventArgs e)
        {
            Session["DarkMode"] = !(bool)Session["DarkMode"];
            Response.Redirect("ListaToDo.aspx");
        }

        protected void UdostepnijButtonW_Click(object sender, EventArgs e)
        {
            Button udostepnijButton = (Button)sender;
            string id = udostepnijButton.CommandArgument;
            Response.Redirect("Udostepnianie.aspx?id=" + id);
        }
    }
}
