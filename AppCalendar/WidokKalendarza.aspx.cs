using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Windows;

namespace AppCalendar
{
    public partial class WidokKalendarza : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DarkMode"] == null)
            {
                Session["DarkMode"] = true;
            }
            if (!IsPostBack)
            {
               int user_id = Int32.Parse(Session["user_id"].ToString());
                

                Kalendarz.SelectedDate = DateTime.Today;
                DataBox.Text = DateTime.Now.ToString("yyyy-MM-dd");
                GodzinaBox.Text = DateTime.Now.ToString("HH:mm");

                Kalendarz.SelectedDayStyle.BackColor = System.Drawing.Color.PowderBlue;
                Kalendarz.SelectedDayStyle.ForeColor = System.Drawing.Color.Black;
                DodajWydarzenieButton.Visible = true;

                var dc = DataContextSingleton.GetInstance();
                var wydarzenia = dc.Tabela_Wydarzenia.Where(w => w.Id_Uzytkownika == user_id && w.Data == Kalendarz.SelectedDate.Date).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();

                foreach (var wydarzenie in wydarzenia)
                {
                    var div = new HtmlGenericControl("div");

                    if (wydarzenie.Data < DateTime.Now && wydarzenie.Godzina < DateTime.Now.TimeOfDay)
                    {
                        var s = new HtmlGenericControl("s");
                        s.InnerHtml = ("• ") + wydarzenie.Nazwa;
                        if (wydarzenie.Godzina != null)
                        {
                            s.InnerHtml += (" o godzinie ") + wydarzenie.Godzina.ToString();
                        }

                        if (wydarzenie.Miejsce != "")
                        {
                            s.InnerHtml += (" w ") + wydarzenie.Miejsce;
                        }

                        if (wydarzenie.Goscie != "")
                        {
                            s.InnerHtml += (" z ") + wydarzenie.Goscie;
                        }

                        div.Controls.Add(s);
                    }
                    else
                    {
                        div.InnerHtml = ("• ") + wydarzenie.Nazwa;
                        if (wydarzenie.Godzina != null)
                        {
                            div.InnerHtml += (" o godzinie ") + wydarzenie.Godzina.ToString();
                        }

                        if (wydarzenie.Miejsce != "")
                        {
                            div.InnerHtml += (" w ") + wydarzenie.Miejsce;
                        }

                        if (wydarzenie.Goscie != "")
                        {
                            div.InnerHtml += (" z ") + wydarzenie.Goscie;
                        }
                    }
                    div_dzisiaj.Controls.Add(div);
                }
            }
            div_formularz.Visible = false;
        }

        protected void Kalendarz_SelectionChanged(object sender, EventArgs e)
        {
            int user_id = Int32.Parse(Session["user_id"].ToString());

            var dc = DataContextSingleton.GetInstance();
            var wydarzenia = dc.Tabela_Wydarzenia.Where(w => w.Id_Uzytkownika == user_id && w.Data == Kalendarz.SelectedDate.Date).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();

            foreach (var wydarzenie in wydarzenia)
            {
                var div = new HtmlGenericControl("div");

                if (wydarzenie.Data < DateTime.Now || (wydarzenie.Data == DateTime.Now.Date && wydarzenie.Godzina < DateTime.Now.TimeOfDay))
                {
                    var s = new HtmlGenericControl("s");
                    s.InnerHtml = ("• ") + wydarzenie.Nazwa;
                    if (wydarzenie.Godzina != null)
                    {
                        s.InnerHtml += (" o godzinie ") + wydarzenie.Godzina.ToString();
                    }

                    if (wydarzenie.Miejsce != "")
                    {
                        s.InnerHtml += (" w ") + wydarzenie.Miejsce;
                    }

                    if (wydarzenie.Goscie != "")
                    {
                        s.InnerHtml += (" z ") + wydarzenie.Goscie;
                    }

                    div.Controls.Add(s);
                }
                else
                {
                    div.InnerHtml = ("• ") + wydarzenie.Nazwa;
                    if (wydarzenie.Godzina != null)
                    {
                        div.InnerHtml += (" o godzinie ") + wydarzenie.Godzina.ToString();
                    }

                    if (wydarzenie.Miejsce != "")
                    {
                        div.InnerHtml += (" w ") + wydarzenie.Miejsce;
                    }

                    if (wydarzenie.Goscie != "")
                    {
                        div.InnerHtml += (" z ") + wydarzenie.Goscie;
                    }
                }
                div_dzisiaj.Controls.Add(div);
            }

            LabelDzisiaj.Visible = true;
            DodajWydarzenieButton.Visible = true;
            div_formularz.Visible = false;
        }

        protected void DodajWydarzenieButton_Click(object sender, EventArgs e)
        {
            DataBox.Text = Kalendarz.SelectedDate.ToString("yyyy-MM-dd");

            LabelDzisiaj.Visible = false;

            DodajWydarzenieButton.Visible = false;
            div_formularz.Visible = true;

            var dc = new DataClassesDataContext();
            var kategorie = dc.Tabela_Kategorie.ToList();
            KategoriaList.DataSource = kategorie;
            KategoriaList.DataTextField = "Nazwa";
            KategoriaList.DataValueField = "Id";
            KategoriaList.DataBind();
        }

        protected void ZapiszButton_Click(object sender, EventArgs e)
        {
            int user_id = Int32.Parse(Session["user_id"].ToString());

            var dc = DataContextSingleton.GetInstance();
            var noweWydarzenie = new Tabela_Wydarzenia
            {
                Nazwa = NazwaBox.Text,
                Data = Convert.ToDateTime(DataBox.Text),
                Godzina = TimeSpan.Parse(GodzinaBox.Text),
                Opis = OpisBox.Text,
                Miejsce = MiejsceBox.Text,
                Goscie = GoscieBox.Text,
                Notatka = NotatkaBox.Text,
                Kolor = KolorBox.Text,
                Priorytet = Convert.ToInt32(PriorytetBox.Text),
                Id_Uzytkownika = user_id,
                Id_Kategorii = Convert.ToInt32(KategoriaList.SelectedValue)
            };

            dc.Tabela_Wydarzenia.InsertOnSubmit(noweWydarzenie);
            dc.SubmitChanges();

            DodajWydarzenieButton.Visible = true;
            div_formularz.Visible = false;

            LabelDzisiaj.Visible = true;

            var wydarzenia = dc.Tabela_Wydarzenia.Where(w => w.Id_Uzytkownika == user_id && w.Data == Kalendarz.SelectedDate.Date).OrderBy(w => w.Data).ThenBy(w => w.Godzina).ToList();

            foreach (var wydarzenie in wydarzenia)
            {
                var div = new HtmlGenericControl("DIV");

                if (wydarzenie.Data < DateTime.Now || (wydarzenie.Data == DateTime.Now.Date && wydarzenie.Godzina < DateTime.Now.TimeOfDay))
                {
                    var s = new HtmlGenericControl("s");
                    s.InnerHtml = ("• ") + wydarzenie.Nazwa;
                    if (wydarzenie.Godzina != null)
                    {
                        s.InnerHtml += (" o godzinie ") + wydarzenie.Godzina.ToString();
                    }

                    if (wydarzenie.Miejsce != "")
                    {
                        s.InnerHtml += (" w ") + wydarzenie.Miejsce;
                    }

                    if (wydarzenie.Goscie != "")
                    {
                        s.InnerHtml += (" z ") + wydarzenie.Goscie;
                    }

                    div.Controls.Add(s);
                }
                else
                {
                    div.InnerHtml = ("• ") + wydarzenie.Nazwa;
                    if (wydarzenie.Godzina != null)
                    {
                        div.InnerHtml += (" o godzinie ") + wydarzenie.Godzina.ToString();
                    }

                    if (wydarzenie.Miejsce != "")
                    {
                        div.InnerHtml += (" w ") + wydarzenie.Miejsce;
                    }

                    if (wydarzenie.Goscie != "")
                    {
                        div.InnerHtml += (" z ") + wydarzenie.Goscie;
                    }
                }
                div_dzisiaj.Controls.Add(div);
            }
        }

        protected void Mode_Click(object sender, EventArgs e)
        {
            Session["DarkMode"] = !(bool)Session["DarkMode"];
            Response.Redirect("WidokKalendarza.aspx");
        }
    }
}