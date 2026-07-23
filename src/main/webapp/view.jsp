<%@ page import="java.util.List" %>
<%@ page import="com.example.productmanagement.Product" %>

<%
    if(request.getAttribute("products") == null){
        response.sendRedirect("product");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>View Products</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            width: 800px;
            margin: 50px auto;
            background: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px #aaa;
        }

        h2 {
            text-align: center;
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background-color: #007bff;
            color: white;
            padding: 10px;
        }

        td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: center;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .btn {

            padding: 6px 12px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin: 2px;

        }

        .update {
            background-color: #28a745;
        }

        .delete {
            background-color: #dc3545;
        }

        .add-btn {

            display: inline-block;
            margin-top:20px;
            padding:10px 20px;
            background:#007bff;
            color:white;
            text-decoration:none;
            border-radius:4px;

        }

    </style>

</head>

<body>


<div class="container">

    <h2>Product List</h2>


    <%
        List<Product> products =
                (List<Product>)request.getAttribute("products");
    %>


    <table>

        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Category</th>
            <th>Price</th>
            <th>Action</th>
        </tr>


        <%
            for(Product p : products){
        %>


        <tr>

            <td><%=p.getId()%></td>

            <td><%=p.getName()%></td>

            <td><%=p.getCategory()%></td>

            <td><%=p.getPrice()%></td>


            <td>

                <a class="btn update"
                   href="product?action=edit&id=<%=p.getId()%>">
                    Update
                </a>


                <a class="btn delete"
                   href="product?action=delete&id=<%=p.getId()%>"
                   onclick="return confirm('Delete this product?');">
                    Delete
                </a>

            </td>

        </tr>


        <%
            }
        %>


    </table>


    <div style="text-align:center">

        <a class="add-btn" href="add.jsp">
            Add Product
        </a>

    </div>


</div>


</body>
</html>
