<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title><c:out value="${category.getName()}"/></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="../bootstrap-website/css/style.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <link rel="stylesheet" href="View/Client/Css/Index.css">
</head>
<body>
<div class="container">
    <div class="row" style="margin: 10px 0 10px 0">
        <div class="col-md-3"><a href="/user">
            <img src="/View/Client/Css/logo.png" alt="Logo" title="Logo">
        </a></div>
        <div class="col-md-5">
            <div style="width: 70% ;float: right" class="input-group">
                <form action="/user?ac=search_product_by_name&id_cate=${category.getId()}" method="post">
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
        <div class="col-md-1"></div>
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
                                <a class="nav-link btn btn-light" href="/user">Home <span
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
    <div class="row"><a href="/user">Home </a> > <c:out value="${category.getName()}"/></div>
    <div style="margin-top: 20px" class="row">
        <c:forEach items="${requestScope['products']}" var="p">
            <div style="margin-bottom: 45px" class="col-md-3">
                <a href="/user?ac=product_detail&id=${p.getId()}">
                    <div class="card" style="width: 90%;">
                        <img class="card-img-top" src="${p.getImage()}" alt="${p.getName()}">
                        <div class="card-body">
                            <p class="card-text">${p.getPrice()} $<br>${p.getName()}</p><br>
                            <a href="/user?ac=addItem&pId=${p.getId()}" class="btn btn-light">
                                <i class="bi bi-cart">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-cart" viewBox="0 0 16 16">
                                        <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                                    </svg>
                                </i>
                            </a>
                        </div>
                    </div>
                </a>
            </div>
        </c:forEach>
    </div>
    <div style="margin-top: 50px" class="row"><!-- Footer -->
        <footer class="bg-light text-center text-lg-start">
            <!-- Grid container -->
            <div class="container p-4">
                <!--Grid row-->
                <div class="row">
                    <!--Grid column-->
                    <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
                        <h5 class="text-uppercase">VASCARA</h5>

                        <p>
                            Known as the first female fashion brand to own 137 stores nationwide and the e-commerce
                            channel www.vascara.com with a completely new interface, meeting the shopping needs of
                            fashionistas around the country. All over the country, VASCARA offers her many choices
                            of shoes, bags, backpacks, purses, glasses ... designed with youthful modern design,
                            creating delicate style for women while still in harmony with fashion trends
                            international.
                        </p>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase">POLICY</h5>

                        <ul class="list-unstyled mb-0">
                            <li>
                                <a href="#!" class="text-dark">Privacy Policy</a>
                            </li>
                            <li>
                                <a href="#!" class="text-dark">Preferential customers</a>
                            </li>
                            <li>
                                <a href="#!" class="text-dark">Lifetime warranty policy</a>
                            </li>
                            <li>
                                <a href="#!" class="text-dark">Forwarding policy</a>
                            </li>
                        </ul>
                    </div>
                    <!--Grid column-->

                    <!--Grid column-->
                    <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
                        <h5 class="text-uppercase mb-0">CUSTOMER SUPPORT</h5>

                        <ul class="list-unstyled">
                            <li>
                                <a href="#!" class="text-dark">Shopping guide</a>
                            </li>
                            <li>
                                <a href="#!" class="text-dark">Warranty lookup</a>
                            </li>
                            <li>
                                <a href="#!" class="text-dark">Regulations on gift certificates</a>
                            </li>
                            <li>
                                <a href="#!" class="text-dark">Conditions of use of Giftcard</a>
                            </li>
                        </ul>
                    </div>
                    <!--Grid column-->
                </div>
                <!--Grid row-->
            </div>
            <!-- Grid container -->

            <!-- Copyright -->
            <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
                Global Fashion Company Limited. Office: 4th floor, ACM building at 96 Cao Thang, ward 04, district
                03, Ho Chi Minh city.

                GP No. 0314657558 issued by the Department of Planning and Investment of Ho Chi Minh City for the
                first time on October 5, 2017
                <br>
                <a class="text-dark" href="https://mdbootstrap.com/">Vascara</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </div>
</div>
</body>
</html>