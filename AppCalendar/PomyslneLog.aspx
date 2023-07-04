<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PomyslneLog.aspx.cs" Inherits="AppCalendar.PomyslneLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Zalogowano</title>
    <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"]) { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% } else { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>
</head>

<body>
    <form id="form1" runat="server">
        <div class="STRONA">
        <div style="height: 300px;">
        <p style="font-size: 25px; font-family: serif">Zalogowano pomyślnie!</p>
              <p style="font-size: 20px; font-family: serif;">Id: <asp:Label ID="IdLabel" runat="server" Text=" "></asp:Label></p>
              <p style="font-size: 20px; font-family: serif;">E-mail: <asp:Label ID="EmailLabel" runat="server" Text=" " style="margin-right: 10px;"></asp:Label><asp:Button ID="EdytujEmailButton" runat="server" Text="Edytuj"  Visible="true" style="margin-left: 10px;" OnClick="EdytujEmailButton_Click"/><asp:TextBox ID="WpiszNowyEmailBox" runat="server" Visible="false" ></asp:TextBox><asp:Button ID="ZapiszEdycjeEButton" runat="server" Text="Zapisz" Visible="false" OnClick="ZapiszEdycjeEButton_Click" />
                  <asp:Label ID="InfoLabelPL1" runat="server" Text=""></asp:Label>
             </p>
              <p style="font-size: 20px; font-family: serif;">Hasło: <asp:Label ID="HasloLabel" runat="server" Text=" " style="margin-right: 10px;"></asp:Label><asp:Button ID="EdytujHasloButton" runat="server" Text="Edytuj" Visible="true" style="margin-left: 10px;" OnClick="EdytujHasloButton_Click" /><asp:TextBox ID="WpiszNoweHasloBox" runat="server"  Visible="false"></asp:TextBox><asp:Button ID="ZapiszEdycjeHButton" runat="server" Text="Zapisz" Visible="false" OnClick="ZapiszEdycjeHButton_Click"/>
                  <asp:Label ID="InfoLabelPL2" runat="server" Text=""></asp:Label>
             </p>
             <asp:Button ID="WylogujButton" runat="server" Text="Wyloguj" OnClick="WylogujButton_Click" /><br/>
             <asp:Button ID="UsunKontoButton" runat="server" Text="Usuń konto" OnClick="UsunKontoButton_Click" /><br/>
             <asp:Button ID="Mode" runat="server" OnClick="Mode_Click" Text="Zmień motyw" />
             <asp:Label ID="InfoLabelPL3" runat="server" Text=""></asp:Label>
             <br/>
    <div style="text-align: center; height: 300px;">
        <p style="font-size: 30px; font-family: serif; font-weight: bold"><a href="https://localhost:44360/WidokKalendarza.aspx">Kalendarz</a></p>
        <p style="font-size: 30px; font-family: serif; font-weight: bold"><a href="https://localhost:44360/ListaToDo.aspx">Lista to do</a></p>
        <p style="font-size: 30px; font-family: serif; font-weight: bold"><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx">Udostępnione Tobie wydarzenia</a></p>
        <p style="font-size: 30px; font-family: serif; font-weight: bold"><a href="https://localhost:44360/Szukaj.aspx">Wyszukaj wydarzenie</a></p>
    </div>
         </div>
        </div>
    </form>
</body>

</html>


