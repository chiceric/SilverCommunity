package silver.web.bean;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import silver.include.Paging;
import silver.web.dao.NoticeBoardDAO;
import silver.web.vo.NoticeBoardVO;

public class Notice_list_Control implements Controller{
	//Listener에 의해서 톰켓이 구동될 때 미리 생성해둔 객체들 중 dao라는 겍체는  아래의 변수에 자동저장된다.
		NoticeBoardDAO ntdao;
		
		//페이징 기법에 필요한 변수들
		public static final int Block_LIST=10;
		public static final int Block_PAGE=5;
		
		int nowPage; //현재 페이지 값
		int rowTotal; //총 게시물의 수
		String pageCode; //페이징 처리된 HTML코드


		
		public void setNtdao(NoticeBoardDAO ntdao) {
			this.ntdao = ntdao;
		}

		@Override
		public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception {
			
			//현재 페이지 값 받기
			
			String c_page = request.getParameter("nowPage");
			if(c_page == null)
				nowPage =1;
			else
				nowPage = Integer.parseInt(c_page);

			
			rowTotal =ntdao.getTotalCount();
			//페이징 코드를 만들어내는 객체 생성
			Paging page = new Paging(nowPage, rowTotal, Block_LIST, Block_PAGE);
			pageCode = page.getSb().toString();
			
			//게시물 표현을 위한 begin과 end값
			int begin = page.getBegin();
			int end = page.getEnd();
			if(end>rowTotal)
				end= rowTotal;
			
			//dao를 통해 표현할 목록을 가져오기 위해 map구조를 생성
			Map<String, String> map = 
					new HashMap<>();
			map.put("begin", String.valueOf(begin));
			map.put("end", String.valueOf(end));
			NoticeBoardVO[] ar = ntdao.getList(map);
			
			//jsp에서 표현할 수 있도록 반환객체 생성
			ModelAndView mv =  new ModelAndView();
			mv.addObject("list", ar);
			mv.addObject("nowPage", nowPage);
			mv.addObject("pageCode",pageCode);
			mv.addObject("rowTotal",rowTotal);
			mv.addObject("blockList",Block_LIST);
			
			mv.setViewName("/list_notice");
			
			return mv;
		}
}
