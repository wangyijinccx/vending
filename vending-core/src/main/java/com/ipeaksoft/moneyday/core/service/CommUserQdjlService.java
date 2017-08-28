package com.ipeaksoft.moneyday.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.CommUserQdjl;
import com.ipeaksoft.moneyday.core.mapper.CommUserQdjlMapper;

@Service
public class CommUserQdjlService extends BaseService {

	@Autowired
	private CommUserQdjlMapper mapper;

	public CommUserQdjl findByOpenid(String openid) {
		return mapper.selectByOpenid(openid);
	}

	public CommUserQdjl findByUnionid(String unionid) {
		return mapper.selectByUnionid(unionid);
	}

	public int updateInviteCodeByOpenid(String openid, String inviteCode) {
		return mapper.updateInviteCodeByOpenid(openid, inviteCode);
	}

	public int unsubscribe(String openid) {
		return mapper.unsubscribe(openid);
	}

	public int create(CommUserQdjl record) {
		return mapper.insertSelective(record);
	}

	public int subscribe(String openid) {
		return mapper.subscribe(openid);
	}
}
