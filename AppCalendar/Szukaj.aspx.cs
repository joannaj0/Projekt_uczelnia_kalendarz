using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppCalendar
{
    public partial class Szukaj : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        { 
            if (Session["DarkMode"] == null)
            {
                Session["DarkMode"] = true;
            }
        }
        protected void ButtonSzukaj_Click(object sender, EventArgs e)
        {
            int user_id = Int32.Parse(Session["user_id"].ToString());

            var dc = DataContextSingleton.GetInstance();
            var wydarzenia = dc.Tabela_Wydarzenia.Where(w => w.Id_Uzytkownika == user_id).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();
            var znalezione = wydarzenia.Where(w => w.Nazwa == TextBoxNazwaWydarzenia.Text).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();

            if (znalezione.Count == 0)
            {
                this.LabelKomunikat.Text = "Nie ma wydarzenia o takiej nazwie.";
                ListView.DataSource = znalezione;
                ListView.DataBind();
            }
            else
            {
                this.LabelKomunikat.Text = " ";
                ListView.DataSource = znalezione;
                ListView.DataBind();
            }
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
                var znalezione = wydarzenia.Where(w => w.Nazwa == TextBoxNazwaWydarzenia.Text).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();
                ListView.DataSource = znalezione;
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
            Response.Redirect("Szukaj.aspx");
        }
    }
}