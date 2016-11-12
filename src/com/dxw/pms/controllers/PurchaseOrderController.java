package com.dxw.pms.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.DbException;
import com.dxw.pms.dal.PurchaseOrderDao;
import com.dxw.pms.models.PurchaseOrder;
import com.pms.utils.TimeUtil;

@Controller
@RequestMapping("/purchaseOrder")
public class PurchaseOrderController {

	@Autowired
	private PurchaseOrderDao purchaseOrderDao;

	@RequestMapping(value = "/code/{code}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResultBean<PurchaseOrder> getPurchaseOrder(@PathVariable("code") String code) {
		ResultBean<PurchaseOrder> bean = new ResultBean<>();
		try {
			PurchaseOrder purchaseOrder = purchaseOrderDao.findByCode(code);
			bean.setCode(ResultBean.RESULT_SUCCESS);
			bean.setMessage("success");
			bean.setResult(purchaseOrder);
			bean.setTime(TimeUtil.getCurrentTimeStr());
		} catch (DbException ex) {
			bean.setCode(ResultBean.RESULT_ERROR);
			bean.setMessage(ex.getMessage());
		}
		return bean;
	}
}
