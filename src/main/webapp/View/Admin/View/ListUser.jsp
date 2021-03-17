<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
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
                    <a href="admin?ac=dashboard" class="nav-link px-2">
                        <i class="material-icons icon">
                            person
                        </i>
                        <span class="text">Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="admin?ac=list_user" class="nav-link px-2">
                        <i class="material-icons icon">
                            person
                        </i>
                        <span class="text">User Management</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="admin?ac=list_product" class="nav-link px-2">
                        <i class="material-icons icon"> insert_chart </i
                        ><span class="text">Product Management</span></a>
                </li>
                <li class="nav-item">
                    <a href="admin?ac=list_order" class="nav-link px-2">
                        <i class="material-icons icon">
                            settings
                        </i>
                        <span class="text">Order Management</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="admin?ac=list_category" class="nav-link px-2">
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
                <div class="col-md-3"><a style="float: right ; margin-top: 35px" class="btn btn-warning" href="/admin?ac=add_user">Add new member</a> </div>
            </div>
            <div style="margin-top: 20px" class="row">
                <table style="margin-top: 50px ; color: black" class="table table-striped">
                    <thead>
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Action</th>
                        <th scope="col">Username</th>
                        <th scope="col">Email</th>
                        <th scope="col">Password</th>
                        <th scope="col">Avatar</th>
                        <th scope="col">Role</th>
                    </tr>
                    </thead>
                    <c:forEach items='${requestScope["userList"]}' var="user">
                        <tr>
                            <td>${user.getId()}</td>
                            <td>
                                <a class="btn btn-primary" href="/admin?act=edit_user&id=${user.getId()}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path
                                                d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456l-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                                        <path fill-rule="evenodd"
                                              d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                                    </svg>
                                    Edit
                                </a>

                                <a class="btn btn-danger" href="/admin?act=delete_user&id=${user.getId()}">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                         class="bi bi-trash" viewBox="0 0 16 16">
                                        <path
                                                d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z">
                                        </path>
                                        <path fill-rule="evenodd"
                                              d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z">
                                        </path>
                                    </svg>
                                    Delete
                                </a>

                            </td>
                            <td>${user.getUsername()}</td>
                            <td>${user.getPassword()}</td>
                            <td>${user.getEmail()}</td>
                            <td><img style="width: 100px; height: 100px" src="${user.getAvatar()}"></td>
                            <td>
                                <c:if test = "${user.getRoleId() == 1}">
                                <p>Admin<p>
                                </c:if>
                                    <c:if test = "${user.getRoleId() == 0}">
                                    <p>User<p>
                                    </c:if>
                            </td>
                        </tr>
                    </c:forEach>
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