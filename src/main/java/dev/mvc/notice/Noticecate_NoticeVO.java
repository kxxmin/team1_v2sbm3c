package dev.mvc.notice;

// SELECT c.noticecateno, c.name, c.cnt,
//           n.noticeno, n.title, n.cnt as notice_cnt, n.rdate, n.file1saved, n.thumb1
// FROM noticecate c, notice n
// WHERE c.noticecateno = n.noticecateno;
public class Noticecate_NoticeVO {
  /** 카테고리 번호 */
  private int noticecateno;
  /** 카테고리 이름 */
  private String name;
  /** 등록된 글 수 */
  private int cnt;
  
  /** 컨텐츠 번호 */
  private int noticeno;
  /** 제목 */
  private String title = "";
  /** 조회수 */
  private int notice_cnt = 0;
  /** 등록 날짜 */
  private String rdate = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";
  /** 메인 이미지 preview */
  private String thumb1 = "";
  public int getNoticecateno() {
    return noticecateno;
  }
  public void setNoticecateno(int noticecateno) {
    this.noticecateno = noticecateno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getNotice_cnt() {
    return notice_cnt;
  }
  public void setNotice_cnt(int notice_cnt) {
    this.notice_cnt = notice_cnt;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getFile1saved() {
    return file1saved;
  }
  public void setFile1saved(String file1saved) {
    this.file1saved = file1saved;
  }
  public String getThumb1() {
    return thumb1;
  }
  public void setThumb1(String thumb1) {
    this.thumb1 = thumb1;
  }

  
}
