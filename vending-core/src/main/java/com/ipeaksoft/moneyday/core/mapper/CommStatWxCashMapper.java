package com.ipeaksoft.moneyday.core.mapper;

import com.ipeaksoft.moneyday.core.entity.CommStatWxCash;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface CommStatWxCashMapper {
    int deleteByPrimaryKey(Date day);

    int insert(CommStatWxCash record);

    int insertSelective(CommStatWxCash record);

    CommStatWxCash selectByPrimaryKey(Date day);

    int updateByPrimaryKeySelective(CommStatWxCash record);

    int updateByPrimaryKey(CommStatWxCash record);
    
    int countAllByWhere(Map<String, Object> map);
    
    List<CommStatWxCash> selectPageByDay(Map<String, Object> map);
    
    int getAllMoney();
}