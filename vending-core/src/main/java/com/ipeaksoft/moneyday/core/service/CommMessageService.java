package com.ipeaksoft.moneyday.core.service;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.core.entity.CommDevice;
import com.ipeaksoft.moneyday.core.entity.CommMessage;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.mapper.CommMessageMapper;
import com.ipeaksoft.moneyday.core.util.MessageSend;
import com.ipeaksoft.moneyday.core.enums.MessageEnum;

@Service
public class CommMessageService extends BaseService {

	@Autowired
	CommMessageMapper commMessgaeMapper;

	@Autowired
	CommDeviceService commDeviceService;

	@Autowired
	CommUserService commUserService;

	// 消息类型，消息标题，消息内容（包括消息来源等），消息所属（token），是否已读
	// 按照创建时间倒叙排序
	// 客户端接收消息内容（按类型解析）和是否已读 消息id

	public Map<String, Object> selectOrderInfo(String orderId) {
		return commMessgaeMapper.selectOrderInfo(orderId);
	}

	public int findUnreadCount(String token) {
		return commMessgaeMapper.findUnreadCount(token);
	}

	public int insertSelective(CommMessage record) {
		return commMessgaeMapper.insertSelective(record);
	}

	public int updateByPrimaryKeySelective(CommMessage record) {
		return commMessgaeMapper.updateByPrimaryKeySelective(record);
	}

	public int updateRead(Integer id) {
		return commMessgaeMapper.updateRead(id);
	}

	public List<CommMessage> selectMessages(String token, Integer start,
			Integer length) {
		return commMessgaeMapper.selectMessages(token, start, length);
	}

	/**
	 * 推广员收益消息推送
	 * @param Promate
	 * @param amount
	 * @param token
	 * @param orderid
	 */
	public void tradingPromateMess(BigDecimal amount, String promateToken,
			String orderid) {
		// 一个消息只会记录一次
		JSONObject jo = new JSONObject();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		CommMessage commMessage = new CommMessage();
		Map<String, Object> orderInfo = selectOrderInfo(orderid);
		String content = String.format(MessageEnum.tradingpromate.getKey(),
				(String) orderInfo.get("username"),
				(String) orderInfo.get("name"), amount);
		String subject = MessageEnum.tradingpromate.toString();
		jo.put("type", MessageEnum.trading); // 类型 这里发大类，为了客户端选择不同的图片，但存库我存小类
		jo.put("title", "交易消息"); // 标题
		jo.put("content", content);// 内容
		jo.put("source_order", orderid); // 来源 订单号
		jo.put("createtime", sf.format(new Date()));

		commMessage.setSubject(subject);
		commMessage.setContent(jo.toString());
		commMessage.setToken(promateToken);
		commMessage.setIsread((byte) 0);
		commMessage.setCreateTime(new Date());
		commMessage.setUpdateTime(new Date());
		if (insertSelective(commMessage) > 0) {
			// 推送的内容 -- 保存成功才推送
			CommDevice model = commDeviceService.selectByUserId(promateToken);
			String deviceToken = model.getDeviceToken();
			byte type = model.getType();
			// token有多少未读
			//Integer badge = findUnreadCount(promateToken);
			if (0 == type) {
				// android
				MessageSend.AndroidSend(deviceToken, content);
			} else {
				// ios
				MessageSend.iosSend(deviceToken, content);
			}
		}

	}
    
	/**
	 * 师傅收益推送
	 * @param masterToken
	 * @param amount
	 * @param promateToken
	 * @param orderid
	 */
	public void tradingMasterMess(String masterToken, BigDecimal amount,
			String promateToken, String orderid) {

		CommUser commUser = commUserService.selectByIndicate(promateToken);
		// 一个消息只会记录一次
		JSONObject jo = new JSONObject();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		CommMessage commMessage = new CommMessage();
		Map<String, Object> orderInfo = selectOrderInfo(orderid);

		DecimalFormat df = new DecimalFormat("0.00");
		String content = String.format(MessageEnum.tradingmaster.getKey(),
				null == commUser.getNickname() ? commUser.getMobile()
						: commUser.getMobile(), (String) orderInfo.get("name"),
				df.format(amount));

		String subject = MessageEnum.tradingmaster.toString();
		jo.put("type", MessageEnum.trading); // 类型 这里发大类，为了客户端选择不同的图片，但存库我存小类
		jo.put("title", "交易消息"); // 标题
		jo.put("content", content);// 内容
		jo.put("source_order", orderid); // 来源 订单号
		jo.put("source_promate", promateToken); // 来源 徒弟
		jo.put("createtime", sf.format(new Date()));

		commMessage.setSubject(subject);
		commMessage.setContent(jo.toString());
		commMessage.setToken(masterToken);
		commMessage.setIsread((byte) 0);
		commMessage.setCreateTime(new Date());
		commMessage.setUpdateTime(new Date());
		if (insertSelective(commMessage) > 0) {
			// 推送的内容 -- 保存成功才推送
			CommDevice model = commDeviceService.selectByUserId(masterToken);
			String deviceToken = model.getDeviceToken();
			byte type = model.getType();
			// token有多少未读
			//Integer badge = findUnreadCount(masterToken);
			if (0 == type) {
				// android
				MessageSend.AndroidSend(deviceToken, content);
			} else {
				// ios
				MessageSend.iosSend(deviceToken, content);
			}
		}

	}
    
