<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeBehind="ListaToDo.aspx.cs" Inherits="AppCalendar.ListaToDo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Twoja Lista To Do</title>
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
                            <li><a href="https://localhost:44360/WydarzeniaUdostepnione.aspx" class="nav-link px-2">Udostępnione Tobie Wydarzenia</a></li>
                            <li><a href="https://localhost:44360/Szukaj.aspx" class="nav-link px-2">Wyszukiwanie</a></li>
                        </ul>
                    </div>

                    <div class="d-grid gap-2">
                        <asp:Button ID="Mode" CssClass="btn btn-outline-primary me-2" runat="server" OnClick="Mode_Click" Text="Zmień Motyw" />
                    </div>
                </header>
                <div class="col-lg-4 order-md-last">
                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                        <span class="text-primary">Twoja lista to do</span>
                    </h4>
                    <asp:ListView ID="ListView" runat="server" DataKeyNames="Id">
                        <ItemTemplate>
                            <ul>
                                <li <%# Convert.ToDateTime(Eval("Data")).Date < DateTime.Now.Date ? "class=\"text-danger\"" : "" %>>
                                    <div class="accordion">
                                        <div class="accordion-item">
                                            <h2 class="accordion-header">
                                                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapse<%# Eval("Id") %>" aria-expanded="false" aria-controls="collapse<%# Eval("Id") %>">
                                                    <strong>Nazwa: </strong><%# Eval("Nazwa") %>
                                                </button>
                                            </h2>
                                            <div id="collapse<%# Eval("Id") %>" class="accordion-collapse collapse">
                                                <div class="accordion-body">
                                                    <strong>Data: </strong><%# Eval("Data", "{0:d}") %>
                                                    <br />
                                                    <strong>Godzina: </strong><%# Eval("Godzina", "{0:t}") %>
                                                    <br />
                                                    <strong>Opis: </strong><%# Eval("Opis") %>
                                                    <br />
                                                    <strong>Miejsce: </strong><%# Eval("Miejsce") %>
                                                    <br />
                                                    <strong>Goście: </strong><%# Eval("Goscie") %>
                                                    <br />
                                                    <strong>Notatka: </strong><%# Eval("Notatka") %>
                                                    <br />
                                                    <strong>Kolor: </strong><span style="color: <%# Eval("Kolor").ToString() %>"><%# Eval("Kolor") %></span>
                                                    <br />
                                                    <strong>Priorytet: </strong><span style="font-weight: bold; color: red"><%# Eval("Priorytet") %></span><br />
                                                    <asp:Panel runat="server" Visible='<%# Convert.ToDateTime(Eval("Data")).Date < DateTime.Now.Date %>'>
                                                        <asp:Button ID="UsunButtonWM" CssClass="btn btn-outline-primary me-2" runat="server" Text="Usuń" OnClick="UsunButtonW_Click" CommandArgument='<%# Eval("Id") %>' />
                                                    </asp:Panel>
                                                    <asp:Panel runat="server" Visible='<%# Convert.ToDateTime(Eval("Data")).Date >= DateTime.Now.Date %>'>
                                                        <asp:Button ID="EdytujButtonW" CssClass="btn btn-outline-primary me-2" runat="server" Text="Edytuj" OnClick="EdytujButtonW_Click" CommandArgument='<%# Eval("Id") %>' />
                                                        <asp:Button ID="UsunButtonW" CssClass="btn btn-outline-primary me-2" runat="server" Text="Usuń" OnClick="UsunButtonW_Click" CommandArgument='<%# Eval("Id") %>' />
                                                        <asp:Button ID="UdostepnijButtonW" CssClass="btn btn-outline-primary me-2" runat="server" Text="Udostępnij" OnClick="UdostepnijButtonW_Click" CommandArgument='<%# Eval("Id") %>' />
                                                    </asp:Panel>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </ItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
