<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FrmLoginSA.aspx.cs" Inherits="IBPTLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
    <title>Smart Web - Login</title>
    <link rel="shortcut icon" href="assets/img/favicon.png">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,400;0,500;0,700;0,900;1,400;1,500;1,700&amp;display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css">
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css">
    <link rel="stylesheet" href="assets/css/style.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="main-wrapper login-body">
            <div class="login-wrapper">
                <div class="container">
                    <div class="loginbox">
                        <div class="login-left">
                            <img class="img-fluid" src="assets/img/login.jpg" alt="Logo">
                        </div>
                        <div class="login-right">
                            <div class="login-right-wrap">
                                <img src="assets/img/logo.jpeg" style="width: 60%;" />
                                <br />
                                <br />
                                <h2>Sign in</h2>
                                <!-- Form -->
                                <div action="#">
                                    <div class="form-group">
                                        <label>Username <span class="login-danger">*</span></label>
                                        <asp:TextBox ID="txtUserName" class="form-control" runat="server"></asp:TextBox>
                                        <span class="profile-views"><i class="fas fa-user-circle"></i></span>
                                        <asp:RequiredFieldValidator ID="rqs" Font-Size="9" runat="server" ControlToValidate="txtUserName" Text="Enter Username" ForeColor="Red" ValidationGroup="a" Display="None" ErrorMessage="Enter Username">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                    <div class="form-group">
                                        <label>Password <span class="login-danger">*</span></label>
                                        <asp:TextBox ID="txtPassword" class="form-control pass-input" TextMode="Password" runat="server"></asp:TextBox>
                                        <span class="profile-views feather-eye toggle-password"><i class="fas fa-eye"></i></span>
                                        <asp:RequiredFieldValidator ID="rqs1" Font-Size="9" runat="server" ControlToValidate="txtPassword" Text="Enter Password" ForeColor="Red" ValidationGroup="a" Display="None" ErrorMessage="Enter Password">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                
                                    <div class="form-group">
                                        <asp:Button ID="btnLogin" class="btn btn-primary btn-block" OnClick="btnLogin_Click" runat="server" Text="Login" />
                                    </div>
                                    <div class="row" runat="server" visible="false" id="divErrorMessage">
                                        <div class="input-field col s12 m12 l12 login-text">
                                            <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="assets/js/jquery-3.7.1.min.js"></script>
        <script src="assets/js/bootstrap.bundle.min.js"></script>
        <script src="assets/js/feather.min.js"></script>
        <script src="assets/js/script.js"></script>
        <style>
            body {
                background-image: url('assets/img/bg-login.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
                background-attachment: fixed;
            }
        </style>
    </form>
</body>
</html>
