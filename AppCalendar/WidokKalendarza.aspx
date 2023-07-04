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
                <asp:Calendar ID="Kalendarz" runat="server" OnSelectionChanged="Kalendarz_SelectionChanged" DayRender="Kalendarz_DayRender" Height="238px" Width="1250px"></asp:Calendar>

                <asp:Button ID="DodajWydarzenieButton" CssClass="btn btn-outline-primary me-2" runat="server" Text="Dodaj wydarzenie" Visible="false" OnClick="DodajWydarzenieButton_Click" />
                <asp:Label ID="NazwaLabel" runat="server" Text="Nazwa:      " Visible="false"></asp:Label><asp:TextBox ID="NazwaBox" runat="server" Visible="false"></asp:TextBox>
                <br />
                <asp:Label ID="DataLabel" runat="server" Text="Data:     " Visible="false"></asp:Label><asp:TextBox ID="DataBox" runat="server" TextMode="Date" Visible="false"></asp:TextBox><br />
                <asp:Label ID="GodzinaLabel" runat="server" Text="Godzina:     " Visible="false"></asp:Label><asp:TextBox ID="GodzinaBox" runat="server" TextMode="Time" Visible="false"></asp:TextBox><br />
                <asp:Label ID="OpisLabel" runat="server" Text="Opis:     " Visible="false"></asp:Label><asp:TextBox ID="OpisBox" runat="server" Visible="false"></asp:TextBox><br />
                <asp:Label ID="MiejsceLabel" runat="server" Text="Miejsce:     " Visible="false"></asp:Label><asp:TextBox ID="MiejsceBox" runat="server" Visible="false"></asp:TextBox><br />
                <asp:Label ID="KategoriaLabel" runat="server" Text="Kategoria:     " Visible="false"></asp:Label><asp:DropDownList ID="KategoriaList" runat="server" Visible="false"></asp:DropDownList><br />
                <asp:Label ID="GoscieLabel" runat="server" Text="Goście:     " Visible="false"></asp:Label><asp:TextBox ID="GoscieBox" runat="server" Visible="false"></asp:TextBox><br />
                <asp:Label ID="NotatkaLabel" runat="server" Text="Notatka:     " Visible="false"></asp:Label><asp:TextBox ID="NotatkaBox" runat="server" Visible="false"></asp:TextBox><br />
                <asp:Label ID="KolorLabel" runat="server" Text="Kolor:     " Visible="false"></asp:Label><asp:TextBox ID="KolorBox" runat="server" TextMode="Color" Visible="false"></asp:TextBox><br />
                <asp:Label ID="PriorytetLabel" runat="server" Text="Priorytet:     " Visible="false"></asp:Label><asp:TextBox ID="PriorytetBox" runat="server" TextMode="Number" Visible="false" Min="1" Max="10"></asp:TextBox><br />
                <asp:Button ID="ZapiszButton" CssClass="btn btn-outline-primary me-2" runat="server" Text="Zapisz" Visible="false" OnClick="ZapiszButton_Click" />
                <asp:Label ID="InfoLabelDW" class="h5 mb-3 fw-normal text-primary" runat="server" Text=""></asp:Label>

  
                    <asp:Label ID="LabelDzisiaj" class="h5 mb-3 fw-normal text-primary" runat="server" Text="Dzisiaj" Visible="True"></asp:Label>
             

            </div>
        </div>
    </form>
</body>
</html>

