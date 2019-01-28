package top.tomxwd.pms.vo;

import java.util.List;

public class PageObj<T> {
	private Integer page = 1;//当前页
	private Integer total = 0;//总页数
	private Integer size = 10;//一页显示多少条数据
	private Integer records = 0;//总条数
	private List<T> root = null;
	public PageObj() {
		super();
		// TODO Auto-generated constructor stub
	}
	public PageObj(Integer page, Integer total, Integer size, Integer records, List<T> root) {
		super();
		this.page = page;
		this.total = total;
		this.size = size;
		this.records = records;
		this.root = root;
	}
	@Override
	public String toString() {
		return "PageObj [page=" + page + ", total=" + total + ", size=" + size + ", records=" + records + ", root="
				+ root + "]";
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getRecords() {
		return records;
	}
	public void setRecords(Integer records) {
		this.records = records;
	}
	public List<T> getRoot() {
		return root;
	}
	public void setRoot(List<T> root) {
		this.root = root;
	}
}
