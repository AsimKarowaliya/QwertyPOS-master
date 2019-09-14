<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminHelp.aspx.cs" Inherits="QwertyPOS.AdminHelp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <title>Admin Help | Qwerty Kicks</title>
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
                            <a class="navbar-brand" <span><img alt="Qwerty Kicks Logo" src="Images/QwertyKicksYellow_LightBackground.png" height="100"/></span> Qwerty Kicks</a>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="navbar-nav">
                                </ul>
                                <ul class="navbar-nav ml-md-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="Login.aspx"> Sign out <span class="sr-only">(current)</span></a>
                                    </li>
                                    <!-- Admin Help button -->
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="AdminHelp.aspx" id="navbarDropdownMenuLink" data-toggle="dropdown"> Help </a>
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
                            <h2>Help / FAQ - Administrator
                            </h2>
                            <p>
                                Hello! If you need any help navigating the Qwerty Kicks employee website, you've come to the right place!
                                Look below for all the information you'll need to be a superstar here at Qwerty Kicks!
                            </p>
                        </div>
                    </div>
                </div>
                 </div>
                <div class="row">
                  <div class="col-4">
                    <div class="list-group" id="list-tab" role="tablist">
                      <a class="list-group-item list-group-item-action active" id="list-nav-list" data-toggle="list" href="#list-nav" role="tab" aria-controls="nav">General Navigation</a>
                      <a class="list-group-item list-group-item-action" id="list-add-list" data-toggle="list" href="#list-add" role="tab" aria-controls="sale">Adding a Product</a>
                      <a class="list-group-item list-group-item-action" id="list-restock-list" data-toggle="list" href="#list-restock" role="tab" aria-controls="restock">Restocking Inventory</a>
                      <a class="list-group-item list-group-item-action" id="list-adminmanager-list" data-toggle="list" href="#list-adminmanager" role="tab" aria-controls="adminmanager">When to Contact an Admin/Manager</a>
                    </div>
                  </div>
                  <div class="col-8">
                    <div class="tab-content" id="nav-tabContent">
                      <div class="tab-pane fade show active" id="list-nav" role="tabpanel" aria-labelledby="list-nav-list">
                          <h1>General Navigation</h1>
                          To navigate the site, simply look to the sidebar to your left!
                          There, you will find all necessary links to perform to the best of your abilities here at Qwerty Kicks!
                          If you get lost or need any more help, you can always return to this page from the "Help" button in the top right!
                          Remember to click "Sign Out" in the top right when you're done with your shift!
                      </div>
                      <div class="tab-pane fade" id="list-add" role="tabpanel" aria-labelledby="list-add-list">
                          <h1>Adding a Product</h1>
                          Once you have arrived at the "Add a Product" Page, fill all text fields in top-down order. Then, verify that the information you have
                          entered is correct, and simply click "Add Product" at the bottom of the page.
                      </div>
                      <div class="tab-pane fade" id="list-restock" role="tabpanel" aria-labelledby="list-profile-list">
                          <h1>Transactions Reports</h1>
                          Once you have arrived at the "Transactions Reports" page, simply enter a start and end date into the text fields on the page to receive
                          an instantly generated report of all sales within that time period!
                      </div>
                      <div class="tab-pane fade" id="list-adminmanager" role="tabpanel" aria-labelledby="list-adminmanager-list">
                          <h1>Low Quantity Reports</h1>
                          Once you have arrived at the "Low Quantity Reports" page, simply enter a start and end date into the text fields on the page to receive
                          an instantly generated report of all moments of low product-quantity within that time period!
                      </div>
                    </div>
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
