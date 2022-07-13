package edu.kh.podo.common.interceptor;

import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import edu.kh.podo.board.category.model.service.CategoryService;
import edu.kh.podo.board.category.model.vo.LargeCategory;
import edu.kh.podo.board.category.model.vo.MiddleCategory;

public class CategoryInterceptor implements HandlerInterceptor {
	
	@Autowired
	private CategoryService service;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		ServletContext application = request.getServletContext();
		
		List<LargeCategory> LCategoryList = service.selectLCategory();
		List<MiddleCategory> MCategoryList = service.selectMCategory();
		
		application.setAttribute("LCategoryList", LCategoryList);
		application.setAttribute("MCategoryList", MCategoryList);
		
		return HandlerInterceptor.super.preHandle(request, response, handler);
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HandlerInterceptor.super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		HandlerInterceptor.super.afterCompletion(request, response, handler, ex);
	}
	
	

}
