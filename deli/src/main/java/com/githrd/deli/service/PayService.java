package com.githrd.deli.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.githrd.deli.dao.PayDao;
import com.githrd.deli.vo.PayVO;

@Service
public class PayService {
	@Autowired
	PayDao paDao;
	
	@Autowired
	PayService paSrvc;
	
	
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	
	public static final String KEY = "5781100875728352";
	public static final String SECRET = "fa6925fe5a8c23bc192ea5840d57ebc7b71168fedaf51c45f0d6aaae3a5798b229699e7e7692d485";
	
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수
	private List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		
		Set<Entry<String,String>> entries = paramMap.entrySet();
		
		for(Entry<String,String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
			System.out.println("paramList : "+paramList);
		}
		return paramList;
	}
	
    // 아임포트 인증(토큰)을 받아주는 함수
	public String getImportToken() {
		String token = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL);
		Map<String,String> m  =new HashMap<String,String>();
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			token = resNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("getToken error");
			throw new RuntimeException("아임포트 토큰 발급에 실패했습니다.");
		}
		System.out.println("paramList : "+ token);
		return token;
	}
	
	// 결제취소
	public int cancelPayment(String token, String merchant_uid) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL);
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", merchant_uid);
		String asd = "";
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String enty = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(enty);
			asd = rootNode.get("response").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (asd.equals("null")) {
			System.err.println("환불실패");
			return -1;
		} else {
			System.err.println("환불성공");
			return 1;
		}
	}
	
    // 아임포트 결제정보를 조회해서 결제금액을 뽑아주는 함수
	public String getAmount(String token, String merchant_uid) {
		String amount = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + merchant_uid + "/paid");
		get.setHeader("Authorization", token);

		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			JsonNode resNode = rootNode.get("response");
			amount = resNode.get("amount").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return amount;
	}
	
    // 아임포트 결제금액 변조를 방지하는 함수
	public void setHackCheck(String amount,String merchant_uid,String token) {
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String,String> m  = new HashMap<String,String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount);
		m.put("merchant_uid", merchant_uid);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode);
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	@Transactional
	public void insertAllM(PayVO paVO) {
		//	할일
		//	데이터 입력
		try {
		paDao.insertOdt(paVO);
		paDao.insertOdl(paVO);
		paDao.insertOdm(paVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	public void delAllM(String ono) {
		paDao.delOdt(ono);
		paDao.delOdl(ono);
		paDao.delOdm(ono);
	}
	
	@PostMapping("/confirmPay")
	public void confirmPay(@RequestParam("imp_uid")String imp_uid) {
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		
		JSONObject body = new JSONObject();
		body.put("imp_key", KEY);
		body.put("imp_secret", SECRET);
		try {
			HttpEntity<JSONObject> entity = new HttpEntity<>(body, headers);
			ResponseEntity<JSONObject> token = restTemplate.postForEntity("https://api.iamport.kr/users/getToken", entity, JSONObject.class);
			
		} catch(Exception e) {
			e.printStackTrace();
			System.out.println("getTokken error");
			throw new RuntimeException("아임포트 토큰 발급에 실패했습니다");
		} finally {
			headers.clear();
			body.clear();
		}
	}

}