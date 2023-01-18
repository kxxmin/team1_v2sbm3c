package dev.mvc.event;

import java.util.ArrayList;
import java.util.HashMap;

public interface EventDAOInter {
  /**
   * 등록
   * @param contentsVO
   * @return 등록된 갯수
   */
  public int create(EventVO eventVO);
  
  /**
   * 특정 카테고리의 등록된 글목록
   * <select id="list_by_cateno" resultType="dev.mvc.contents.ContentsVO" parameterType="int">
   * @return
   */
  public ArrayList<EventVO> list_by_cateno(int cateno);
  
  /**
   * 조회
   * @param contentsno 조회할 레코드 번호(PK) 
   * @return 조회된 레코드
   */
  public EventVO read(int evtno);
  
  /**
   * 검색 
   * @param hashMap 검색어
   * @return 검색된 레코드 목록
   */
  public ArrayList<EventVO> list_by_cateno_search(HashMap<String, Object> hashMap);

  
  /**
   * cate + contents INNER JOIN
   * <select id="list_all" resultType="dev.mvc.contents.CateContentsVO">
   */
  public ArrayList<CateEventVO> list_all();
  
  /**
   * 검색 + 페이징 목록
   * @param map
   * @return
   */
  public ArrayList<EventVO> list_by_cateno_search_paging(HashMap<String, Object> map);
  

  /** 
   * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
   * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
   *
   * @param cateno          카테고리번호 
   * @param search_count  검색(전체) 레코드수 
   * @param now_page      현재 페이지
   * @param word 검색어
   * @return 페이징 생성 문자열
   */ 
  public String pagingBox(int cateno, int search_count, int now_page, String evword);
  
  /**
   * 검색된 레코드 수
   * @param hashMap 검색어
   * @return 검색된 레코드 수
   */
  public int search_count(HashMap hashMap);
  
  /**
   * 파일 정보 수정
   * @param contentsVO
   * @return 처리된 레코드 갯수
   */
  public int update_text(EventVO eventVO);
  
  /**
   * 파일 정보 수정
   * @param contentsVO
   * @return 처리된 레코드 갯수
   */
  public int update_file(EventVO eventVO);
  
  /**
   * 삭제
   * @param contentsno
   * @return 삭제된 레코드 갯수
   */
  public int delete(int contentsno);
}
