package dev.mvc.review;
/*
 * CREATE TABLE REVIEW(
    REVIEWNO NUMERIC(10) NOT NULL PRIMARY KEY,
    TITLE VARCHAR(300) NOT NULL,
    REVIEWCONTENT VARCHAR(2000) NOT NULL,
    PRODUCTNO NUMERIC(10) NOT NULL,
    MEMBERNO NUMERIC(10) NOT NULL,
    LIKE VARCHAR(10) NOT NULL,
    LIKENO NUMERIC(10) NOT NULL,
    COMMENTCNT NUMERIC(10) NOT NULL,
    COMMENTNO NUMERIC(10) NOT NULL,
    WORD VARCHAR(300) NOT NULL,
    RDATE DATE NOT NULL,
    FILE1 VARCHAR(100) NOT NULL,
    SIZE1 NUMERIC(10) NOT NULL,
  FOREIGN KEY (PRODUCTNO) REFERENCES PRODUCT (PRODUCTNO)
);
 */
public class ReviewVO {
  /** 상품후기번호 */
  private int reviewno;  
  /** 상품후기제목 */
  private String title;
  /** 상품후기내용 */
  private int reviewcontent;
  /** 상품번호 */
  private int contentsno;
  /** 회원번호 */
  private int memberno;
  /** 좋아요 */
  private String likes;
  /** 좋아요수 */
  private int likesno; 
  /** 댓글수 */
  private int commentcnt;
  /** 댓글번호 */
  private int commentno;
  /** 검색어 */
  private String word;
  /** 등록일 */
  private String rdate;
  /** 메인이미지 */
  private String file1;
  /** 메인이미지크기 */
  private int size1;
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public int getReviewcontent() {
    return reviewcontent;
  }
  public void setReviewcontent(int reviewcontent) {
    this.reviewcontent = reviewcontent;
  }
  public int getContentsno() {
    return contentsno;
  }
  public void setContentsno(int contentsno) {
    this.contentsno = contentsno;
  }
  public int getMemberno() {
    return memberno;
  }
  public void setMemberno(int memberno) {
    this.memberno = memberno;
  }
  public String getLikes() {
    return likes;
  }
  public void setLikes(String likes) {
    this.likes = likes;
  }
  public int getLikesno() {
    return likesno;
  }
  public void setLikesno(int likesno) {
    this.likesno = likesno;
  }
  public int getCommentcnt() {
    return commentcnt;
  }
  public void setCommentcnt(int commentcnt) {
    this.commentcnt = commentcnt;
  }
  public int getCommentno() {
    return commentno;
  }
  public void setCommentno(int commentno) {
    this.commentno = commentno;
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
  public int getSize1() {
    return size1;
  }
  public void setSize1(int size1) {
    this.size1 = size1;
  }
  
  
  @Override
  public String toString() {
    return "ReviewVO [reviewno=" + reviewno + ", title=" + title + ", reviewcontent=" + reviewcontent + ", contentsno="
        + contentsno + ", memberno=" + memberno + ", likes=" + likes + ", likesno=" + likesno + ", commentcnt="
        + commentcnt + ", commentno=" + commentno + ", word=" + word + ", rdate=" + rdate + ", file1=" + file1
        + ", size1=" + size1 + "]";
  }
  
  
}
