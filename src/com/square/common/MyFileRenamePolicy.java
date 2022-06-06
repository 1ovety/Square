package com.square.common;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRenamePolicy implements FileRenamePolicy {

	// after change the file name, return the file
	@Override
	public File rename(File originFile) {
		
		// origin file name 
		String originName = originFile.getName();
		
		// change file name : file upload time + random 5 digit + file Extension
		
		//1. upload time
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		
		//2. random 5 digit
		int ranNum = (int)Math.random() * 90000  + 10000;
		
		//3. origin file Extension
		String ext = originName.substring(originName.lastIndexOf("."));
		
		String changeName = currentTime + ranNum + ext; 
		
		//  return the file that changed originFile name to change Name
		return new File(originFile.getParent(), changeName);
		
		
		
		
		
		
		
		
		
	}

	
	
	
	
}
