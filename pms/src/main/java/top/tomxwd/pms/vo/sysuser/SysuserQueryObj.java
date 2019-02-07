package top.tomxwd.pms.vo.sysuser;

import top.tomxwd.pms.vo.QueryObj;

public class SysuserQueryObj extends QueryObj {
	
	private String searchNameOrNickName = "";

	public SysuserQueryObj() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SysuserQueryObj(Integer begin, Integer size) {
		super(begin, size);
		// TODO Auto-generated constructor stub
	}

	public SysuserQueryObj(String searchNameOrNickName) {
		super();
		this.searchNameOrNickName = searchNameOrNickName;
	}

	@Override
	public String toString() {
		return "SysuserQueryObj [searchNameOrNickName=" + searchNameOrNickName + "]";
	}

	public String getSearchNameOrNickName() {
		return searchNameOrNickName;
	}

	public void setSearchNameOrNickName(String searchNameOrNickName) {
		this.searchNameOrNickName = searchNameOrNickName;
	}
	
}
