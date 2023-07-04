using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppCalendar
{
    public partial class Udostepnianie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DarkMode"] == null)
            {
                Session["DarkMode"] = true;
            }

            int user_id = Int32.Parse(Session["user_id"].ToString());

            if (!Page.IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    int id = int.Parse(Request.QueryString["id"]);

                    using (var context = new DataClassesDataContext())
                    {
                        var wydarzenie = context.Tabela_Wydarzenia.FirstOrDefault(x => x.Id == id);
                        if (wydarzenie != null)
                        {
                            NazwaLabelDane.Text = wydarzenie.Nazwa;
                            DataLabelDane.Text = wydarzenie.Data.ToString("dd-MM-yyyy");
                            GodzinaLabelDane.Text = wydarzenie.Godzina.ToString();
                            OpisLabelDane.Text = wydarzenie.Opis;
                            MiejsceLabelDane.Text = wydarzenie.Miejsce;
                            GoscieLabelDane.Text = wydarzenie.Goscie;
                            NotatkaLabelDane.Text = wydarzenie.Notatka;
                            KolorLabelDane.Text = wydarzenie.Kolor;
                            //KolorLabelDane.ForeColor = ColorTranslator.FromHtml(wydarzenie.Kolor);
                            PriorytetLabelDane.Text = wydarzenie.Priorytet.ToString();
                            PriorytetLabelDane.ForeColor = Color.Red;
                            KategoriaLabelDane.Text = wydarzenie.Tabela_Kategorie.Nazwa.ToString();
                        }

                        var osoby = context.Tabela_RL.Where(x => x.Id != user_id).Select(x => x.Email).ToList();
                        CheckBoxListOsoby.DataSource = osoby;
                        CheckBoxListOsoby.DataBind();
                    }
                }
            }
        }

        protected void ButtonUdostepnij_Click(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                int wydarzenie_id = int.Parse(Request.QueryString["id"]);


                foreach (ListItem listItem in CheckBoxListOsoby.Items)
                {
                    if (listItem.Selected)
                    {
                        string email = listItem.Value;
                        Tabela_WydarzeniaUdostepnione dane = new Tabela_WydarzeniaUdostepnione();
                        dane.Id_Uzytkownika = PobierzId(email);
                        dane.Id_Wydarzenia = wydarzenie_id;

                        var dc = DataContextSingleton.GetInstance();
                        dc.Tabela_WydarzeniaUdostepnione.InsertOnSubmit(dane);
                        dc.SubmitChanges();
                    }
                }
            }

            InfoLabel.Text = "Udostępniono!";
            string redirectScript = "setTimeout(function() { window.location.href = 'WidokKalendarza.aspx'; }, 1000);";
            ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
        }

        public int PobierzId(string email)
        {
            var dc = DataContextSingleton.GetInstance();
            var uzytkownik = dc.Tabela_RL.FirstOrDefault(u => u.Email == email);

            if (uzytkownik != null)
            {
                return uzytkownik.Id;
            }
            else
            {
                return -1;
            }
        }
    }
}