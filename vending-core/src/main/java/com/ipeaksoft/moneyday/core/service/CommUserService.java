package com.ipeaksoft.moneyday.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.mapper.CommUserMapper;

@Service
public class CommUserService extends BaseService {

	@Autowired
	private CommUserMapper commUserMapper;
	

	public int insertSelective(CommUser record) {
		return commUserMapper.insertSelective(record);
	}

	public CommUser selectBymobile(String mobile) {
		return commUserMapper.selectBymobile(mobile);
	}

	public CommUser selectByIndicate(String indicate) {
		return commUserMapper.selectByIndicate(indicate);
	}

	public int updateByPrimaryKeySelective(CommUser record) {
		return commUserMapper.updateByPrimaryKeySelective(record);
	}

	public CommUser selectByOpenid(String openid) {
		return commUserMapper.selectByOpenid(openid);
	}

	public Map<String, Object> selectByIndicateSelective(String indicate) {
		return commUserMapper.selectByIndicateSelective(indicate);
	}

	public Map<String, Object> selectByIndicateSelective2(String indicate) {
		return commUserMapper.selectByIndicateSelective2(indicate);
	}

	public int updateByIndicate(CommUser record) {
		return commUserMapper.updateByIndicate(record);
	}

	public CommUser selectByPrimaryKey(Integer id) {
		return commUserMapper.selectByPrimaryKey(id);
	}

	public List<CommUser> selectByPid(Integer pid, Integer currentPage,
			Integer pageSize) {
		return commUserMapper.selectByPid(pid, currentPage, pageSize);
	}
	
	public CommUser selectByUnionid(String unionid){
		return commUserMapper.selectByUnionid(unionid);
	}

	public CommUser toUser(CommUser commUser, JSONObject json) {
		if (commUser == null) {
			commUser = new CommUser();
		}
		String openid = json.getString("openid");
		commUser.setOpenid(openid);
		String nickname = json.getString("nickname");
		commUser.setNickname(null == nickname ? "" : nickname);
		Short sex = json.getShort("sex");
		commUser.setSex(null == sex ? 0 : sex);
		String language = json.getString("language");
		commUser.setLanguage(null == language ? "" : language);
		String city = json.getString("city");
		commUser.setCity(null == city ? "" : city);
		String province = json.getString("province");
		commUser.setProvince(null == province ? "" : province);
		String country = json.getString("country");
		commUser.setCountry(null == country ? "" : country);
		String headimgurl = json.getString("headimgurl");
		commUser.setHeadimgurl(null == headimgurl ? "" : headimgurl);
		String privilege = json.getString("privilege");
		commUser.setPrivilege(null == privilege ? "" : privilege);
		String unionid = json.getString("unionid");
		commUser.setUnionid(unionid == null ? "" : unionid);
		return commUser;
	}

	

}
