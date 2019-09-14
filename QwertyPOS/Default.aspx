<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="QwertyPOS.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <title>Home | Qwerty Kicks</title>
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
    <form id="form1" runat="server">
        <div class="sidenav">
            <!--Employee Only Nav -->
            <a href="Default.aspx"><img alt="Qwerty Kicks Logo" src="Images/home-white.png" height="15" />  Home</a>
            <a href="SellPage_Test.aspx"><img alt="Qwerty Kicks Logo" src="Images/make-sale-white.png" height="15" />  Make Sale</a>
            <a href="Restock.aspx"><img alt="Qwerty Kicks Logo" src="Images/restock-white.png" height="15" />  Restock</a>

        </div>

        <div class="main">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12">
                        <nav class="navbar navbar-expand-lg navbar-light bg-light">
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <a class="navbar-brand"> <span><img alt="Qwerty Kicks Logo" src="Images/QwertyKicksYellow_LightBackground.png" height="100"/> Qwerty Kicks</span></a>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="navbar-nav">
                                </ul>
                                <ul class="navbar-nav ml-md-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="Login.aspx"> Sign Out <span class="sr-only">(current)</span></a>
                                    </li>
                                    <!-- Employee Help button -->
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="EmployeeHelp.aspx" id="navbarDropdownMenuLink" data-toggle="dropdown"> Help </a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="EmployeeHelp.aspx">Help / FAQ</a> 
                                            <!--<a class="dropdown-item" href="#">Separated link</a> -->
                                            <!-- Keeping the above seperated link in case it's useful later - Nick -->
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                        <div class="jumbotron">
                            <asp:label id="lblSuccess" runat="server" Font-Bold="true" Font-Size="XX-Large"></asp:label>
                            
                            <p>
                                You look great today. I'm not surprised, Qwerty employees are the best around.
                                Ready to sell some shoes? Select an item below to get started making your customer's day.
                            </p>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <!-- Make a Sale-->
                    <div class="col-md-5">
                        <img alt="Make a Sale" src="Images/payment-method.png" height="150" />
                        <p></p>
                        <h2>Make a Sale
                        </h2>
                        <p>
                           Go here to start a transaction and make a sale
                        </p>
                        <a class="btn btn-dark" href="SellPage_Test.aspx" role="button">Make a Sale</a>
                    </div>
                    <!-- Restock Inventory-->
                    <div class="col-md-5">
                        <img alt="Restock Inventory" src="Images/purchase.png" height="150" />
                        <p></p>
                        <h2>Restock Inventory
                        </h2>
                        <p>
                            Go here to restock inventory 
                        </p>
                        <a class="btn btn-dark" href="Restock.aspx" role="button">Restock Inventory</a>
                    </div>
                </div>
            </div>
        </div>


    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>
