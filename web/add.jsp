<!DOCTYPE html>
<%@ page errorPage="error.jsp" %>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Blog</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <style>
        input[type="text"]::placeholder {
            text-align: center;
        }
        textarea::placeholder {
            text-align: center;
        }
    </style>

</head>

<body>
   <header class="header">
            <h1 class="logo"><a href="#">Blog Application</a></h1>
            <ul class="main-nav">
                <li><a href="main.jsp">Home</a></li>
                <li><a href="add.jsp">Add Blog</a></li>
                <li><a href="search.jsp">Search</a></li>
                <li><a href="update.jsp">Update</a></li>
                <li><a href="delete.jsp">Delete</a></li>
                <li><a href="about.jsp">About</a></li>

                <li><a href="login.jsp">Logout</a></li>
            </ul>
        </header>
    
    <div class="addblog-body mt-5">

        <div class="d-flex justify-content-center">
            <h1>Add Blog</h1>
        </div>
        <div class="">
            <form action="add" class="addblog-form" method="post">
                <div class="form-group">
                    <label class="d-flex justify-content-center" for="username">
                        <h3>username</h3>
                    </label>
                    <input type="text" class="form-control addblog-input" placeholder="Add Your Username" name="username">
                </div>
                <div class="form-group">
                    <label class="d-flex justify-content-center" for="title">
                        <h3>Title</h3>
                    </label>
                    <input type="text" class="form-control addblog-input" placeholder="Add Your Title" name="title">
                </div>
                <div class="form-group">
                    <label class="d-flex justify-content-center" for="content">
                        <h3>Body</h3>
                    </label>
                    <textarea class="form-control addblog-input" placeholder="Add Your Content" rows="20" name="content"></textarea>
                </div>
                <div class="form-group mt-2 d-flex justify-content-center ">
                    <input type="submit" class="btn btn-primary mb-2" value="Submit"/>
                </div>
            </form>
        </div>
    </div>
</body>

</html>