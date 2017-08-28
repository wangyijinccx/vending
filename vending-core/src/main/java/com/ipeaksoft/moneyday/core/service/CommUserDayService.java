package com.ipeaksoft.moneyday.core.service;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.CommHost;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.entity.CommUserDay;
import com.ipeaksoft.moneyday.core.mapper.CommUserDayMapper;
import com.ipeaksoft.moneyday.core.util.strUtil;

@Service
public class CommUserDayService extends BaseService {

	@Autowired
	private CommUserDayMapper commUserDayMapper;
	@Autowired
	private CommUserService commUserService;
	@Autowired
	private CommHostService commHostService;
	@Autowired
	private CommMessageService commMessageService;

	public int insertSelective(CommUserDay record) {
		return commUserDayMapper.insertSelective(record);
	}

	public int insertUpdateWithdrawCount(CommUserDay record) {
		return commUserDayMapper.insertUpdateWithdrawCount(record);
	}

	public CommUserDay selectCurrentInfo(String userid) {
		return commUserDayMapper.selectCurrentInfo(userid);
	}

	public int updateCurrentInfo(CommUserDay record) {
		return commUserDayMapper.updateCurrentInfo(record);
	}

	public Map<String, Object> getConsumptionThisMonth(String userid) {
		return commUserDayMapper.getConsumptionThisMonth(userid);
	}

	public List<Map<String, Object>> selectIncomingList(String userid,
			Integer currentPage, Integer pageSize) {
		return commUserDayMapper.selectIncomingList(userid, currentPage,
				pageSize);
	}

	public List<Map<String, Object>> selectPromotionList(String userid,
			Integer currentPage, Integer pageSize) {
		return commUserDayMapper.selectPromotionList(userid, currentPage,
				pageSize);
	}

