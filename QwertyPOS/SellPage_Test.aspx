<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SellPage_Test.aspx.cs" Inherits="QwertyPOS.SellPage_Test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta charset="utf-8" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <title>Make a Sale | Qwerty Kicks</title>
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
        .GridPosition{
            position: center;
            margin-left: 700px;
            margin-top:-440px;
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
                            <a class="navbar-brand"><span>
                                <img alt="Qwerty Kicks Logo" src="Images/QwertyKicksYellow_LightBackground.png" height="100" /></span> Qwerty Kicks</a>
                            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                <ul class="navbar-nav">
                                </ul>
                                <ul class="navbar-nav ml-md-auto">
                                    <li class="nav-item active">
                                        <a class="nav-link" href="Login.aspx">Sign Out <span class="sr-only">(current)</span></a>
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
                            <img alt="Qwerty Kicks Logo" src="Images/payment-method.png" height="50" />
                            <h2>Make a Sale</h2>
                            <p>
                                Choose your customers items below to add to the transaction and make a sale.
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblBrand" runat="server" CssClass="col-md-2 control-label" Text="Select Brand:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlBrand" CssClass="form-control " runat="server" ></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblModel" runat="server" CssClass="col-md-2 control-label" Text="Select Model:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlModel" CssClass="form-control " runat="server" OnSelectedIndexChanged="ddlModel_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblSize" runat="server" CssClass="col-md-2 control-label" Text="Select Size:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlSize" CssClass="form-control " runat="server" OnSelectedIndexChanged="ddlSize_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblGender" runat="server" CssClass="col-md-2 control-label" Text="Select Gender (1=M, 2=F):"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlGender" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblQuantity" runat="server" CssClass="col-md-2 control-label" Text="Select Quantity In Stock:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlQuantity" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="lblPrice" runat="server" CssClass="col-md-2 control-label" Text="Select Price:"></asp:Label>
                <div class="col-md-3">
                    <asp:DropDownList ID="ddlPrice" CssClass="form-control " runat="server"></asp:DropDownList>
                </div>
            </div>

            <asp:Button ID="btnAdd" runat="server" Class="btn btn-dark" Text="Add" OnClick="btnAdd_Click"/>

            <asp:Button ID="btnComplete" runat="server" Class="btn btn-dark" Text="Complete" OnClick="btnComplete_Click" OnClientClick="javascript:return confirm('Transaction Complete');"/>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="GridPosition" CellPadding="4" ForeColor="#333333" OnDataBound="GridView1_DataBound" ShowFooter="True" OnRowDeleting="GridView1_RowDeleting" GridLines="None" HorizontalAlign="Center">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Brand" HeaderText="Brand Number" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Model" HeaderText="Model Name" >
               
                    <FooterStyle HorizontalAlign="Center" />
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
               
                    <asp:BoundField DataField="Price" HeaderText="Price" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Size" HeaderText="Size" >
                    <HeaderStyle HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-dark" DeleteText="Remove">
                        <ControlStyle CssClass="btn btn-dark"></ControlStyle>
                    </asp:CommandField>
                </Columns>
                <EditRowStyle BackColor="#7C6F57" HorizontalAlign="Center" BorderStyle="Solid" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#E3EAEB" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            
        </div>


    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</body>
</html>

