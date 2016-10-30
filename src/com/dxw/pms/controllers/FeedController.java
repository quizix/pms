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
import com.dxw.pms.dal.FeedDao;
import com.dxw.pms.models.FeedLog;
import com.pms.utils.TimeUtil;

/**
 * 饲料种类
 * @author zhang
 *
 */
@Controller
@RequestMapping("api/v1/feeds")
public class FeedController {

	@Autowired
	private FeedDao feedDao;

	@RequestMapping(method=RequestMethod.GET,
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<PageBean<FeedLog>> get(){
		ResultBean<PageBean<FeedLog>> bean = new ResultBean<>();
		List feeds = feedDao.findAll();
		
		PageBean<FeedLog> pageBean = new PageBean<>();
		pageBean.setItems(feeds);
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
