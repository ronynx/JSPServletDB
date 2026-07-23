package com.example.productmanagement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {


    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {


        String action = request.getParameter("action");


        try {

            Connection con = DBConnection.getConnection();


            // UPDATE PRODUCT
            if ("update".equals(action)) {

                int id = Integer.parseInt(request.getParameter("id"));

                String name = request.getParameter("name");
                String category = request.getParameter("category");
                double price = Double.parseDouble(request.getParameter("price"));


                String sql =
                        "UPDATE product SET name=?, category=?, price=? WHERE id=?";


                PreparedStatement ps = con.prepareStatement(sql);

                ps.setString(1, name);
                ps.setString(2, category);
                ps.setDouble(3, price);
                ps.setInt(4, id);


                ps.executeUpdate();

                ps.close();

            }

            // INSERT PRODUCT
            else {

                String name = request.getParameter("name");
                String category = request.getParameter("category");
                double price =
                        Double.parseDouble(request.getParameter("price"));


                String sql =
                        "INSERT INTO product(name, category, price) VALUES(?,?,?)";


                PreparedStatement ps = con.prepareStatement(sql);


                ps.setString(1, name);
                ps.setString(2, category);
                ps.setDouble(3, price);


                ps.executeUpdate();

                ps.close();
            }


            con.close();


        } catch(Exception e) {

            e.printStackTrace();

        }


        response.sendRedirect("product");

    }




    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {


        String action = request.getParameter("action");


        try {


            Connection con = DBConnection.getConnection();



            // DELETE PRODUCT
            if ("delete".equals(action)) {


                int id =
                        Integer.parseInt(request.getParameter("id"));


                String sql =
                        "DELETE FROM product WHERE id=?";


                PreparedStatement ps =
                        con.prepareStatement(sql);


                ps.setInt(1, id);


                ps.executeUpdate();


                ps.close();

                con.close();


                response.sendRedirect("product");

                return;

            }



            // EDIT PRODUCT - LOAD DATA
            if ("edit".equals(action)) {


                int id =
                        Integer.parseInt(request.getParameter("id"));


                String sql =
                        "SELECT * FROM product WHERE id=?";


                PreparedStatement ps =
                        con.prepareStatement(sql);


                ps.setInt(1, id);


                ResultSet rs = ps.executeQuery();



                if(rs.next()) {


                    Product p = new Product();


                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setCategory(rs.getString("category"));
                    p.setPrice(rs.getDouble("price"));


                    request.setAttribute("product", p);

                }


                rs.close();
                ps.close();
                con.close();


                request.getRequestDispatcher("edit.jsp")
                        .forward(request,response);


                return;

            }



            // SHOW ALL PRODUCTS

            List<Product> products = new ArrayList<>();


            String sql =
                    "SELECT * FROM product";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ResultSet rs =
                    ps.executeQuery();



            while(rs.next()) {


                Product p = new Product();


                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));


                products.add(p);

            }


            rs.close();
            ps.close();
            con.close();



            request.setAttribute("products", products);


            request.getRequestDispatcher("view.jsp")
                    .forward(request,response);



        } catch(Exception e) {

            e.printStackTrace();

        }

    }

}
