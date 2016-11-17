package com.dxw.pms.controllers;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.dxw.pms.beans.ActionResult;
import com.dxw.pms.beans.ResultBean;
import com.dxw.pms.dal.DbException;
import com.dxw.pms.dal.PurchaseOrderDao;
import com.dxw.pms.models.PurchaseOrder;
import com.pms.utils.TimeUtil;

@Controller
@RequestMapping("api/v1/po")
public class PurchaseOrderController {

	@Autowired
	ServletContext servletContext;
	
	@Autowired
	private PurchaseOrderDao purchaseOrderDao;

	@RequestMapping(value = "/code/{code}", method = RequestMethod.GET, 
			produces = MediaType.APPLICATION_JSON_VALUE)
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
	
	@RequestMapping(value = "/finish", method = RequestMethod.POST, 
			produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ActionResult getPurchaseOrder(@RequestParam Long purchaseOrderId/*, @RequestParam MultipartFile file*/) {
		ActionResult bean = new ActionResult();
		bean.setTime(TimeUtil.getCurrentTimeStr());
		try {
			PurchaseOrder purchaseOrder = purchaseOrderDao.findById(purchaseOrderId);

			if( purchaseOrder != null){
				Date today = new Date();
				String fileName = getFileName(today);
				//saveFile(file, fileName);
				
				purchaseOrder.setExecutionImg(fileName);
				purchaseOrder.setExecutionTime(today);
				purchaseOrderDao.update(purchaseOrder);
				
				bean.setCode(ActionResult.RESULT_SUCCESS);
				bean.setMessage("success");
			}
			else{
				bean.setCode(ActionResult.RESULT_ERROR);
				bean.setMessage(String.format("无法找到订单号为%d的订单", purchaseOrderId));
			}
		} 
		catch(Exception ex){
			ex.printStackTrace();
			bean.setCode(ActionResult.RESULT_ERROR);
			bean.setMessage(ex.getMessage());
		}
		return bean;
	}

	private void saveFile(MultipartFile file, String fileName) throws IOException, FileNotFoundException {
		File imgFile = new File(fileName);
		InputStream is = file.getInputStream();
		
		FileOutputStream fos = new FileOutputStream(imgFile);
		byte[] buffer = new byte[8*1024];
		int bytesRead;
		while((bytesRead=is.read(buffer))>0 ){
			fos.write(buffer, 0, bytesRead);
		}
		is.close();
		fos.close();
	}
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private synchronized String getFileName(Date date){
		File root = new File( servletContext.getRealPath("/WEB-INF/upload/po") );
		
		String subPath = sdf.format(date);
		
		File subDir = new File(root.getAbsolutePath() + File.separator + subPath);
		System.out.println(subDir.getAbsolutePath());
		if( !subDir.exists())
			subDir.mkdirs();
		
		return subDir.getAbsolutePath() + File.separator + UUID.randomUUID().toString()
				+".jpg";
		
	}
}
