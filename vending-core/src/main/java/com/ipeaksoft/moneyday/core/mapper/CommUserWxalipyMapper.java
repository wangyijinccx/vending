package com.ipeaksoft.moneyday.core.mapper;

import com.ipeaksoft.moneyday.core.entity.CommUserWxalipy;

public interface CommUserWxalipyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CommUserWxalipy record);

    int insertSelective(CommUserWxalipy record);

    CommUserWxalipy selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommUserWxalipy record);

    int updateByPrimaryKey(CommUserWxalipy record);
    
    CommUserWxalipy selectToken(String token);
    
    int unsubscribe(String weixin);
}