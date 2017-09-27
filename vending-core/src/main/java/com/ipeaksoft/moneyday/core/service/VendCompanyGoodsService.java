package com.ipeaksoft.moneyday.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.VendCompanyGoods;
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

	public int insertSelective(VendCompanyGoods record) {
		return vendCompanyGoodsMapper.insertSelective(record);
	}

	public VendCompanyGoods selectByPrimaryKey(Integer id) {
		return vendCompanyGoodsMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(VendCompanyGoods record) {
		return vendCompanyGoodsMapper.updateByPrimaryKeySelective(record);
	}

	public List<VendCompanyGoods> selectByCompanyId(Integer id) {
		return vendCompanyGoodsMapper.selectByCompanyId(id);
	}

	public List<VendCompanyGoods> selectByGoodsId(Integer id) {
		return vendCompanyGoodsMapper.selectByGoodsId(id);
	}

	public VendCompanyGoods selectByGoodsAndCompanyId(Integer goodsId,
			int companyId) {
		return vendCompanyGoodsMapper.selectByGoodsAndCompanyId(goodsId,
				companyId);
	}

}
