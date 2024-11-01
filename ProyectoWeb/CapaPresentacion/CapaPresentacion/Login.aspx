<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CapaPresentacion.Login" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f5f5f5;
            font-family: Arial, sans-serif;
        }

        .login-container {
            display: flex;
            max-width: 900px;
            width: 100%;
            height: 500px;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.15);
        }

        .image-section {
            flex: 1;
            background-color: #003366;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
        }

        .tech-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .form-section {
            flex: 1;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            height: 100%;
        }

        h2 {
            color: #003366;
            margin-bottom: 30px;
            font-size: 28px;
            text-align: center;
            font-weight: bold;
        }
        h2 span {
            color: black;
            font-weight: normal;
        }

        h3 {
            color: #003366;
            font-weight: bold;
            font-size: 20px;
            margin-bottom: 20px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            border: none;
            border-bottom: 2px solid #003366;
            font-size: 16px;
            background: none;
            box-sizing: border-box;
            color: #666;
        }

        .form-control::placeholder {
            color: #ccc;
        }

        .form-control:focus {
            outline: none;
            border-color: #0056b3;
        }

        .btn-login {
            width: 100%;
            padding: 12px;
            background: #0056b3;
            border: none;
            border-radius: 50px;
            color: white;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        .btn-login:hover {
            background: #004494;
        }

        .validation-error {
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
        }

        #lblMessage {
            color: #dc3545;
            margin-top: 10px;
            display: block;
            text-align: center;
        }

        .toggle-password {
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }

        @media screen and (max-width: 768px) {
            .login-container {
                flex-direction: column;
                height: auto;
            }

            .image-section {
                display: none;
            }

            .form-section {
                padding: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="login-wrapper">
        <div class="login-container">
            <div class="image-section">
                <img src="https://firebasestorage.googleapis.com/v0/b/munigo-35675.appspot.com/o/blue_tech.png?alt=media&token=79bc641b-21ce-4e76-be39-73ff99593609" alt="Tech Background" class="tech-image" />
            </div>
            <div class="form-section">
                <h2>Hello, <span>Admin</span>!</h2>
                <h3>Login</h3>
                <form id="form2" runat="server">
                    <div class="form-group">
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter your email" />
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                            ControlToValidate="txtEmail"
                            ErrorMessage="Email is required"
                            CssClass="validation-error"
                            Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Password" />
                        <span class="toggle-password" onclick="togglePasswordVisibility()">
                            <i class="bi bi-eye-slash" id="toggleIcon"></i>
                        </span>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                            ControlToValidate="txtPassword"
                            ErrorMessage="Password is required"
                            CssClass="validation-error"
                            Display="Dynamic" />
                    </div>
                    <div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" Text="Go" CssClass="btn-login" OnClick="btnLogin_Click" />
                    </div>
                    <asp:Label ID="lblMessage" runat="server" />
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePasswordVisibility() {
            var passwordField = document.getElementById('<%= txtPassword.ClientID %>');
            var toggleIcon = document.getElementById('toggleIcon');
            if (passwordField.type === "password") {
                passwordField.type = "text";
                toggleIcon.classList.remove('bi-eye-slash');
                toggleIcon.classList.add('bi-eye');
            } else {
                passwordField.type = "password";
                toggleIcon.classList.remove('bi-eye');
                toggleIcon.classList.add('bi-eye-slash');
            }
        }
    </script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.5.0/font/bootstrap-icons.min.css" rel="stylesheet" />
</body>
</html>