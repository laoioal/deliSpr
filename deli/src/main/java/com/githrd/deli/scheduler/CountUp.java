package com.githrd.deli.scheduler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;



public class CountUp {
	@Autowired
//	EmpDao eDao;
	
	private static final Logger eLog = LoggerFactory.getLogger("smithLogger");
	
	public void upSal() {
//		int result = eDao.upSal();
		
//		if(result == 1) {
			eLog.info("SMITH 급여 인상 성공");
//		}
	}
}
