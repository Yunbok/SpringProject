package com.solnamu.yb.controller;

import java.util.ArrayList;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.solnamu.yb.service.*;
import com.solnamu.yb.dto.CourseBean;
import com.solnamu.yb.dto.UserBean;

@Controller
public class AdminController {

	@Autowired
	DebugBoardService boardService;
	@Autowired
	CourseService courseService;
	@Autowired
	UserService userinfoService;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/admin_userinfo.do", method = RequestMethod.GET)
	public String userinfo(Locale locale, Model model) {
		logger.info("admin_userinfo.do call");
		
		ArrayList<UserBean> memberList = userinfoService.getUsersinfo();
		ArrayList<UserBean> memberListAddCourName = new ArrayList<UserBean>();
		for(UserBean data:memberList) {
			data.setCour_name(courseService.getCourName(data.getCode()));
			memberListAddCourName.add(data);
		}
		model.addAttribute("MemberCount", userinfoService.getMembers() );
		model.addAttribute("MemberList", memberListAddCourName );
		
		return "admin/UserInfo";
	}
	
	
	@RequestMapping(value = "/admin_usercheck.do", method = RequestMethod.GET)
	public String usercheck(Locale locale, Model model) {
		logger.info("admin_usercheck.do call");
		ArrayList<UserBean> memberList = userinfoService.getUserCheck();
		ArrayList<UserBean> memberListAddCourName = new ArrayList<UserBean>();
		for(UserBean data:memberList) {
			data.setCour_name(courseService.getCourName(data.getCode()));
			memberListAddCourName.add(data);
		}
		model.addAttribute("MemberCount", userinfoService.getCheckMembers() );
		model.addAttribute("MemberList", memberListAddCourName );
		
		return "admin/UserCheck";
	}
	
	@RequestMapping(value = "/admin_usercheck.do", method = RequestMethod.POST)
	public String Dousercheck(@RequestParam("select") int select  ,@RequestParam("check") String checkids ,Model model) {
		
		String[] ids = checkids.split(",");
		for(String id : ids)
			{
				
				if(select == 0) {
					userinfoService.getCheckIdMove(id);
				}
				userinfoService.getCheckDelete(id); //삭제	
			}

		model.addAttribute("MemberCount", userinfoService.getCheckMembers() );
		model.addAttribute("MemberList", userinfoService.getUserCheck() );
		
		return "redirect:/admin_usercheck.do";
	}
	
	
	@RequestMapping(value = "/admin_userupdate.do", method = RequestMethod.POST)
	public String Douserupdate(@RequestParam("select") int select  ,@RequestParam("check") String checkids ,Model model) {
		
		String[] ids = checkids.split(",");
		
		if(select == 0) {
			for(String id : ids)
			{
				userinfoService.getUpdatepw(id);
			}
		}else if(select == 1) {
			for(String id : ids)
			{
				userinfoService.getUserDelete(id); //삭제	
			}
		}else {
			for(String id : ids)
			{
				userinfoService.getUpdateUserAdmin(id);	
			}
		}
		
		return "redirect:admin_userinfo.do";
	}
	
	@RequestMapping(value = "/admin_course_list.do", method = RequestMethod.GET)
	public String coursesList(Model model) {

		model.addAttribute("CourseList", courseService.getCourses());
		
		return "admin/CourseList";
	}
	
	@RequestMapping(value = "/admin_course_write_form.do", method = RequestMethod.GET)
	public String coursesInsertWrite(Model model) {
		model.addAttribute("WriteCourseBean", new CourseBean());
		return "admin/CourseWriteForm";
	}

	@RequestMapping(value = "/admin_course_insert.do", method = RequestMethod.POST)
	public String coursesInsert(@ModelAttribute("WriteCourseBean")CourseBean courseBean,
			Model model) {
		courseService.insertCourse(courseBean);
		return "redirect:admin_course_list.do";
	}
	
	@RequestMapping(value = "/admin_course_update_form.do", method = RequestMethod.GET)
	public String coursesUpdateWrite(@RequestParam("code")int code, Model model) {
		//model.addAttribute("courseBean", courseService.getCour(code));
		model.addAttribute("updateCourseBean", courseService.getCour(code));
		return "admin/CourseUpdateWrite";
	}
	
	@RequestMapping(value = "/admin_course_update.do", method = RequestMethod.POST)
	public String coursesUpdate(@ModelAttribute("updateCourseBean")CourseBean courseBean, Model model) {
		courseService.updateCourse(courseBean);
		return "redirect:admin_course_list.do";
	}
	
	@RequestMapping(value = "/admin_course_delete.do", method = RequestMethod.GET)
	public String coursesDelete(@RequestParam("code")int code, Model model) {
		courseService.deleteCourse(code);
		return "redirect:admin_course_list.do";
	}
}
