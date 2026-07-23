<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>

    <style>

        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .container {
            width: 400px;
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

        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        label {
            width: 120px;
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"] {

            width: 220px;
            padding: 8px;
            border: 1px solid #aaa;
            border-radius: 4px;

        }

        input[type="submit"] {

            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;

        }

        input[type="submit"]:hover {

            background-color: #0056b3;

        }

    </style>

</head>

<body>

<div class="container">

    <h2>Add Product</h2>

    <form action="product" method="post">

        <div class="form-group">
            <label>Product Name:</label>
            <input type="text" name="name" required>
        </div>


        <div class="form-group">
            <label>Category:</label>
            <input type="text" name="category" required>
        </div>


        <div class="form-group">
            <label>Price:</label>
            <input type="number" step="0.01" name="price" required>
        </div>


        <input type="submit" value="Save Product">

    </form>

</div>

</body>
</html>
