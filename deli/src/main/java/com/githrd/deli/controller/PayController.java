package com.githrd.deli.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import org.slf4j.*;

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
import org.springframework.web.servlet.view.RedirectView;

import com.githrd.deli.dao.PayDao;
import com.githrd.deli.dao.YonghyunDao;
import com.githrd.deli.service.PayService;
import com.githrd.deli.service.PaymentCheck;
import com.githrd.deli.util.PageUtil;
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
	
	
	
	private static final Logger payLog = LoggerFactory.getLogger(PayController.class);
	private static final Logger PayLog = LoggerFactory.getLogger("payLog");
	
	public IamportClient api;
	//	실험 페이지
	/*
	@RequestMapping("payPay.dlv")
	public ModelAndView payPay(ModelAndView mv, HttpServletRequest req, PayVO paVO, YonghyunVO yVO, HttpSession session) {
		
		String sid = (String) session.getAttribute("SID");
		paVO = paDao.selPays(paVO);
		
		String pay = req.getParameter("짜장면");
		int opay = Integer.parseInt(pay);
		
		String pay2 = req.getParameter("짬뽕");
		int opay2 = Integer.parseInt(pay2);
		
		String[] menuArr = new String[2];
		menuArr[0] = "짜장면";
		menuArr[1] = "짬뽕";
		
		int[] payArr = new int[2];	
		payArr[0] = opay;	
		payArr[1] = opay2;
		
		
		int[] menuPrice = new int[2];
		for(int i =0 ; i< payArr.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			map.put(menuArr[i], paVO.getRname());
			menuPrice[i] = paDao.selMenuPrice(map);
		}
		
		System.out.println(menuPrice);

		int[] cntArr = new int[2];
		int countCnt = 0;
		for(int i = 0; i < cntArr.length ; i++) {
			cntArr[i] = ((payArr[i] !=0) ? payArr[i] / 6000 : 0);
			countCnt = cntArr[i];
		}
		
		int[] priceArr = new int[2];
		for(int i =0 ;i< priceArr.length; i++) {
			priceArr[i] = payArr[i] / cntArr[i];
		}
		
		List<PayVO> mlist = new ArrayList<PayVO>();
		
		for(int i =0 ; i< 2; i++) {
			if(cntArr[i] == 0) {
				break;
			} else {
				PayVO pVO = new PayVO();
				pVO.setMname(menuArr[i]);
				pVO.setMprice(priceArr[i]);
				pVO.setQuantity(cntArr[i]);
				mlist.add(pVO);
			}
		}

		System.out.println(paVO);
		
		String mname = "짜장면";
		
		int mtprice = opay + opay2;
		
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
		mv.addObject("COUNCNT", countCnt);
		mv.addObject("MLIST", mlist);
		
		
		mv.setViewName("payment/beforePay");
		
		
		return mv;
	}
	*/
	
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
	
	//	결제 정보 확인 -> 오류 발생 시 환불 조치 실행
	@RequestMapping("complete.dlv")
	@ResponseBody
	public Map paymentComplete(@RequestParam("imp_uid")String imp_uid, String merchant_uid) {
		String token = paSrvc.getImportToken();
		Map result = new HashMap<String, String>();
		result.put("token", token);
		result.put("imp_uid", imp_uid);
		result.put("merchant_uid", merchant_uid);
		try {
			String smount = paSrvc.getAmount(token, merchant_uid);
			paSrvc.setHackCheck(smount, merchant_uid, token);
			result.put("result", "y");
			// paSrvc.cancelPayment(token, imp_uid);
		} catch (Exception e) {
			e.printStackTrace();
			result.put("result", "n");
		}
		// System.out.println("token : " + token);
		return result;
	}
	
	//	환불 절차
	@RequestMapping("cancelPay.dlv")
	@ResponseBody
	public int cancelPay(String merchant_uid) {
		String token = paSrvc.getImportToken();
		// System.out.println("token : " + token);
		int cnt = paSrvc.cancelPayment(token, merchant_uid);
		return cnt;
		
	}
	
	//	token 없어도 실행되는 거 확인
	
	@RequestMapping("canCelPay.dlv")
	@ResponseBody
	public int canCelPay(String merchant_uid) {
		String token = paSrvc.getImportToken();
		System.out.println("token : " + token);
		int cnt = paSrvc.cancelPayment(token, merchant_uid);
		String ono = merchant_uid;
		paSrvc.delAllM(ono);
		
		return cnt;
		
	}
	
	/*
	@RequestMapping("payProc.dlv")
	@ResponseBody
	public Map payProc(HttpSession session, PayVO paVO, YonghyunVO yVO) {
		
		Map result = new HashMap<String, String>();
		
		try {
			paSrvc.insertAllM(paVO);
			result.put("result", "y");
		} catch (Exception e) {
			result.put("result", "n");
		}
		return result;
	}
	*/
	//	결제 후 페이지 폼보기 처리 함수
	@RequestMapping("afterPay.dlv")
	public ModelAndView afterPay(ModelAndView mv, HttpSession session, PayVO paVO, YonghyunVO yVO, HttpServletRequest req, RedirectView rv, MembVO membVO) {
		System.out.println(paVO);
		
		Map result = new HashMap<String, String>();

		String sid = (String) session.getAttribute("SID");
		membVO = paDao.selMinfo(sid);
		paVO = paDao.selPays(paVO);
		String amname = (String) req.getParameter("mname1");
		String mmprice = (String)req.getParameter("price1");
		String imp_uid = (String)req.getParameter("imp_uid");
		String merchant_uid = (String)req.getParameter("merchant_uid");
		String token = (String)req.getParameter("token");
		String rq = (String)req.getParameter("rq");
		// System.out.println(token);
		int mtprice = Integer.parseInt(mmprice);
		
		paVO.setAmname(amname);
		paVO.setMyprice(mtprice);
		
		int cnt = paDao.abnoCnt(paVO.getBno());
		
		int delpay = (paVO.getDelpay() != 0) ? paVO.getDelpay() / cnt : 0;
		
		List<YonghyunVO> mVO = yDao.getMenu(yVO);
		
		List<YonghyunVO> kVO = yDao.selRegimem(yVO);
		paVO.setOno((String)req.getParameter("merchant_uid"));
		paVO.setMtprice(mtprice + delpay);
		paVO.setRno(paVO.getRestno());
		paVO.setOprice(paVO.getMtprice());
		paVO.setOlmenu(amname);
		paVO.setMno(membVO.getMno());
		paVO.setPaym((String)req.getParameter("paym"));
		paVO.setRequest(rq);
		//	각 메뉴 이름 및 가격, 수량(후에 수정 필요)
		paVO.setOmenu(amname);
		paVO.setOmprice(paVO.getMtprice());
		
		try {
			paSrvc.insertAllM(paVO);
			payLog.info(membVO.getId() + " 님이 "+ amname +" 주문을 완료했습니다.");
		} catch (Exception e) {
			e.printStackTrace();
			mv.setViewName("payment/beforePay");
			return mv;
		}
		membVO.setResult("OK");
		mv.addObject("RQ", rq);
		mv.addObject("PO", paVO);
		mv.addObject("MPO", membVO);
		mv.addObject("MENU", mVO);
		mv.addObject("MEMBER", kVO);
		mv.addObject("DLP", delpay);
		mv.addObject("UID", imp_uid);
		mv.addObject("MUID", merchant_uid);
		mv.addObject("TK", token);
		
		mv.setViewName("payment/afterPay");
		return mv;
	}
	
	//	주문 내역 조회 폼보기 함수
	@RequestMapping("orderHistory.dlv")
	public ModelAndView orderHistory(ModelAndView mv, HttpSession session, RedirectView rv, PayVO paVO, PageUtil page) {
		String sid = (String) session.getAttribute("SID");
		System.out.println(sid);
		
		if(sid == null) {
			rv.setUrl("/deli/member/login.dlv");
			mv.setView(rv);
			return mv;
		}
		
		MembVO membVO = paDao.selMinfo(sid);
		
		paVO.setMno(membVO.getMno());
		
		List<PayVO> list = paDao.selOdH(paVO);

		mv.addObject("LIST", list);
		
		mv.setViewName("payment/orderHistory");
		
		return mv;
	}
	
}