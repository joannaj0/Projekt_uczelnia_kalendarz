<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WidokKalendarza.aspx.cs" Inherits="AppCalendar.WidokKalendarza" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Twój kalendarz</title>
    <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"])
        { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% }
        else
        { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>

    <style>
        table#Kalendarz tr:nth-child(2) th {
            background-color: powderblue;
        }

        table#Kalendarz {
            font-family: "Segoe UI";
        }
    </style>
</head>
<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
    <form id="form1" runat="server">
        <div draggable="auto">
            <div class="container">
                <header
                    class="d-flex flex-wrap align-items-right justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                    <div class="mb-md-0">
                        <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                            <li><a href="https://localhost:44360/PomyslneLog.aspx" class="nav-link px-2">Strona główna</a></li>
                            <li><a href="https://localhost:44360/ListaToDo.aspx" class="nav-link px-2">Lista to do</a></li>
                            <li><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx" class="nav-link px-2">Udostępnione Tobie Wydarzenia</a></li>
                            <li><a href="https://localhost:44360/Szukaj.aspx" class="nav-link px-2">Wyszukiwanie</a></li>
                        </ul>
                    </div>

                    <div class="d-grid gap-2">
                        <asp:Button ID="Mode" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" />
                    </div>
                </header>

                <div class="row">

                    <div class="col-xxl-12">
                        <asp:Calendar ID="Kalendarz" runat="server" OnSelectionChanged="Kalendarz_SelectionChanged" DayRender="Kalendarz_DayRender"></asp:Calendar>
                    </div>
                </div>

                <script>
                    var d = document.getElementById("Kalendarz");
                    d.className += "table table-bordered text-center ";
                </script>

                <div class="row">
                    <div class="col-xxl-12">
                        <asp:Button ID="DodajWydarzenieButton" CssClass="btn btn-outline-primary me-2" runat="server" Text="Dodaj wydarzenie" Visible="false" OnClick="DodajWydarzenieButton_Click" />
                    </div>
                </div>

                <div id="div_formularz" runat="server">

                    <div class="row">
                        <div class="col-xxl-12">
                            <label for="NazwaBox" class="form-label">Nazwa:</label>
                            <asp:TextBox ID="NazwaBox" class="form-control" runat="server"></asp:TextBox><br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-6">
                            <label for="DataBox" class="form-label">Data:</label>
                            <asp:TextBox ID="DataBox" class="form-control" runat="server" TextMode="Date"></asp:TextBox><br />
                        </div>

                        <div class="col-xxl-6">
                            <label for="GodzinaBox" class="form-label">Godzina:</label>
                            <asp:TextBox ID="GodzinaBox" class="form-control" runat="server" TextMode="Time"></asp:TextBox><br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-12">
                            <label for="OpisBox" class="form-label">Opis:</label>
                            <asp:TextBox ID="OpisBox" class="form-control" runat="server"></asp:TextBox><br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-12">
                            <label for="MiejsceBox" class="form-label">Miejsce:</label>
                            <asp:TextBox ID="MiejsceBox" class="form-control" runat="server"></asp:TextBox><br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-12">
                            <label for="KategoriaBox" class="form-label">Kategoria:</label>
                            <asp:DropDownList ID="KategoriaList" class="form-control" runat="server"></asp:DropDownList><br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-12">
                            <label for="GoscieBox" class="form-label">Goscie:</label>
                            <asp:TextBox ID="GoscieBox" class="form-control" runat="server"></asp:TextBox><br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-12">
                            <label for="NotatkaBox" class="form-label">Notatka:</label>
                            <asp:TextBox ID="NotatkaBox" class="form-control" runat="server"></asp:TextBox><br />
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xxl-6">
                            <label for="KolorBox" class="form-label">Kolor:</label>
                            <asp:TextBox ID="KolorBox" class="form-control" runat="server" TextMode="Color"></asp:TextBox><br />
                        </div>

                        <div class="col-xxl-6">
                            <label for="PriorytetBox" class="form-label">Priorytet:</label>
                            <asp:TextBox ID="PriorytetBox" class="form-control" runat="server" TextMode="Number" Min="1" Max="10"></asp:TextBox><br />
                        </div>
                    </div>
                    <asp:Button ID="ZapiszButton" CssClass="w-100 btn btn-outline-primary btn-lg" runat="server" Text="Zapisz" OnClick="ZapiszButton_Click" />
                </div>
                <br />
                <div class="row">
                    <div class="col-xxl-12">
                        <asp:Label ID="LabelDzisiaj" class="h5 mb-3 fw-normal text-primary" runat="server" Text="Dzisiaj" Visible="True"></asp:Label>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xxl-12">
                        <div id="div_dzisiaj" class="row" runat="server"></div>
                    </div>
                </div>

            </div>
        </div>
    </form>
</body>
</html>

