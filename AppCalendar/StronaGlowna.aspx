<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StronaGlowna.aspx.cs" Inherits="AppCalendar.StronaGlowna" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" <%= (Session["DarkMode"] != null && (bool)Session["DarkMode"]) ? "class=\"darkmode\" data-bs-theme=\"dark\"" : "" %>>
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Strona Główna</title>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <form id="form1" runat="server">
        <div draggable="auto">
            <div class="container">
                <header
                    class="d-flex align-items-right justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                    <div class="mb-md-0">
                        <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
                            <li><a href="https://localhost:44360/Logowanie.aspx" class="nav-link px-2">Zaloguj</a></li>
                            <li><a href="https://localhost:44360/Rejestracja.aspx" class="nav-link px-2">Zarejestruj</a></li>
                        </ul>
                    </div>
                    <div class="d-grid gap-2">
                        <asp:Button ID="Mode" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" UseSubmitBehavior="False" />
                    </div>

                </header>
            </div>
            <div class="container">
                <div class="col">
                    <div class="row">
                        <div class="text-center">
                            <h1 class="display-4 text-primary">KALENDARZ</h1>
                        </div>
                    </div>
                    <div class="row">
                        <div class="text-center">
                            <p class="fs-5 text-primary">Zapisuj wszystkie swoje zadania i wydarzenia w jednym miejscu.</p>
                        </div>
                    </div>
                </div>
            </div>
    </form>
</body>
</html>

