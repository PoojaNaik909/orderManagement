<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frm_Login.aspx.cs" Inherits="WebApplication4.WebForm1" %>
 
<script runat="server">
    
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<%--<head runat="server">--%>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Core CSS - Include with every page -->
    <link href="assets/plugins/bootstrap/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
    <link href="assets/plugins/pace/pace-theme-big-counter.css" rel="stylesheet">
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/main-style.css" rel="stylesheet">
</head>
    <body class="body-Login-back">
    <form id="form1" runat="server">
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-md-offset-4 text-center logo-margin ">
                    <%--<img src="assets/img/logo.png" alt="">--%>
                    <h1 style="color: White; font-weight: bolder; text-transform: uppercase;">
                     Login page</h1>
                </div>
                
                <div class="col-md-6 col-md-offset-4">
                    <div class="login-panel panel panel-default">
                        <div class="panel-heading">
                            <h3 class="panel-title">
                                Please Sign In</h3>
                        </div>
                        <div class="panel-body">
                            <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <asp:DropDownList ID="ddl_type" runat="server" CssClass="form-control">
                                        <asp:ListItem>User</asp:ListItem>
                                        <asp:ListItem>Admin</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox ID="txt_username" CssClass="form-control" runat="server" autofocus=""
                                        placeholder="Enter Mobile No."></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox value="" ID="txt_password" CssClass="form-control" runat="server" TextMode="Password"
                                        placeholder="password"></asp:TextBox>
                                </div>
                              
                                <div class="checkbox">
                                    <label>
                                        <a href="#" tabindex="-1">Forgotten your password?</a>
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <asp:Button ID="btn_login" runat="server" Text="Login" CssClass="btn btn-lg btn-success btn-block"
                                    OnClick="btn_login_Click" />
                            </fieldset>
                            </form>
                        </div>
                    </div>
                    <div class="copyright-text text-center">
                        <p>
                          
                        </p>
                        <p>
                           
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>

</html>