	public void statistical(String agentname, double real_amount, String orderId) {
		String xgAccount = strUtil.getAgentName(agentname);
		CommUser commUser = commUserService.selectBymobile(xgAccount);
		// 用户做任务前，绑定了师傅和主播了
		// 有一个推广员没有师傅--老板账号
		Integer promoterId = commUser.getId();
		String promoterToken = commUser.getIndicate();
		Integer masterId = commUser.getPid();
		String masterToken = commUserService.selectByPrimaryKey(masterId)
				.getIndicate();
		Integer hostId = commUser.getCommid();
		String hostToken = commHostService.selectByPrimaryKey(hostId)
				.getIndicate();
		BigDecimal realAmonut = new BigDecimal(real_amount);
		BigDecimal promoterAward = realAmonut.multiply(promoterCommission);
		// BigDecimal masterAward = realAmonut.multiply(masterCommission);
		BigDecimal hostAward = realAmonut.multiply(hostCommission);
		// todayRegisterNum 今日注册数 todayRechargeNum 今日充值人数 todayCommission 今日收益总数
		// todayRechargeTotal 今日充值总数(推广员玩家) todayRechargeTd 今日徒弟玩家充值总数
		// 推广员
		CommUserDay cud = selectCurrentInfo(promoterToken);
		CommUserDay commUserDay = new CommUserDay();
		commUserDay.setUserid(promoterToken);
		if (null == cud) {
			commUserDay.setTodayrechargenum(1);
			commUserDay.setTodaycommission(promoterAward.doubleValue());
			commUserDay.setTodayrechargetotal(real_amount);
			commUserDay.setTime(new Date());
			commUserDayMapper.insertSelective(commUserDay);
		} else {
			commUserDay.setTodayrechargenum(cud.getTodayrechargenum() + 1);
			BigDecimal original = new BigDecimal(cud.getTodaycommission());
			commUserDay.setTodaycommission(original.add(promoterAward)
					.doubleValue());
			commUserDay.setTodayrechargetotal(realAmonut.add(
					new BigDecimal(cud.getTodayrechargetotal())).doubleValue());
			commUserDayMapper.updateCurrentInfo(commUserDay);
		}
		// 累计 aworad 余额 totalaword 总收益
		CommUser model = new CommUser();
		model.setId(promoterId);
		model.setTotalaward(promoterAward.add(
				new BigDecimal(commUser.getTotalaward())).doubleValue());
		model.setAward(promoterAward.add(new BigDecimal(commUser.getAward()))
				.doubleValue());
		commUserService.updateByPrimaryKeySelective(model);
		
		commMessageService.tradingPromateMess(promoterAward, promoterToken, orderId);

		if (null != masterId) {
			BigDecimal masterAward = realAmonut.multiply(masterCommission);
			// 推广员的师傅
			CommUserDay masterCud = selectCurrentInfo(masterToken);
			CommUserDay masterCommUserDay = new CommUserDay();
			masterCommUserDay.setUserid(masterToken);
			if (null == masterCud) {
				masterCommUserDay.setTodaycommission(masterAward.doubleValue());
				masterCommUserDay.setTodayrechargetd(real_amount);
				masterCommUserDay.setTime(new Date());
				commUserDayMapper.insertSelective(masterCommUserDay);
			} else {
				BigDecimal original = new BigDecimal(
						masterCud.getTodaycommission());
				masterCommUserDay.setTodaycommission(original.add(masterAward)
						.doubleValue());
				masterCommUserDay.setTodayrechargetd(real_amount);
				commUserDayMapper.updateCurrentInfo(masterCommUserDay);
			}
			// 累计 aworad 余额 tbaword 徒弟收益 totalaword 总收益
			CommUser masterCu = commUserService.selectByPrimaryKey(masterId);
			CommUser masterModel = new CommUser();
			masterModel.setId(masterId);
			masterModel.setTotalaward(masterAward.add(
					new BigDecimal(masterCu.getTotalaward())).doubleValue());
			masterModel.setAward(masterAward.add(
					new BigDecimal(masterCu.getAward())).doubleValue());
			masterModel.setTdaward(masterAward.add(
					new BigDecimal(masterCu.getTdaward())).doubleValue());
			commUserService.updateByPrimaryKeySelective(masterModel);

			commMessageService.tradingMasterMess(masterToken, masterAward, promoterToken, orderId);
		}

		// 主播
		CommUserDay hostCud = selectCurrentInfo(hostToken);
		CommUserDay hostCommUserDay = new CommUserDay();
		hostCommUserDay.setUserid(hostToken);
		if (null == hostCud) {
			hostCommUserDay.setTodayrechargenum(1);
			hostCommUserDay.setTodaycommission(hostAward.doubleValue());
			hostCommUserDay.setTodayrechargetotal(real_amount);
			hostCommUserDay.setTime(new Date());
			commUserDayMapper.insertSelective(hostCommUserDay);
		} else {
			hostCommUserDay
					.setTodayrechargenum(hostCud.getTodayrechargenum() + 1);
			BigDecimal original = new BigDecimal(hostCud.getTodaycommission());
			hostCommUserDay.setTodaycommission(original.add(hostAward)
					.doubleValue());
			hostCommUserDay.setTodayrechargetotal(realAmonut.add(
					new BigDecimal(hostCud.getTodayrechargetotal()))
					.doubleValue());
			commUserDayMapper.updateCurrentInfo(hostCommUserDay);
		}

		commMessageService.tradingHostMess(hostToken, hostAward, promoterToken, orderId);

		// 累计 aworad 余额 totalaword 总收益
		CommHost ch = commHostService.selectByPrimaryKey(hostId);
		CommHost commHost = new CommHost();
		commHost.setId(hostId);
		commHost.setTotalaward(hostAward
				.add(new BigDecimal(ch.getTotalaward())).doubleValue());
		commHost.setAward(hostAward.add(new BigDecimal(ch.getAward()))
				.doubleValue());
		commHostService.updateByPrimaryKeySelective(commHost);
	}

	public void registered(CommUser commUser) {
		// 玩家 玩家所属推广员+1 推广员所属主播+1 一天一个user只有一条记录
		Integer hostId = commUser.getCommid();
		String hostToken = commHostService.selectByPrimaryKey(hostId)
				.getIndicate();
		// Integer promotersId = commUser.getId();
		String promoterToken = commUser.getIndicate();
		registered_update(hostToken);
		registered_update(promoterToken);
	}

	public void registered_update(String id) {
		CommUserDay cud = selectCurrentInfo(id);
		CommUserDay commUserDay = new CommUserDay();
		commUserDay.setUserid(id);
		if (null == cud) {
			commUserDay.setTodayregisternum(1);
			commUserDay.setTime(new Date());
			commUserDayMapper.insertSelective(commUserDay);
		} else {
			commUserDay.setTodayregisternum(cud.getTodayregisternum() + 1);
			commUserDayMapper.updateCurrentInfo(commUserDay);
		}
	}
}
