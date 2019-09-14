<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProducts_Test.aspx.cs" Inherits="QwertyPOS.AddProducts_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <title>Add Products | Qwerty Kicks</title>
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
                                        <a class="nav-link" href="Login.aspx"> Sign Out <span class="sr-only">(current)</span></a>
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
                            <img alt="Qwerty Kicks Logo" src="Images/shopping-bag.png" height="50" />
                            <h2>Brand and Product Management
                            </h2>
                            <p>
                                Hello! This is an admin-only page. Use this page to manage brands and products in your store.
                            </p>
                        </div>
                    </div>
                </div>
                </div>
            <!-- Add a Brand -->
            <div class="form-group">
                <asp:Label ID="lblBrand" runat="server" CssClass="col-md-2 control-label" Text="Select Brand:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlBrand" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblModel" runat="server" CssClass="col-md-2 control-label" Text="Enter Model Name:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="ddlModel" CssClass="form-control " runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSize" runat="server" CssClass="col-md-2 control-label" Text="Enter Size:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="ddlSize" CssClass="form-control " runat="server"></asp:TextBox>
                </div>
            </div>
           
                <div class="form-group">
                <asp:Label ID="lblGender" runat="server" CssClass="col-md-2 control-label" Text="Enter Gender:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlGnder" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
                    </div>
            <div class="form-group">
                <asp:Label ID="lblQuantity" runat="server" CssClass="col-md-2 control-label" Text="Enter Quantity:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="ddlQuantity" CssClass="form-control " runat="server"></asp:TextBox>
                </div>
            </div>
               
            
            <div class="form-group">
                <asp:Label ID="lblPrice" runat="server" CssClass="col-md-2 control-label" Text="Enter Price:"></asp:Label>
                <div class="col-md-3">
                    <asp:TextBox ID="ddlPrice" CssClass="form-control " runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="col-md-3">
                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-dark" Text="Add Product" OnClick="Button1_Click" OnClientClick="javascript:return confirm('Product has been added');"/>
            </div>
            
            </div>
    </form>
     <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
