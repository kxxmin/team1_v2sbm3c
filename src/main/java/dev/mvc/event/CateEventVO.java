package dev.mvc.event;

import org.springframework.web.multipart.MultipartFile;

/*
SELECT c.name,
       t.contentsno, t.adminno, t.cateno, t.title, t.content, t.recom, t.cnt, t.replycnt, t.word, t.rdate,
       t.file1, t.file1saved, t.thumb1, t.size1, t.price, t.dc, t.saleprice, t.point, t.salecnt, t.map, t.youtube
FROM cate c, contents t
WHERE c.cateno = t.cateno
ORDER BY t.contentsno ASC;   
 */
public class CateEventVO {
    /** 카테고리 이름 */
    private String name;
    private int evtno;
    private String evtitle;
    private String evdesc;
    private String evdate;
    private String evimage_r="";
    private String evimage_rsaved="";
    private String evimage_t="";
    private String evimage_size="";
    private String evword="";
      /** 카테고리 번호 */
    private int cateno;
    private int adminno;
      /**
       이미지 파일
       <input type='file' class="form-control" name='file1MF' id='file1MF' 
                  value='' placeholder="파일 선택">
       */
      private MultipartFile file1MF;
      
      /** 메인 이미지 크기 단위, 파일 크기 */
      private String size1_label = "";

      public CateEventVO() { // 기본 생성자
          
      }

      public int getEvtno() {
        return evtno;
      }

      public void setEvtno(int evtno) {
        this.evtno = evtno;
      }

      public String getEvtitle() {
        return evtitle;
      }

      public void setEvtitle(String evtitle) {
        this.evtitle = evtitle;
      }

      public String getEvdesc() {
        return evdesc;
      }

      public void setEvdesc(String evdesc) {
        this.evdesc = evdesc;
      }

      public String getEvdate() {
        return evdate;
      }

      public void setEvdate(String evdate) {
        this.evdate = evdate;
      }

      public String getEvimage_r() {
        return evimage_r;
      }

      public void setEvimage_r(String evimage_r) {
        this.evimage_r = evimage_r;
      }

      public String getEvimage_rsaved() {
        return evimage_rsaved;
      }

      public void setEvimage_rsaved(String evimage_rsaved) {
        this.evimage_rsaved = evimage_rsaved;
      }

      public String getEvimage_t() {
        return evimage_t;
      }

      public void setEvimage_t(String evimage_t) {
        this.evimage_t = evimage_t;
      }

      public String getEvimage_size() {
        return evimage_size;
      }

      public void setEvimage_size(String evimage_size) {
        this.evimage_size = evimage_size;
      }

      public String getEvword() {
        return evword;
      }

      public void setEvword(String evword) {
        this.evword = evword;
      }

      public int getCateno() {
        return cateno;
      }

      public void setCateno(int cateno) {
        this.cateno = cateno;
      }

      public int getAdminno() {
        return adminno;
      }

      public void setAdminno(int adminno) {
        this.adminno = adminno;
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

    public void setName(String name) {
      this.name = name;
    }
    
}