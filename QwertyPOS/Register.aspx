<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="QwertyPOS.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="CSS/Register.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"/>
    <title>Register | Qwerty Kicks</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="center-page">


            <div class="vald">
                <asp:Label ID="lblMsg" runat="server"></asp:Label>
            </div>
            

            <label class="col-xs-11">ID Number</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbID" runat="server" class="form-control" MaxLength="7"></asp:TextBox>
            </div>
           
             <label class="col-xs-11">First Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbFirstName" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
            </div>

             <label class="col-xs-11">Last Name</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbLastName" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
            </div>

             <label class="col-xs-11">Phone Number</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbPhoneNum" runat="server" class="form-control" MaxLength="10"></asp:TextBox>
            </div>

             <label class="col-xs-11">Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbPassword" runat="server" class="form-control" MaxLength="8" TextMode="Password"></asp:TextBox>
            </div>

             <label class="col-xs-11">Confirm Password</label>
            <div class="col-xs-11">
                <asp:TextBox ID ="tbConfirmPass" runat="server" class="form-control" MaxLength="8" TextMode="Password"></asp:TextBox>
            </div>
            <div class="col-xs-11 space-vert">
                <asp:Button ID="btnSignup" runat="server" Class="btn btn-dark" Text ="Signup" OnClick="btnSignup_Click1"/>
            </div>
            
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
