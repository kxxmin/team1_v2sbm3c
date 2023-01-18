package dev.mvc.event;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.cate.CateProcInter;
import dev.mvc.cate.CateVO;
import dev.mvc.event.Contents;
import dev.mvc.event.EventVO;
import dev.mvc.tool.Tool;
import dev.mvc.tool.Upload;

@Controller
public class EventCont {
  @Autowired
  @Qualifier("dev.mvc.cate.CateProc") 
  private CateProcInter cateProc;
  
  @Autowired
  @Qualifier("dev.mvc.event.EventProc") 
  private EventProcInter eventProc;
  
  public EventCont () {
    // System.out.println("-> ContentsCont created.");
  }
  
  /**
   * 새로고침 방지, POST -> POST 정보 삭제 -> GET -> msg.jsp
   * @return
   */
  @RequestMapping(value="/event/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();

    mav.setViewName(url); // forward
    
    return mav; // forward
  }
  
  
  // 등록 폼
  // http://localhost:9091/contents/create.do?cateno=1
  @RequestMapping(value="/event/create.do", method = RequestMethod.GET)
  public ModelAndView create(int cateno) {
//  public ModelAndView create(HttpServletRequest request,  int cateno) {
    ModelAndView mav = new ModelAndView();

    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);
//    request.setAttribute("cateVO", cateVO);
    
    // 커뮤니티(공지사항, 게시판, 자료실, 갤러리,  Q/A...)글 등록 
    // mav.setViewName("/contents/create"); // /webapp/WEB-INF/views/contents/create.jsp
    
    // 쇼핑몰의 상품 정보 등록
    mav.setViewName("/event/create"); // /webapp/WEB-INF/views/contents/create_product.jsp
    
