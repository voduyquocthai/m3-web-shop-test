<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>VASCARA</title>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="../bootstrap-website/css/style.css">
    <link href='https://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet'>
    <!-- CSS Global Compulsory -->
    <link rel="stylesheet"
          href="${url}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${url}/css/shop.style.css">

    <!-- CSS Header and Footer -->
    <link rel="stylesheet" href="${url}/css/headers/header-v5.css">
    <link rel="stylesheet" href="${url}/css/footers/footer-v4.css">

    <!-- CSS Implementing Plugins -->
    <link rel="stylesheet" href="${url}/plugins/animate.css">
    <link rel="stylesheet" href="${url}/plugins/line-icons/line-icons.css">
    <link rel="stylesheet"
          href="${url}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet"
          href="${url}/plugins/jquery-steps/css/custom-jquery.steps.css">
    <link rel="stylesheet"
          href="${url}/plugins/scrollbar/css/jquery.mCustomScrollbar.css">

    <!-- Style Switcher -->
    <link rel="stylesheet" href="${url}/css/plugins/style-switcher.css">

    <!-- CSS Theme -->
    <link rel="stylesheet" href="${url}/css/theme-colors/default.css"
          id="style_color">

    <!-- CSS Customization -->
    <link rel="stylesheet" href="${url}/css/custom.css">
