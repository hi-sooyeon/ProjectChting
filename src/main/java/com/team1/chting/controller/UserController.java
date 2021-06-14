package com.team1.chting.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.team1.chting.dto.*;
import com.team1.chting.dto.MyPageInfo;
import com.team1.chting.service.BoardService;
import net.sf.json.JSONArray;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.chting.service.UserService;

@Controller
public class UserController {

    @Autowired
    private SqlSession sqlsession;

    @Autowired
    private UserService userService;

    @Autowired
    private BoardService boardService;

    /*
    마이페이지 회원 정보 불러오기
    작성자 : 박주현
    작성일 : 2021-06-07
    */
    @RequestMapping(value = "myPage.do", method = RequestMethod.GET)
    public String userInfo(Model model) {

        model.addAttribute("userInfo", userService.getMyPageInfo());

        return "user/userinfo";
    }

    /*
    마이페이지 회원 정보 수정 페이지
    작성자 : 박주현
    작성일 : 2021-06-10
    */
    @RequestMapping(value = "userUpdate.do", method = RequestMethod.GET)
    public String userUpdate(Model model) {

        model.addAttribute("userInfo", userService.getMyPageInfo());
        model.addAttribute("areaList", boardService.getAreaList());

        return "user/userUpdate";
    }


    /*
    마이페이지 회원 정보 수정 - 관심사 선택
    작성자 : 박주현
    작성일 : 2021-06-11
    */
    @RequestMapping(value = "categoryChoice.do", method = RequestMethod.GET)
    public String categoryChoice(Model model) {

        List<InterestCategoryDto> list = new ArrayList<>();
        InterestCategoryDto interestCategory = new InterestCategoryDto();

        interestCategory.setM_catecode("");
        list.add(interestCategory);

        model.addAttribute("interestCategory", userService.getInterestCategory(list));

        return "user/interestCategory";
    }


}
