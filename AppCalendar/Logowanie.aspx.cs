using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Security.Cryptography;

namespace AppCalendar
{
    public partial class Logowanie : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asiak\Documents\DataBase.mdf;Integrated Security=True;Connect Timeout=30";

        protected void ZalogujButton_Click(object sender, EventArgs e)
        {
            string selectQuery1 = "SELECT Haslo, Sol FROM Tabela_RL WHERE Email='" + EmailBoxL.Text + "'";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(selectQuery1, connection);
                SqlDataReader reader = command.ExecuteReader();
                if (reader.Read())
                {
                    string przechowywane_zaszyfrowane_haslo = reader.GetString(0);
                    byte[] przechowywana_sol = reader.GetSqlBinary(1).Value;
                    string haslo = HasloBoxL.Text;
                    bool SprawdzHaslo = this.SprawdzHaslo(haslo, przechowywane_zaszyfrowane_haslo, przechowywana_sol);
                    if (SprawdzHaslo)
                    {
                        string email = EmailBoxL.Text;
                        Response.Redirect("PomyslneLog.aspx?email=" + email + "&haslo=" + haslo);
                    }
                    else
                    {
                        InfoLabelL.Text = "Nieprawidłowe dane! Spróbuj ponownie.";
                        string redirectScript = "setTimeout(function() { window.location.href = 'Logowanie.aspx'; }, 1000);";
                        ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
                    }
                }
                else
                {
                    InfoLabelL.Text = "Nieprawidłowe dane! Spróbuj ponownie.";
                    string redirectScript = "setTimeout(function() { window.location.href = 'Logowanie.aspx'; }, 1000);";
                    ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
                }
                reader.Close();
            }
        }

        const int keySize = 64;
        const int iterations = 350000;
        HashAlgorithmName hashAlgorithm = HashAlgorithmName.SHA512;

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