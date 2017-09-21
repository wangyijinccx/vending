package com.ipeaksoft.moneyday.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.VendCompany;
import com.ipeaksoft.moneyday.core.mapper.VendCompanyMapper;

@Service
public class VendCompanyService extends BaseService {

	@Autowired
	private VendCompanyMapper vendCompanyMapper;

	public VendCompany selectByPrimaryKey(Integer id) {
		return vendCompanyMapper.selectByPrimaryKey(id);
	}

	public List<VendCompany> selectAll(Integer start, Integer length) {
		return vendCompanyMapper.selectAll(start, length);
	}

	public int selectNum() {
		return vendCompanyMapper.selectNum();
	}
	
	public int insertSelective(VendCompany record){
		return vendCompanyMapper.insertSelective(record);
	}


	public int updateByPrimaryKeySelective(VendCompany record){
		return vendCompanyMapper.updateByPrimaryKeySelective(record);
		
	}

}
