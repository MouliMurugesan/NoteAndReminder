package com.NoteAndRemainder1.DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionDb {
    public static Connection con;
    
    public static Connection getConnection(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/noteandremainder","root","@mouli091609");
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}