package com.ddu.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddu.project.dao.MemberDao;

@Controller
public class MemberController {

	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/index")
	public String index(HttpSession session, Model model, HttpServletRequest request) {
		return"index";
	}
	@RequestMapping(value = "/join")
	public String join(HttpSession session, Model model, HttpServletRequest request) {
		return"join";
	}
	@RequestMapping(value = "/joinOk")
	public String joinOk(HttpSession session, Model model, HttpServletRequest request) {
		String memberid = request.getParameter("memberid");
		String memberpw = request.getParameter("memberpw");
		String checkpw = request.getParameter("checkpw");
		String membername = request.getParameter("membername");
		String memberphone = request.getParameter("memberphone");
		
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		
		int idResult = mDao.memberIdCheckDao(memberid);
		
		if (idResult == 1) {
			
			model.addAttribute("msg", "이미 존재하는 아이디입니다. 다시 가입해 주세요.");
			model.addAttribute("url", "join");
			
			return "alert/alert";
		} else if (!memberpw.equals(checkpw)) {
			
			model.addAttribute("msg", "비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "join");
			
			return "alert/alert";
		} else {
			int joinResult = mDao.memberJoinDao(memberid, memberpw, membername, memberphone);
			model.addAttribute("mid", memberid);
			model.addAttribute("msg", "회원가입이 완료되었습니다. 로그인 해주세요");
			model.addAttribute("url", "login");
			
			return"alert/alert";
		}

	}
	@RequestMapping(value = "/login")
	public String login(HttpSession session, Model model, HttpServletRequest request) {
		
		return"login";
	}
	@RequestMapping(value = "/loginOk")
	public String loginOk(HttpSession session, Model model, HttpServletRequest request) {
		String memberid = request.getParameter("memberid");
		String memberpw = request.getParameter("memberpw");
		
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		int loginResult = mDao.loginOkDao(memberid, memberpw);
		
		if (loginResult != 1) {
			model.addAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			model.addAttribute("url", "login");
			
			return"alert/alert";
		}
		session.setAttribute("sessionId", memberid);
		model.addAttribute("msg", memberid + "님 로그인 완료 되었습니다!");
		model.addAttribute("url", "index");
		
		return"alert/alert";
	}
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session, Model model, HttpServletRequest request) {
		session.invalidate();
		model.addAttribute("msg","로그아웃 되셨습니다");
		model.addAttribute("url", "index");
		return"alert/alert";
	}
	@RequestMapping(value = "/memberDelete")
	public String memberDelete(HttpSession session, Model model, HttpServletRequest request) {
		String memberid =(String) session.getAttribute("sessionId");
		MemberDao mDao = sqlSession.getMapper(MemberDao.class);
		int result = mDao.memberDeleteDao(memberid);
		  if (memberid == null || memberid.trim().isEmpty()) {
		        model.addAttribute("msg", "회원 ID가 전달되지 않았습니다.");
		        model.addAttribute("url", "orders");
		        return "alert/alert";
		    }
		
		if (result != 1) {
			model.addAttribute("msg","회원탈퇴에 실패 하셨습니다.");
			model.addAttribute("url", "orders");
			return"alert/alert";
		}
		session.invalidate();
		model.addAttribute("msg","탈퇴 되셨습니다");
		model.addAttribute("url", "index");
		return"alert/alert";
	}
}
