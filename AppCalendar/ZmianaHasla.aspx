<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ZmianaHasla.aspx.cs" Inherits="AppCalendar.ZmianaHasla" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" <%= (Session["DarkMode"] != null && (bool)Session["DarkMode"]) ? "class=\"darkmode\" data-bs-theme=\"dark\"" : "" %>>
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Zmiana hasła</title>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <form id="form1" method="post" runat="server">
        <div draggable="auto">
            <div class="container">
                <header
                    class="d-flex flex-wrap align-items-right justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                    <div class="mb-md-0">
                        <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
                            <li><a href="https://localhost:44360/PomyslneLog.aspx" class="nav-link px-2">Strona główna</a></li>
                            <li><a href="https://localhost:44360/WidokKalendarza.aspx" class="nav-link px-2">Kalendarz</a></li>
                            <li><a href="https://localhost:44360/ListaToDo.aspx" class="nav-link px-2">Lista to do</a></li>
                            <li><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx" class="nav-link px-2">Udostępnione Tobie Wydarzenia</a></li>
                            <li><a href="https://localhost:44360/Szukaj.aspx" class="nav-link px-2">Wyszukiwanie</a></li>
                        </ul>
                    </div>
                    <div class="d-flex gap-2">
                        <asp:Button ID="Button2" CssClass="btn btn-outline-primary me-2" runat="server" Text="Wyloguj" OnClick="WylogujButton_Click" UseSubmitBehavior="False" />
                        <asp:Button ID="Mode" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" UseSubmitBehavior="False" />
                    </div>
                </header>
            </div>

            <div class="d-flex align-items-center py-5">
                <div class="form-signin w-25 m-auto">
                    <h1 class="h3 mb-3 fw-normal text-primary">Zmiana hasła</h1>

                    <div class="form-floating">
                        <asp:TextBox ID="AktualneHasloBoxZH" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <label for="AktualneHasloBoxZH">Aktualne hasło</label>
                    </div>
                    <div class="form-floating">
                        <asp:TextBox ID="NoweHasloBoxZH" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <label for="NoweHasloBoxZH">Nowe hasło</label>
                    </div>

                    <div class="form-floating">
                        <asp:TextBox ID="PowtorzNoweHasloBoxZH" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <label for="PowtorzNoweHasloBoxL">Powtórz nowe hasło</label>
                    </div>

                    <asp:Button ID="ZmienHasloButton" runat="server" class="btn btn-primary w-100 py-2 " Text="Zmień hasło" OnClick="ZmienHasloButton_Click" />

                    <asp:Label ID="InfoLabelZH" runat="server" class="h5 mb-3 fw-normal text-primary" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>

</html>
