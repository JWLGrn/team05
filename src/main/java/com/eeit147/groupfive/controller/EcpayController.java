package com.eeit147.groupfive.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.eeit147.groupfive.users.model.Donation;
import com.eeit147.groupfive.users.model.DonationDao;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutDevide;

@Controller
//@SessionAttributes({ "loginUser", "result","updateUserResult" })
public class EcpayController {

	@Autowired
	private  DonationDao dDao;

	public static AllInOne all;

	@GetMapping("/donation")
	public String donationToUserful() {
		return "donation/donation";
	}

	@PostMapping("/ecpay")
	@ResponseBody
	public  String genAioCheckOutDevide(@RequestParam("price") Integer price,
			@RequestParam("address") String address, @RequestParam("phone") Integer phone,Model model) {
		StringBuilder orderNumber = new StringBuilder();
		Random randomOrderNumber = new Random();
		for (int i = 0; i < 6; i++) {
			orderNumber.append(randomOrderNumber.nextInt(10));
		}
		String orderNumber02 = orderNumber.toString();
		SimpleDateFormat Date = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date current = new Date();
		AllInOne aio = new AllInOne("");
		AioCheckOutDevide obj = new AioCheckOutDevide();
		obj.setMerchantTradeNo("ICook" + orderNumber02);
		obj.setMerchantTradeDate(Date.format(current));
		obj.setTotalAmount(price.toString());
		obj.setTradeDesc("援助脆弱家庭兒少免於飢餓、健康成長，以及孤、貧、殘、疾之脆弱年長者獲得適需的資源。");
		obj.setItemName("贊助");
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setCreditInstallment("12");
		String form = aio.aioCheckOut(obj, null);
		Donation donation = new Donation();
		donation.setAddress(address);
		donation.setPhone(phone);
		donation.setDonateDate(current);
		donation.setPrice(price);
		donation.setTradeno("ICook" + orderNumber02);
		dDao.save(donation);
		model.addAttribute("donation", donation);
		return form;

	}
	
	@PostMapping("/findAllDonation")
	public @ResponseBody List<Donation> findAllDonation(){
		List<Donation> dList = dDao.findAll();
		return dList;
		
	}

}