</head>
<body>
<div class="container">
    <div class="row">
        <div style="margin-top: 20px" class="col-md-3"><a href="/user?ac=home">
            <img href="/user?ac=home" src="/View/Client/Css/logo.png" alt="Logo" title="Logo">
        </a></div>
        <div style="margin-top: 30px" class="col-md-5 text-center"><div style="width: 70% ;float: right" class="input-group rounded">
            <input type="search" class="form-control rounded" placeholder="Search" aria-label="Search"
                   aria-describedby="search-addon" />
        </div>
        </div>
        <div class="col-md-1"></div>
        <div style="margin-top: 46px " class="col-md-3">
            <p style="color: red">Welcome ${user.getUsername()} !</p>
            <a style="" href="/View/Client/View/SignIn.jsp">Register/Log in</a>
        </div>
    </div>

    <!--=== Content Medium Part ===-->
    <div class="content-md margin-bottom-30">
        <div class="container">
            <form class="shopping-cart" action="#">
                <div>
                    <div class="header-tags">
                        <div class="overflow-h">
                            <h2>Shopping Cart</h2>
                            <p>Review &amp; edit your product</p>
                            <i class="rounded-x fa fa-check"></i>
                        </div>
                    </div>
                    <section>
                        <div class="table-responsive">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Qty</th>
                                    <th>Total</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${sessionScope.cart}" var="map">

                                    <tr>
                                        <td class="product-in-table">
                                            <img src="${map.value.product.image }">
                                            <div class="product-it-in">
                                                <h3>${map.value.product.name }</h3>
                                                <span>${map.value.product.des }</span>
                                            </div></td>
                                        <td>$ ${map.value.product.price }</td>
                                        <td>${map.value.quantity }</td>
                                        <td class="shop-red">$ ${map.value.product.price * map.value.quantity }</td>
                                        <td><a
                                                href="${pageContext.request.contextPath}/user?ac=removeItem&pId=${map.value.product.id}"><button
                                                type="button" class="close">
                                            <span>&times;</span><span class="sr-only">Close</span>
                                        </button></a></td>
                                    </tr>
                                </c:forEach>

                                </tbody>
                            </table>
                        </div>
                    </section>




                    <div class="header-tags">
                        <div class="overflow-h">
                            <h2>Payment</h2>
                            <p>Select Payment method</p>
                            <i class="rounded-x fa fa-credit-card"></i>
                        </div>
                    </div>
                    <section>
                        <div class="row">
                            <div class="col-md-6 md-margin-bottom-50">
                                <h2 class="title-type">Choose a payment method</h2>
                                <!-- Accordion -->
                                <div class="accordion-v2">
                                    <div class="panel-group" id="accordion">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapseOne"> <i class="fa fa-credit-card"></i>
                                                        Credit or Debit Card
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse in">
                                                <div class="panel-body cus-form-horizontal">
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">Fullname</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control required"
                                                                   name="fullname" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">Address</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control required"
                                                                   name="address" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">Phone Number</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control required"
                                                                   name="phoneNumber" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">Cardholder
                                                            Name</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control required"
                                                                   name="cardholder" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">Card
                                                            Number</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" class="form-control required"
                                                                   name="cardnumber" placeholder="">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">Payment
                                                            Types</label>
                                                        <div class="col-sm-8">
                                                            <ul class="list-inline payment-type">
                                                                <li><i class="fa fa-cc-paypal"></i></li>
                                                                <li><i class="fa fa-cc-visa"></i></li>
                                                                <li><i class="fa fa-cc-mastercard"></i></li>
                                                                <li><i class="fa fa-cc-discover"></i></li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4">Expiration Date</label>
                                                        <div class="col-sm-8 input-small-field">
                                                            <input type="text" name="mm" placeholder="MM"
                                                                   class="form-control required sm-margin-bottom-20">
                                                            <span class="slash">/</span> <input type="text"
                                                                                                name="yy" placeholder="YY"
                                                                                                class="form-control required">
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="col-sm-4 no-col-space control-label">CSC</label>
                                                        <div class="col-sm-8 input-small-field">
                                                            <input type="text" name="number" placeholder=""
                                                                   class="form-control required"> <a href="#">What's
                                                            this?</a>
                                                        </div>
                                                        <div>
                                                            <a href="#" type="button" class="btn-u btn-u-sea-shop" style="float: right">Place Order</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion"
                                                       href="#collapseTwo"> <i class="fa fa-paypal"></i> Pay
                                                        with PayPal
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo" class="panel-collapse collapse">
                                                <div class="content margin-left-10">
                                                    <a href="#"><img
                                                            src="https://www.paypalobjects.com/webstatic/en_US/i/buttons/PP_logo_h_150x38.png"
                                                            alt="PayPal"></a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Accordion -->
                            </div>

                            <div class="col-md-6">
                                <h2 class="title-type">Frequently asked questions</h2>
                                <!-- Accordion -->
                                <div class="accordion-v2 plus-toggle">
                                    <div class="panel-group" id="accordion-v2">
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" data-parent="#accordion-v2"
                                                       href="#collapseOne-v2"> What payments methods can I
                                                        use? </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne-v2" class="panel-collapse collapse in">
                                                <div class="panel-body">
                                                    You can use a Visa or MasterCard credit card to pay.
                                                    - including Visa or MasterCard prepaid cards which accept recurring payments
                                                    - including also Debit MasterCard or Visa Debit card
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" class="collapsed"
                                                       data-parent="#accordion-v2" href="#collapseTwo-v2">
                                                        Can I use gift card to pay for my purchase? </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo-v2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    Yes. The cost of the item you are purchasing doesn't have to be the same as the balance of your card. If you want to buy something that costs more than the balance on your gift card, all you need to do is give your retailer another payment method, like cash or debit card, to pay for the remaining cost.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" class="collapsed"
                                                       data-parent="#accordion-v2" href="#collapseThree-v2">
                                                        Will I be charged when I place my order? </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree-v2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    When you order, your credit card will be immediately charged the full sum.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-default">
                                            <div class="panel-heading">
                                                <h4 class="panel-title">
                                                    <a data-toggle="collapse" class="collapsed"
                                                       data-parent="#accordion-v2" href="#collapseFour-v2">
                                                        How long will it take to get my order? </a>
                                                </h4>
                                            </div>
                                            <div id="collapseFour-v2" class="panel-collapse collapse">
                                                <div class="panel-body">
                                                    Usually your order will be shipped 1-2 business days after placing your order (subject to card clearance and stock availability - up to 7 days during sale/campaign periods). Depending on your location and shipping option, your delivery times may vary.
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Accordion -->
                            </div>
                        </div>
                    </section>

                    <div class="coupon-code">
                        <div class="row">
                            <div class="col-sm-4 sm-margin-bottom-30">
                                <h3>Discount Code</h3>
                                <p>Enter your coupon code</p>
                                <input class="form-control margin-bottom-10" name="code"
                                       type="text">
                                <button type="button" class="btn-u btn-u-sea-shop">Apply
                                    Coupon</button>
                            </div>
                            <div class="col-sm-3 col-sm-offset-5">
                                <ul class="list-inline total-result">
                                    <li>
                                        <h4>Subtotal:</h4> <c:set var="total" value="${0}" /> <c:forEach
                                            items="${sessionScope.cart}" var="map">
                                        <c:set var="total"
                                               value="${total + map.value.quantity * map.value.product.price}" />
                                    </c:forEach>
                                        <div class="total-result-in">
                                            <span>$ ${total }</span>

                                        </div>
                                    </li>
                                    <li>
                                        <h4>Shipping:</h4>
                                        <div class="total-result-in">
                                            <span class="text-right">- - - -</span>
                                        </div>
                                    </li>
                                    <li class="divider"></li>
                                    <li class="total-price">
                                        <h4>Total:</h4>
                                        <div class="total-result-in">
                                            <span>$ ${total }</span>

                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <!--/end container-->
    </div>
    <!--=== End Content Medium Part ===-->

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
<!-- JS Global Compulsory -->
<script src="${url}/plugins/jquery/jquery.min.js"></script>
<script src="${url}/plugins/jquery/jquery-migrate.min.js"></script>
<script src="${url}/plugins/bootstrap/js/bootstrap.min.js"></script>
<!-- JS Implementing Plugins -->
<script src="${url}/plugins/back-to-top.js"></script>
<script src="${url}/plugins/smoothScroll.js"></script>
<script src="${url}/plugins/jquery-steps/build/jquery.steps.js"></script>
<script
        src="${url}/plugins/scrollbar/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script
        src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.validate.min.js"></script>
<!-- JS Customization -->
<script src="${url}/js/custom.js"></script>
<!-- JS Page Level -->
<script src="${url}/js/shop.app.js"></script>
<script src="${url}/js/forms/page_login.js"></script>
<script src="${url}/js/plugins/stepWizard.js"></script>
<script src="${url}/js/forms/product-quantity.js"></script>
<script>
    jQuery(document).ready(function() {
        App.init();
        Login.initLogin();
        App.initScrollBar();
        StepWizard.initStepWizard();
        StyleSwitcher.initStyleSwitcher();
    });
</script>

<!--[if lt IE 9]>
    <script src="${url}/plugins/respond.js"></script>
    <script src="${url}/plugins/html5shiv.js"></script>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/sky-forms-ie8.js"></script>
<![endif]-->
<!--[if lt IE 10]>
    <script src="${url}/plugins/sky-forms-pro/skyforms/js/jquery.placeholder.min.js"></script>
<![endif]-->
</body>
</html>