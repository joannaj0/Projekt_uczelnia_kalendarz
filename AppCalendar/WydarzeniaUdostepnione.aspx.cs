using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppCalendar
{
    public partial class WydarzeniaUdostepnione : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int user_id = Int32.Parse(Session["user_id"].ToString());

            if (Session["DarkMode"] == null)
            {
                Session["DarkMode"] = true;
            }

            var dc = DataContextSingleton.GetInstance();
            /*var wydarzenia = (from udostepnione in dc.Tabela_WydarzeniaUdostepnione
                              join wydarzenie in dc.Tabela_Wydarzenia on udostepnione.Id_Wydarzenia equals wydarzenie.Id
                              join uzytkownik in dc.Tabela_RL on wydarzenie.Id_Uzytkownika equals uzytkownik.Id
                              where udostepnione.Id_Uzytkownika == user_id
                              orderby wydarzenie.Data, wydarzenie.Godzina
                              select new
                              {
                                  uzytkownik.Email,
                                  wydarzenie.Nazwa,
                                  wydarzenie.Data,
                                  wydarzenie.Godzina,
                                  wydarzenie.Opis,
                                  wydarzenie.Miejsce,
                                  wydarzenie.Goscie,
                                  wydarzenie.Notatka,
                                  wydarzenie.Kolor,
                                  wydarzenie.Priorytet
                              }).ToList();*/

            var wydarzenia = (from udostepnione in dc.Tabela_WydarzeniaUdostepnione
                              join wydarzenie in dc.Tabela_Wydarzenia on udostepnione.Id_Wydarzenia equals wydarzenie.Id
                              where udostepnione.Id_Uzytkownika == user_id
                              orderby wydarzenie.Data, wydarzenie.Godzina
                              select wydarzenie).ToList();

            ListView.DataSource = wydarzenia;
            ListView.DataBind();


        }

        protected void UsunButtonW_Click(object sender, EventArgs e)
        {
            int user_id = Int32.Parse(Session["user_id"].ToString());

            var dc = DataContextSingleton.GetInstance();
            var wydarzenieU = dc.Tabela_WydarzeniaUdostepnione.FirstOrDefault(w => w.Id_Uzytkownika == user_id);

            if (wydarzenieU != null)
            {
                dc.Tabela_WydarzeniaUdostepnione.DeleteOnSubmit(wydarzenieU);
                dc.SubmitChanges();
                var wydarzenia = (from udostepnione in dc.Tabela_WydarzeniaUdostepnione
                                  join wydarzenie in dc.Tabela_Wydarzenia on udostepnione.Id_Wydarzenia equals wydarzenie.Id
                                  where udostepnione.Id_Uzytkownika == user_id
                                  orderby wydarzenie.Data, wydarzenie.Godzina
                                  select wydarzenie).ToList();  

                ListView.DataSource = wydarzenia;
                ListView.DataBind();
            }
        }

        protected void Mode_Click(object sender, EventArgs e)
        {
            Session["DarkMode"] = !(bool)Session["DarkMode"];
            Response.Redirect("WydarzeniaUdostepnione.aspx");
        }
    }
}