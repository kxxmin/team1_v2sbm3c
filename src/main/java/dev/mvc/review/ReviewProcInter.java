package dev.mvc.review;

import dev.mvc.review.ReviewVO;

public interface ReviewProcInter {
  /**
   * 등록
   * @param reviewVO
   * @return 등록한 레코드 개수
   */
  public int create(ReviewVO reviewVO);
}
