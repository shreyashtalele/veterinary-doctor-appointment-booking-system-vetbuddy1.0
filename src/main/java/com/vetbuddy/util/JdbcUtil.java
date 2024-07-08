package com.vetbuddy.util;




import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;




// HIkaricp configuration....
public class JdbcUtil {

	private JdbcUtil()
	{

	}
	static {

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
	 }




			public static Connection physicalConnection() throws FileNotFoundException, IOException, SQLException {
				String loc = "D:\\eclipse\\VetBuddy1\\src\\main\\java\\com\\vetbuddy\\util\\db.properties";
				FileInputStream fis = new FileInputStream(loc);
				Properties properties = new Properties();
				properties.load(fis);
				String url = properties.getProperty("url");
				String username = properties.getProperty("username");
				String password = properties.getProperty("password");
				Connection connection = DriverManager.getConnection(url,username,password);
				return connection;
			}


}

