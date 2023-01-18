package dev.mvc.noticecate;

/*
CREATE TABLE NOTICECATE(
    NOTICECATENO                NUMBER(10)     NOT NULL    PRIMARY KEY,
    NAME                        VARCHAR2(30)     NOT NULL,
    CNT                         NUMBER(7)    NOT NULL,
    RDATE                       DATE     NOT NULL,
    UDATE                       DATE     NULL ,
    SEQNO                       NUMBER(5)    DEFAULT 0     NOT NULL,
    VISIBLE                     CHAR(1)    DEFAULT 'N'     NOT NULL
);
 */
public class NoticecateVO {
  /** 카테고리 번호 */
  private int noticecateno;
  /** 카테고리 이름 */
  private String name;
  /** 등록된 글 수 */
  private int cnt;
  /** 등록일 */
  private String rdate;
  /** 변경일 */
  private String udate;
  /** 출력 순서, 기본값 0 */
  private int seqno;
  /** 출력 모드, 기본값 null */
  private String visible;
  
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
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getUdate() {
    return udate;
  }
  public void setUdate(String udate) {
    this.udate = udate;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  
}


