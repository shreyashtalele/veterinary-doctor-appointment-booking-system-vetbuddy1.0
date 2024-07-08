package com.vetbuddy.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import com.vetbuddy.dto.Admin;
import com.vetbuddy.dto.Appointment;
import com.vetbuddy.dto.AppointmentInfo;
import com.vetbuddy.dto.Doctor;
import com.vetbuddy.dto.Pet;
import com.vetbuddy.dto.PetOwner;
import com.vetbuddy.util.JdbcUtil;




public class Dao {


	public static String savePetOwner(PetOwner petOwner)
	{
		String status  = "Something Went Wrong..."; 
		try {
			Connection connection = JdbcUtil.physicalConnection();
			PreparedStatement preparedStatement = null;
			String insertQuery = "insert into petowner(`name`,`email`,`password`,`address`,`Postal_code`,`village`,`district`,`mobile`) values(?,?,?,?,?,?,?,?)";
			if(connection!=null)
			{
				preparedStatement =  connection.prepareStatement(insertQuery);

			}
			if (preparedStatement!=null) {

				preparedStatement.setString(1,petOwner.getName());
				preparedStatement.setString(2,petOwner.getEmail());
				preparedStatement.setString(3,petOwner.getPassword());
				preparedStatement.setString(4,petOwner.getAddress());
				preparedStatement.setInt(5,petOwner.getPostal_code());
				preparedStatement.setString(6,petOwner.getVillage());
				preparedStatement.setString(7,petOwner.getDistrict());
				preparedStatement.setLong(8, petOwner.getMobile());


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
	
	
	
	public static Integer savePet(Pet pet) {
	    PreparedStatement preparedStatement = null;
	    Connection connection = null;
	    Integer generatedId = null;
	    
	    try {
	        connection = JdbcUtil.physicalConnection();
	        String insertQuery = "insert into pet(`name`,`age`,`breed`,`species`,`oid`) values(?,?,?,?,?)";
	        if (connection != null) {
	            preparedStatement = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
	        }

	        if (preparedStatement != null) {
	            preparedStatement.setString(1, pet.getPetName());
	            preparedStatement.setInt(2, pet.getAge());
	            preparedStatement.setString(3, pet.getBreed());
	            preparedStatement.setString(4, pet.getSpecies());
	            preparedStatement.setInt(5, pet.getOwnerId());

	            int affectedRows = preparedStatement.executeUpdate();

	            if (affectedRows > 0) {
	                ResultSet generatedKeys = preparedStatement.getGeneratedKeys();

	                if (generatedKeys.next()) {
	                    generatedId = generatedKeys.getInt(1);
	                } else {
	                    return -1; // Handle no generated keys scenario
	                }
	            }
	        }
	    } catch (SQLIntegrityConstraintViolationException e) {
	        e.printStackTrace();
	    } catch (FileNotFoundException e) {
	        e.printStackTrace();
	    } catch (IOException e) {
	        e.printStackTrace();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        // Close resources in a finally block
	        try {
	            if (preparedStatement != null) {
	                preparedStatement.close();
	            }
	            if (connection != null) {
	                connection.close();
	            }
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	    }
	    return generatedId;
	}


	
	
	public static Pet getPetByOwner(Integer oid){
		
		Pet pet  = null;
		Connection connection = null;
		try {

		connection = JdbcUtil.physicalConnection();
		PreparedStatement preparedStatement = null;
		String insertQuery = "select * from pet where oid=?";
		if(connection!=null)
		{
			preparedStatement =  connection.prepareStatement(insertQuery);

		}

		if(preparedStatement!=null)
		{
			preparedStatement.setInt(1,oid);

			ResultSet resultSet = preparedStatement.executeQuery();

			if(resultSet.next())
			{
				pet = new Pet();
				pet.setPetId(resultSet.getInt("pid"));
				pet.setPetName(resultSet.getString("name"));
				pet.setAge(resultSet.getInt("age"));
				pet.setBreed(resultSet.getString("breed"));
				pet.setOwnerId(resultSet.getInt("oid"));
				pet.setSpecies(resultSet.getString("species"));
				

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
		return pet;
	}
	
	public static String saveDoctor(Doctor doctor)
	{
		String status  = "Something Went Wrong..."; 
		try {
			Connection connection = JdbcUtil.physicalConnection();
			PreparedStatement preparedStatement = null;
			String insertQuery = "insert into doctor(`name`,`email`,`address`,`Postal_code`,`village`,`district`,`mobile`,`certificate`,`password`,`specialization`) values(?,?,?,?,?,?,?,?,?,?)";
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
				preparedStatement.setString(9,doctor.getPassword());
				preparedStatement.setString(10,doctor.getSpecialization());


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
	
	
	
	
	public static List<AppointmentInfo> getAppointmentDetailsByOID(Integer oid) {
		
		Connection connection = null;
		List<AppointmentInfo> list = null;
		AppointmentInfo appointmentInfo = null;
		try {

		connection = JdbcUtil.physicalConnection();
		PreparedStatement preparedStatement = null;
		String selectQuery = "SELECT o.name, o.address, o.mobile, p.species, p.breed," +
				"a.appointment_date, a.booking_date, a.appointment_status, a.aid, d.name, d.specialization " +
				"FROM appointment a " +
				"JOIN doctor d ON a.did = d.did " +
				"JOIN petowner o ON a.oid = o.oid " +
				"JOIN pet p ON a.pid = p.pid " +
				"WHERE o.oid = ? ORDER BY a.booking_date DESC limit 2";


		if(connection!=null)
		{
			preparedStatement =  connection.prepareStatement(selectQuery);

		}

		if(preparedStatement!=null)
		{
			preparedStatement.setInt(1,oid);

			ResultSet resultSet = preparedStatement.executeQuery();
            list = new ArrayList<AppointmentInfo>();
            if(resultSet!=null) {
			while(resultSet.next())
			{
				appointmentInfo = new AppointmentInfo();
				appointmentInfo.setOwnerName(resultSet.getString(1));
				appointmentInfo.setAddress(resultSet.getString(2));
				appointmentInfo.setMobile(resultSet.getLong(3));
				appointmentInfo.setPetSpecies(resultSet.getString(4));
				appointmentInfo.setBreed(resultSet.getString(5));
				appointmentInfo.setAppointmentDate(resultSet.getDate(6));
				appointmentInfo.setBookingDate(resultSet.getDate(7));
				appointmentInfo.setAppointment_status(resultSet.getString(8));
				appointmentInfo.setAid(resultSet.getInt(9));
				appointmentInfo.setDoctorName(resultSet.getString(10));
				appointmentInfo.setSpecialization(resultSet.getString(11));

                 list.add(appointmentInfo);
                 
			}
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
		return list;
		
	}
	
	
public static List<AppointmentInfo> getAllAppointmentDetailsByOID(Integer oid) {
		
		Connection connection = null;
		List<AppointmentInfo> list = null;
		AppointmentInfo appointmentInfo = null;
		try {

		connection = JdbcUtil.physicalConnection();
		PreparedStatement preparedStatement = null;
		String selectQuery = "SELECT o.name, o.address, o.mobile, p.species, p.breed," +
				"a.appointment_date, a.booking_date, a.appointment_status, a.aid, d.name, d.specialization " +
				"FROM appointment a " +
				"JOIN doctor d ON a.did = d.did " +
				"JOIN petowner o ON a.oid = o.oid " +
				"JOIN pet p ON a.pid = p.pid " +
				"WHERE o.oid = ?";


		if(connection!=null)
		{
			preparedStatement =  connection.prepareStatement(selectQuery);

		}

		if(preparedStatement!=null)
		{
			preparedStatement.setInt(1,oid);

			ResultSet resultSet = preparedStatement.executeQuery();
            list = new ArrayList<AppointmentInfo>();
            if(resultSet!=null) {
			while(resultSet.next())
			{
				appointmentInfo = new AppointmentInfo();
				appointmentInfo.setOwnerName(resultSet.getString(1));
				appointmentInfo.setAddress(resultSet.getString(2));
				appointmentInfo.setMobile(resultSet.getLong(3));
				appointmentInfo.setPetSpecies(resultSet.getString(4));
				appointmentInfo.setBreed(resultSet.getString(5));
				appointmentInfo.setAppointmentDate(resultSet.getDate(6));
				appointmentInfo.setBookingDate(resultSet.getDate(7));
				appointmentInfo.setAppointment_status(resultSet.getString(8));
				appointmentInfo.setAid(resultSet.getInt(9));
				appointmentInfo.setDoctorName(resultSet.getString(10));
				appointmentInfo.setSpecialization(resultSet.getString(11));

                 list.add(appointmentInfo);
                 
			}
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
		return list;
		
	}
	
public static List<AppointmentInfo> getAppointmentDetails(Integer did) {
		
		Connection connection = null;
		List<AppointmentInfo> list = null;
		AppointmentInfo appointmentInfo = null;
		try {

		connection = JdbcUtil.physicalConnection();
		PreparedStatement preparedStatement = null;
		String selectQuery = "SELECT o.oid, o.name, o.address, o.mobile, p.species, p.breed," +
				"a.appointment_date, a.booking_date, a.appointment_status, a.aid, o.email " +
				"FROM appointment a " +
				"JOIN doctor d ON a.did = d.did " +
				"JOIN petowner o ON a.oid = o.oid " +
				"JOIN pet p ON a.pid = p.pid " +
				"WHERE a.did = ?";


		if(connection!=null)
		{
			preparedStatement =  connection.prepareStatement(selectQuery);

		}

		if(preparedStatement!=null)
		{
			preparedStatement.setInt(1,did);

			ResultSet resultSet = preparedStatement.executeQuery();
            list = new ArrayList<AppointmentInfo>();
            if(resultSet!=null) {
			while(resultSet.next())
			{
				appointmentInfo = new AppointmentInfo();
				appointmentInfo.setOid(resultSet.getInt(1));
				appointmentInfo.setOwnerName(resultSet.getString(2));
				appointmentInfo.setAddress(resultSet.getString(3));
				appointmentInfo.setMobile(resultSet.getLong(4));
				appointmentInfo.setPetSpecies(resultSet.getString(5));
				appointmentInfo.setBreed(resultSet.getString(6));
				appointmentInfo.setAppointmentDate(resultSet.getDate(7));
				appointmentInfo.setBookingDate(resultSet.getDate(8));
				appointmentInfo.setAppointment_status(resultSet.getString(9));
				appointmentInfo.setAid(resultSet.getInt(10));
				appointmentInfo.setEmail(resultSet.getString(11));

                 list.add(appointmentInfo);
                 
			}
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
		return list;
		
	}
	
	public static Boolean updateAppointmentStatus(Integer aid ,String updateStatus){
		
		Connection connection =null;
		Integer affectedRow  = null;
		PreparedStatement preparedStatement = null;
		try {
			 connection = JdbcUtil.physicalConnection();
			String updateQuery = "UPDATE appointment set appointment_status=? where aid = ?";
			if(connection!=null)
			{
				preparedStatement =  connection.prepareStatement(updateQuery);

			}
			if (preparedStatement!=null) {
				
				preparedStatement.setString(1,updateStatus);
				preparedStatement.setInt(2,aid);
			    affectedRow =  preparedStatement.executeUpdate();

			}


		}catch (SQLIntegrityConstraintViolationException e) {
		      e.printStackTrace();
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

		return affectedRow>0;
		
	}
	public static Boolean bookAppointment(Appointment appointment) {
		
		Connection connection =null;
		Integer affectedRow  = null;
		PreparedStatement preparedStatement = null;
		try {
			 connection = JdbcUtil.physicalConnection();
			String insertQuery = "insert into appointment(`did`,`oid`,`pid`,`appointment_date`,`booking_date`) values(?,?,?,?,?)";
			if(connection!=null)
			{
				preparedStatement =  connection.prepareStatement(insertQuery);

			}
			if (preparedStatement!=null) {

				preparedStatement.setInt(1,appointment.getDid());
				preparedStatement.setInt(2,appointment.getOid());
				preparedStatement.setInt(3,appointment.getPid());
				preparedStatement.setObject(4, appointment.getAppointmentDate());
				preparedStatement.setObject(5, appointment.getBookingDate());


			   affectedRow =  preparedStatement.executeUpdate();

			   

			}


		}catch (SQLIntegrityConstraintViolationException e) {
		      e.printStackTrace();
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

		return affectedRow>0;
		
		
	}
	
	
	
	
	
	
	public static PetOwner getPetOwnerByEmailPassword(String email,String password)
	{

		PetOwner petOwner  = null;
		Connection connection = null;
		try {

		 connection = JdbcUtil.physicalConnection();
		PreparedStatement preparedStatement = null;
		String insertQuery = "select * from petowner where email=? and password=?";
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
				petOwner = new PetOwner();
				petOwner.setOid(resultSet.getInt("oid"));	
				petOwner.setName(resultSet.getString("name"));
				petOwner.setEmail(resultSet.getString("email"));
				petOwner.setPassword(resultSet.getString("password"));
				petOwner.setAddress(resultSet.getString("address"));
				petOwner.setVillage(resultSet.getString("village"));
				petOwner.setDistrict(resultSet.getString("district"));
				petOwner.setMobile(resultSet.getLong("mobile"));
				petOwner.setPostal_code(resultSet.getInt("postal_code"));


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
		return petOwner;

	}

	public static Boolean updatePetOwner(PetOwner petOwner)
	{
        
		String updateQuery = "update petowner set name=?,email=?,password=?,address=?,village=?,postal_code=?,district=? where oid=?";
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
				preparedStatement.setString(1,petOwner.getName());
				preparedStatement.setString(2,petOwner.getEmail());
				preparedStatement.setString(3,petOwner.getPassword());
				preparedStatement.setString(4,petOwner.getAddress());
				preparedStatement.setString(5,petOwner.getVillage());
				preparedStatement.setInt(6,petOwner.getPostal_code());
				preparedStatement.setString(7,petOwner.getDistrict());
				preparedStatement.setInt(8,petOwner.getOid());


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
	
	
	
	public static Boolean updateDoctor(Doctor doctor)
	{
        
		String updateQuery = "update doctor set name=?,email=?,password=?,address=?,village=?,postal_code=?,district=? where did=?";
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
				preparedStatement.setString(1,doctor.getName());
				preparedStatement.setString(2,doctor.getEmail());
				preparedStatement.setString(3,doctor.getPassword());
				preparedStatement.setString(4,doctor.getAddress());
				preparedStatement.setString(5,doctor.getVillage());
				preparedStatement.setInt(6,doctor.getPostal_code());
				preparedStatement.setString(7,doctor.getDistrict());
				preparedStatement.setInt(8,doctor.getDid());


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
	public static Boolean updatePetOwner(String name,String email,Long mobile,Integer oid)
	{
        
		String updateQuery = "update petowner set name=?,email=?,mobile=? where oid=?";
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
				preparedStatement.setString(1,name);
				preparedStatement.setString(2,email);
				preparedStatement.setLong(3, mobile);
				preparedStatement.setInt(4,oid);
				


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
	
	public static Boolean verifyDoctorByID(Integer did)
	{
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String verify = "Verified";
		Integer AffectedRow = 0;
		String updateQuery = "UPDATE DOCTOR SET verification=? WHERE did=?";
		
		try {
			
			connection = JdbcUtil.physicalConnection();
			if (connection!=null) {
				
				preparedStatement =  connection.prepareStatement(updateQuery);
			}
			
			if (preparedStatement!=null) {
				
			    preparedStatement.setString(1,verify);  
			    preparedStatement.setInt(2,did);
			    
			    AffectedRow = preparedStatement.executeUpdate();
			   
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
		
		
	   return AffectedRow>0;
		
	}
	
	
	public  static Doctor getDoctorByEmailPassword( String email,String password) {
		
		

		Connection connection  = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String selectQuery = "SELECT * FROM DOCTOR WHERE email=? and password=?";
		Doctor doctor = null;
		
		try {
			 connection = JdbcUtil.physicalConnection();
			 
			 if(connection!=null)
			 {
				 preparedStatement = connection.prepareStatement(selectQuery);
			 }
			 if(preparedStatement!=null)
			 {
				 preparedStatement.setString(1,email);
				 preparedStatement.setString(2,password);
				 
				 resultSet = preparedStatement.executeQuery();
			 }
			 if(resultSet!=null)
			 {
				if(resultSet.next())
				{
					doctor = new Doctor();
					
					doctor.setDid(resultSet.getInt("did"));
					doctor.setName(resultSet.getString("name"));
					doctor.setEmail(resultSet.getString("email"));
					doctor.setMobile(resultSet.getLong("mobile"));
					doctor.setAddress(resultSet.getString("address"));
					doctor.setVillage(resultSet.getString("village"));
					doctor.setDistrict(resultSet.getString("district"));
					doctor.setPostal_code(resultSet.getInt("postal_code"));
					doctor.setCertificate(resultSet.getBinaryStream("certificate"));
					doctor.setVerification(resultSet.getString("verification"));
					doctor.setSpecialization(resultSet.getString("specialization"));
					
				}
			 }
		}
		catch (SQLException e) {
			
		}
		catch (Exception e) {
			
		}
		return doctor;
		
	}
	
	public static Doctor getDoctorCredential(Integer did)
	{
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Doctor doctor = null;
		String selectQuery = "SELECT `name`,`email`,`password` FROM Doctor WHERE did=?";
		
		try {
			
			connection = JdbcUtil.physicalConnection();
			if (connection!=null) {
				
				preparedStatement =  connection.prepareStatement(selectQuery);
			}
			
			if (preparedStatement!=null) {
				
			    preparedStatement.setInt(1,did);
			    
			    resultSet =  preparedStatement.executeQuery();
			   
			}
			if(resultSet!=null)
			{
				 if (resultSet.next()) {
					
					 doctor = new Doctor();
					 doctor.setName(resultSet.getString("name"));
					 doctor.setEmail(resultSet.getString("email"));
					 doctor.setPassword(resultSet.getString("password"));
					 doctor.setDid(did);
				}
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
		return doctor;
		
		
		
	}
	public static List<Doctor> getDoctorDetailsByStatus(String status){
		
		
		Connection connection  = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Doctor> pendingDoctors = null;
		String selectQuery = "SELECT * FROM DOCTOR WHERE verification=?";
		Doctor doctor = null;
		
		try {
			 connection = JdbcUtil.physicalConnection();
			 
			 if(connection!=null)
			 {
				 preparedStatement = connection.prepareStatement(selectQuery);
			 }
			 if(preparedStatement!=null)
			 {
				 preparedStatement.setString(1,status);
				 
				 resultSet = preparedStatement.executeQuery();
			 }
			 if(resultSet!=null)
			 {
				pendingDoctors = new ArrayList<Doctor>();
				while(resultSet.next())
				{
					doctor = new Doctor();
					
					doctor.setDid(resultSet.getInt("did"));
					doctor.setName(resultSet.getString("name"));
					doctor.setEmail(resultSet.getString("email"));
					doctor.setMobile(resultSet.getLong("mobile"));
					doctor.setAddress(resultSet.getString("address"));
					doctor.setVillage(resultSet.getString("village"));
					doctor.setDistrict(resultSet.getString("district"));
					doctor.setPostal_code(resultSet.getInt("postal_code"));
					doctor.setCertificate(resultSet.getBinaryStream("certificate"));
					doctor.setVerification(resultSet.getString("verification"));
					doctor.setSpecialization(resultSet.getString("specialization"));
					
					pendingDoctors.add(doctor);
					
				}
			 }
		}
		catch (SQLException e) {
			
		}
		catch (Exception e) {
			
		}
		return pendingDoctors;
	}
	
	public static List<PetOwner> getAllPetOwner() {
		

		PetOwner petOwner  = null;
		Connection connection = null;
		ResultSet resultSet  = null;
		PreparedStatement preparedStatement = null;
		List<PetOwner> petOwnerList = null;
		try {

		connection = JdbcUtil.physicalConnection();
		String selectQuery = "SELECT * FROM petowner";
		if(connection!=null)
		{
			preparedStatement =  connection.prepareStatement(selectQuery);

		}

		if(preparedStatement!=null)
		{

		   resultSet = preparedStatement.executeQuery();

		   if(resultSet!=null)
		   {
			   petOwnerList = new ArrayList<PetOwner>();   
			   while(resultSet.next())
			   {
				   petOwner = new PetOwner(); 
				   
				   petOwner.setOid(resultSet.getInt("oid"));
				   petOwner.setName(resultSet.getString("name"));
				   petOwner.setEmail(resultSet.getString("email"));
				   petOwner.setPassword(resultSet.getString("password"));
				   petOwner.setAddress(resultSet.getString("address"));
				   petOwner.setVillage(resultSet.getString("village"));
				   petOwner.setDistrict(resultSet.getString("district"));
				   petOwner.setMobile(resultSet.getLong("mobile"));
				   petOwner.setPostal_code(resultSet.getInt("postal_code"));
					
				   petOwnerList.add(petOwner);

			   }
		   }
			
		 }
		}
		catch (SQLException e) {
			e.printStackTrace();
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
		return petOwnerList;
		
	}
}
