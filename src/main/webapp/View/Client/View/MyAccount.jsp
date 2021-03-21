<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>My Account</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin: 10px 0 10px 0">
        <div class="col-md-3"><a href="/user">
            <img src="/View/Client/Css/logo.png" alt="Logo" title="Logo">
        </a></div>
        <div class="col-md-5">
            <div style="width: 70% ;float: right" class="input-group">
                <form action="/user?ac=search_product_by_name&id_cate=searchAll" method="post">
                    <div class="input-group">
                        <input type="text" class="form-control" name="search" placeholder="Quick search">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="submit">
                            <i class="bi bi-search">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-search" viewBox="0 0 16 16">
                                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
                                </svg>
                            </i>
                            </button>
                        </span>
                    </div>
                </form>
            </div>
        </div>
        <div class="col-md-1"><a href="/user?ac=my_account&username=${user.getUsername()}"><c:out value="${user.getUsername()}"/></a></div>
        <div class="col-md-3">
            <a style="" class="btn btn-secondary" href="/View/Client/View/SignIn.jsp">Registration/Log in</a>
        </div>
    </div>
    <div class="row">
        <div class="container">
            <div class="row">
                <nav class="navbar bg-light navbar-light navbar-expand-lg">
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav mr-auto" id="navbarList">
                            <li class="nav-item active">
                                <a class="nav-link btn btn-light" href="#">Home <span
                                        class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="View/Client/View/Shoes.jsp">Shoes</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="#">Hand Bag</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="#">Backpack</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="#">Wallet</a>
                            </li>
                            <li class="nav-item">
                                <div class="dropdown">
                                    <button class="btn btn-light dropdown-toggle" type="button" id="dropdownMenuButton"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Category
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <c:forEach items="${requestScope['categories']}" var="c">
                                            <a class="dropdown-item"
                                               href="/user?ac=search_product_by_cate&id=${c.getId()}">${c.getName()}</a>
                                        </c:forEach>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="#">Accessories</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="#">Sale Off</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="#">New Arrival</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link btn btn-light" href="#">News</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-10" style="font-size: 50px"><c:out value="${user.getUsername()}"/></div>
        <div class="col-md-2">
            <a href="${pageContext.request.contextPath }/logout" class="pull-right">
                <img title="profile image" class="img-circle img-responsive"
                     src="http://www.gravatar.com/avatar/28fd20ccec6865e2d5f0e1f4446eb7bf?s=100"></a>
        </div>
    </div>
    <form action="/user?ac=my_account" method="post">
        <div class="row">
            <div class="col-md-5">
                <input type="number" name="id" value="${user.getId()}" hidden>
                <input type="number" name="role_id" value="${user.getRoleId()}" hidden>
                <div class="text-center">
                    <img src="<c:out value='${user.getAvatar()}'/>" alt="" class="avatar img-circle img-thumbnail">
                    <h6>Upload a different photo...</h6>
                    <input type="file" name="avatar" class="text-center center-block file-upload">
                </div>
            </div>
            <div class="col-md-7">
                <div class="tab-content">
                    <div class="tab-pane active">
                        <hr>
                        <div class="form-group">
                            <div class="col-xs-6">
                                <h4><label>Username</label></h4>
                                <input type="text" class="form-control" name="username" value="${user.getUsername()}">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-6">
                                <h4><label>Email</label></h4>
                                <input type="email" class="form-control" name="email" value="${user.getEmail()}">
                            </div>
                        </div>
                        <div class="form-group">
                            <h4><label>Password</label></h4>
                            <div class="input-group mb-3">
                                <input type="password" class="form-control" id="inPass" name="password" value="${user.getPassword()}">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-secondary" type="button" id="btnPassword">
                                        <i class="bi bi-eye">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                                                <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8zM1.173 8a13.133 13.133 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5c2.12 0 3.879 1.168 5.168 2.457A13.133 13.133 0 0 1 14.828 8c-.058.087-.122.183-.195.288-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5c-2.12 0-3.879-1.168-5.168-2.457A13.134 13.134 0 0 1 1.172 8z"/>
                                                <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5zM4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0z"/>
                                            </svg>
                                        </i>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-12">
                                <br>
                                <button class="btn btn-lg btn-success" type="submit">
                                    <i class="glyphicon glyphicon-ok-sign"></i> Save
                                </button>
                                <button class="btn btn-lg" type="reset">
                                    <i class="glyphicon glyphicon-repeat"></i> Reset
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
<script>
    let showPassword = false

    // step 2
    const ipnElement = document.querySelector('#inPass')
    const btnElement = document.querySelector('#btnPassword')

    // step 3
    btnElement.addEventListener('click', function() {
        if (showPassword) {
            // Đang hiện password
            // Chuyển sang ẩn password
            ipnElement.setAttribute('type', 'password')
            showPassword = false
        } else {
            // Đang ẩn password
            // Chuyển sang hiện password
            ipnElement.setAttribute('type', 'text')
            showPassword = true
        }
    })

</script>
</html>
