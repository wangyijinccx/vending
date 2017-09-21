package com.ipeaksoft.moneyday.core.mapper;

import com.ipeaksoft.moneyday.core.entity.VendCompanyGoods;

public interface VendCompanyGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VendCompanyGoods record);

    int insertSelective(VendCompanyGoods record);

    VendCompanyGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VendCompanyGoods record);

    int updateByPrimaryKey(VendCompanyGoods record);
}