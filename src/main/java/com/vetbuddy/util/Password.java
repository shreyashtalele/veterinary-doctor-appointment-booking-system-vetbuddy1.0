package com.vetbuddy.util;

import java.util.Random;

public class Password {

	 public static String generatePassword(int length) {
	        Random random = new Random();
	        
	        // Create a StringBuilder to store the password
	        StringBuilder password = new StringBuilder();
	        // Generate random digits to form the password
	        for (int i = 0; i < length; i++) {
	            int digit = random.nextInt(10); // Generates a random number between 0 and 9
	            password.append(digit);
	        }
	        return password.toString();
	    }
}
