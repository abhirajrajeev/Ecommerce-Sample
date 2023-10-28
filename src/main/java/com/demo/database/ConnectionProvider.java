package com.demo.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {

	public static Connection getcon()
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ecommerce","root","abhi");
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
		
	}
} 
