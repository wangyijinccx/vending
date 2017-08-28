package com.ipeaksoft.moneyday.core.mapper;

import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ipeaksoft.moneyday.core.entity.CommMemCash;
import com.ipeaksoft.moneyday.core.entity.UserCashOrder;

public interface CommMemCashMapper {
	int deleteByPrimaryKey(Long id);

	int insert(CommMemCash record);

	int insertSelective(CommMemCash record);

	CommMemCash selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(CommMemCash record);

	int updateByPrimaryKey(CommMemCash record);

	List<Map<Object, Object>> selectByToken(@Param("token") String token,
			@Param("currentPage") Integer currentPage,
			@Param("pageSize") Integer pageSize);

	List<UserCashOrder> selectOrderByDay(Date date);

	int selectCountByStatus(Date date);

	List<Map<Object, Object>> selectPageByDay(
			@Param("startDate") String startDate,
			@Param("endDate") String endDate, @Param("mobile") String mobile,
			@Param("nickname") String nickname,
			@Param("amount") Integer amount, @Param("start") int start,
			@Param("size") int size);

	int countPageByDay(@Param("startDate") String startDate,
			@Param("endDate") String endDate, @Param("mobile") String mobile,
			@Param("nickname") String nickname, @Param("amount") Integer amount);
	
	List<Map<Object, Object>> countByTokens(@Param(value = "tokens") Collection<String> tokens);
	
	int countPageByUser(Map<String, Object> map);

	List<Map<Object, Object>> selectPageByUser(Map<String, Object> map);

}