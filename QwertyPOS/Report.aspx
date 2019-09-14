<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="QwertyPOS.Report" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <title>Transaction Report | Qwerty Kicks</title>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#txtDate").datepicker({

                dateFormat: 'yy/mm/dd'
            });

            $("#txtDate2").datepicker({

                dateFormat: 'yy/mm/dd'
            });

        });
    </script>
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidenav {
            height: 100%;
            width: 160px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #292b2c;
            overflow-x: hidden;
            padding-top: 50px;
        }

            .sidenav a {
                padding: 6px 8px 6px 16px;
                text-decoration: none;
                font-size: 16px;
                color: #f1f1f1;
                display: block;
            }

                .sidenav a:hover {
                    color: #808080;
                }

        .main {
            margin-left: 160px; /* Same as the width of the sidenav */
            font-size: 18px; /* Increased text to enable scrolling */
            padding: 20px;
        }

        @media screen and (max-height: 450px) {
            .sidenav {
                padding-top: 15px;
            }

                .sidenav a {
                    font-size: 16px;
                }
        }
    </style>
</head>
<body>
    <div class="sidenav">

         <!--Admin Nav -->
        <a href="Admin.aspx">
            <img alt="Qwerty Kicks Logo" src="Images/home-white.png" height="15" />
            Home</a>
        <a href="AddProducts_Test.aspx">
            <img alt="Qwerty Kicks Logo" src="Images/product-white.png" height="15" />
            Add Products</a>
        
        <a href="Report.aspx">
            <img alt="Qwerty Kicks Logo" src="Images/time-white.png" height="15" />
            Transactions</a>
        <a href="FinanceReport.aspx"><img alt="Qwerty Kicks Logo" src="Images/iconmonstr-trophy-7-240.png" height="15" /> Top 3 Items</a>
            <a href="ProductReport.aspx">
            <img alt="Qwerty Kicks Logo" src="Images/iconmonstr-error-5-240.png" height="15" />
            Out of Stock</a>
        <a href="Report2.aspx">
            <img alt="Qwerty Kicks Logo" src="Images/down-arrow-white.png" height="15" />
            Low Quantity</a>   

    </div>

    <div class="main">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <a class="navbar-brand" <span>
                            <img alt="Qwerty Kicks Logo" src="Images/QwertyKicksYellow_LightBackground.png" height="100" /></span> Qwerty Kicks</a>
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="navbar-nav">
                            </ul>
                            <ul class="navbar-nav ml-md-auto">
                                <li class="nav-item active">
                                    <a class="nav-link" href="Login.aspx">Sign out <span class="sr-only">(current)</span></a>
                                </li>
                                <!-- Admin Help button -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="AdminHelp.aspx" id="navbarDropdownMenuLink" data-toggle="dropdown">Help </a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                        <a class="dropdown-item" href="AdminHelp.aspx">Help / FAQ</a>
                                        <!--<a class="dropdown-item" href="#">Separated link</a> -->
                                        <!-- Keeping the above seperated link in case it's useful later - Nick -->
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </nav>
                    <div class="jumbotron">
                        <img alt="Qwerty Kicks Logo" src="Images/barcode.png" height="50" />
                        <h2>Transaction History
                        </h2>
                        <p>
                            Transaction history provides a report of all transactions that have taken place within a specified date range.
                        </p>
                    </div>
                     </div>
                 </div>
             </div>
         </div>
                    <div class="main">
                        <div class="col-md-5">
                            <p>
                                Select the dates for which you would like to run a transaction history report below.
                            </p>
                        </div>
                    </div>
                    <div class="main">
                        <div class="col-md-5">
                            <form id="form1" runat="server">
                                <div>
                                    <asp:Label ID="lblStart" runat="server">Start Date:</asp:Label>
                                    <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                                    <asp:Label ID="lblEnd" runat="server">End Date:</asp:Label>
                                    <asp:TextBox ID="txtDate2" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnApply" runat="server" Class="btn btn-dark" Text="Apply" OnClick="btnApply_Click" />
                                    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True">
                                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                        <EditRowStyle BackColor="#999999" />
                                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

                                    </asp:GridView>
                                </div>
                            </form>
                            <asp:Label ID="lblprice" runat="server"></asp:Label>
                        </div>
                    </div>
</body>
</html>
