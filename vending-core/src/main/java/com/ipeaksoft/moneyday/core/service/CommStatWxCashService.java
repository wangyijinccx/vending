package com.ipeaksoft.moneyday.core.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.CommStatWxCash;
import com.ipeaksoft.moneyday.core.mapper.CommStatWxCashMapper;


@Service
public class CommStatWxCashService extends BaseService {
    @Autowired
    private  CommStatWxCashMapper mapper;

    public int addNew(CommStatWxCash record){
    	return mapper.insert(record);
    }

    public int insertSelective(CommStatWxCash record){
    	return mapper.insertSelective(record);
    }

    public CommStatWxCash getStatByDay(Date day){
    	return mapper.selectByPrimaryKey(day);
    }
    
    public List<CommStatWxCash> getPageByDay(Map<String, Object> map){
        return mapper.selectPageByDay(map);
    }

    public int updateUser(CommStatWxCash record){
    	return mapper.updateByPrimaryKeySelective(record);
    }

    public int updateByPrimaryKey(CommStatWxCash record){
    	return mapper.updateByPrimaryKey(record);
    }

    public int getAllMoney() {  // 获取所有订单的累积兑换金额，不区分订单的状态
        return mapper.getAllMoney();
    }

    public int countAllByWhere(Map<String, Object> map) {
        return mapper.countAllByWhere(map);        
    }   
    
    public CommStatWxCash selectByPrimaryKey(Date day){
    	return mapper.selectByPrimaryKey(day);
    }
}
