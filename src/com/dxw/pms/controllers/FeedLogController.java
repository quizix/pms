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
import com.dxw.pms.dal.FeedLogDao;
import com.dxw.pms.models.FeedLog;
import com.pms.utils.TimeUtil;

/**
 * 饲料入库
 * @author zhang
 *
 */
@Controller
@RequestMapping("api/v1/feedlogs")
public class FeedLogController {

	@Autowired
	private FeedLogDao feedLogDao;
	
	@RequestMapping(method=RequestMethod.POST,
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ActionResult post(@RequestParam Long warehouseId,
			@RequestParam float quantity, @RequestParam int operation,
			@RequestParam Long purchaseOrderId, @RequestParam Long userId){
		ActionResult result = new ActionResult();
		FeedLog feedLog = new FeedLog();

		Date now = new Date();
		feedLog.setCreateTime(now);
		feedLog.setModifyTime(now);
		
		feedLog.setQuantity(quantity);
		feedLog.setWarehouseId(warehouseId);
		feedLog.setPurchaseOrderId(purchaseOrderId);
		feedLog.setOperation(operation);
		feedLog.setUserId(userId);
		try {
			feedLogDao.add(feedLog);
		} catch (DbException e) {
			result.setCode(ActionResult.RESULT_ERROR);
			result.setMessage(e.getMessage());
		}
		return result;
	}
	
	@RequestMapping(method=RequestMethod.GET,
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<PageBean<FeedLog>> get(@RequestParam Long warehouseId){
		ResultBean<PageBean<FeedLog>> bean = new ResultBean<>();
		List logs = feedLogDao.findAll(warehouseId);
		
		PageBean<FeedLog> pageBean = new PageBean<>();
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
