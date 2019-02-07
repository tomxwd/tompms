package top.tomxwd.pms.vo;

//初始化时候已经将begin-1，所以只要传入正确的currentPage即可
public class QueryObj {
	private Integer begin = 0;
	private Integer size = 10;
	public QueryObj() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QueryObj(Integer begin, Integer size) {
		super();
		this.begin = begin;
		this.size = size;
	}
	@Override
	public String toString() {
		return "QueryObj [begin=" + begin + ", size=" + size + "]";
	}
	public Integer getBegin() {
		return begin;
	}
	public void setBegin(Integer begin) {
		this.begin = begin;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public void init(Integer page, Integer rows) {
		this.begin=(page-1)*rows;
		this.size=rows;
	}
	
	
}