	/**
	 * 直播收益推送
	 * @param hostToken
	 * @param amount
	 * @param promateToken
	 * @param orderid
	 */
	public void tradingHostMess(String hostToken, BigDecimal amount,
			String promateToken, String orderid) {

		CommUser commUser = commUserService.selectByIndicate(promateToken);
		// 一个消息只会记录一次
		JSONObject jo = new JSONObject();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		CommMessage commMessage = new CommMessage();
		Map<String, Object> orderInfo = selectOrderInfo(orderid);

		DecimalFormat df = new DecimalFormat("0.00");
		String content = String.format(MessageEnum.tradinghost.getKey(),
				null == commUser.getNickname() ? commUser.getMobile()
						: commUser.getMobile(), (String) orderInfo.get("name"),
				df.format(amount));

		String subject = MessageEnum.tradinghost.toString();
		jo.put("type", MessageEnum.trading); // 类型 这里发大类，为了客户端选择不同的图片，但存库我存小类
		jo.put("title", "交易消息"); // 标题
		jo.put("content", content);// 内容
		jo.put("source_order", orderid); // 来源 订单号
		jo.put("source_promate", promateToken); // 来源 徒弟
		jo.put("createtime", sf.format(new Date()));

		commMessage.setSubject(subject);
		commMessage.setContent(jo.toString());
		commMessage.setToken(hostToken);
		commMessage.setIsread((byte) 0);
		commMessage.setCreateTime(new Date());
		commMessage.setUpdateTime(new Date());
		if (insertSelective(commMessage) > 0) {
			// 推送的内容 -- 保存成功才推送
			CommDevice model = commDeviceService.selectByUserId(hostToken);
			String deviceToken = model.getDeviceToken();
			byte type = model.getType();
			// token有多少未读
			//Integer badge = findUnreadCount(hostToken);
			if (0 == type) {
				// android
				MessageSend.AndroidSend(deviceToken, content);
			} else {
				// ios
				MessageSend.iosSend(deviceToken, content);
			}
		}
	}
	
   /**
    * 提现
    * @param token
    * @param amount
    * @param order
    */
	public void tradingDrawalMess(String token, double amount,
			String order) {

		// 一个消息只会记录一次
		JSONObject jo = new JSONObject();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		CommMessage commMessage = new CommMessage();
		String content = String.format(MessageEnum.tradingDrawal.getKey(),amount);
		String subject = MessageEnum.tradingDrawal.toString();
		jo.put("type", MessageEnum.trading); // 类型 这里发大类，为了客户端选择不同的图片，但存库我存小类
		jo.put("title", "交易消息"); // 标题
		jo.put("content", content);// 内容
		jo.put("source_order", order); // 来源 订单号
		jo.put("createtime", sf.format(new Date()));

		commMessage.setSubject(subject);
		commMessage.setContent(jo.toString());
		commMessage.setToken(token);
		commMessage.setIsread((byte) 0);
		commMessage.setCreateTime(new Date());
		commMessage.setUpdateTime(new Date());
		if (insertSelective(commMessage) > 0) {
			// 推送的内容 -- 保存成功才推送
			CommDevice model = commDeviceService.selectByUserId(token);
			String deviceToken = model.getDeviceToken();
			byte type = model.getType();
			// token有多少未读
			//Integer badge = findUnreadCount(token);
			if (0 == type) {
				// android
				MessageSend.AndroidSend(deviceToken, content);
			} else {
				// ios
				MessageSend.iosSend(deviceToken, content);
			}
		}
	}

}