    return mav;
  }
  
  /**
   * 등록 처리 http://localhost:9091/contents/create.do
   * 
   * @return
   */
  @RequestMapping(value = "/event/create.do", method = RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
    
    // ------------------------------------------------------------------------------
    // 파일 전송 코드 시작
    // ------------------------------------------------------------------------------
    String evimage_r = "";          // 원본 파일명 image
    String evimage_rsaved = "";   // 저장된 파일명, image
    String evimage_t = "";     // preview image

    // 기준 경로 확인
    String user_dir = System.getProperty("user.dir"); // 시스템 제공
    // System.out.println("-> User dir: " + user_dir);
    //  --> User dir: C:\kd\ws_java\resort_v1sbm3c
    
    // 파일 접근임으로 절대 경로 지정, static 폴더 지정
    // 완성된 경로 C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage
    String upDir =  user_dir + "/src/main/resources/static/event/storage/"; // 절대 경로
    // System.out.println("-> upDir: " + upDir);
    
    // 전송 파일이 없어도 file1MF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택">
    MultipartFile mf = eventVO.getFile1MF();
    
    evimage_r = Tool.getFname(mf.getOriginalFilename()); // 원본 순수 파일명 산출
    System.out.println("-> evimage_r: " + evimage_r);
    
    long evimage_size = mf.getSize();  // 파일 크기
    
    if (evimage_size > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      evimage_rsaved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(evimage_rsaved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 200, height: 150
        evimage_t = Tool.preview(upDir, evimage_rsaved, 200, 150); 
      }
      
    }    
    
    eventVO.setEvimage_r(evimage_r);   // 순수 원본 파일명
    eventVO.setEvimage_rsaved(evimage_rsaved); // 저장된 파일명(파일명 중복 처리)
    eventVO.setEvimage_t(evimage_t);      // 원본이미지 축소판
    eventVO.setEvimage_size(evimage_size);  // 파일 크기
    // ------------------------------------------------------------------------------
    // 파일 전송 코드 종료
    // ------------------------------------------------------------------------------
    
    // Call By Reference: 메모리 공유, Hashcode 전달
    int cnt = this.eventProc.create(eventVO); 
    
    // ------------------------------------------------------------------------------
    // PK의 return
    // ------------------------------------------------------------------------------
    // System.out.println("--> contentsno: " + contentsVO.getContentsno());
    // mav.addObject("contentsno", contentsVO.getContentsno()); // redirect parameter 적용
    // ------------------------------------------------------------------------------
    
    if (cnt == 1) {
        mav.addObject("code", "create_success");
        // cateProc.increaseCnt(contentsVO.getCateno()); // 글수 증가
    } else {
        mav.addObject("code", "create_fail");
    }
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)
    
    // System.out.println("--> cateno: " + contentsVO.getCateno());
    // redirect시에 hidden tag로 보낸것들이 전달이 안됨으로 request에 다시 저장
    mav.addObject("cateno", eventVO.getCateno()); // redirect parameter 적용

    // mav.setViewName("/contents/msg"); // POST -> msg.jsp -> top.do 파일이 호출이안됨
    
    mav.addObject("url", "/event/msg"); // msg.jsp, redirect parameter 적용
    mav.setViewName("redirect:/event/msg.do"); // GET

    return mav; // forward
  }
  
  /**
   * 모든 레코드 목록, http://localhost:9091/contents/list_by_cateno_search_paging.do
   * @return
   */
  /*
   * @RequestMapping(value="/contents/list_by_cateno_search_paging.do",
   * method=RequestMethod.GET) public ModelAndView list_by_cateno(int cateno) {
   * ModelAndView mav = new ModelAndView();
   * 
   * CateVO cateVO = this.cateProc.read(cateno); mav.addObject("cateVO", cateVO);
   * 
   * ArrayList<ContentsVO> list = this.contentsProc.list_by_cateno(cateno);
   * mav.addObject("list", list); // request.setAttribute("list", list);
   * 
   * // System.out.println("-> list size: " + list.size());
   * 
   * mav.setViewName("/contents/list_by_cateno"); //
   * /webapp/WEB-INF/views/contents/list_by_cateno.jsp
   * 
   * return mav; }
   */
  
  /**
   * 조회, http://localhost:9091/contents/read.do?cateno=12&contentsno=1
   * @return
   */
  @RequestMapping(value="/event/read.do", method=RequestMethod.GET)
  public ModelAndView read(int cateno, int evtno) {
    
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);
    
    EventVO eventVO = this.eventProc.read(evtno);
    mav.addObject("eventVO", eventVO);
    
    mav.setViewName("/event/read"); // /webapp/WEB-INF/views/contents/read.jsp
    
    return mav;
  }


  
  /**
   * 검색 레코드 목록, http://localhost:9091/contents/list_by_cateno_search_paging.do
   * @return
   */
