package com.dxw.pms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxw.pms.beans.LoginUser;
import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.UpdateDao;
import com.dxw.pms.dal.UserDao;
import com.dxw.pms.models.Update;
import com.dxw.pms.models.User;
import com.pms.utils.CryptoUtils;

@Controller
@RequestMapping("api/v1/updates")
public class UpdateController {

	@Autowired
	private UpdateDao updateDao;
	
	@RequestMapping(value="/{id}", method=RequestMethod.GET, 
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<Update> getUser(@PathVariable("id") Long id){
		ResultBean<Update> bean = new ResultBean<>();
		
		Update update = updateDao.findById(id);
		bean.setCode(ResultBean.RESULT_SUCCESS);
		bean.setMessage("success");
		bean.setResult(update);
		return bean;
	}
}
