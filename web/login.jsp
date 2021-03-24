<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
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
        <h1>Login Form</h1>
        <section class="section-login">
    
            <form action="login" method="post">
                <table style="width: 50%">
    
                    <tr class="form-group">
                            <td><b>Username</b></td>
                            <td><input class="ml-15" type="text" name="username" placeholder="Username"/></td>
                        
                    </tr>
                    <tr class="form-group">
                        <td><b>Password</b></td>
                        <td><input class="ml-15" type="password" name="password" placeholder="Password"/></td>
                    </tr>
                </table>
                <div class="input-center">
                    <input class="btn btn-primary" type="submit" value="Login" />
                </div>
                
            </form>
            <form class="btn-form-register" name="main1" method="get" action="register.jsp">
                <input class="btn btn-warning" type="submit" name="Register" value="Register">
            </form>
        </section>
    </div>
    


</body>

</html>