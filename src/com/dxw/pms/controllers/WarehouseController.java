package com.dxw.pms.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxw.pms.beans.PageBean;
import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.StyDao;
import com.dxw.pms.dal.WarehouseDao;
import com.dxw.pms.models.Sty;
import com.dxw.pms.models.Warehouse;
import com.pms.utils.TimeUtil;

@Controller
@RequestMapping("api/v1/warehouses")
public class WarehouseController {

	@Autowired
	private WarehouseDao warehouseDao;
	
	@RequestMapping(value="/{id}", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<Warehouse> getProduct(@PathVariable("id") Long id){
		ResultBean<Warehouse> bean = new ResultBean<>();
		
		Warehouse warehouse = warehouseDao.findById(id);
		bean.setCode(ResultBean.RESULT_SUCCESS);
		bean.setMessage("success");
		bean.setResult(warehouse);
		bean.setTime(TimeUtil.getCurrentTimeStr());
		return bean;
	}
	
	@RequestMapping(value="/code/{code}", method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<Warehouse> getWarehouseByCode(@PathVariable("code") String code){
		ResultBean<Warehouse> bean = new ResultBean<>();
		
		Warehouse warehouse = warehouseDao.findByNaturalId(code);
		bean.setCode(ResultBean.RESULT_SUCCESS);
		bean.setMessage("success");
		bean.setResult(warehouse);
		bean.setTime(TimeUtil.getCurrentTimeStr());
		return bean;
	}
	
	@RequestMapping(method=RequestMethod.GET, produces=MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
	public ResultBean<PageBean<Warehouse>> getProducts(){
		ResultBean<PageBean<Warehouse>> bean = new ResultBean<>();
		List warehouses = warehouseDao.findAll();
		
		PageBean<Warehouse> pageBean = new PageBean<>();
		pageBean.setItems(warehouses);
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
