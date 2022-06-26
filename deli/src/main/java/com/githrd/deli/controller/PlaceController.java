package com.githrd.deli.controller;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.githrd.deli.dao.CategoryDao;
import com.githrd.deli.dao.PlaceDao;
import com.githrd.deli.dao.RestaurantDao;
import com.githrd.deli.service.PlaceService;
import com.githrd.deli.service.RestaurantService;
import com.githrd.deli.vo.categoryVO;
import com.githrd.deli.vo.placeVO;
import com.githrd.deli.vo.restaurantVO;
/*
 * 이 클래스는 회원이 선택한 내용을 토대로 순차적으로 전달해주는 클래스
 *  
 *  작성자 : 고하늘
 * */
@Controller
@RequestMapping("/place")
public class PlaceController {
	@Autowired private PlaceDao placedao;	// 픽업장소 관련
	@Autowired private CategoryDao categorydao;	//음식 카테고리 관련 
	@Autowired private RestaurantService restaurantService;
	@Autowired private RestaurantDao restaurantdao;
	@Autowired private PlaceService placeservice;
	
	//음식 카테고리 정보 요청
	@GetMapping("/category.dlv")
	public String chooseCategory(Model model, @Param("name")String name) {
		List<categoryVO> category = categorydao.selectList();		
		placeVO place = placedao.selectOne(name);
		model.addAttribute("place", place);
		model.addAttribute("category",category);
		return "/search/2.SelectPlace/chooseMenuCategory";
	}
	
	//카테고리를 바탕으로 식당 조회, 이를 선택
	@GetMapping("/restaurant.dlv")	//code:카테고리 코드, place_name : 장소명
	public String chooseMenuCategory(Model model,@Param("code")int code,@Param("place_name")String place_name) {
		placeVO place = placedao.selectOne(place_name);
		System.out.println(place);
		int mcode = placeservice.getCode(place);
		System.out.println(mcode);
		categoryVO category = categorydao.selectNum(code);
		System.out.println(category);
		Map<Integer,List<restaurantVO>> RMap = restaurantService.sortMap(code,mcode);
		List<restaurantVO> restaurant =restaurantService.sortList(RMap.get(mcode));
		System.out.println("*******************"+restaurant);
		
		//레스토랑 배열.... 
		model.addAttribute("place",place);
		model.addAttribute("category",category);
		model.addAttribute("restaurant",restaurant);
		
		return "search/3.SelectRestaurant/restaurantChoose";
	}
	
	//선택한 픽업장소, 식당정보 안내 및 확인창
	@GetMapping("/restaurant/selectfinish.dlv")
	public String restaurantChoose(Model model,@Param("restno")int restno,@Param("place_name")String place_name) {
		System.out.println(restno);
		placeVO place = placedao.selectOne(place_name);
		restaurantVO restaurant = restaurantdao.selectRestno(restno);
		categoryVO category = categorydao.selectNum(restaurant.getCname());
		
		model.addAttribute("place",place);
		model.addAttribute("category",category);
		model.addAttribute("restaurant",restaurant);
		return "search/3.SelectRestaurant/checkInfo";
		}
	
	
}


	