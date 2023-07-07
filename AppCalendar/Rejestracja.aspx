<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rejestracja.aspx.cs" Inherits="AppCalendar.Rejestracja" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" <%= (Session["DarkMode"] != null && (bool)Session["DarkMode"]) ? "class=\"darkmode\" data-bs-theme=\"dark\"" : "" %>>
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Rejestracja</title>

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
                        <ul class="nav col-12 col-md-auto justify-content-center mb-md-0">
                            <li><a href="https://localhost:44360/StronaGlowna.aspx" class="nav-link px-2">Strona główna</a></li>
                        </ul>
                    </div>
                    <div class="d-grid gap-2">
                        <asp:Button ID="Mode" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" UseSubmitBehavior="False" />
                    </div>
                </header>
            </div>
            <div class="d-flex align-items-center py-5">
                <div class="form-signin w-25 m-auto">
                    <h1 class="h3 mb-3 fw-normal text-primary">Rejestracja</h1>

                    <div class="form-floating">
                        <asp:TextBox ID="EmailBoxR" class="form-control" runat="server" TextMode="Email"></asp:TextBox>
                        <label for="EmailBoRL">E-mail</label>
                    </div>
                    <div class="form-floating">
                        <asp:TextBox ID="HasloBoxR" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
                        <label for="HasloBoxR">Hasło</label>
                    </div>
                    <asp:Button ID="ZarejestrujButton" runat="server" class="btn btn-primary w-100 py-2" Text="Zarejestruj" OnClick="ZarejestrujButton_Click" />
                    <asp:Label ID="InfoLabelR" class="h5 mb-3 fw-normal text-primary" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
