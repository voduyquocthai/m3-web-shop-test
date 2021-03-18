<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add product</title>
    <style>
        #content{
            margin: 25px 25px 0 350px;
        }
    </style>
</head>
<body>
<div id="wrapper">
    <jsp:include page="/View/Admin/View/Index.jsp"></jsp:include>
    <div id="content">
        <div class="container-fluid">
            <form method="post" style="width: 80%; margin-top: 50px;margin-left: 150px">
                <div class="row"><h2> Add new product </h2></div>
                <div style="margin-top: 20px" class="form-row">
                    <div class="form-group col-md-6">
                        <label for="inputName">Name product</label>
                        <input name="name_product" type="text" class="form-control" id="inputName" placeholder="Enter name product">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="inputPrice">Price</label>
                        <input name="price_product" type="number" class="form-control" id="inputPrice" placeholder="Enter price">
                    </div>
                </div>
                <div class="form-group">
                    <label >Category</label>
                    <div class="checkbox">
                        <select name="category">
                            <c:forEach items="${requestScope['categories']}" var="c">
                                <option value="${c.getId()}">${c.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputDes">Description</label>
                    <input name="des_product" type="text" class="form-control" id="inputDes" placeholder="Enter description" >
                </div>
                <div class="form-group">
                    <label class="form-label" for="customFile">Image</label>
                    <input name="image" type="file" class="form-control" id="customFile" />
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
