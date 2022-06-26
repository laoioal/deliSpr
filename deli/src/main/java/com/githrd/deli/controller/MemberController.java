package com.githrd.deli.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.githrd.deli.dao.PlaceDao;
import com.githrd.deli.service.CalculatorService;
import com.githrd.deli.service.MemberService;
import com.githrd.deli.vo.calculatorVO;
import com.githrd.deli.vo.guestVO;
import com.githrd.deli.vo.memberVO;
import com.githrd.deli.vo.placeVO;
/*
 * 이 클래스는 아이디를 입력 받으면 그 정보에 맞는 주소값을 가져온 뒤
 * 거리를 계산해서 그에 맞는 정보를 보여주는 controller
 * 작성자 : 고하늘
 */
@Controller
@RequestMapping("/member")
public class MemberController {
	@Autowired private MemberService service;
	@Autowired private PlaceDao mapper;
	@Autowired private CalculatorService calculator;
	
	private memberVO member;
	
	//insertId라는 주소가 url에 들어오면 해당 페이지를 보여줌
	@GetMapping("/insertId.dlv")
	public String start() {
		return "search/1.mapSearch/insertId";
	}
	
	
	//id 존재 여부 확인 : 아이디 값이 있으면 그 다음 페이지로 넘어가지만, 존재하지 않으면 하단에 경고 메세지 표시
	@PostMapping("/insertId.dlv")
	public String insertId(Model model, guestVO guest) {
		service.searchById(guest);
		if(guest.getError()!=null) {
			String error = guest.getError();
			model.addAttribute("error", error);
			return "search/1.mapSearch/insertId";
		}
		else {
			member = new memberVO(guest.getId(),guest.getAddr());
			model.addAttribute("member",member);
			return "search/1.mapSearch/myPositionSearch";
		}
	}

	
	//아이디 주소를 입력하면 주소값에 대한 위도값, 경도값을 자바스크립트를 통해 전달 받은 뒤
	//등록된 pickup정보를 바탕으로 거리 계산하고 이를 view(placeView)에 뿌려주는 기능
	@GetMapping("/placeView.dlv")
	public String mapSearh(Model model, @Param("lat")double lat, @Param("lon")double lon) {
		List<placeVO> place = mapper.selectList();	//픽업 리스트
		System.out.println("리스트 : "+place);
		List<calculatorVO> cal = new ArrayList<>(place.size()); 
		
		for(int i = 0; i<place.size();i++) {
			double distance = calculator.disCal(lon, lat, place.get(i).getPickuplat(), place.get(i).getPickuplon());
			if(distance<1000) {
			calculatorVO calculat = new calculatorVO(place.get(i).getName(),place.get(i).getAddress(),distance);
			cal.add(calculat);
			}
		}
		placeVO myPlace = new placeVO(member.getId(),member.getAddr(),lon,lat);	//마커 표시를 위해 회원 정보도 list에 넣어줌
		place.add(myPlace);
		
		//가까운거리순으로 정렬
		Collections.sort(cal,new Comparator<calculatorVO>() {
			@Override
			public int compare(calculatorVO o1, calculatorVO o2) {
				if(o1.getDistance()<o2.getDistance()) {
					return -1;
				}
				return 1;}});
		model.addAttribute("lat",lat);
		model.addAttribute("lon",lon);
		model.addAttribute("place",place);
		model.addAttribute("cal",cal);
		return "search/2.SelectPlace/pickUpPlaceChoose";
	}

}
	
	

