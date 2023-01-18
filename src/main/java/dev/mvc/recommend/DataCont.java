package dev.mvc.recommend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DataCont {
  public DataCont() {
    System.out.println("-> DataCont created.");
  }
   
  /**
   * 영화 추천
   * http://127.0.0.1:8000/recommend_movie/mf_movie?userId=1
   * http://localhost:9091/recommend_movie/mf_movie.do
   * @return
   */
  @RequestMapping(value = "/recommend_clothes/mf_clothes.do", method = RequestMethod.GET)
  public ModelAndView json_list() {
    ModelAndView mav = new ModelAndView();
    
    // /WEB-INF/views/recommend_movie/mf_movie_list.jsp
    mav.setViewName("recommend_clothes/mf_clothes_list");  // /WEB-INF/views/django/json_list.jsp

    return mav;
  }
  
}
