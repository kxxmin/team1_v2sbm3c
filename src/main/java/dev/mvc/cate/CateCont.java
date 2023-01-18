package dev.mvc.cate;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CateCont {
    @Autowired
    @Qualifier("dev.mvc.cate.CateProc")  // @Component("dev.mvc.cate.CateProc")
    private CateProcInter cateProc;

    public CateCont() {
//        System.out.println("-> CateCont created.");
//        System.out.println("-> CateCont" + (cateProc == null));
    }
    
    /**
     * 등록폼 http://localhost:9093/cate/create.do
     * 
     * @return
     */
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.GET)
    public ModelAndView create() {
      
      // System.out.println("-> create()");
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/cate/create"); // /webapp/WEB-INF/views/cate/create.jsp

      return mav;
    }
    
    /**
     * 등록처리
     * CateVO cateVO 객체안의 필드들이 <form> 태그에 존재하면 자동으로 setter 호출됨. 
     * http://localhost:9093/cate/create.do
     * @return
     */
    @RequestMapping(value = "/cate/create.do", method = RequestMethod.POST)
    public ModelAndView create(CateVO cateVO) {
//      System.out.println("-> create(CateVO cateVO)");
//      System.out.println("-> CateCont create post : " + (cateProc == null));
//      CateVO cateVO2 = new CateVO();
//      cateVO2.setName(request.getParameter("name"));
      ModelAndView mav = new ModelAndView();
      int cnt = this.cateProc.create(cateVO);
      if (cnt ==1) {
        mav.addObject("code", "create_success");
      }
      else {
        mav.addObject("code", "create_fail");
      }
      mav.addObject("cnt", cnt);
//      mav.setViewName("/cate/msg"); // /WEB-INF/views/cate/msg.jsp
     
      if(cnt>0) {
        mav.setViewName("redirect:/cate/list_all.do");
      }
      else {
        mav.setViewName("cate/msg");
      }
      return mav;
    }
    
    /**
     * 전체 목록
     * http://localhost:9093/cate/list_all.do 
     * @return
     */
    @RequestMapping(value="/cate/list_all.do", method = RequestMethod.GET)
    public ModelAndView list_all() {
      ModelAndView mav= new ModelAndView();
      
      ArrayList<CateVO> list = this.cateProc.list_all();
      mav.addObject("list", list);
      
      // System.out.println("-> list size : " + list.size());
      mav.setViewName("/cate/list_all");
      return mav;
    }
    
    /**
     * 수정폼
     * http://localhost:9093/cate/read_update.do?cateno=1 
     * @return
     */
    @RequestMapping(value="/cate/read_update.do", method = RequestMethod.GET)
    public ModelAndView read_update(int cateno) {
      // System.out.println("->cateno: " + cateno);
      ModelAndView mav= new ModelAndView();
      
      ArrayList<CateVO> list = this.cateProc.list_all();
      mav.addObject("list", list);
      
      CateVO cateVO= this.cateProc.read(cateno); 
      mav.addObject("cateVO", cateVO);
      
      mav.setViewName("/cate/read_update");
      return mav;
    }
    
    /**
     * 수정처리
     *<FORM name = "frm" method = "POST" action="./read_update.do">
     * http://localhost:9093/cate/read_update.do
     * @return
     */
    @RequestMapping(value = "/cate/read_update.do", method = RequestMethod.POST)
    public ModelAndView read_update(CateVO cateVO) {
      ModelAndView mav = new ModelAndView();
      int cnt = this.cateProc.update(cateVO);
      
      if (cnt ==0) {
        mav.addObject("code", "update_fail");
      }
      
      mav.addObject("cnt", cnt);
//      mav.setViewName("/cate/msg"); // /WEB-INF/views/cate/msg.jsp
     
      if(cnt>0) {
        mav.setViewName("redirect:/cate/list_all.do");
      }
      else {
        mav.setViewName("cate/msg");
      }
      return mav;
    }
    
    /**
     * 삭제폼
     * http://localhost:9093/cate/read_delete.do?cateno=1 
     * @return 
     */
    @RequestMapping(value="/cate/read_delete.do", method = RequestMethod.GET)
    public ModelAndView read_delete(int cateno) {
      // System.out.println("->cateno: " + cateno);
      ModelAndView mav= new ModelAndView();
      
      ArrayList<CateVO> list = this.cateProc.list_all();
      mav.addObject("list", list);
      
      CateVO cateVO= this.cateProc.read(cateno); 
      mav.addObject("cateVO", cateVO);
      
      mav.setViewName("/cate/read_delete");
      return mav;
    }
    
    /**
     * 삭제 처리
     *<FORM name = "frm" method = "POST" action="./read_delete.do">
     * http://localhost:9093/cate/read_update.do
     * @return
     */
    @RequestMapping(value = "/cate/read_delete.do", method = RequestMethod.POST)
    public ModelAndView delete(int cateno) {
      ModelAndView mav = new ModelAndView();
      int cnt = this.cateProc.delete(cateno);
      
      if (cnt ==0) {
        mav.addObject("code", "delete_fail");
      }
      
      mav.addObject("cnt", cnt);
     
      if(cnt>0) {
        mav.setViewName("redirect:/cate/list_all.do");
      }
      else {
        mav.setViewName("cate/msg");
      }
      return mav;
    }
    
    /**
     * 출력 순서 올림(상향, 10등 -> 1등), seqno : 10 -> 1
     *<FORM name = "frm" method = "POST" action="./read_update.do">
     * http://localhost:9093/cate/update_seqno_up.do
     * @return
     */
    @RequestMapping(value = "/cate/update_seqno_up.do", method = RequestMethod.GET)
    public ModelAndView update_seqno_up(int cateno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.cateProc.update_seqno_up(cateno);
      //System.out.println("->cnt : " + cnt);
      
      mav.setViewName("redirect:/cate/list_all.do");
      
      return mav;
    }
    
    /**
     * 출력 순서 내림(하향, 1등 -> 10등), seqno : 1 -> 10
     *<FORM name = "frm" method = "POST" action="./read_update.do">
     * http://localhost:9093/cate/update_seqno_down.do
     * @return
     */
    @RequestMapping(value = "/cate/update_seqno_down.do", method = RequestMethod.GET)
    public ModelAndView update_seqno_down(int cateno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.cateProc.update_seqno_down(cateno);
      //System.out.println("->cnt : " + cnt);
      
      mav.setViewName("redirect:/cate/list_all.do");
      
      return mav;
    }
    
    /**
     * 출력 모드 Y로 변경
     * http://localhost:9093/cate/update_visible_y.do?cateno=1
     */
    @RequestMapping(value = "/cate/update_visible_y.do", method = RequestMethod.GET)
    public ModelAndView update_visible_y(int cateno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.cateProc.update_visible_y(cateno);
      
      mav.setViewName("redirect:/cate/list_all.do");
      
      return mav;
    }
    
    /**
     * 출력 모드 N로 변경
     * http://localhost:9091/cate/update_visible_n.do?cateno=1
     */
    @RequestMapping(value = "/cate/update_visible_n.do", method = RequestMethod.GET)
    public ModelAndView update_visible_n(int cateno) {
      ModelAndView mav = new ModelAndView();
      
      int cnt = this.cateProc.update_visible_n(cateno);
      
      mav.setViewName("redirect:/cate/list_all.do");
      
      return mav;
    }
    
    /**
     * 글 수 증가
     * http://localhost:9093/cate/update_cnt_add.do?cateno=1
     */
    @RequestMapping(value = "/cate/update_cnt_add.do", method = RequestMethod.GET)
    public String update_cnt_add(int cateno) {
      int cnt = this.cateProc.update_cnt_add(cateno);
      return "변경된 글 수 : " + cnt;
    }
    /**
     * 글 수 감소
     * http://localhost:9093/cate/update_cnt_sub.do?cateno=1
     */
    @RequestMapping(value = "/cate/update_cnt_sub.do", method = RequestMethod.GET)
    public String update_cnt_sub(int cateno) {
      int cnt = this.cateProc.update_cnt_sub(cateno);
      return "변경된 글 수 : " + cnt;
    }
}