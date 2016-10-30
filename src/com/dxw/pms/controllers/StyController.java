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
import com.dxw.pms.dal.StyDao;
import com.dxw.pms.models.Sty;
import com.pms.utils.TimeUtil;

@Controller
@RequestMapping("api/v1/sties")
public class StyController {

	@Autowired
	private StyDao styDao;
	
	@RequestMapping(value="/{id}", method=RequestMethod.GET, 
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<Sty> getSty(@PathVariable("id") Long id){
		ResultBean<Sty> bean = new ResultBean<>();
		
		Sty sty = styDao.findById(id);
		bean.setCode(ResultBean.RESULT_SUCCESS);
		bean.setMessage("success");
		bean.setResult(sty);
		bean.setTime(TimeUtil.getCurrentTimeStr());
		return bean;
	}
	

	@RequestMapping(value="/code/{code}", method=RequestMethod.GET, 
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<Sty> getSty(@PathVariable("code") String code){
		ResultBean<Sty> bean = new ResultBean<>();
		
		Sty sty = styDao.findByNaturalId(code);
		
		bean.setCode(ResultBean.RESULT_SUCCESS);
		bean.setMessage("success");
		bean.setResult(sty);
		bean.setTime(TimeUtil.getCurrentTimeStr());
		return bean;
	}
	
	@RequestMapping(method=RequestMethod.GET, 
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<PageBean<Sty>> getProducts(){
		ResultBean<PageBean<Sty>> bean = new ResultBean<>();
		List sties = styDao.findAll();
		
		PageBean<Sty> pageBean = new PageBean<>();
		pageBean.setItems(sties);
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
