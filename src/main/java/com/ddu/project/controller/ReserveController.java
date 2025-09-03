package com.ddu.project.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddu.project.dao.ReserveDao;
import com.ddu.project.dto.ReserveDto;

@Controller
public class ReserveController {
    
    @Autowired
    private SqlSession sqlSession;
    
    @RequestMapping(value = "/reservation")
    public String reservation(HttpSession session, Model model, HttpServletRequest request) {
        
    	return "reservation";
    }
    
    @RequestMapping(value = "/reserveOk")
    public String reservationOk(HttpSession session, Model model, HttpServletRequest request) {
        String machine = request.getParameter("machine");
        String rdatestr = request.getParameter("rdate");
        String rtimestr = request.getParameter("rtime");
        String memberid = (String) session.getAttribute("sessionId"); // 세션에서 memberid 가져오기

        if (memberid == null) {
            model.addAttribute("msg", "로그인 후 이용 가능합니다");
            model.addAttribute("url", "login");
            return "alert/alert";  // 로그인 페이지로 이동
        }
        // 선택한 날짜와 시간 합치기
        SimpleDateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm");

        try {

            Date rdate = dateFormatter.parse(rdatestr);  // 문자열을 Date로 변환
            Date rtime = timeFormatter.parse(rtimestr);  // 문자열을 Date로 변환

            // 날짜와 시간을 합쳐서 하나의 Date로 설정
            Calendar calendar = Calendar.getInstance();
            calendar.setTime(rdate); // 날짜를 먼저 설정
            Calendar timeCalendar = Calendar.getInstance();
            timeCalendar.setTime(rtime); // 시간을 설정
            calendar.set(Calendar.HOUR_OF_DAY, timeCalendar.get(Calendar.HOUR_OF_DAY));
            calendar.set(Calendar.MINUTE, timeCalendar.get(Calendar.MINUTE));
            calendar.set(Calendar.SECOND, timeCalendar.get(Calendar.SECOND));

            Date rdatetime = calendar.getTime();  // 합쳐진 Date

            // DAO 호출
            ReserveDao rDao = sqlSession.getMapper(ReserveDao.class);
            int checkResult = rDao.reserveCheckDao(machine, rdatetime);

            if (checkResult > 0) { // 이미 예약이 존재하는 경우
                model.addAttribute("msg", "선택하신 날짜와 시간대에 에약이 마감되었습니다.");
                model.addAttribute("url", "reservation");
                
                return "alert/alert";
            } 
     
         int result = rDao.reserveDao(machine, rdatetime, memberid); // 예약 추가
          if (result == 1) {
                model.addAttribute("msg", "예약이 완료되었습니다.");
                model.addAttribute("url", "orders");
            } else {
                model.addAttribute("msg", "예약 실패");
                model.addAttribute("url", "reservation");
            }

        } catch (Exception e) {
            model.addAttribute("msg", "입력한 날짜와 시간 형식이 잘못되었습니다.");
            model.addAttribute("url", "reservation");
            e.printStackTrace();
        }

        return "alert/alert";
    }

    @RequestMapping(value = "/reserveDelete")
    public String reserveDelete(HttpSession session, Model model, HttpServletRequest request) {
        int rid = Integer.parseInt(request.getParameter("rid"));
        
        ReserveDao rDao = sqlSession.getMapper(ReserveDao.class);
        int result = rDao.reserveDeleteDao(rid);
        
        if (result == 1) {
        	model.addAttribute("msg", "예약이 취소되었습니다.");
            model.addAttribute("url", "orders");
            
            return "alert/alert";
		}else {
            model.addAttribute("msg", "취소 실패");
            model.addAttribute("url", "orders");
            return "alert/alert";
        }
    	
    }
    @RequestMapping(value = "/orders")
    public String orders(HttpSession session, Model model, HttpServletRequest request) {
        String memberid = (String) session.getAttribute("sessionId");

        if (memberid == null) {
            model.addAttribute("msg", "로그인 후 예약 내역을 확인할 수 있습니다.");
            model.addAttribute("url", "login");
            return "alert/alert";
        }

        ReserveDao rDao = sqlSession.getMapper(ReserveDao.class);
        List<ReserveDto> rDtos = rDao.reserveListDao(memberid);
        
        Date currentTime = new Date();
        List<ReserveDto> filteredDtos = new ArrayList(); 
        
        for (ReserveDto rDto : rDtos) {
        	String status = rDto.getStatus();
        	
        	Date reservedTime = rDto.getRdatetime();
        	
			if (currentTime.after( reservedTime)) {
				rDto.setStatus("진행중");
				if (currentTime.after(reservedTime) && "진행중".equals(rDto.getStatus())) {
		            long timeDiff = currentTime.getTime() - reservedTime.getTime(); // 밀리초 차이
		            long twoHoursInMillis = 2 * 60 * 60 * 1000;  // 2시간을 밀리초로 변환
		            
		            if (timeDiff > twoHoursInMillis) {
		                rDto.setStatus("세탁완료");
		            }
		        }
			} else if (currentTime.before(reservedTime)) {
				rDto.setStatus("예약완료");
			} 
	        filteredDtos.add(rDto);
        
        }

        model.addAttribute("rDtos",filteredDtos);
        return "orders";
    }
}
