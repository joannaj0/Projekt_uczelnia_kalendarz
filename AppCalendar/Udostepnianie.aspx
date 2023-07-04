<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="Udostepnianie.aspx.cs" Inherits="AppCalendar.Udostepnianie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Udostępnianie wydarzeń</title>
     <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"]) { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% } else { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>
</head>
<body>
     <p style="font-size: 16px; font-family: serif;"><a href="https://localhost:44360/PomyslneLog.aspx">Strona główna | </a> <a href="https://localhost:44360/ListaToDo.aspx"> Lista to do | </a> <a href="https://localhost:44360/Szukaj.aspx"> Szukaj wydarzenia | </a> <a href="https://localhost:44360/WidokKalendarza.aspx"> Kalendarz | </a><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx"> Udostępnione Tobie Wydarzenia </a></p>
    <form id="form1" runat="server">
         <asp:Label ID="Label1" runat="server" Font-Bold="true" Text="Twoje wydarzenie: "></asp:Label><br />
        <asp:Label ID="NazwaLabel" runat="server" Text="Nazwa:      " Visible="true" ></asp:Label><asp:Label ID="NazwaLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="DataLabel" runat="server" Text="Data:     " Visible="true" ></asp:Label><asp:Label ID="DataLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="GodzinaLabel" runat="server" Text="Godzina:     " Visible="true" ></asp:Label><asp:Label ID="GodzinaLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="OpisLabel" runat="server" Text="Opis:     " Visible="true"></asp:Label><asp:Label ID="OpisLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="MiejsceLabel" runat="server" Text="Miejsce:     " Visible="true"></asp:Label><asp:Label ID="MiejsceLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="KategoriaLabel" runat="server" Text="Kategoria:     " Visible="true"></asp:Label><asp:Label ID="KategoriaLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="GoscieLabel" runat="server" Text="Goście:     " Visible="true"></asp:Label><asp:Label ID="GoscieLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="NotatkaLabel" runat="server" Text="Notatka:     " Visible="true"></asp:Label><asp:Label ID="NotatkaLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="KolorLabel" runat="server" Text="Kolor:     " Visible="true"></asp:Label><asp:Label ID="KolorLabelDane" runat="server" Text=""></asp:Label><br/>
            <asp:Label ID="PriorytetLabel" runat="server" Text="Prioryet:     " Visible="true"></asp:Label><asp:Label ID="PriorytetLabelDane" runat="server" Text=""></asp:Label><br /><br />
            <asp:Label ID="Label2" runat="server" Font-Bold="true" Text="Wybierz osobę/y której/ym chcesz udostępnić to wydarzenie: "></asp:Label>
        <asp:CheckBoxList ID="CheckBoxListOsoby" runat="server"></asp:CheckBoxList>
        <asp:Button ID="ButtonUdostepnij" runat="server" Text="Udostępnij" OnClick="ButtonUdostepnij_Click" /><br/>
        <asp:Label ID="InfoLabel" runat="server" Text=""></asp:Label>
    </form>
</body>
</html>

