package com.githrd.deli.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.githrd.deli.dao.PayDao;
import com.githrd.deli.dao.YonghyunDao;
import com.githrd.deli.service.ImportPay;
import com.githrd.deli.service.PayService;
import com.githrd.deli.service.PaymentCheck;
import com.githrd.deli.vo.MembVO;
import com.githrd.deli.vo.PayVO;
import com.githrd.deli.vo.YonghyunVO;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;



@Controller
@RequestMapping("/payment")
public class PayController {
	@Autowired
	PayDao paDao;
	@Autowired
	YonghyunDao yDao;
	@Autowired
	PayService paSrvc;

	@Autowired
	ImportPay ipay;
	
	public IamportClient api;
	
	//	실험 페이지
	@RequestMapping("payPay.dlv")
	public ModelAndView payPay(ModelAndView mv, HttpServletRequest req) {
		String pay = req.getParameter("짜장면");
		System.out.println(pay);
		return mv;
	}
	
	
	//	결제전 페이지 폼 보기 처리함수
	@RequestMapping("beforePay.dlv")
	public ModelAndView beforePay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO, HttpServletRequest req) {
		
		String sid = (String) session.getAttribute("SID");
		paVO = paDao.selPays(paVO);
		String mname = (String)req.getParameter("mname1");
		String mmprice = (String)req.getParameter("price1");
		int mtprice = Integer.parseInt(mmprice);
		
		paVO.setAmname(mname);
		paVO.setMyprice(mtprice);
		
		
		int cnt = paDao.abnoCnt(paVO.getBno());
			
		int delpay = (paVO.getDelpay() != 0) ? paVO.getDelpay() / cnt : 0;
		paVO.setMtprice(mtprice + delpay);
		
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		int aprice = 0;
		for(int i = 0 ; i < mVO.size() ; i ++) {
			aprice = aprice + mVO.get(i).getMprice();
		}
		
		aprice = aprice + paVO.getMyprice();
		
		List<YonghyunVO> kVO = yDao.selRegimem(yVO);
		
		MembVO membVO = paDao.selMinfo(sid);
		mv.addObject("DLP", delpay);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		mv.addObject("MEMBER", kVO);		
		mv.addObject("APRICE", aprice);
		
		mv.setViewName("payment/beforePay");
		
		return mv;
	}
	
	@RequestMapping("complete.dlv")
	@ResponseBody
	public int paymentComplete(@RequestParam("imp_uid")String imp_uid, String merchant_uid) {
		String token = paSrvc.getImportToken();
		
		// int cancelPay = paSrvc.cancelPayment(token, merchant_uid);
		
		String smount = paSrvc.getAmount(token, merchant_uid);
		int amount = Integer.parseInt(smount);
		paSrvc.setHackCheck(smount, merchant_uid, token);
		System.out.println(imp_uid);
		return amount;
	}
	
	@RequestMapping("payProc.dlv")
	@ResponseBody
	public Map payProc(HttpSession session, PayVO paVO, YonghyunVO yVO) {
		
		Map result = new HashMap<String, String>();
		
		System.out.println(paVO);
		
		try {
			paSrvc.insertAllM(paVO);
			result.put("result", "y");
		} catch (Exception e) {
			result.put("result", "n");
		}
		return result;
	}
	
	@RequestMapping("afterPay.dlv")
	public ModelAndView afterPay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO, HttpServletRequest req) {
		String sid = (String) session.getAttribute("SID");
		paVO = paDao.selPays(paVO);
		String amname = (String) req.getParameter("mymenu");
		String mmprice = (String)req.getParameter("amount");
		String rq = (String)req.getParameter("rq");
		
		int mtprice = Integer.parseInt(mmprice);
		System.out.println("paVO" + paVO);
		
		paVO.setAmname(amname);
		paVO.setMyprice(mtprice);
		
		int cnt = paDao.abnoCnt(paVO.getBno());
		
		int delpay = (paVO.getDelpay() != 0) ? paVO.getDelpay() / cnt : 0;
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		List<YonghyunVO> kVO = yDao.selRegimem(yVO);
		
		paVO.setMtprice(mtprice + delpay);
		
		MembVO membVO = paDao.selMinfo(sid);
		mv.addObject("RQ", rq);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		mv.addObject("MEMBER", kVO);
		mv.addObject("DLP", delpay);
		
		mv.setViewName("payment/afterPay");
		
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> paymentByImpUid(
			Model model
			, Locale locale
			, HttpSession session
			, @PathVariable(value= "imp_uid") String imp_uid) throws IamportResponseException, IOException{	
			this.api = new IamportClient("5781100875728352", "fa6925fe5a8c23bc192ea5840d57ebc7b71168fedaf51c45f0d6aaae3a5798b229699e7e7692d485");
			return api.paymentByImpUid(imp_uid);
	}
}
