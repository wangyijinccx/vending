package com.ipeaksoft.moneyday.core.mapper;

import com.ipeaksoft.moneyday.core.entity.VendGoods;

public interface VendGoodsMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VendGoods record);

    int insertSelective(VendGoods record);

    VendGoods selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VendGoods record);

    int updateByPrimaryKey(VendGoods record);
}