<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageBrand.aspx.cs" Inherits="QwertyPOS.Default" %>

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
    <form id="BrandForm" runat="server">
        <div class="sidenav">
            
            <!--Employee Only Nav -->
            <a href="#Default">Home</a>
            <a href="#Sell">Make a Sale</a>
            <a href="#Restock">Restock Inventory</a>          
            
            <!--Admin Only Nav --
            <a href="#Products">Products</a>
            <a href="#Customers">Customers</a>
            <a href="#Reporting">Reporting</a>-->
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
                                        <a class="nav-link" href="#"> Signout <span class="sr-only">(current)</span></a>
                                    </li>
                                    <li class="nav-item dropdown">
                                        <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown"> Help </a>
                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                                            <a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a> <a class="dropdown-item" href="#">Something else here</a>
                                            <div class="dropdown-divider">
                                            </div>
                                            <a class="dropdown-item" href="#">Separated link</a>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                        <div class="jumbotron">
                            <h2>Brand Management
                            </h2>
                            <p>
                                Hello [Admin Name]! This is an admin-only page. Use this page to manage brands in the database.
                            </p>
                        </div>
                    </div>
                </div>
            <!-- Add a Brand -->
            <div class="form-group">
                <label for="formGroupExampleInput"class="font-weight-bold">Add a Brand</label>
                <input type="text" class="form-control" id="formGroupExampleInput" placeholder="New Brand Name">
              </div>
            <div class="form-group">
                <label for="brandImageFile">Brand Image</label>
                <input type="file" class="form-control-file" id="brandImageFile">
              </div>
            <div class="form-group">
                <label for="brandDescription">Brand Description</label>
                <input type="text" class="form-control" id="brandDescription" placeholder="New Brand Description">
              </div>
            <input class="btn btn-dark" type="submit" value="Submit">
            <!-- Rename a Existing Brand -->
            <div class="form-group">
            <label for="formGroupExampleInput2" class="font-weight-bold">Rename a Brand</label>
            <div class="col">
                    <input type="text" class="form-control" placeholder="Current Brand Name">
                </div>
                <div class="col">
                    <input type="text" class="form-control" placeholder="New Brand Name">
                </div>
            <input class="btn btn-dark" type="submit" value="Submit">
            </div>
            <!-- Remove a Product -->
            <div class="form-group">
                <label for="formGroupExampleInput" class="font-weight-bold">Remove a Brand</label>
                <input type="text" class="form-control" id="removeBrandForm" placeholder="Brand to be Removed">
                <input class="btn btn-dark" type="submit" value="Submit">
            </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>
