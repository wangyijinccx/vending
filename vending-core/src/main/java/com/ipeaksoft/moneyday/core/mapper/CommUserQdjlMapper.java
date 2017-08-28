package com.ipeaksoft.moneyday.core.mapper;

import org.apache.ibatis.annotations.Param;

import com.ipeaksoft.moneyday.core.entity.CommUserQdjl;


public interface CommUserQdjlMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(CommUserQdjl record);

    int insertSelective(CommUserQdjl record);

    CommUserQdjl selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(CommUserQdjl record);

    int updateByPrimaryKey(CommUserQdjl record);
    
    int deleteByOpenid(String openid);

    CommUserQdjl selectByOpenid(String openid);
    CommUserQdjl selectByUnionid(String unionid);

	int updateInviteCodeByOpenid(@Param(value="openid")String openid, @Param(value="inviteCode")String inviteCode);
	int unsubscribe(String openid);
	int subscribe(String openid);
}