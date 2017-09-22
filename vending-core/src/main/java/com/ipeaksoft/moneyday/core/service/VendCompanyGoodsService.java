package com.ipeaksoft.moneyday.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.mapper.VendCompanyGoodsMapper;

@Service
public class VendCompanyGoodsService extends BaseService {

	@Autowired
	private VendCompanyGoodsMapper vendCompanyGoodsMapper;

	public List<Map<Object, Object>> selectExist(Integer company_id,
			int currentPage, int pageSize) {
		return vendCompanyGoodsMapper.selectExist(company_id, currentPage,
				pageSize);
	}

	public int selectExistNum(Integer company_id) {
		return vendCompanyGoodsMapper.selectExistNum(company_id);
	}

	public List<Map<Object, Object>> selectNotHave(Integer company_id,
			int currentPage, int pageSize) {
		return vendCompanyGoodsMapper.selectNotHave(company_id, currentPage,
				pageSize);
	}

	public int selectNotHaveNum(Integer company_id) {
		return vendCompanyGoodsMapper.selectNotHaveNum(company_id);
	}

}
