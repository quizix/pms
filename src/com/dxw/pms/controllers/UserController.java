package com.dxw.pms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxw.pms.beans.ActionResult;
import com.dxw.pms.beans.LoginUser;
import com.dxw.pms.beans.Result;
import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.UserDao;
import com.dxw.pms.models.User;
import com.pms.utils.CryptoUtils;

@Controller
@RequestMapping("api/v1/users")
public class UserController {

	private final static String ENCRYPT_KEY = "cestquoi1314"; 
	@Autowired
	private UserDao userDao;
	
	@RequestMapping(value="/{id}", method=RequestMethod.GET, 
			produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<User> getUser(@PathVariable("id") Long id){
		ResultBean<User> bean = new ResultBean<>();
		
		User user = userDao.findById(id);
		bean.setCode(ResultBean.RESULT_SUCCESS);
		bean.setMessage("success");
		bean.setResult(user);
		return bean;
	}

	@RequestMapping(value="/login", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean<User> login(@RequestParam String username,
			@RequestParam String password){
		ResultBean<User> result = new ResultBean<>();
		User user = userDao.findByName(username);
		String encrypedPassword = CryptoUtils.encode("cestquoi1314", password);
		if(user == null){
			result.setResult(null);
			result.setCode(ResultBean.RESULT_ERROR);
			result.setMessage("用户名或者密码错误!");
		}
		else{
			if(encrypedPassword.equals(user.getPassword())){
				result.setResult(user);
				result.setCode(ResultBean.RESULT_SUCCESS);
			}
			else{
				result.setResult(null);
				result.setCode(ResultBean.RESULT_ERROR);
				result.setMessage("用户名或者密码错误!");
			}
		}
		return result;
	}
	
	//Url：/users/changePassword
	//Parameters: username, passwordOld, passwordNew 
	@RequestMapping(value="/changePassword", method=RequestMethod.POST, 
			produces=MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ActionResult changePassword(@RequestParam String username,
			@RequestParam String passwordOld, @RequestParam String passwordNew){
		ActionResult bean = new ActionResult();
		bean.setCode(ResultBean.RESULT_SUCCESS);
		
		User user = userDao.findByName(username);
		String encrypedPasswordOld = CryptoUtils.encode(ENCRYPT_KEY, passwordOld);
		if(user == null){
			bean.setCode(ResultBean.RESULT_ERROR);
			bean.setMessage("用户不存在!");
		}
		else{
			if(!encrypedPasswordOld.equals(user.getPassword())){
				bean.setCode(ResultBean.RESULT_ERROR);
				bean.setMessage("旧密码不正确!");
			}
			else{
				String encrypedPasswordNew = CryptoUtils.encode(ENCRYPT_KEY, passwordNew);
				user.setPassword(encrypedPasswordNew);
				userDao.updateUser(user);
				bean.setCode(ResultBean.RESULT_SUCCESS);
				bean.setMessage("修改密码成功！");
			}
		}
		return bean;
	}
	
}
