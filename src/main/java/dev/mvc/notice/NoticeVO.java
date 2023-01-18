package dev.mvc.notice;

import org.springframework.web.multipart.MultipartFile;

//CREATE TABLE NOTICE(
//    NOTICENO                          NUMBER(10)     NOT NULL    PRIMARY KEY,
//    ADMINNO                           NUMBER(10)     NOT NULL,
//    NOTICECATENO                      NUMBER(10)     NULL ,
//    TITLE                             VARCHAR2(300)    NOT NULL,
//    CONTENT                           CLOB         NOT NULL,
//    CNT                               NUMBER(7)    NOT NULL,
//    PASSWD                            VARCHAR2(15)     NOT NULL,
//    WORD                              VARCHAR2(300)    NULL ,
//    RDATE                             DATE     NOT NULL,
//    FILE1                             VARCHAR2(100)    NULL ,
//    FILE1SAVED                        VARCHAR2(100)    NULL ,
//    THUMB1                            VARCHAR2(100)    NULL ,
//    SIZE1                             NUMBER(10)     NULL ,
//  FOREIGN KEY (NOTICECATENO) REFERENCES NOTICECATE (NOTICECATENO),
//  FOREIGN KEY (ADMINNO) REFERENCES ADMIN (ADMINNO)
//);
public class NoticeVO {
  /** 컨텐츠 번호 */
  private int noticeno;
  /** 관리자 번호 */
  private int adminno;
  /** 카테고리 번호 */
  private int noticecateno;
  /** 제목 */
  private String title = "";
  /** 내용 */
  private String content = "";
  /** 조회수 */
  private int cnt = 0;
  /** 패스워드 */
  private String passwd = "";
  /** 검색어 */
  private String word = "";
  /** 등록 날짜 */
  private String rdate = "";

  /** 메인 이미지 */
  private String file1 = "";
  /** 실제 저장된 메인 이미지 */
  private String file1saved = "";
  /** 메인 이미지 preview */
  private String thumb1 = "";
  /** 메인 이미지 크기 */
  private long size1;

  /**
   이미지 파일
   <input type='file' class="form-control" name='file1MF' id='file1MF' 
              value='' placeholder="파일 선택">
   */
  private MultipartFile file1MF;
  
  /** 메인 이미지 크기 단위, 파일 크기 */
  private String size1_label = "";

  public int getNoticeno() {
    return noticeno;
  }

  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }

  public int getAdminno() {
    return adminno;
  }

  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }

  public int getNoticecateno() {
    return noticecateno;
  }

  public void setNoticecateno(int noticecateno) {
    this.noticecateno = noticecateno;
  }

  public String getTitle() {
    return title;
  }

  public void setTitle(String title) {
    this.title = title;
  }

  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }

  public int getCnt() {
    return cnt;
  }

  public void setCnt(int cnt) {
    this.cnt = cnt;
  }

  public String getPasswd() {
    return passwd;
  }

  public void setPasswd(String passwd) {
    this.passwd = passwd;
  }

  public String getWord() {
    return word;
  }

  public void setWord(String word) {
    this.word = word;
  }

  public String getRdate() {
    return rdate;
  }

  public void setRdate(String rdate) {
    this.rdate = rdate;
  }

  public String getFile1() {
    return file1;
  }

  public void setFile1(String file1) {
    this.file1 = file1;
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

  public long getSize1() {
    return size1;
  }

  public void setSize1(long size1) {
    this.size1 = size1;
  }

  public MultipartFile getFile1MF() {
    return file1MF;
  }

  public void setFile1MF(MultipartFile file1mf) {
    file1MF = file1mf;
  }

  public String getSize1_label() {
    return size1_label;
  }

  public void setSize1_label(String size1_label) {
    this.size1_label = size1_label;
  }

  
  
}

