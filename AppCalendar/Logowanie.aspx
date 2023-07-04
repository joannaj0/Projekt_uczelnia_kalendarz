<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logowanie.aspx.cs" Inherits="AppCalendar.Logowanie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Logowanie</title>
    <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"])
        { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% }
    else
    { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>
        <link href="StylPanel.css" rel="stylesheet">
</head>

    <body class="d-flex align-items-center py-5">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>


    <main class="form-signin w-25 m-auto">
        <form id="form1" runat="server">

            <h1 class="h3 mb-3 fw-normal text-primary">Logowanie</h1>

            <div class="form-floating">
                <asp:TextBox ID="EmailBoxL" class="form-control" runat="server" TextMode="Email"></asp:TextBox>
      <label for="EmailBoxL">E-mail</label>
            </div>
            <div class="form-floating">
                    <asp:TextBox ID="HasloBoxL" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                <label for="HasloBoxL">Hasło</label>
            </div>

            <asp:Button ID="ZalogujButton" runat="server" class="btn btn-primary w-100 py-2" Text="Zaloguj" OnClick="ZalogujButton_Click" />

            <asp:Label ID="InfoLabelL" runat="server" class="h5 mb-3 fw-normal text-primary" Text=""></asp:Label>
        </form>
    </main>
</body>

</html>
