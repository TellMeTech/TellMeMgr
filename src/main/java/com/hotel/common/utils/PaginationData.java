package com.hotel.common.utils;

import com.hotel.common.BaseConstants;
import com.hotel.common.BaseObject;
import java.util.List;

public class PaginationData extends BaseObject
{
  private static final long serialVersionUID = 3803928734424285900L;
  private int total;
  private List<?> rows;
  private int pageNo = 1;

  private int pageSize = BaseConstants.PAGE_SIZE.intValue();

  private int pageCount = 1;
  private String sort;
  private String order;

  public int getTotal()
  {
    return this.total;
  }
  public PaginationData() {
  }

  public PaginationData(int total, int pageNo) {
    this.total = (total < 0 ? 0 : total);
    this.pageNo = (pageNo > this.pageCount ? this.pageCount : pageNo < 1 ? 1 : pageNo);
    setPageCount();
  }

  public PaginationData(int total, int pageNo, int pageSize) {
    this.total = (total < 0 ? 0 : total);
    this.pageNo = (pageNo > this.pageCount ? this.pageCount : pageNo < 1 ? 1 : pageNo);
    this.pageSize = (pageSize < 1 ? BaseConstants.PAGE_SIZE.intValue() : pageSize);
    setPageCount();
  }

  public void setTotal(int total) {
    this.total = (total < 0 ? 0 : total);
    setPageCount();
  }

  private void setPageCount() {
    if (this.total > 0)
      this.pageCount = ((int)Math.ceil(this.total / this.pageSize));
  }

  public List<?> getRows()
  {
    return this.rows;
  }

  public void setRows(List<?> rows) {
    this.rows = rows;
  }

  public int getPageNo() {
    return this.pageNo > this.pageCount ? this.pageCount : this.pageNo < 1 ? 1 : this.pageNo;
  }

  public void setPageNo(int pageNo) {
    this.pageNo = pageNo;
  }

  public int getPageSize() {
    return this.pageSize;
  }

  public void setPageSize(int pageSize) {
    if (this.pageSize == pageSize) return;
    this.pageSize = (pageSize < 1 ? BaseConstants.PAGE_SIZE.intValue() : pageSize);
    setPageCount();
  }

  public int getPageCount() {
    return this.pageCount;
  }

  public int getStartIndex() {
    return (this.pageNo - 1) * this.pageSize;
  }

  public int getEndIndex() {
    return this.pageNo * this.pageSize;
  }

  public boolean hasNextPage() {
    return this.pageNo < this.pageCount;
  }

  public boolean hasPreviousPage() {
    return this.pageNo > 1;
  }

  public String getSort() {
    return this.sort;
  }

  public void setSort(String sort) {
    this.sort = sort;
  }

  public String getOrder() {
    return this.order;
  }

  public void setOrder(String order) {
    this.order = order;
  }
}