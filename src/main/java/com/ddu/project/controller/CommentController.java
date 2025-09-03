package com.ddu.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddu.project.dao.CommentDao;
import com.ddu.project.dao.NoticeDao;
import com.ddu.project.dto.NoticeDto;

@Controller
public class CommentController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/commentOk")
	public String commentOk(HttpSession session, Model model, HttpServletRequest request) {
		String ctext = request.getParameter("ctext");
		String memberid = (String)session.getAttribute("sessionId");
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		CommentDao cDao = sqlSession.getMapper(CommentDao.class);
		int result = cDao.commentWriteDao(ctext, memberid, bnum);
		
		if (result ==1) {
			model.addAttribute("msg","댓글 작성 완료");
			model.addAttribute("url","contentView?bnum=" + bnum);
			System.out.println("bnum from request: " + bnum);
		}
		return"alert/alert";
	}
	@RequestMapping(value = "/commentDelete")
	public String commentDelete(HttpSession session, Model model, HttpServletRequest request) {
		String ctext = request.getParameter("ctext");
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		
		CommentDao cDao = sqlSession.getMapper(CommentDao.class);
		int result = cDao.commentDeleteDao(cnum);
		
		if (result == 1) {
			model.addAttribute("msg","댓글이 삭제 되었습니다");
			model.addAttribute("msg","contentView?bnum=" + bnum");
		}
		
		return"commentDelete";
	}
	@RequestMapping(value = "/commentModify")
	public String commentModify(HttpSession session, Model model, HttpServletRequest request) {
		
		return"commentModify";
	}
}