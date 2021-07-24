package com.aptech.controllers;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import javax.persistence.*;

import com.aptech.models.Product;
import com.aptech.repositories.ProductRepository;
/*
Create mysql container
docker pull mysql:5.7.35 
docker run -d --rm --name mysql-c1908GDoiCan -e MYSQL_ROOT_PASSWORD=123456 -p 3308:3306 -v c1908GDoiCanDatabase:/var/lib/mysql mysql:5.7.35
//ket noi den database trong container ?
phpmyadmin => dung terminal
mysql -h localhost -P 3308 --protocol=tcp -u root -p
create database testdb;
use testdb;
create table tblProduct(
	ID int PRIMARY KEY AUTO_INCREMENT,
	productName VARCHAR(300),
	price float default 0.0,
	quantity int default 1 
);
ALTER TABLE tblProduct ADD UNIQUE (productName);
insert into tblProduct(productName, price, quantity)
values
('Macbook pro',1234,12),
('Macbook air',1090,123);

 */
@WebServlet(value = "/productlist.jsp") //giong route trong .net
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductController() {
        // TODO Auto-generated constructor stub
    }
	//"/products"
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductRepository productRepository = new ProductRepository();
		List<Product> products = productRepository.findAll();
		RequestDispatcher requestDispatcher;
		System.out.println("haha");
		requestDispatcher = request.getRequestDispatcher("productlist.jsp");	
		request.setAttribute("products", products);
		//ViewBag, ViewData trong asp .net mvc
		requestDispatcher.forward(request, response);
		//solution ?
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher requestDispatcher;
		String productname = request.getParameter("productname");				
				
	}

}
