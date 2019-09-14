<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="QwertyPOS.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link href="CSS/Login.css" rel="stylesheet" type="text/css" />
    <title>Login | Qwerty Kicks </title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="sidenav">
                <div class="login-main-text">
                    <img alt="Qwerty Logo" src="Images/QwertyKicksYellow.png" />
                    <p>Login or register from here to access.</p>
                </div>
            </div>
            <div class="main">

                <div class="col-md-6 col-sm-12">
                    <div class="login-form">

                        <div class="form-group">
                            <label>UserName(ID Number)</label>
                            <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorUserName" CssClass="text-danger" runat="server" ErrorMessage="Username is required!" ControlToValidate="UserName" ></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <asp:TextBox ID="Password" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidatorPassword" CssClass="text-danger" runat="server" ErrorMessage="Password is required!" ControlToValidate="Password"></asp:RequiredFieldValidator>
                        </div>
                        <asp:Button ID="btnLogin" runat="server" Class="btn btn-black" Text="Login" OnClick="btnLogin_Click" />
                        <asp:Button ID="btnRegister" runat="server" Class="btn btn-black" Text="Register" PostBackUrl="~/Register.aspx" CausesValidation="false" />
                        
                       

                    </div>


                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>
                    <div class="col-md-6">
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>


            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>
</html>
