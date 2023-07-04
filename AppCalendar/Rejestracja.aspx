<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rejestracja.aspx.cs" Inherits="AppCalendar.Rejestracja" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Rejestracja</title>
     <% if (Session["DarkMode"] != null && (bool)Session["DarkMode"]) { %>
    <link rel="stylesheet" href="Styl.css" type="text/css" />
    <% } else { %>
    <link rel="stylesheet" href="Darkmode.css" type="text/css" />
    <% } %>
</head>

<body>
    <form id="form1" runat="server">
        <div class="STRONA">
        <div class="BOX">
        <p style="font-size: 40px;font-family: serif; text-align: initial; font-weight: bold">Rejestracja</p>
            <table style="width: 100%;">
            <tbody style="font-family: serif; font-size: 20px">
                <tr>
                    <td stle="padding: 18px; ">E-mail: </td>
                    <td>
                        <asp:TextBox ID="EmailBoxR" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td stle="padding: 18px; ">Hasło: </td>
                    <td><asp:TextBox ID="HasloBoxR" runat="server" TextMode="Password"></asp:TextBox></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td></td>
                    <td><asp:Button ID="ZarejestrujButton" runat="server" class="BUTTON" Text="Zarejestruj" OnClick="ZarejestrujButton_Click" /></td>
                </tr>
            </tbody>
            </table>
            <asp:Label ID="InfoLabelR" runat="server" Text=""></asp:Label>
        </div>
        </div>
    </form>
</body>

</html>
