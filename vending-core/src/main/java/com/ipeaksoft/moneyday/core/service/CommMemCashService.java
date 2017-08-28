package com.ipeaksoft.moneyday.core.service;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentSkipListSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.CommMemCash;
import com.ipeaksoft.moneyday.core.entity.UserCashOrder;
import com.ipeaksoft.moneyday.core.mapper.CommMemCashMapper;

@Service
public class CommMemCashService extends BaseService {
	private final ConcurrentSkipListSet<String> activeUsers = new ConcurrentSkipListSet<String>();

	@Autowired
	private CommMemCashMapper commMemCashMapper;

	public int insertSelective(CommMemCash record) {
		return commMemCashMapper.insertSelective(record);
	}

	public CommMemCash selectByPrimaryKey(Integer id) {
		return commMemCashMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelective(CommMemCash record) {
		return commMemCashMapper.updateByPrimaryKeySelective(record);
	}

	public List<Map<Object, Object>> selectByToken(String token, Integer currentPage,
			Integer pageSize) {
		return commMemCashMapper.selectByToken(token, currentPage, pageSize);
	}

	public List<UserCashOrder> selectOrderByDay(Date date) {
		return commMemCashMapper.selectOrderByDay(date);
	}

	public int selectCountByStatus(Date date) {
		return commMemCashMapper.selectCountByStatus(date);
	}

	public List<Map<Object, Object>> getPageByday(String startDate,
			String endDate, String mobile, String nickname, Integer amount,
			int start, int size) {
		return commMemCashMapper.selectPageByDay(startDate, endDate, mobile,
				nickname, amount, start, size);
	}

	public int countPageByDay(String startDate, String endDate, String mobile,
			String nickname, Integer amount) {
		return commMemCashMapper.countPageByDay(startDate, endDate, mobile,
				nickname, amount);
	}

	public Map<String, Long> countByTokens(Collection<String> tokens) {
		Map<String, Long> result = new HashMap<>();
		List<Map<Object, Object>> list = commMemCashMapper
				.countByTokens(tokens);
		list.forEach(h -> {
			result.put((String) h.get("token"), (Long) h.get("cnt"));
		});
		return result;
	}

	public int countPageByUser(Map<String, Object> map) {
		return commMemCashMapper.countPageByUser(map);
	}

	public List<Map<Object, Object>> getPageByUser(Map<String, Object> map) {
		return commMemCashMapper.selectPageByUser(map);
	}

	/**
	 * 粗略实现自旋锁，尝试3次
	 * 
	 * @param userid
	 * @return
	 */
	public boolean aquireLock(String userid) {
		int i = 0;
		while (!activeUsers.add(userid) && i++ < 3) {
			try {
				Thread.sleep(500);
			} catch (InterruptedException e) {
			}
		}
		if (i < 3) {
			return true;
		} else {
			return false;
		}
	}

	public void realseLock(String userid) {
		activeUsers.remove(userid);
	}

}
