using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Security.Cryptography;
using System.Text;
using System.IO;

namespace AppCalendar
{
    public partial class Rejestracja : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asiak\Documents\DataBase.mdf;Integrated Security=True;Connect Timeout=30";

        protected void ZarejestrujButton_Click(object sender, EventArgs e)
        { 
            string email = EmailBoxR.Text;
            string haslo = HasloBoxR.Text;
            if (string.IsNullOrWhiteSpace(email) || string.IsNullOrWhiteSpace(haslo))
            {
                InfoLabelR.Text = "Nie uzupełniono wszystkich pól!";
                string redirectScript = "setTimeout(function() { window.location.href = 'Rejestracja.aspx'; }, 1000);";
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
            }
            else
            {
                string selectQuery = "SELECT COUNT(*) FROM Tabela_RL WHERE Email = @Email";
                string insertQuery = "INSERT INTO Tabela_RL (Email, Haslo, Sol) VALUES (@Email, @Haslo, @Sol)";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                    selectCommand.Parameters.AddWithValue("@Email", email);
                    int count = (int)selectCommand.ExecuteScalar();
                    if (count > 0)
                    {
                        InfoLabelR.Text = "Konto o podanym adresie e-mail już istnieje!";
                    }
                    else
                    {
                        byte[] sol;
                        string haslo_zaszyfrowane = SzyfrujHaslo(haslo, out sol);

                        SqlCommand insertCommand = new SqlCommand(insertQuery, connection);
                        insertCommand.Parameters.AddWithValue("@Email", email);
                        insertCommand.Parameters.AddWithValue("@Haslo", haslo_zaszyfrowane);
                        insertCommand.Parameters.AddWithValue("@Sol", sol);
                        int rowsAffected = insertCommand.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            InfoLabelR.Text = "Zarejestrowano!";
                            string redirectScript = "setTimeout(function() { window.location.href = 'Logowanie.aspx'; }, 2000);";
                            ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
                        }
                    }
                }
            }
        }

        const int keySize = 64;
        const int iterations = 350000;
        HashAlgorithmName hashAlgorithm = HashAlgorithmName.SHA512;

        string SzyfrujHaslo(string h, out byte[] s)
        {
            s = new byte[keySize];
            using (var rng = RandomNumberGenerator.Create())
            {
                rng.GetBytes(s);
            }

            var szyfr = new Rfc2898DeriveBytes(h, s, iterations, hashAlgorithm).GetBytes(keySize);
            return Convert.ToBase64String(szyfr);
        }
    }
}
