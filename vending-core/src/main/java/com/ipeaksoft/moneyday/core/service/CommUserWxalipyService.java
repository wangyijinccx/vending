package com.ipeaksoft.moneyday.core.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.CommUserWxalipy;
import com.ipeaksoft.moneyday.core.mapper.CommUserWxalipyMapper;


@Service
public class CommUserWxalipyService extends BaseService {

	@Autowired
	private CommUserWxalipyMapper commUserWxalipyMapper;

    public int insertSelective(CommUserWxalipy record){
    	return commUserWxalipyMapper.insertSelective(record);
    }

    public int updateByPrimaryKeySelective(CommUserWxalipy record){
    	return commUserWxalipyMapper.updateByPrimaryKeySelective(record);
    }

    
    public CommUserWxalipy selectToken(String token){
    	return commUserWxalipyMapper.selectToken(token);
    }
    
    public int unsubscribe(String weixin){
    	return commUserWxalipyMapper.unsubscribe(weixin);
    }
}
