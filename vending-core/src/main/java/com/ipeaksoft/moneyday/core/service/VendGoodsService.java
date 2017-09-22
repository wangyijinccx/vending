package com.ipeaksoft.moneyday.core.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.VendGoods;
import com.ipeaksoft.moneyday.core.mapper.VendGoodsMapper;

@Service
public class VendGoodsService extends BaseService {

	@Autowired
	private VendGoodsMapper vendGoodsMapper;

	public VendGoods selectByPrimaryKey(Integer id) {
		return vendGoodsMapper.selectByPrimaryKey(id);
	}

	public List<VendGoods> selectAll(Integer start, Integer length) {
		return vendGoodsMapper.selectAll(start, length);
	}

	public int selectNum() {
		return vendGoodsMapper.selectNum();
	}

	public int insertSelective(VendGoods record) {
		return vendGoodsMapper.insertSelective(record);
	}

	public int updateByPrimaryKeySelective(VendGoods record) {
		return vendGoodsMapper.updateByPrimaryKeySelective(record);
	}

	public int updateStatus(Integer goods_id) {
		return vendGoodsMapper.updateStatus(goods_id);
	}

}
