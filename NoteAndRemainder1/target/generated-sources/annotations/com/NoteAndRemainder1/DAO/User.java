package com.NoteAndRemainder1.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.NoteAndRemainder1.Model.Registration;

public class User {
	Connection con ;

    public User(Connection con) {
        this.con = con;
    }
    
    //for register user 
    public boolean saveUser(Registration register) throws SQLException{
        boolean set = false;
        try{
            //Insert register data to database
        	String check="Select * from registration where email=?";
        	PreparedStatement ptc = con.prepareStatement(check);
            ptc.setString(1, register.getEmail());
            ResultSet rs=ptc.executeQuery();
            if(rs.next())
            {
            	 return false;
            }
            String query = "insert into registration(Name,email,mobno,password) values(?,?,?,?)";
           PreparedStatement pt = con.prepareStatement(query);
           pt.setString(1, register.getName());
           pt.setString(2, register.getEmail());
           pt.setString(3, register.getMobile());
           pt.setString(4, register.getPassword());
           pt.executeUpdate();
           set = true;
           
        }catch(Exception e){
        	 
            e.printStackTrace();
           
        }
        
        con.close();
        
        return set;
    }

}
