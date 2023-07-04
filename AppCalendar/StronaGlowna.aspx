<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StronaGlowna.aspx.cs" Inherits="AppCalendar.StronaGlowna" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
 <meta http-equiv="Content-Type" content="text/html"; charset="utf-8" />
        <title>Strona Główna</title>
    <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"]) { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% } else { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center; height: 300px;">
        <p style="font-size: 70px; font-family: serif; font-weight:bold">Kalendarz</p>
        <p style="font-size: 30px; font-family: serif;"><a href="https://localhost:44360/Logowanie.aspx">Zaloguj</a></p>
        <p style="font-size: 30px; font-family: serif;"><a href="https://localhost:44360/Rejestracja.aspx">Zarejestruj</a></p>
        <p style="font-size: 30px; font-family: serif">
            <a href="https://localhost:44360/Rejestracja.aspx">
            <asp:Button ID="Mode" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" />
            </a>
        </p>
    </div>
    </form>
</body>
</html>

