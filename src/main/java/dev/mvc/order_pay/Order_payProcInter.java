package dev.mvc.order_pay;

import java.util.List;

public interface Order_payProcInter {
  /**
   * 
   * @param order_payVO
   * @return
   */
  public int create(Order_payVO order_payVO);
  
  public List<Order_payVO> list_by_memberno(int memberno);
}