package com.ipeaksoft.moneyday.admin.schedule;

import javax.annotation.PostConstruct;

import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.service.BaseService;

@Service
@Lazy(true)
public class ScheduleService extends BaseService {
	
	
    @PostConstruct
    public void init() {
    	logger.info("init .........");
    }
    
    @Scheduled(cron = "*/30 * * * * ?")
    public void doTask(){
       
    }
    

}