//  @RequestMapping(value="/contents/list_by_cateno_search_paging.do", method=RequestMethod.GET)
//  public ModelAndView list_by_cateno_search(int cateno, String word) {
//    ModelAndView mav = new ModelAndView();
//    
//    CateVO cateVO = this.cateProc.read(cateno);
//    mav.addObject("cateVO", cateVO);
//    
//    HashMap<String, Object> hashmap = new HashMap<String, Object>();
//    hashmap.put("cateno", cateno);
//    hashmap.put("word", word);
//    
//    ArrayList<ContentsVO> list = this.contentsProc.list_by_cateno_search(hashmap);
//    mav.addObject("list", list);
//    // request.setAttribute("list", list);
//    
//    // System.out.println("-> list size: " + list.size());
//    
//    mav.setViewName("/contents/list_by_cateno_search"); // /webapp/WEB-INF/views/contents/list_by_cateno.jsp
//    
//    return mav;
//  }
  
  /**
   * 검색 레코드 목록, http://localhost:9091/contents/list_all.do
   * @return
   */
  @RequestMapping(value="/event/list_all.do", method=RequestMethod.GET)
  public ModelAndView list_all() {
    ModelAndView mav = new ModelAndView();
    
    ArrayList<CateEventVO> list = this.eventProc.list_all();
    mav.addObject("list", list);
    
    mav.setViewName("/event/list_all"); // /webapp/WEB-INF/views/contents/list_by_cateno.jsp
    
    return mav;
  }
  
  /**
   * 목록 + 검색 + 페이징 지원
   * http://localhost:9090/contents/list_by_cateno_search_paging.do?cateno=1&word=스위스&now_page=1
   * 
   * @param cateno
   * @param word
   * @param now_page
   * @return
   */
  @RequestMapping(value = "/event/list_by_cateno_search_paging.do", method = RequestMethod.GET)
  public ModelAndView list_by_cateno_search_paging(@RequestParam(value = "cateno", defaultValue = "1") int cateno,
                                                                     @RequestParam(value = "word", defaultValue = "") String word,
                                                                     @RequestParam(value = "now_page", defaultValue = "1") int now_page) {
    // System.out.println("--> now_page: " + now_page);

    ModelAndView mav = new ModelAndView();

    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("cateno", cateno); // #{cateno}
    map.put("word", word); // #{word}
    map.put("now_page", now_page); // 페이지에 출력할 레코드의 범위를 산출하기위해 사용

    // 검색 목록
    ArrayList<EventVO> list = eventProc.list_by_cateno_search_paging(map);
    mav.addObject("list", list);

    // 검색된 레코드 갯수
    int search_count = eventProc.search_count(map);
    mav.addObject("search_count", search_count);

    CateVO cateVO = cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);

    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 현재 페이지: 11 / 22 [이전] 11 12 13 14 15 16 17
     * 18 19 20 [다음]
     * @param cateno 카테고리번호
     * @param search_count 검색(전체) 레코드수
     * @param now_page 현재 페이지
     * @param word 검색어
     * @return 페이징용으로 생성된 HTML/CSS tag 문자열
     */
    String paging = eventProc.pagingBox(cateno, search_count, now_page, word);
    mav.addObject("paging", paging);

    // mav.addObject("now_page", now_page);
    
    mav.setViewName("/event/list_by_cateno_search_paging");  // /contents/list_by_cateno_search_paging.jsp

    return mav;
  }
  
  /**
   * Grid 형태의 화면 구성 http://localhost:9091/contents/list_by_cateno_grid.do
   * 
   * @return
   */
  @RequestMapping(value = "/event/list_by_cateno_grid.do", method = RequestMethod.GET)
  public ModelAndView list_by_cateno_grid(int cateno) {
    ModelAndView mav = new ModelAndView();
    
    CateVO cateVO = this.cateProc.read(cateno);
    mav.addObject("cateVO", cateVO);
    
    ArrayList<EventVO> list = this.eventProc.list_by_cateno(cateno);
    mav.addObject("list", list);

    // 테이블 이미지 기반, /webapp/WEB-INF/views/contents/list_by_cateno_grid.jsp
    mav.setViewName("/event/list_by_cateno_grid");

    return mav; // forward
  }
  
  /**
   * 파일 수정 폼
   * http://localhost:9091/contents/update_file.do?contentsno=1
   * 
   * @return
   */
  @RequestMapping(value = "/event/update_file.do", method = RequestMethod.GET)
  public ModelAndView update_file(int evtno) {
    ModelAndView mav = new ModelAndView();
    
    EventVO eventVO = this.eventProc.read(evtno);
    CateVO cateVO = this.cateProc.read(eventVO.getCateno());
    
    mav.addObject("eventVO", eventVO);
    mav.addObject("cateVO", cateVO);
    
    mav.setViewName("/event/update_file"); // /WEB-INF/views/contents/update_file.jsp

    return mav; // forward
  }
  
  /**
   * 파일 수정 처리 http://localhost:9091/contents/update_file.do
   * 
   * @return
   */
  @RequestMapping(value = "/event/update_file.do", method = RequestMethod.POST)
  public ModelAndView update_file(HttpServletRequest request, EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
    
    // 삭제할 파일 정보를 읽어옴, 기존에 등록된 레코드 저장용
    EventVO eventVO_old = eventProc.read(eventVO.getEvtno());
   
    int cnt=0;
    // -------------------------------------------------------------------
    // 파일 삭제 코드 시작
    // -------------------------------------------------------------------       
    String evimage_rsaved = eventVO_old.getEvimage_rsaved(); // 실제 저장된 파일명
    String evimage_t = eventVO_old.getEvimage_t();       // 실제 저장된 preview 이미지 파일명
    long evimage_size = 0;
    boolean sw = false;
        
    // 완성된 경로 C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage/
    String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/event/storage/"; // 절대 경로

    sw = Tool.deleteFile(upDir, evimage_rsaved);  // Folder에서 1건의 파일 삭제
    sw = Tool.deleteFile(upDir, evimage_t);     // Folder에서 1건의 파일 삭제
    // System.out.println("sw: " + sw);
    // -------------------------------------------------------------------
    // 파일 삭제 종료 시작
    // -------------------------------------------------------------------
        
    // -------------------------------------------------------------------
    // 파일 전송 코드 시작
    // -------------------------------------------------------------------
    String evimage_r = "";          // 원본 파일명 image

    // 완성된 경로 F:/ai8/ws_frame/resort_v1sbm3a/src/main/resources/static/contents/storage/
    // String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/contents/storage/"; // 절대 경로
        
    // 전송 파일이 없어도 fnamesMF 객체가 생성됨.
    // <input type='file' class="form-control" name='file1MF' id='file1MF' 
    //           value='' placeholder="파일 선택">
    MultipartFile mf = eventVO.getFile1MF();
        
    evimage_r = mf.getOriginalFilename(); // 원본 파일명
    evimage_size = mf.getSize();  // 파일 크기
        
    if (evimage_size > 0) { // 파일 크기 체크
      // 파일 저장 후 업로드된 파일명이 리턴됨, spring.jsp, spring_1.jpg...
      evimage_rsaved = Upload.saveFileSpring(mf, upDir); 
      
      if (Tool.isImage(evimage_rsaved)) { // 이미지인지 검사
        // thumb 이미지 생성후 파일명 리턴됨, width: 250, height: 200
        evimage_t = Tool.preview(upDir, evimage_rsaved, 250, 200); 
      }
      
    } else { // 파일이 삭제만 되고 새로 올리지 않는 경우
        evimage_r="";
        evimage_rsaved="";
        evimage_t="";
        evimage_size=0;
    }
        
    eventVO.setEvimage_r(evimage_r);
    eventVO.setEvimage_rsaved(evimage_rsaved);
    eventVO.setEvimage_t(evimage_t);
    eventVO.setEvimage_size(evimage_size);
    // -------------------------------------------------------------------
    // 파일 전송 코드 종료
    // -------------------------------------------------------------------
        
    // Call By Reference: 메모리 공유, Hashcode 전달
    cnt = this.eventProc.update_file(eventVO);
    
    mav.addObject("evtno", eventVO.getEvtno());
    mav.addObject("cateno",eventVO.getCateno());
    mav.setViewName("redirect:/event/read.do"); // request -> param으로 접근 전환
    
    return mav; // forward
  }   
  
  /**
   * 삭제 폼
   * @param contentsno
   * @return
   */
  @RequestMapping(value="/event/delete.do", method=RequestMethod.GET )
  public ModelAndView delete(int evtno) { 
    ModelAndView mav = new  ModelAndView();
    
    // 삭제할 정보를 조회하여 확인
    EventVO eventVO = this.eventProc.read(evtno);
    CateVO cateVO = this.cateProc.read(eventVO.getCateno());
    
    mav.addObject("eventVO", eventVO);
    mav.addObject("cateVO", cateVO);
    
    mav.setViewName("/event/delete");  // contents/delete.jsp
    
    return mav; 
  }

  /**
   * 삭제 처리 http://localhost:9091/contents/delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/event/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(int evtno, String word, @RequestParam(value="now_page", defaultValue = "1")int now_page) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = 0;
    // -------------------------------------------------------------------
    // 파일 삭제 코드 시작
    // -------------------------------------------------------------------
    // 삭제할 파일 정보를 읽어옴.
    EventVO eventVO = eventProc.read(evtno);
    
    String evimage_rsaved = eventVO.getEvimage_rsaved();
    String evimage_t = eventVO.getEvimage_t();
    long evimage_size = 0;
    boolean sw = false;
        
    // 완성된 경로 C:/kd/ws_java/resort_v1sbm3c/src/main/resources/static/contents/storage/
    String upDir =  System.getProperty("user.dir") + "/src/main/resources/static/event/storage/"; // 절대 경로

    sw = Tool.deleteFile(upDir, evimage_rsaved);  // Folder에서 1건의 파일 삭제
    sw = Tool.deleteFile(upDir, evimage_t);     // Folder에서 1건의 파일 삭제
    // -------------------------------------------------------------------
    // 파일 삭제 종료 시작
    // -------------------------------------------------------------------
        
    cnt = this.eventProc.delete(evtno); // DBMS 삭제
       
    // -------------------------------------------------------------------------------------
    // 마지막 페이지의 레코드 삭제시의 페이지 번호 -1 처리
    HashMap<String, Object> page_map = new HashMap<String, Object>();
    page_map.put("cateno", eventVO.getCateno());
    page_map.put("word", word);
    // 10번째 레코드를 삭제후
    // 하나의 페이지가 3개의 레코드로 구성되는 경우 현재 9개의 레코드가 남아 있으면
    // 페이지수를 4 -> 3으로 감소 시켜야함, 마지막 페이지의 마지막 레코드 삭제 시 나머지는 0 발생.
    if (eventProc.search_count(page_map) % Contents.RECORD_PER_PAGE == 0) {
      now_page = now_page - 1;
      if (now_page < 1) {
        now_page = 1; // 시작 페이지
      }
    }
    // -------------------------------------------------------------------------------------
    
    mav.addObject("cateno", eventVO.getCateno());
    mav.addObject("now_page", now_page);
    mav.setViewName("redirect:/event/list_by_cateno_search_paging.do");
    
    return mav; // forward
    }
  
  /**
   * 수정 폼
   * http://localhost:9091/contents/update_text.do?contentsno=1
   * 
   * @return
   */
  @RequestMapping(value = "/event/update_text.do", method = RequestMethod.GET)
  public ModelAndView update_text(int evtno) {
    ModelAndView mav = new ModelAndView();
    
    EventVO eventVO = this.eventProc.read(evtno);
    CateVO cateVO = this.cateProc.read(eventVO.getCateno());

    
    mav.addObject("eventVO", eventVO);
    mav.addObject("cateVO", cateVO);
    
    mav.setViewName("/event/update_text"); // /WEB-INF/views/contents/update_text.jsp
    // String content = "장소:\n인원:\n준비물:\n비용:\n기타:\n";
    // mav.addObject("content", content);

    return mav; // forward
  }
  
  /**
   * 수정 처리
   * http://localhost:9091/contents/update_text.do?contentsno=1
   * 
   * @return
   */
  @RequestMapping(value = "/event/update_text.do", method = RequestMethod.POST)
  public ModelAndView update_text(EventVO eventVO) {
    ModelAndView mav = new ModelAndView();
    
    int cnt = this.eventProc.update_text(eventVO);
    
    mav.addObject("evtno",eventVO.getEvtno());
    mav.addObject("cateno",eventVO.getCateno());
    mav.setViewName("redirect:/event/read.do");
    // mav.setViewName("redirect:/contents/read.do?contentsno="+contentsVO.getContentsno()+"&cateno="+contentsVO.getCateno());

    return mav; // forward
  }
}



