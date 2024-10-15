package com.nqb.convert;

import java.math.RoundingMode;
import java.text.DecimalFormat;

public class ConvertData {
	
	public static String convertToStr(int number) {
		DecimalFormat decimalFormat = new DecimalFormat("#,###");
        decimalFormat.setRoundingMode(RoundingMode.HALF_UP);
        decimalFormat.setMinimumFractionDigits(0);
        decimalFormat.setMaximumFractionDigits(0);
        return decimalFormat.format(number);
	}
	
	public static int convertToInt(double number) {
		return (int) Math.round(number);
	}
	
	public static int discountCal(int price, int discount) {
		return Math.round((price - (price * discount)/100));
	}

}
