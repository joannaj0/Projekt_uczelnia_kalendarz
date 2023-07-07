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

            SqlConnection connection = new SqlConnection(connectionString);
            connection.Open();

            string query = "SELECT Email FROM Tabela_RL WHERE Id = @Id_uzytkownika";
            using (connection)
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Id_uzytkownika", Int32.Parse(Session["Id_uzytkownika"].ToString()));

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            IdLabel.Text = Session["Id_uzytkownika"].ToString();
                            EmailLabel.Text = reader["Email"].ToString();
                        }
                    }
                }
            }
            connection.Close();
        }

        protected void WylogujButton_Click(object sender, EventArgs e)
        {
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
            Response.Redirect("ZmianaHasla.aspx");
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

        protected void Mode_Click(object sender, EventArgs e)
        {
            Session["DarkMode"] = !(bool)Session["DarkMode"];
            Response.Redirect("PomyslneLog.aspx");
        }
    }
}