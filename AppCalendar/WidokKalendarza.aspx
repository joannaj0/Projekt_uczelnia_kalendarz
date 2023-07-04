<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WidokKalendarza.aspx.cs" Inherits="AppCalendar.WidokKalendarza" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Twój kalendarz</title>
    <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"]) { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% } else { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>
</head>
<body>
     <form id="form1" runat="server">
         <div draggable="auto">
            <p style="font-size: 16px; font-family: serif;"><a href="https://localhost:44360/PomyslneLog.aspx">Strona główna | </a> <a href="https://localhost:44360/ListaToDo.aspx"> Lista to do | </a> <a href="https://localhost:44360/Szukaj.aspx"> Szukaj wydarzenia | </a><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx"> Udostępnione Tobie Wydarzenia </a></p>
            <asp:Calendar ID="Kalendarz" runat="server" OnSelectionChanged="Kalendarz_SelectionChanged"  DayRender="Kalendarz_DayRender" Height="238px" Width="1160px"></asp:Calendar>
            
            <asp:Button ID="DodajWydarzenieButton" runat="server" Text="Dodaj wydarzenie" Visible="false" OnClick="DodajWydarzenieButton_Click" />
            <asp:Label ID="NazwaLabel" runat="server" Text="Nazwa:      " Visible="false" ></asp:Label><asp:TextBox ID="NazwaBox" runat="server" Visible="false"></asp:TextBox>
            <asp:Button ID="Mode" runat="server" OnClick="Mode_Click" Text="Zmień motyw" />
             <br/>
            <asp:Label ID="DataLabel" runat="server" Text="Data:     " Visible="false" ></asp:Label><asp:TextBox ID="DataBox" runat="server" TextMode="Date" Visible="false"></asp:TextBox><br/>
            <asp:Label ID="GodzinaLabel" runat="server" Text="Godzina:     " Visible="false" ></asp:Label><asp:TextBox ID="GodzinaBox" runat="server" TextMode="Time" Visible="false"></asp:TextBox><br/>
            <asp:Label ID="OpisLabel" runat="server" Text="Opis:     " Visible="false"></asp:Label><asp:TextBox ID="OpisBox" runat="server" Visible="false"></asp:TextBox><br/>
            <asp:Label ID="MiejsceLabel" runat="server" Text="Miejsce:     " Visible="false"></asp:Label><asp:TextBox ID="MiejsceBox" runat="server" Visible="false"></asp:TextBox><br/>
            <asp:Label ID="KategoriaLabel" runat="server" Text="Kategoria:     " Visible="false"></asp:Label><asp:DropDownList ID="KategoriaList" runat="server"  Visible="false"></asp:DropDownList><br/>
            <asp:Label ID="GoscieLabel" runat="server" Text="Goście:     " Visible="false"></asp:Label><asp:TextBox ID="GoscieBox" runat="server" Visible="false"></asp:TextBox><br/>
            <asp:Label ID="NotatkaLabel" runat="server" Text="Notatka:     " Visible="false"></asp:Label><asp:TextBox ID="NotatkaBox" runat="server" Visible="false"></asp:TextBox><br/>
            <asp:Label ID="KolorLabel" runat="server" Text="Kolor:     " Visible="false"></asp:Label><asp:TextBox ID="KolorBox" runat="server" TextMode="Color" Visible="false"></asp:TextBox><br/>
            <asp:Label ID="PriorytetLabel" runat="server" Text="Priorytet:     " Visible="false"></asp:Label><asp:TextBox ID="PriorytetBox" runat="server" TextMode="Number" Visible="false" Min="1" Max="10"></asp:TextBox><br />
            <asp:Button ID="ZapiszButton" runat="server" Text="Zapisz" Visible="false" OnClick="ZapiszButton_Click" />
            <asp:Label ID="InfoLabelDW" runat="server" Text=""></asp:Label>
            
            <p style="font-size: 20px; font-family: serif; font-weight: bold; text-align: center">
                <asp:Label ID="LabelDzisiaj" runat="server" Text="Dzisiaj" Visible="True"></asp:Label>
            </p>

        </div>
    </form>
</body>
</html>

