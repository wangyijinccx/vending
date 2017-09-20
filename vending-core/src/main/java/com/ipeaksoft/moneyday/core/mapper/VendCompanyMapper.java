package com.ipeaksoft.moneyday.core.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ipeaksoft.moneyday.core.entity.VendCompany;

public interface VendCompanyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(VendCompany record);

    int insertSelective(VendCompany record);

    VendCompany selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(VendCompany record);

    int updateByPrimaryKey(VendCompany record);
    
    List<VendCompany> selectAll(@Param(value = "currentPage") Integer start,
			@Param(value = "pageSize") Integer length);

	int selectNum();
}