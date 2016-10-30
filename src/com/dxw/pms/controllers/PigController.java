package com.dxw.pms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxw.pms.beans.PageBean;
import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.PigDao;
import com.dxw.pms.models.Pig;
import com.pms.utils.TimeUtil;

@Controller
@RequestMapping("api/v1/pigs")
public class PigController {
	@Autowired
	private PigDao pigDao;
	
	@RequestMapping(method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<PageBean<Pig>> getProducts(){
		ResultBean<PageBean<Pig>> bean = new ResultBean<>();
		List pigs = pigDao.findAll();
		
		PageBean<Pig> pageBean = new PageBean<>();
		pageBean.setItems(pigs);
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
