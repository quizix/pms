package com.dxw.pms.controllers;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxw.pms.beans.ActionResult;
import com.dxw.pms.beans.PageBean;
import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.DbException;
import com.dxw.pms.dal.PigLogDao;
import com.dxw.pms.models.PigLog;
import com.pms.utils.TimeUtil;

/**
 * 入栏/出栏/转栏
 * @author zhang
 *
 */
@Controller
@RequestMapping("api/v1/piglogs")
public class PigLogController {

	@Autowired
	private PigLogDao pigLogDao;
	
	@RequestMapping(method=RequestMethod.POST,
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ActionResult addPigLog(
			@RequestParam(required=false) Long pigId, 
			@RequestParam int operation, @RequestParam int number,
			@RequestParam(required=false) Long styIdFrom, @RequestParam(required=false) Long styIdTo,
			@RequestParam Long userId, @RequestParam(required=false) Long purchaseOrderId,
			@RequestParam(required=false) Float weight){
		ActionResult result = new ActionResult();
		PigLog pigLog = new PigLog();
		
		Date now = new Date();
		pigLog.setCreateTime(now);
		pigLog.setModifyTime(now);
		
		pigLog.setPurchaseOrderId(purchaseOrderId);
		pigLog.setUserId(userId);

		pigLog.setNumber(number);
		pigLog.setOperation(operation);
		pigLog.setStyIdFrom(styIdFrom);
		pigLog.setStyIdTo(styIdTo);
		pigLog.setWeight(weight);

		try {
			pigLogDao.add(pigLog);
		} catch (DbException e) {
			result.setCode(-1);
			result.setMessage(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(method=RequestMethod.GET,
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<PageBean<PigLog>> getPigLogs(@RequestParam Long styId,
			@RequestParam(required=false, defaultValue="0") int operation){
		ResultBean<PageBean<PigLog>> bean = new ResultBean<>();
		List logs = pigLogDao.findAll(styId, operation);
		
		PageBean<PigLog> pageBean = new PageBean<>();
		pageBean.setItems(logs);
		pageBean.setNextPageToken("");
		pageBean.setPrevPageToken("");
		pageBean.setPageInfo(null);
		
		bean.setCode(ResultBean.RESULT_SUCCESS);
		bean.setMessage("success");
		bean.setResult(pageBean);
		bean.setTime(TimeUtil.getCurrentTimeStr());
		return bean;
	}
}
