package com.wjy.common.system.utils;

import java.io.Serializable;
import java.util.List;

/**
 * <p>Title: PageUtils</p>
 * <p>Description: 页面工具类</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2019年2月26日 下午7:10:41</p>
 * @author	XiaShenBao
 * @version 1.0
 */
public class  PageUtils implements Serializable {
	private static final long serialVersionUID = 1L;
	private int total;
	private List<?> rows;

	public PageUtils(List<?> list, int total) {
		this.rows = list;
		this.total = total;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public List<?> getRows() {
		return rows;
	}

	public void setRows(List<?> rows) {
		this.rows = rows;
	}

}
