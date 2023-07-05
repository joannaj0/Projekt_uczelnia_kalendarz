<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="EdycjaDanych.aspx.cs" Inherits="AppCalendar.EdycjaDanych" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Edycja Danych</title>
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
                            <li><a href="https://localhost:44360/WidokKalendarza.aspx" class="nav-link px-2">Kalendarz</a></li>
                            <li><a href="https://localhost:44360/ListaToDo.aspx" class="nav-link px-2">Lista to do</a></li>
                            <li><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx" class="nav-link px-2">Udostępnione Tobie Wydarzenia</a></li>
                            <li><a href="https://localhost:44360/Szukaj.aspx" class="nav-link px-2">Wyszukiwanie</a></li>
                        </ul>
                    </div>
                </header>


                <div class="col">
                    <div class="row">
                        <asp:Label ID="NazwaLabel" class="form-label" runat="server" Text="Nazwa:      " Visible="true"></asp:Label><asp:TextBox ID="NazwaBox" class="form-control" runat="server" Visible="true"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="DataLabel" class="form-label" runat="server" Text="Data:     " Visible="true"></asp:Label><asp:TextBox ID="DataBox" class="form-control" runat="server" TextMode="Date" Visible="true"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="GodzinaLabel" class="form-label" runat="server" Text="Godzina:     " Visible="true"></asp:Label><asp:TextBox ID="GodzinaBox" class="form-control" runat="server" TextMode="Time" Visible="true"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="OpisLabel" class="form-label" runat="server" Text="Opis:     " Visible="true"></asp:Label><asp:TextBox ID="OpisBox" class="form-control" runat="server" Visible="true"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="MiejsceLabel" class="form-label" runat="server" Text="Miejsce:     " Visible="true"></asp:Label><asp:TextBox ID="MiejsceBox" class="form-control" runat="server" Visible="true"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="KategoriaLabel" class="form-label" runat="server" Text="Kategoria:     " Visible="true"></asp:Label><asp:DropDownList ID="KategoriaList" class="form-control" runat="server" Visible="true"></asp:DropDownList><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="GoscieLabel" class="form-label" runat="server" Text="Goście:     " Visible="true"></asp:Label><asp:TextBox ID="GoscieBox" class="form-control" runat="server" Visible="true"></asp:TextBox><br />
                    </div>
                    <div class="row">
                        <asp:Label ID="NotatkaLabel" class="form-label" runat="server" Text="Notatka:     " Visible="true"></asp:Label><asp:TextBox ID="NotatkaBox" class="form-control" runat="server" Visible="true"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="KolorLabel" class="form-label" runat="server" Text="Kolor:     " Visible="true"></asp:Label><asp:TextBox ID="KolorBox" class="form-control" runat="server" TextMode="Color" Visible="true"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Label ID="PriorytetLabel" class="form-label" runat="server" Text="Prioryet:     " Visible="true"></asp:Label><asp:TextBox ID="PriorytetBox" class="form-control" runat="server" TextMode="Number" Visible="true" Min="1" Max="10"></asp:TextBox><br />
                    </div>

                    <div class="row">
                        <asp:Button ID="ZapiszEdycjeButtonPW" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="ZapiszEdycjeButtonPW_Click" Text="Zapisz" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
