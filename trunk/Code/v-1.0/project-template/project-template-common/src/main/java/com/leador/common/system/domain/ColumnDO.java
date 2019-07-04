package com.leador.common.system.domain;

import lombok.Data;

/**
 * <p>Title: ColumnDO</p>
 * <p>Description: 列的属性类</p>
 * <p>Company: www.leador.com.cn</p> 
 * <p>Date: 2018年10月24日 下午7:13:26</p>
 * @author	XiaShenBao
 * @version 1.0
 */
@Data
public class ColumnDO {
	// 列名
	private String columnName;
	// 列名类型
	private String dataType;
	// 列名备注
	private String comments;
	// 属性名称(第一个字母大写)，如：user_name => UserName
	private String attrName;
	// 属性名称(第一个字母小写)，如：user_name => userName
	private String attrname;
	// 属性类型
	private String attrType;
	// auto_increment
	private String extra;
	
	public String getAttrname() {
		return attrname;
	}

	public void setAttrname(String attrname) {
		this.attrname = attrname;
	}

	public String getAttrName() {
		return attrName;
	}

	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}
	
}