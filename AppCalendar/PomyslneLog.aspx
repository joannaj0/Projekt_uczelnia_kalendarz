<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PomyslneLog.aspx.cs" Inherits="AppCalendar.PomyslneLog" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" <%= (Session["DarkMode"] != null && (bool)Session["DarkMode"]) ? "class=\"darkmode\" data-bs-theme=\"dark\"" : "" %>>
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous"> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Zalogowano</title>

</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
        <form id="form1" runat="server">
        <div class="container">
            <header
                class="d-flex flex-wrap align-items-right justify-content-center justify-content-md-between py-3 mb-4 border-bottom">
                <div class="mb-md-0">
                    <ul class="nav col-12 col-md-auto mb-2 justify-content-center mb-md-0">
                        <li><a href="https://localhost:44360/WidokKalendarza.aspx" class="nav-link px-2">Kalendarz</a></li>
                        <li><a href="https://localhost:44360/ListaToDo.aspx" class="nav-link px-2">Lista to do</a></li>
                        <li><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx" class="nav-link px-2">Udostępnione Tobie Wydarzenia</a></li>
                        <li><a href="https://localhost:44360/Szukaj.aspx" class="nav-link px-2">Wyszukiwanie</a></li>
                    </ul>
                </div>
                <div class="d-flex gap-2">
                    <asp:Button ID="Button2" CssClass="btn btn-outline-primary me-2" runat="server" Text="Wyloguj" OnClick="WylogujButton_Click" UseSubmitBehavior="False" />
                    <asp:Button ID="Button3" CssClass="btn btn-outline-secondary me-2" runat="server" Text="Usuń konto" OnClick="UsunKontoButton_Click" UseSubmitBehavior="False" />
                             <asp:Button ID="Button1" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" UseSubmitBehavior="False" />
                </div>

            </header>
        </div>

        <div class="m-auto col-lg-4 order-md-last">
            <h4 class="d-flex justify-content-between align-items-center mb-3">
                <span class="text-primary">Zalogowano pomyślnie</span>
            </h4>
            <ul class="list-group mb-3">
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">Id</h6>
                        <asp:Label ID="IdLabel" class="text-body-secondary" runat="server" Text=" "></asp:Label>
                    </div>
                </li>
                <li class="list-group-item d-flex justify-content-between lh-sm">
                    <div>
                        <h6 class="my-0">E-mail</h6>
                        <asp:Label ID="EmailLabel" class="text-body-secondary" runat="server" Text=" " Style="margin-right: 10px;"></asp:Label>
                        <asp:Button ID="EdytujEmailButton" class="btn btn-outline-secondary me-2" runat="server" Text="Edytuj" Visible="true" Style="margin-left: 10px;" OnClick="EdytujEmailButton_Click" />
                     
                            <div class="input-group">
                              
                                <asp:TextBox ID="WpiszNowyEmailBox" class="form-control" runat="server" Visible="false"></asp:TextBox>
                                <asp:Button ID="ZapiszEdycjeEButton" class="btn btn-secondary" runat="server" Text="Zapisz" Visible="false" OnClick="ZapiszEdycjeEButton_Click" />
                            </div>

    <asp:Label ID="InfoLabelPL1" runat="server" Text=""></asp:Label>
    </div>
          </li>
          <li class="list-group-item d-flex justify-content-between lh-sm">
              <div>
                  <h6 class="my-0">Hasło</h6>
                  <asp:Label ID="HasloLabel" class="text-body-secondary" runat="server" Text=" " Style="margin-right: 10px;">
                  </asp:Label><asp:Button ID="EdytujHasloButton" class="btn btn-outline-secondary me-2" runat="server" Text="Edytuj" Visible="true" Style="margin-left: 10px;" OnClick="EdytujHasloButton_Click" />
           
                            <div class="input-group">
         
                  <asp:TextBox ID="WpiszNoweHasloBox" class="form-control" runat="server" Visible="false"></asp:TextBox>
                  <asp:Button ID="ZapiszEdycjeHButton" class="btn btn-secondary" runat="server" Text="Zapisz" Visible="false" OnClick="ZapiszEdycjeHButton_Click" />
                                         </div>
  
                  <asp:Label ID="InfoLabelPL2" runat="server" Text=""></asp:Label>
              </div>
              <asp:Label ID="InfoLabelPL3" runat="server" Text=""></asp:Label>
          </li>
    </ul>
        </div>
  </form>
</body>

</html>


