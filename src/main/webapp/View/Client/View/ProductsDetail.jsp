<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Website | Responsive Website Design</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="../bootstrap-website/css/style.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
</head>
<body>
<div class="container">
    <div class="row">
        <div style="margin-top: 20px" class="col-md-3"><a href="/View/Client/View/Index.jsp">
            <img src="/View/Client/Css/logo.png" alt="Logo" title="Logo">
        </a></div>
        <div style="margin-top: 30px" class="col-md-5 text-center"><div style="width: 70% ;float: right" class="input-group rounded">
            <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
                   aria-describedby="search-addon" />
        </div>
        </div>
        <div class="col-md-1"></div>
        <div style="margin-top: 46px " class="col-md-3">
            <a style="" href="/View/Client/View/SignIn.jsp">Registration/Log in</a>
        </div>
    </div>
    <div class="row">
        <nav class="navbar bg-light navbar-light navbar-expand-lg">
            <div style="margin-left: 200px" class="container">
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav mr-auto" id="navbarList">
                        <li class="nav-item active">
                            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Shoes.jsp">Shoes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Hand Bag</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Backpack</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Wallet</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sandals</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Accessories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Sale Off</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">New Arrival</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">News</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>
    <div style="margin-top: 20px" class="row">adv</div>
    <div style="margin-top: 20px" class="row">
        <div class="col-md-6">
            <div style=" " id="carouselExampleControls" class="carousel slide" data-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img class="d-block w-100" src="<c:out value="${product.getImage()}"/>" alt="First slide" >
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/View/Img/giay.jpg" alt="Second slide">
                    </div>
                    <div class="carousel-item">
                        <img class="d-block w-100" src="/View/Img/giay2.jpg" alt="Third slide">
                    </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
                <a href="" class="carousel-control-prev"><span></span></a>
            </div>
        </div>
        <div class="col-md-6">
            <h5><c:out value="${product.getName()}"/></h5>
            <p><span class="mr-1" ><c:out value="${product.getPrice()}"/></span></p>
            <p class="pt-1"><c:out value="${product.getDes()}"/></p>
            <hr>
            <div class="table-responsive mb-2">
                <table class="table table-sm table-borderless">
                    <tbody>
                    <tr>
                        <td class="pl-0 pb-0 w-25">Quantity</td>
                        <td class="pb-0">Select size</td>
                    </tr>
                    <tr>
                        <td class="pl-0">
                            <div class="def-number-input number-input safari_only mb-0">
                                <input class="quantity" min="0" name="quantity" value="1" type="number">
                            </div>
                        </td>
                        <td>
                            <div class="mt-1">
                                <div class="form-check form-check-inline pl-0">
                                    <input type="radio" class="form-check-input" id="small" name="materialExampleRadios"
                                           checked>
                                    <label class="form-check-label small text-uppercase card-link-secondary"
                                           for="small">Small</label>
                                </div>
                                <div class="form-check form-check-inline pl-0">
                                    <input type="radio" class="form-check-input" id="medium"
                                           name="materialExampleRadios">
                                    <label class="form-check-label small text-uppercase card-link-secondary"
                                           for="medium">Medium</label>
                                </div>
                                <div class="form-check form-check-inline pl-0">
                                    <input type="radio" class="form-check-input" id="large"
                                           name="materialExampleRadios">
                                    <label class="form-check-label small text-uppercase card-link-secondary"
                                           for="large">Large</label>
                                </div>
                            </div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        <button type="button" class="btn btn-primary btn-md mr-1 mb-2">Buy now</button>
        <a type="button" class="btn btn-light btn-md mr-1 mb-2"><i
                class="fas fa-shopping-cart pr-2"></i>Add to cart
        </a>
        </div>
    </div>
    <div class="row"></div>
    <div class="row"></div>
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
        <!-- Footer --></div>
</div>
<script src="/View/Client/Css/Jquery/jquery-3.5.1.min.js"></script>
<script src="/View/Client/Css/Jquery/all.min.js"></script>
<script src="/View/Client/Css/Jquery/bootstrap.min.js"></script>
<script src="/View/Client/Css/Jquery/popper.min.js"></script>
</body>
</html>