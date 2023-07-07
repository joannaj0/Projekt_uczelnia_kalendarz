<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="Udostepnianie.aspx.cs" Inherits="AppCalendar.Udostepnianie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" <%= (Session["DarkMode"] != null && (bool)Session["DarkMode"]) ? "class=\"darkmode\" data-bs-theme=\"dark\"" : "" %>>
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

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
                     <div class="d-flex gap-2">
                        <asp:Button ID="Button2" CssClass="btn btn-outline-primary me-2" runat="server" Text="Wyloguj" OnClick="WylogujButton_Click" UseSubmitBehavior="False" />
                           <asp:Button ID="Mode" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" UseSubmitBehavior="False" />
                  
                     </div>
                </header>
                
                <div class="col-xxl-4">
                <p>
                    <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Twoje wydarzenie: "></asp:Label><br />
                    <asp:Label ID="NazwaLabel" runat="server" Text="Nazwa:      " Visible="true"></asp:Label><asp:Label ID="NazwaLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="DataLabel" runat="server" Text="Data:     " Visible="true"></asp:Label><asp:Label ID="DataLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="GodzinaLabel" runat="server" Text="Godzina:     " Visible="true"></asp:Label><asp:Label ID="GodzinaLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="OpisLabel" runat="server" Text="Opis:     " Visible="true"></asp:Label><asp:Label ID="OpisLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="MiejsceLabel" runat="server" Text="Miejsce:     " Visible="true"></asp:Label><asp:Label ID="MiejsceLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="KategoriaLabel" runat="server" Text="Kategoria:     " Visible="true"></asp:Label><asp:Label ID="KategoriaLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="GoscieLabel" runat="server" Text="Goście:     " Visible="true"></asp:Label><asp:Label ID="GoscieLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="NotatkaLabel" runat="server" Text="Notatka:     " Visible="true"></asp:Label><asp:Label ID="NotatkaLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="KolorLabel" runat="server" Text="Kolor:     " Visible="true"></asp:Label><asp:Label ID="KolorLabelDane" runat="server" Text=""></asp:Label><br />
                    <asp:Label ID="PriorytetLabel" runat="server" Text="Prioryet:     " Visible="true"></asp:Label><asp:Label ID="PriorytetLabelDane" runat="server" Text=""></asp:Label><br />
                </p>
                <p>
                    <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Wybierz osobę/y której/ym chcesz udostępnić to wydarzenie: "></asp:Label>
                    <asp:CheckBoxList ID="CheckBoxListOsoby" runat="server"></asp:CheckBoxList><br />
                    <asp:Button ID="ButtonUdostepnij" CssClass="btn btn-outline-primary col-12" runat="server" Text="Udostępnij" OnClick="ButtonUdostepnij_Click" /><br />
                    <asp:Label ID="InfoLabel" class="h5 mb-3 fw-normal text-primary" runat="server" Text=""></asp:Label>
                </p>
                    </div>
            </div>
        </div>
    </form>
</body>
</html>

