<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">

</head>

<body>
    <div class="login-center">
        <div class="login-heading">
            <h1 class="login-heading-center">
                Blog Application
            </h1>
        </div>
        <h1>Register Form</h1>
        <form action="registerDB" method="post">
                    <table style="width: 50%">
                        <tr>
                            <td><b>User ID</b></td>
                            <td><input class="ml-15" type="text" name="Uid" placeholder="Uid" /></td>
                        </tr>
                        <tr>
                        <tr>
                            <td><b>Name</b></td>
                            <td><input class="ml-15" type="text" name="name" placeholder="Name" /></td>
                        </tr>
                        <tr>
                            <td><b>Username</b></td>
                            <td><input class="ml-15" type="text" name="username" placeholder="Username" /></td>
                        </tr>
                            <tr>
                            <td><b>Password</b></td>
                            <td><input class="ml-15" type="password" name="password" placeholder="Password"/></td>
                        </tr>
                        <tr>
                            <td><b>E-Mail</b></td>
                            <td><input class="ml-15" type="email" name="mail" placeholder="E-mail"/></td>
                        </tr>
                        <tr>
                            <td><b>Contact</b></td>
                            <td><input class="ml-15" type="text" name="contact" placeholder="Contact"/></td>
                        </tr></table>
                    <input class="btn btn-primary" type="submit" value="Submit" /></form>
        <form  class="btn-form-register" name="main1"  method="get" action="login.jsp">
                <input class="btn btn-warning" type="submit" name="ter" value="Back to Login" >
        </form>
    </div>

</body>
</html>
