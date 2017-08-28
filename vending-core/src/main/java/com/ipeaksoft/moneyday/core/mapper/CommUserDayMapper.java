package com.ipeaksoft.moneyday.core.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ipeaksoft.moneyday.core.entity.CommUserDay;

public interface CommUserDayMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(CommUserDay record);

	int insertSelective(CommUserDay record);

	int insertUpdateWithdrawCount(CommUserDay record);

	CommUserDay selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(CommUserDay record);

	int updateByPrimaryKey(CommUserDay record);

	CommUserDay selectCurrentInfo(String userid);

	int updateCurrentInfo(CommUserDay record);

	Map<String, Object> getConsumptionThisMonth(String userid);

	List<Map<String, Object>> selectIncomingList(
			@Param("userid") String userid,
			@Param("currentPage") Integer currentPage,
			@Param("pageSize") Integer pageSize);

	List<Map<String, Object>> selectPromotionList(
			@Param("userid") String userid,
			@Param("currentPage") Integer currentPage,
			@Param("pageSize") Integer pageSize);
}