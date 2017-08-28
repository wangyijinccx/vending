package com.ipeaksoft.moneyday.admin.util;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.core.entity.CommMemCash;

public class BillUtil {
    
    public Map<String, Object> getWhereMap(HttpServletRequest request) {
        int start = Integer.parseInt(request.getParameter("start"));//开始记录数
        int pageSize = Integer.parseInt(request.getParameter("length"));//每页记录数
        String dir = request.getParameter("order[0][dir]");
        String from = request.getParameter("start_date");
        String to = request.getParameter("end_data");
        Map<String, Object> paramMap = new HashMap<String, Object>();
        if (null != from)
            paramMap.put("from", from);
        if (null != to)
            paramMap.put("to", to);
        paramMap.put("dir", dir);
        paramMap.put("start", start);
        paramMap.put("size", pageSize);
        return paramMap;
    }
    
    public JSONObject formatResult(String draw, int total, Object object, int size) {
        JSONObject result = new JSONObject();
        result.put("draw", draw);   
        result.put("recordsTotal", size);
        result.put("recordsFiltered", total);
        result.put("data", object);
        return result;
    }
    
    public void formatUserWxBillData(JSONObject jsonObject, CommMemCash userCash, int istatus) {
        String day = DateUtil.date2Str("yyyy-MM-dd HH:mm:ss", userCash.getCreateTime());
        jsonObject.put("day", day);
        String description = userCash.getDescription();
        description = (description.contains(")")) ? description.replaceAll("\\(|\\)", "<br/>") : description;
        jsonObject.put("description", description);
        jsonObject.put("totalcredits", userCash.getTotalcredits());
        String status = (0 == istatus) ? "待审核" : (1 == istatus) ? "处理中" : (2 == istatus) ? "推迟审核" : (3 == istatus) ? "审核异常" : (4 == istatus) ? "充值失败" : (9 == istatus) ? "充值成功" : "其他";
        jsonObject.put("status", status);
        String operator =null; //userCash.getOperatorName();
        operator = (null == operator) ? "" : operator;
        jsonObject.put("operator", operator);
        String operateResult = (4 == istatus) ? userCash.getOperateResult() : "";
        jsonObject.put("operateResult", operateResult);
        String operatetime = DateUtil.date2Str("yyyy-MM-dd HH:mm:ss", userCash.getOperateTime());
        jsonObject.put("operatetime", operatetime);
        jsonObject.put("id", userCash.getId());
    }
}
