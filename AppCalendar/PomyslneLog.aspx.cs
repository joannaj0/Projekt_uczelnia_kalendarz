using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using AppCalendar;
using System.Windows;
using System.Security.Cryptography;
using System.Security.Policy;

namespace AppCalendar
{
    public partial class PomyslneLog : System.Web.UI.Page
    {
        string connectionString = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\asiak\Documents\DataBase.mdf;Integrated Security=True;Connect Timeout=30";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["DarkMode"] == null)
            {
                Session["DarkMode"] = true;
            }
            string email = Request.QueryString["email"];
            string haslo = Request.QueryString["haslo"];

            if (email != null && haslo != null)
            {
                SqlConnection connection = new SqlConnection(connectionString);
                connection.Open();

                string query1 = "SELECT Id, Sol FROM Tabela_RL WHERE Email = @Email";
                SqlCommand command1 = new SqlCommand(query1, connection);
                command1.Parameters.AddWithValue("@Email", email);

                byte[] przechowywana_sol = null;

                SqlDataReader reader1 = command1.ExecuteReader();
                if (reader1.Read())
                {
                    przechowywana_sol = (byte[])reader1["Sol"];
                }
                reader1.Close();

                string zaszyfrowane_haslo = SzyfrujHaslo(haslo, przechowywana_sol);

                string query2 = "SELECT Id, Email, Haslo FROM Tabela_RL WHERE Email = @Email AND Haslo = @Haslo";
                SqlCommand command2 = new SqlCommand(query2, connection);
                command2.Parameters.AddWithValue("@Email", email);
                command2.Parameters.AddWithValue("@Haslo", zaszyfrowane_haslo);

                using (connection)
                {
                    int userId = (int)command2.ExecuteScalar();
                    Session["user_id"] = userId;

                    string query3 = "SELECT Id, Email, Haslo FROM Tabela_RL WHERE Id = @userId";
                    SqlCommand command3 = new SqlCommand(query3, connection);
                    command3.Parameters.AddWithValue("@userId", userId);
                    SqlDataReader reader = command3.ExecuteReader();

                    if (reader.Read())
                    {
                        IdLabel.Text = reader["Id"].ToString();
                        EmailLabel.Text = reader["Email"].ToString();
                        HasloLabel.Text = haslo;
                    }

                    reader.Close();
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

        protected void WylogujButton_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Logowanie.aspx");
        }

        protected void EdytujEmailButton_Click(object sender, EventArgs e)
        {
            EdytujEmailButton.Visible = false;
            WpiszNowyEmailBox.Visible = true;
            ZapiszEdycjeEButton.Visible = true;
        }

        protected void EdytujHasloButton_Click(object sender, EventArgs e)
        {
            EdytujHasloButton.Visible = false;
            WpiszNoweHasloBox.Visible = true;
            ZapiszEdycjeHButton.Visible = true;
        }

        protected void UsunKontoButton_Click(object sender, EventArgs e)
        {
            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = "DELETE FROM Tabela_RL WHERE Email = @Email";
            SqlCommand command = new SqlCommand(query, connection);
            command.Parameters.AddWithValue("@Email", EmailLabel.Text);
            int rowsAffected = command.ExecuteNonQuery();

            connection.Close();

            if (rowsAffected > 0)
            {
                InfoLabelPL3.Text = "Konto usunięte!";
                string redirectScript = "setTimeout(function() { window.location.href = 'Logowanie.aspx'; }, 2000);";
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
            }
        }

        protected void ZapiszEdycjeEButton_Click(object sender, EventArgs e)
        {
            int userId = int.Parse(IdLabel.Text);
            string AktualnyEmail = EmailLabel.Text;

            string NowyEmail = WpiszNowyEmailBox.Text;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                if (string.IsNullOrWhiteSpace(NowyEmail))
                {
                    InfoLabelPL1.Text = "Pole z nowym adresem e-mail nie może być puste!";
                    return;
                }

                string selectQuery = "SELECT COUNT(*) FROM Tabela_RL WHERE Email = @Email AND Id != @userId";
                SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                selectCommand.Parameters.AddWithValue("@Email", NowyEmail);
                selectCommand.Parameters.AddWithValue("@userId", userId);
                int count = (int)selectCommand.ExecuteScalar();

                if (count > 0)
                {
                    InfoLabelPL1.Text = "Konto o podanym adresie e-mail już istnieje!";
                    return;
                }

                string query = "UPDATE Tabela_RL SET Email = @Email WHERE Id = @userId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Email", NowyEmail);
                command.Parameters.AddWithValue("@userId", userId);
                command.ExecuteNonQuery();

                connection.Close();
                InfoLabelPL1.Text = "E-mail został zmieniony na: " + NowyEmail + ". Zaloguj się ponownie!";
                string redirectScript = "setTimeout(function() { window.location.href = 'Logowanie.aspx'; }, 2000);";
                ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
            }
        }

        protected void ZapiszEdycjeHButton_Click(object sender, EventArgs e)
        {
            int userId = int.Parse(IdLabel.Text);
            string AktualneHaslo = HasloLabel.Text;

            string NoweHaslo = WpiszNoweHasloBox.Text;

            if (string.IsNullOrWhiteSpace(NoweHaslo))
            {
                InfoLabelPL2.Text = "Pole z nowym hasłem nie może być puste!";
                return;
            }

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            byte[] przechowywana_sol = null;
            string query1 = "SELECT Sol FROM Tabela_RL WHERE Id = @userId";
            SqlCommand command1 = new SqlCommand(query1, connection);
            command1.Parameters.AddWithValue("@userId", userId);

            SqlDataReader reader1 = command1.ExecuteReader();
            if (reader1.Read())
            {
                przechowywana_sol = (byte[])reader1["Sol"];
            }
            reader1.Close();

            string zaszyfrowane_haslo = SzyfrujHaslo(NoweHaslo, przechowywana_sol);

            string query2 = "UPDATE Tabela_RL SET Haslo = @Haslo WHERE Id = @userId";
            SqlCommand command2 = new SqlCommand(query2, connection);
            command2.Parameters.AddWithValue("@Haslo", zaszyfrowane_haslo);
            command2.Parameters.AddWithValue("@userId", userId);
            command2.ExecuteNonQuery();

            connection.Close();
            InfoLabelPL2.Text = "Hasło zostało zmienione na: " + NoweHaslo + ".Zaloguj się ponownie!";
            string redirectScript = "setTimeout(function() { window.location.href = 'Logowanie.aspx'; }, 2000);";
            ClientScript.RegisterStartupScript(this.GetType(), "RedirectScript", redirectScript, true);
        }

        protected void Mode_Click(object sender, EventArgs e)
        {
            Session["DarkMode"] = !(bool)Session["DarkMode"];
            string email = Request.QueryString["email"];
            string haslo = Request.QueryString["haslo"];
            int id = Convert.ToInt32(IdLabel.Text);
            Response.Redirect("PomyslneLog.aspx?email=" + email + "&haslo=" + haslo);
        }
    }
}