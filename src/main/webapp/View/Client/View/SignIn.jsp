<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 15/03/2021
  Time: 8:39 SA
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/View/Client/Css/SignIn.css">
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container">
<div style="margin-top: 50px" class="row">
    <div class="col-md-3"></div>
    <div class="col-md-6 mx-auto p-0">
        <div class="card">
            <div class="login-box">
                <div class="login-snip">
                    <h2 class="message" style="font-size: 15px; color: red">${message}</h2>
                    <input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Login</label>
                    <input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab">Sign Up</label>
                    <div class="login-space">

                            <div class="login">
                                <form action="/user?ac=login" method="post">
                                <div class="group"> <label for="user" class="label">Username</label> <input name="username" id="user" type="text" class="input" placeholder="Enter your username"> </div>
                                <div class="group"> <label for="pass" class="label">Password</label> <input name="password" id="pass" type="password" class="input" data-type="password" placeholder="Enter your password"> </div>
                                <div class="group"> <input name="keep-signed-in" id="check" type="checkbox" class="check" checked> <label for="check"><span class="icon"></span> Keep me Signed in</label> </div>
                                <div class="group"> <input type="submit" class="button" value="Sign In"> </div>

                                <div class="hr"></div>
                                <div class="foot"> <a href="#">Forgot Password?</a> </div>
                                <div style="margin-top: 50px" class="foot"> <a href="/user"><--Back</a> </div>
                                </form>
                            </div>


                            <div class="sign-up-form">
                                <form action="/user?ac=register" method="post">
                                <div class="group"> <label for="user" class="label">Username</label> <input name="username" id="user1" type="text" class="input" placeholder="Create your Username"> </div>
                                <div class="group"> <label for="pass" class="label">Password</label> <input name="password" id="pass1" type="password" class="input" data-type="password" placeholder="Create your password"> </div>
                                <div class="group"> <label for="pass" class="label">Repeat Password</label> <input id="pass2" type="password" class="input" data-type="password" placeholder="Repeat your password"> </div>
                                <div class="group"> <label for="pass" class="label">Email Address</label> <input name="email" id="pass3" type="text" class="input" placeholder="Enter your email address"> </div>
                                <div class="group"> <input type="submit" class="button" value="Sign Up"> </div>
                                <div class="hr"></div>
                                <div class="foot"> <label for="tab-1">Already Member?</label> </div>
                                </form>
                            </div>


                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-md-3"></div>
</div>
</div>
</body>
</html>
