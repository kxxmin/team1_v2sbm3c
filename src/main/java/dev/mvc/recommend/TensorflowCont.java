package dev.mvc.recommend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TensorflowCont {
  // http://localhost:9091/type2_recommend_clothes/start.do
  @RequestMapping(value = {"/recommend_clothes/start.do"}, method = RequestMethod.GET)
  public ModelAndView start() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recommend_clothes/start");  // /WEB-INF/views/type2_recommend_clothes/start.jsp
    
    return mav;
  }

  // http://localhost:9091/type2_recommend_clothes/form1.do
  @RequestMapping(value = {"/recommend_clothes/form1.do"}, method = RequestMethod.GET)
  public ModelAndView form1() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recommend_clothes/form1");  // /WEB-INF/views/type2_recommend_clothes/form1.jsp
    
    return mav;
  }

  // http://localhost:9091/type2_recommend_clothes/form2.do
  @RequestMapping(value = {"/recommend_clothes/form2.do"}, method = RequestMethod.GET)
  public ModelAndView form2() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recommend_clothes/form2");  // /WEB-INF/views/type2_recommend_clothes/form2.jsp
    
    return mav;
  }

  // http://localhost:9091/type2_recommend_clothes/form3.do
  @RequestMapping(value = {"/recommend_clothes/form3.do"}, method = RequestMethod.GET)
  public ModelAndView form3() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/recommend_clothes/form3");  // /WEB-INF/views/type2_recommend_clothes/form3.jsp
    
    return mav;
  }
  
//http://localhost:9091/type2_recommend_clothes/form3.do
 @RequestMapping(value = {"/recommend_clothes/form4.do"}, method = RequestMethod.GET)
 public ModelAndView form4() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/recommend_clothes/form4");  // /WEB-INF/views/type2_recommend_clothes/form3.jsp
   
   return mav;
 }
 
//http://localhost:9091/type2_recommend_clothes/form3.do
@RequestMapping(value = {"/recommend_clothes/form5.do"}, method = RequestMethod.GET)
public ModelAndView form5() {
  ModelAndView mav = new ModelAndView();
  mav.setViewName("/recommend_clothes/form5");  // /WEB-INF/views/type2_recommend_clothes/form3.jsp
  
  return mav;
}
  
//http://localhost:9091/type2_recommend_clothes/end.do
 @RequestMapping(value = {"/recommend_clothes/end.do"}, method = RequestMethod.GET)
 public ModelAndView end() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/recommend_clothes/end");  // /WEB-INF/views/type2_recommend_clothes/end.jsp
   
   return mav;
 }
    
}