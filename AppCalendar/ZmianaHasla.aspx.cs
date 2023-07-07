using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace AppCalendar
{
    public partial class ZmianaHasla : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asiak\Documents\DataBase.mdf;Integrated Security=True;Connect Timeout=30";

        protected void Page_Load(object sender, EventArgs e)
        {
  
        }

        protected void Mode_Click(object sender, EventArgs e)
        {
            Session["DarkMode"] = !(bool)Session["DarkMode"];
            Response.Redirect("ZmianaHasla.aspx");
        }

        protected void WylogujButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Logowanie.aspx");
        }

        protected void ZmienHasloButton_Click(object sender, EventArgs e)
        {
            if (NoweHasloBoxZH.Text != PowtorzNoweHasloBoxZH.Text || string.IsNullOrEmpty(NoweHasloBoxZH.Text) || string.IsNullOrEmpty(PowtorzNoweHasloBoxZH.Text))
            {

                InfoLabelZH.Text = "Wartości w polach Nowe Hasło i Powtórz Nowe Hasło nie są takie same!";
                string redirectScript = "setTimeout(function() { window.location.href = 'ZmianaHasla.aspx'; }, 1000);";
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
            }
            if (AktualneHasloBoxZH.Text == NoweHasloBoxZH.Text)
            {
                InfoLabelZH.Text = "Wartości z pól Nowe Hasło i Powtórz Nowe Hasło nie są takie same! Spróbuj ponownie.";
                string redirectScript = "setTimeout(function() { window.location.href = 'ZmianaHasla.aspx'; }, 1000);";
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
            }
            if (NoweHasloBoxZH.Text.Length <= 6)
            {
                InfoLabelZH.Text = "Hasło musi mieć minimum 6 znaków! Spróbuj ponownie.";
                string redirectScript = "setTimeout(function() { window.location.href = 'ZmianaHasla.aspx'; }, 1000);";
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
            }

            string selectQuery = "SELECT Id, Haslo, Sol FROM Tabela_RL WHERE Id = @Id_uzytkownika";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(selectQuery, connection);
                command.Parameters.AddWithValue("@Id_uzytkownika", Int32.Parse(Session["Id_uzytkownika"].ToString()));
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    string przechowywane_zaszyfrowane_haslo = reader.GetString(1);
                    byte[] przechowywana_sol = reader.GetSqlBinary(2).Value;
                    bool SprawdzHaslo = this.SprawdzHaslo(AktualneHasloBoxZH.Text, przechowywane_zaszyfrowane_haslo, przechowywana_sol);
                    reader.Close();
                    if (SprawdzHaslo)
                    {
                        string zaszyfrowane_haslo = SzyfrujHaslo(NoweHasloBoxZH.Text, przechowywana_sol);
                        string updateQuery = "UPDATE Tabela_RL SET Haslo = @Haslo WHERE Id = @Id_uzytkownika";
                        SqlCommand command2 = new SqlCommand(updateQuery, connection);
                        command2.Parameters.AddWithValue("@Haslo", zaszyfrowane_haslo);
                        command2.Parameters.AddWithValue("@Id_uzytkownika", Int32.Parse(Session["Id_uzytkownika"].ToString()));
                        command2.ExecuteNonQuery();

                        InfoLabelZH.Text = "Hasło zostało zmienione. Zaloguj się ponownie!";
                        string redirectScript = "setTimeout(function() { window.location.href = 'Logowanie.aspx'; }, 2000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
                    }
                    else
                    {
                        InfoLabelZH.Text = "Aktualne hasło jest nieprawidłowe! Spróbuj ponownie.";
                        string redirectScript = "setTimeout(function() { window.location.href = 'ZmianaHasla.aspx'; }, 1000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
                    }
                }
                else
                {
                    InfoLabelZH.Text = "Nowe hasło nie może być takie samo jak aktualne hasło! Spróbuj ponownie.";
                    string redirectScript = "setTimeout(function() { window.location.href = 'ZmianaHasla.aspx'; }, 1000);";
                    ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
                }
                connection.Close();
            }


        }

        const int keySize = 64;
        const int iterations = 350000;
        HashAlgorithmName hashAlgorithm = HashAlgorithmName.SHA512;

        string SzyfrujHaslo(string h, byte[] s)
        {
            var szyfr = new Rfc2898DeriveBytes(h, s, iterations, hashAlgorithm).GetBytes(keySize);
            return Convert.ToBase64String(szyfr);
        }

        bool SprawdzHaslo(string h, string pzh, byte[] s)
        {
            using (var hashP = new Rfc2898DeriveBytes(h, s, iterations, hashAlgorithm))
            {
                byte[] zaszyfrowane_haslo = hashP.GetBytes(keySize);
                string zaszyfrowane_haslo_string = Convert.ToBase64String(zaszyfrowane_haslo);
                string przechowywane_zaszyfrowane_haslo = pzh;
                return zaszyfrowane_haslo_string.Equals(przechowywane_zaszyfrowane_haslo);
            }
        }
    }
}