<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>FrontendFunn -</title>
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
    <link rel="stylesheet" href="/View/Admin/Css/Index.css" />
</head>

<body>
<nav
        class="navbar navbar-expand-lg navbar-dark bg-mattBlackLight fixed-top"
>
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
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
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
                    <a href="#" class="nav-link px-2">
                        <i class="material-icons icon">
                            dashboard
                        </i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2">
                        <i class="material-icons icon">
                            person
                        </i>
                        <span class="text">User Profile</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2">
                        <i class="material-icons icon"> insert_chart </i
                        ><span class="text">Charts</span></a
                    >
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2">
                        <i class="material-icons icon">
                            settings
                        </i>
                        <span class="text">Settings</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2">
                        <i class="material-icons icon">
                            pages
                        </i>
                        <span class="text">Pages</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2">
                        <i class="material-icons icon">
                            computer
                        </i>
                        <span class="text">Demo</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link px-2 sideMenuToggler">
                        <i class="material-icons icon expandView ">
                            view_list
                        </i>
                        <span class="text">Resize</span>
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="content">
        <div class="container">
        <div class="row">
                <div class="col-md-9"></div>
                <div class="col-md-3">
                    <div style="margin-top: 20px" class="input-group">
                        <input style="width: 70%" type="search" class="form-control rounded" placeholder="Search"
                               aria-label="Search"
                               aria-describedby="search-addon"/>
                        <button style="width: 30%" type="button" class="btn btn-outline-primary">search</button>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-9"></div>
                <div class="col-md-3"><a style="float: right ; margin-top: 35px" class="btn btn-warning" href="AddUser.jsp">Add new member</a> </div>
            </div>
            <div style="margin-top: 20px" class="row">
                <table style="margin-top: 50px ; color: black" class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col"><input type="checkbox" value=""></th>
                        <th scope="col">ID</th>
                        <th scope="col">Action</th>
                        <th scope="col">Name</th>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Address1</th>
                    </tr>
                    </thead>
                    <c:forEach items='${requestScope["customers"]}' var="customer">
                        <tbody>
                        <tr>
                            <th scope="row" > + </th>
                            <td><input type="checkbox" value=""></th></td>
                            <td>${customer.getId()}</td>
                            <td><a class="btn btn-primary" href="EditUser.jsp">Edit
                                <span style="float: left" class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                            </a>
                                <a class="btn btn-danger" href="customer?action=delete&id=${customer.getId()}">Delete
                                    <span style="float: left" class="glyphicon glyphicon-edit" aria-hidden="true"></span>
                                </a></td>
                            <td>${customer.getName()}</td>
                            <td>${customer.getUsername()}</td>
                            <td>${customer.getEmail()}</td>
                            <td>${customer.getAddress()}</td>
                        </tr>
                        </tbody></c:forEach>
                </table>
            </div>
            <div class="row">
                <div style="margin-top: 25px" class="col-md-3">
                    Showing 0 to 0 of 0 entries
                </div>
                <div class="col-md-1"></div>
                <div class="col-md-8">
                    <div class="col-md-4"></div>
                    <div style="margin-top: 25px ; float: right" class="col-md-3"> Show
                        <select class="selectpicker">
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                            <option>6</option>
                            <option>7</option>
                            <option>8</option>
                            <option>9</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                        </select>
                        <span>Entries</span>
                    </div>
                    <div style="float: right ; margin-top: 17px" class="col-md-5">
                        <nav aria-label="Page navigation example">
                            <ul class="pagination">
                                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                                <li class="page-item"><a class="page-link" href="#">1</a></li>
                                <li class="page-item"><a class="page-link" href="#">2</a></li>
                                <li class="page-item"><a class="page-link" href="#">3</a></li>
                                <li class="page-item"><a class="page-link" href="#">...</a></li>
                                <li class="page-item"><a class="page-link" href="#">Next</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
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