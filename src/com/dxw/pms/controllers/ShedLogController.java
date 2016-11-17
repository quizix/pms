package com.dxw.pms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxw.pms.beans.PageBean;
import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.ShedLogDao;
import com.dxw.pms.models.ShedLog;
import com.pms.utils.TimeUtil;

@Controller
@RequestMapping("api/v1/shedlogs")
public class ShedLogController {

	@Autowired
	private ShedLogDao shedLogDao;
	
	@RequestMapping(value="/shedId/{shedId}",method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<PageBean<ShedLog>> getShedLogs(@PathVariable Long shedId){
		ResultBean<PageBean<ShedLog>> bean = new ResultBean<>();
		List shedLogs = shedLogDao.findByShedId(shedId);
		
		PageBean<ShedLog> pageBean = new PageBean<>();
		pageBean.setItems(shedLogs);
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
