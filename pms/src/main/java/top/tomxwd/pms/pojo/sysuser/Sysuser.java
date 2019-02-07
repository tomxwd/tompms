package top.tomxwd.pms.pojo.sysuser;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Sysuser {
    private Integer id;

    private String uname;

    private String nickname;

    private Integer delstatus;

    private String pwd;

    private String phone;

    private String email;

    private String qq;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date regtime;

    private String img;

    private Integer deptId;

    @Override
	public String toString() {
		return "Sysuser [id=" + id + ", uname=" + uname + ", nickname=" + nickname + ", delstatus=" + delstatus
				+ ", pwd=" + pwd + ", phone=" + phone + ", email=" + email + ", qq=" + qq + ", regtime=" + regtime
				+ ", img=" + img + ", deptId=" + deptId + "]";
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public Integer getDelstatus() {
        return delstatus;
    }

    public void setDelstatus(Integer delstatus) {
        this.delstatus = delstatus;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Integer getDeptId() {
        return deptId;
    }

    public void setDeptId(Integer deptId) {
        this.deptId = deptId;
    }
}