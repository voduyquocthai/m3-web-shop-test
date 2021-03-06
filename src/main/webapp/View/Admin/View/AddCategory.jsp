<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <meta http-equiv="X-UA-Compatible" content="ie=edge"/>
    <title>AddCategory-</title>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y="
            crossorigin="anonymous"
    />

    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"
            integrity="sha256-x8PYmLKD83R9T/sYmJn1j3is/chhJdySyhet/JuHnfY="
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/View/Admin/Css/AddUser.scss"/>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/css/bootstrap.min.css"
            integrity="sha256-L/W5Wfqfa0sdBNIKN9cG6QA5F2qx4qICmU2VgLruv9Y="
            crossorigin="anonymous"
    />

    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/material-design-icons/3.0.1/iconfont/material-icons.min.css"
            integrity="sha256-x8PYmLKD83R9T/sYmJn1j3is/chhJdySyhet/JuHnfY="
            crossorigin="anonymous"
    />
    <link rel="stylesheet" href="/View/Admin/Css/Index.css"/>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-mattBlackLight fixed-top">
    <button class="navbar-toggler sideMenuToggler" type="button">
        <span class="navbar-toggler-icon"></span>
    </button>

    <a class="navbar-brand" href="#">Admin</a>
    <button
            class="navbar-toggler"
            type="button"
            data-toggle="collapse"
            data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent"
            aria-expanded="false"
            aria-label="Toggle navigation"
    >
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown">
                <a
                        class="nav-link dropdown-toggle p-0"
                        href="#"
                        id="navbarDropdown"
                        role="button"
                        data-toggle="dropdown"
                        aria-haspopup="true"
                        aria-expanded="false"
                >
                    <i class="material-icons icon">
                        person
                    </i>
                    <span class="text">Account</span>
                </a>
                <div
                        class="dropdown-menu dropdown-menu-right"
                        aria-labelledby="navbarDropdown"
                >
                    <a class="dropdown-item" href="#">My Account</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="user?ac=logout">Logout</a>
                </div>
            </li>
        </ul>
    </div>
</nav>
<div class="wrapper d-flex">
    <div class="sideMenu bg-mattBlackLight">
        <div class="sidebar">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/admin?ac=dashboard" class="nav-link px-2">
                        <i class="material-icons icon">
                            person
                        </i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/admin?ac=list_user" class="nav-link px-2">
                        <i class="material-icons icon">
                            person
                        </i>
                        <span class="text">User Management</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/admin?ac=list_product" class="nav-link px-2">
                        <i class="material-icons icon"> insert_chart </i><span class="text">Product Management</span></a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/admin?ac=list_order" class="nav-link px-2">
                        <i class="material-icons icon">
                            settings
                        </i>
                        <span class="text">Order Management</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="${pageContext.request.contextPath }/admin?ac=list_cate" class="nav-link px-2">
                        <i class="material-icons icon">
                            computer
                        </i>
                        <span class="text">Category Management</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="content">
        <form method="post" style="width: 80%; margin-top: 50px;margin-left: 150px">
            <div class="row"><h2> Add new Category </h2></div>
            <div style="margin-top: 20px" class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4" >Name</label>
                    <input name="name_cate" type="text" class="form-control" id="inputEmail4" placeholder="">
                </div>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</div>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"
        integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
        crossorigin="anonymous"
></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.4.1/js/bootstrap.bundle.min.js"
        integrity="sha256-OUFW7hFO0/r5aEGTQOz9F/aXQOt+TwqI1Z4fbVvww04="
        crossorigin="anonymous"
></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"
        integrity="sha256-qE/6vdSYzQu9lgosKxhFplETvWvqAAlmAuR+yPh/0SI="
        crossorigin="anonymous"
></script>
</body>
</html>