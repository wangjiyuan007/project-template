package com.wjy.common.system.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import lombok.Data;

/**
 * <p>Title: PageDO</p>
 * <p>Description: 分页类</p>
 * <p>Company: www.wjy.com.cn</p>
 * <p>Date: 2018年10月24日 下午7:15:33</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Data
public class PageDO<T> {
	
	private int offset;
	private int limit;
	private int total;
	private Map<String, Object> params;
	private String param;
	private List<T> rows;

	public PageDO() {
		super();
		this.offset = 0;
		this.limit = 10;
		this.total = 1;
		this.params = new HashMap<>();
		this.param = "";
		this.rows = new ArrayList<>();
	}
}