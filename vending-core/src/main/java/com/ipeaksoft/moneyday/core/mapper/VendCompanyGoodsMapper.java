package com.ipeaksoft.moneyday.core.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ipeaksoft.moneyday.core.entity.VendCompanyGoods;

public interface VendCompanyGoodsMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(VendCompanyGoods record);

	int insertSelective(VendCompanyGoods record);

	VendCompanyGoods selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(VendCompanyGoods record);

	int updateByPrimaryKey(VendCompanyGoods record);

	List<Map<Object, Object>> selectExist(
			@Param("company_id") Integer company_id,
			@Param("currentPage") int currentPage,
			@Param("pageSize") int pageSize);

	int selectExistNum(@Param("company_id") Integer company_id);

	List<Map<Object, Object>> selectNotHave(
			@Param("company_id") Integer company_id,
			@Param("currentPage") int currentPage,
			@Param("pageSize") int pageSize);

	int selectNotHaveNum(@Param("company_id") Integer company_id);

	List<VendCompanyGoods> selectByCompanyId(Integer id);

	List<VendCompanyGoods> selectByGoodsId(Integer id);

	VendCompanyGoods selectByGoodsAndCompanyId(@Param("goodsId") Integer goodsId,
			@Param("companyId") int companyId);
}