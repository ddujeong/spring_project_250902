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
public class NoticeController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/notice")
	public String notice(HttpSession session, Model model, HttpServletRequest request) {
		int pageSize = 10; // 게시판 목록에 한 페이지당 출력될 글 갯수
		int pageNum = 1; // 유저가 클릭한 페이지의 번호-> 현재 보이는 페이지 번호 (단 처음 게시판에 들어왔을때 1페이지를 보여야 하기때문)
		int blockSize = 5; // 페이지 블럭에 표시될 페이지의 수 (<< < 1 , 2 , 3 , 4 , 5 > >>)
		
		
		if (request.getParameter("pageNum") != null) {
			pageNum = Integer.parseInt( request.getParameter("pageNum"));
		}
		
		int startRow = (pageNum * pageSize) - 9; // 페이징 되었을 때 시작할 행의 번호 (1->1 , 2-> 11, 3-> 21)
		// == (pageNum - 1) * pageSize
		int endRow = pageNum * pageSize; // 페이징 되었을 때 행의 끝 번호 (1->10 , 2-> 20, 3-> 30)
		
		NoticeDao nDao = sqlSession.getMapper(NoticeDao.class);
		List<NoticeDto> nDtos = nDao.pageListDao(startRow, endRow);
		int totalPage = (int)Math.ceil((double)nDao.allCountDao() /pageSize);
		int startPage = (((pageNum-1) / blockSize) *blockSize) + 1; 
		int endPage = Math.min(startPage + (blockSize-1),totalPage );
		// int endPage = startPage + (blockSize-1);
		
		model.addAttribute("nDtos",nDtos);
		model.addAttribute("startPage",startPage);
		model.addAttribute("endPage",endPage);
		model.addAttribute("totalPage",totalPage);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("count",nDao.allCountDao());
		
		
		return"notice";
	}
	@RequestMapping(value = "/writeForm")
	public String writeForm(HttpSession session, Model model, HttpServletRequest request) {
		String memberid = (String)session.getAttribute("sessionId");
		
		if (memberid == null) {
			model.addAttribute("msg", "로그인 후 글 작성 가능합니다");
			model.addAttribute("url", "login");
			
			return"alert/alert";
		}
		
		return"writeForm";
	}
	@RequestMapping(value = "/writeOk")
	public String writeOk(HttpSession session, Model model, HttpServletRequest request) {
		String btitle = request.getParameter("btitle");
		String memberid = request.getParameter("memberid");
		String bcontent = request.getParameter("bcontent");
		
		NoticeDao nDao = sqlSession.getMapper(NoticeDao.class);
		int result = nDao.boardWriteDao(btitle, memberid, bcontent);
		
		if (result ==1) {
			model.addAttribute("msg", "글이 성공적으로 작성 되었습니다");
			model.addAttribute("url", "notice");
			
			return"alert/alert";
		} else {
			model.addAttribute("msg", "글 작성 실패. 다시 작성해주세요");
			model.addAttribute("url", "writeForm");
			return"alert/alert";
		}
	}
	@RequestMapping(value = "/contentModify")
	public String contentModify(HttpSession session, Model model, HttpServletRequest request) {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		NoticeDao nDao = sqlSession.getMapper(NoticeDao.class);
		NoticeDto nDto = nDao.contentViewDao(bnum);
		
		model.addAttribute("nDto",nDto);
		
		return"contentModify";
	}
	@RequestMapping(value = "/contentModifyOk")
	public String contentModifyOk(HttpSession session, Model model, HttpServletRequest request) {
		int bnum = Integer.parseInt(request.getParameter("bnum")) ;
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		
		NoticeDao nDao = sqlSession.getMapper(NoticeDao.class);
		int result = nDao.boardModifyDao(btitle, bcontent, bnum);
		
		 
		 if (result == 1) {
			model.addAttribute("msg", "글이 성공적으로 수정 되었습니다");
			model.addAttribute("url", "contentView?bnum=" + bnum);
				
			return"alert/alert";
		} else {
			model.addAttribute("msg", "글 수정 실패. 다시 작성해주세요");
			model.addAttribute("url", "contentView?bnum=" + bnum);
			
			return"alert/alert";
		}
	}
	@RequestMapping(value = "/contentDelete")
	public String contentDelete(HttpSession session, Model model, HttpServletRequest request) {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
		
		NoticeDao nDao = sqlSession.getMapper(NoticeDao.class);
		int result = nDao.boardDeleteDao(bnum);
		
		if (result ==1) {
			model.addAttribute("msg", "글이 삭제 되었습니다");
			model.addAttribute("url", "notice");
			return"alert/alert";
		} else {
			model.addAttribute("msg", "글 삭제 실패하였습니다");
			model.addAttribute("url", "notice");
			return"alert/alert";
		}
	}
	@RequestMapping(value = "/contentView")
	public String contentView(HttpSession session, Model model, HttpServletRequest request) {
		int bnum = Integer.parseInt(request.getParameter("bnum"));
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
		model.addAttribute("commentCount",cDao.allCountDao(bnum));
		
		return"contentView";
	}
	@RequestMapping(value = "/map")
	public String map(HttpSession session, Model model, HttpServletRequest request) {
	
		return"map";
	}
	
	
}
