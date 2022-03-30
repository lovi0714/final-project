package com.project.pms.utils;

import java.text.CharacterIterator;
import java.text.StringCharacterIterator;

public class CommonUtils {
	
	public static String humanReadableByteCountSI(long bytes) {
	    if (-1000 < bytes && bytes < 1000) {
	        return bytes + " b";
	    }
	    CharacterIterator ci = new StringCharacterIterator("kMGTPE");
	    while (bytes <= -999_950 || bytes >= 999_950) {
	        bytes /= 1000;
	        ci.next();
	    }
	    return String.format("%.1f %cb", bytes / 1000.0, ci.current());
	}
	
}
