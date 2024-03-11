package org.ict.lms.common;

import java.security.SecureRandom;

public class MailHandler {
	private static final String CHAR_SET = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

	public static String generateRandomString(int length) {
		StringBuilder randomString = new StringBuilder(length);
		SecureRandom secureRandom = new SecureRandom();

		for (int i = 0; i < length; i++) {
			int randomIndex = secureRandom.nextInt(CHAR_SET.length());
			char randomChar = CHAR_SET.charAt(randomIndex);
			randomString.append(randomChar);
		}

		return randomString.toString();
	}
}
