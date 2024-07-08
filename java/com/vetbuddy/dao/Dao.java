package com.vetbuddy.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;

import org.eclipse.jdt.internal.compiler.ast.ReturnStatement;

import com.google.protobuf.Empty;
import com.vetbuddy.dto.Admin;
import com.vetbuddy.dto.Doctor;
import com.vetbuddy.dto.Farmer;
import com.vetbuddy.util.JdbcUtil;




public class Dao {


	public static String saveFarmer(Farmer farmer)
	{
		String status  = "Something Went Wrong..."; 
		try {
			Connection connection = JdbcUtil.physicalConnection();
			PreparedStatement preparedStatement = null;
			String insertQuery = "insert into farmer(`name`,`email`,`password`,`address`,`Postal_code`,`village`,`district`,`mobile`) values(?,?,?,?,?,?,?,?)";
			if(connection!=null)
			{
				preparedStatement =  connection.prepareStatement(insertQuery);

			}
			if (preparedStatement!=null) {

				preparedStatement.setString(1,farmer.getName());
				preparedStatement.setString(2,farmer.getEmail());
				preparedStatement.setString(3,farmer.getPassword());
				preparedStatement.setString(4,farmer.getAddress());
				preparedStatement.setInt(5,farmer.getPostal_code());
				preparedStatement.setString(6,farmer.getVillage());
				preparedStatement.setString(7,farmer.getDistrict());
				preparedStatement.setLong(8, farmer.getMobile());


			   Integer affectedRow =  preparedStatement.executeUpdate();

			   if (affectedRow>0) {
				   status = "done";
				  
			    }

			}


		}catch (SQLIntegrityConstraintViolationException e) {
			   status = "The Email Id is Already Exist!";
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	    return status;
	}

	
	
	public static String saveDoctor(Doctor doctor)
	{
		String status  = "Something Went Wrong..."; 
		try {
			Connection connection = JdbcUtil.physicalConnection();
			PreparedStatement preparedStatement = null;
			String insertQuery = "insert into doctor(`name`,`email`,`address`,`Postal_code`,`village`,`district`,`mobile`,`certificate`) values(?,?,?,?,?,?,?,?)";
			if(connection!=null)
			{
				preparedStatement =  connection.prepareStatement(insertQuery);

			}
			if (preparedStatement!=null) {

				preparedStatement.setString(1,doctor.getName());
				preparedStatement.setString(2,doctor.getEmail());
				preparedStatement.setString(3,doctor.getAddress());
				preparedStatement.setInt(4,doctor.getPostal_code());
				preparedStatement.setString(5,doctor.getVillage());
				preparedStatement.setString(6,doctor.getDistrict());
				preparedStatement.setLong(7,doctor.getMobile());
				preparedStatement.setBinaryStream(8,doctor.getCertificate());


			   Integer affectedRow =  preparedStatement.executeUpdate();

			   if (affectedRow>0) {
				   status = "done";
				  
			    }

			}


		}catch (SQLIntegrityConstraintViolationException e) {
			   status = "The Email Id is Already Exist!";
		}
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}

	    return status;
	}
	public static Farmer getFarmerByEmailPassword(String email,String password)
	{

		Farmer farmer  = null;
		Connection connection = null;
		try {

		 connection = JdbcUtil.physicalConnection();
		PreparedStatement preparedStatement = null;
		String insertQuery = "select * from farmer where email=? and password=?";
		if(connection!=null)
		{
			preparedStatement =  connection.prepareStatement(insertQuery);

		}

		if(preparedStatement!=null)
		{
			preparedStatement.setString(1,email);
			preparedStatement.setString(2,password);

			ResultSet resultSet = preparedStatement.executeQuery();

			if(resultSet.next())
			{
				farmer = new Farmer();
				farmer.setFid(resultSet.getInt("fid"));				farmer.setName(resultSet.getString("name"));
				farmer.setEmail(resultSet.getString("email"));
				farmer.setPassword(resultSet.getString("password"));
				farmer.setAddress(resultSet.getString("address"));
				farmer.setVillage(resultSet.getString("village"));
				farmer.setDistrict(resultSet.getString("district"));
				farmer.setMobile(resultSet.getLong("mobile"));
				farmer.setPostal_code(resultSet.getInt("postal_code"));


			}
		}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
		    if (connection!=null) {
				 try {
					connection.close();
				} catch (SQLException e) {

					e.printStackTrace();
				}
			}
		}
		return farmer;

	}

	public static Boolean updateFarmer(Farmer farmer)
	{

		String updateQuery = "update farmer set name=?,email=?,password=?,address=?,village=?,postal_code=?,district=? where fid=?";
		Connection connection=null;
		PreparedStatement preparedStatement = null;
		Integer affectedRow = null;

		try {

			connection  = JdbcUtil.physicalConnection();

			if(connection!=null)
			{
				preparedStatement = connection.prepareStatement(updateQuery);
			}

			if(preparedStatement!=null)
			{
				preparedStatement.setString(1,farmer.getName());
				preparedStatement.setString(2,farmer.getEmail());
				preparedStatement.setString(3,farmer.getPassword());
				preparedStatement.setString(4,farmer.getAddress());
				preparedStatement.setString(5,farmer.getVillage());
				preparedStatement.setInt(6,farmer.getPostal_code());
				preparedStatement.setString(7,farmer.getDistrict());
				preparedStatement.setInt(8,farmer.getFid());


				affectedRow =  preparedStatement.executeUpdate();
			}

		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return affectedRow>0;

	}
	
	public static Admin getAdmin(String email,String password)
	{
		// Resources 
		
		Connection connection = null;
		ResultSet resultSet  = null;
		PreparedStatement preparedStatement = null;
		Admin admin  = null;
		String selectQuery = "Select `admin_id`,`name`,`email`,`password` from Admin where email=? and password = ?";
		
		try {
			
			connection = JdbcUtil.physicalConnection();
			if (connection!=null) {
				
				preparedStatement =  connection.prepareStatement(selectQuery);
			}
			
			if (preparedStatement!=null) {
				
			    preparedStatement.setString(1,email);
			    preparedStatement.setString(2,password);
			    
			    
			    resultSet = preparedStatement.executeQuery();
			}
			if (resultSet.next()) {
				admin = new Admin();
				admin.setAdmin_id(resultSet.getInt("admin_id"));
				admin.setEmail(resultSet.getString("email"));
				admin.setName(resultSet.getString("name"));
				admin.setPassword(resultSet.getString("password"));
			}
		}
		catch (SQLException e) {
		   e.printStackTrace();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
			   connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		
	  return admin;  	
	}

  

}
