package com.ipeaksoft.moneyday.core.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ipeaksoft.moneyday.core.entity.CommMemCashApprove;
import com.ipeaksoft.moneyday.core.mapper.CommMemCashApproveMapper;

@Service
public class CommMemCashApproveService extends BaseService {

	@Autowired
	private CommMemCashApproveMapper commMemCashApproveMapper;

	public int insertSelective(CommMemCashApprove record) {
		return commMemCashApproveMapper.insertSelective(record);
	}

}
