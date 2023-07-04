<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="WydarzeniaUdostepnione.aspx.cs" Inherits="AppCalendar.WydarzeniaUdostepnione" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Udostępnione wydarzenia</title>
     <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"]) { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% } else { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>
</head>
<body>
   <p style="font-size: 16px; font-family: serif;"><a href="https://localhost:44360/PomyslneLog.aspx">Strona główna | </a> <a href="https://localhost:44360/ListaToDo.aspx"> Lista to do | </a> <a href="https://localhost:44360/Szukaj.aspx"> Szukaj wydarzenia | </a> <a href="https://localhost:44360/WidokKalendarza.aspx"> Kalendarz </a></p>
<form id="form1" runat="server">
  <asp:Button ID="Mode" runat="server" OnClick="Mode_Click" Text="Zmień motyw" />
     <div style="display: flex; flex-direction: column; align-items: flex-start;">
        <p style="font-size: 25px; font-family: serif; font-weight: bold;">Wydarznia, które zostały dla Ciebie udostępnione:</p>
    </div>
<asp:ListView ID="ListView" runat="server" DataKeyNames="Id">
    <ItemTemplate>
    <ul>
        <li <%# Convert.ToDateTime(Eval("Data")).Date < DateTime.Now.Date ? "style=\"text-decoration: line-through\"" : "" %>>
       
            <strong>Nazwa: </strong> <%# Eval("Nazwa") %> <br />
            <strong>Data: </strong> <%# Eval("Data", "{0:d}") %> <br />
            <strong>Godzina: </strong> <%# Eval("Godzina", "{0:t}") %> <br />
            <strong>Opis: </strong> <%# Eval("Opis") %> <br />
            <strong>Miejsce: </strong> <%# Eval("Miejsce") %> <br />
            <strong>Goście: </strong> <%# Eval("Goscie") %> <br />
            <strong>Notatka: </strong> <%# Eval("Notatka") %> <br />
            <strong>Kolor: </strong><span style="color:<%# Eval("Kolor").ToString() %>"><%# Eval("Kolor") %></span> <br />
            <strong>Priorytet: </strong> <span style="font-weight:bold; color:red"><%# Eval("Priorytet") %></span><br/>
            <asp:Panel runat="server" Visible='<%# Convert.ToDateTime(Eval("Data")).Date < DateTime.Now.Date %>'>
                <asp:Button ID="UsunButtonWM" runat="server" Text="Usuń" OnClick="UsunButtonW_Click" CommandArgument='<%# Eval("Id") %>' />
            </asp:Panel>
            <asp:Panel runat="server" Visible='<%# Convert.ToDateTime(Eval("Data")).Date >= DateTime.Now.Date %>'>
                <asp:Button ID="UsunButtonW" runat="server" Text="Usuń" OnClick="UsunButtonW_Click" CommandArgument='<%# Eval("Id") %>' />
            </asp:Panel>
        </li>
    </ul>
</ItemTemplate>
</asp:ListView>
</form>
</body>
</html>
