package dev.mvc.review;

import dev.mvc.review.ReviewVO;

public interface ReviewDAOInter {
  /**
   * 등록
   * @param cateVO
   * @return 등록한 레코드 개수
   */
  public int create(ReviewVO reviewVO);
}
