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
import com.ddu.project.dto.CommentDto;
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
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		CommentDao cDao = sqlSession.getMapper(CommentDao.class);
		int result = cDao.commentDeleteDao(cnum);
		
		
		if (result == 1) {
			model.addAttribute("bnum",bnum);
			model.addAttribute("msg","댓글이 삭제 되었습니다");
			model.addAttribute("url","contentView?bnum=" + bnum);
		}else {
	        model.addAttribute("msg", "댓글 삭제 실패");
	        model.addAttribute("url", "contentView?bnum=" + bnum);  // 실패 시에도 게시글로 돌아감
	    }
		
		return"alert/alert";
	}
	@RequestMapping(value = "/commentModify")
	public String commentModify(HttpSession session, Model model, HttpServletRequest request) {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		 System.out.println("게시글 번호: " + bnum); // bnum 값 출력해서 확인
		 
		NoticeDao nDao = sqlSession.getMapper(NoticeDao.class);
		CommentDao cDao = sqlSession.getMapper(CommentDao.class);
		nDao.upBhitDao(bnum);
		NoticeDto nDto = nDao.contentViewDao(bnum);
		List<CommentDto> cDtos = cDao.commentListDao(bnum);
		for (CommentDto commentDto : cDtos) {
			System.out.println(commentDto.getCtext());
		}
		System.out.println("댓글 개수: " + cDtos.size());  
		
		model.addAttribute("nDto",nDto);
		model.addAttribute("cDtos",cDtos);
		model.addAttribute("bnum",bnum);
		model.addAttribute("cnum",cnum);
		
		return"commentModify";
		
		
	}
	@RequestMapping(value = "/commentModifyOk")
	public String commentModifyOk(HttpSession session, Model model, HttpServletRequest request) {
		String ctext = request.getParameter("ctext");
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		CommentDao cDao = sqlSession.getMapper(CommentDao.class);
		int result = cDao.commentModifyDao(ctext, cnum);
		
		if (result == 1) {
			model.addAttribute("bnum",bnum);
			model.addAttribute("cnum",cnum);
			model.addAttribute("msg","댓글이 수정 되었습니다");
			model.addAttribute("url","contentView?bnum=" + bnum);
		}else {
	        model.addAttribute("msg", "댓글 수정 실패");
	        model.addAttribute("url", "contentView?bnum=" + bnum);  // 실패 시에도 게시글로 돌아감
	    }
		
		return"alert/alert";
		
		
	}
}