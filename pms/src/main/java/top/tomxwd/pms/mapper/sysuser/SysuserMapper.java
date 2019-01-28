package top.tomxwd.pms.mapper.sysuser;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.DeleteProvider;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.InsertProvider;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.annotations.UpdateProvider;
import org.apache.ibatis.type.JdbcType;

import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.pojo.sysuser.SysuserExample;
import top.tomxwd.pms.vo.PageObj;

public interface SysuserMapper {

	/**
	 * 用户列表
	 * @param record
	 * @return
	 */
	@Select("select id,uname,nickname,delstatus,phone,email,qq,regtime from t_sysuser limit #{page},#{size}")
	List<Sysuser> sysuserList(PageObj<Sysuser> pageObj);
	
    @SelectProvider(type=SysuserSqlProvider.class, method="countByExample")
    long countByExample(SysuserExample example);

    @DeleteProvider(type=SysuserSqlProvider.class, method="deleteByExample")
    int deleteByExample(SysuserExample example);

    @Delete({
        "delete from t_sysuser",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int deleteByPrimaryKey(Integer id);

    @Insert({
        "insert into t_sysuser (id, uname, ",
        "nickname, delstatus, ",
        "pwd, phone, email, ",
        "qq, regtime, img, ",
        "dept_id)",
        "values (#{id,jdbcType=INTEGER}, #{uname,jdbcType=VARCHAR}, ",
        "#{nickname,jdbcType=VARCHAR}, #{delstatus,jdbcType=INTEGER}, ",
        "#{pwd,jdbcType=VARCHAR}, #{phone,jdbcType=VARCHAR}, #{email,jdbcType=VARCHAR}, ",
        "#{qq,jdbcType=VARCHAR}, #{regtime,jdbcType=DATE}, #{img,jdbcType=VARCHAR}, ",
        "#{deptId,jdbcType=INTEGER})"
    })
    int insert(Sysuser record);

    @InsertProvider(type=SysuserSqlProvider.class, method="insertSelective")
    int insertSelective(Sysuser record);

    @SelectProvider(type=SysuserSqlProvider.class, method="selectByExample")
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="uname", property="uname", jdbcType=JdbcType.VARCHAR),
        @Result(column="nickname", property="nickname", jdbcType=JdbcType.VARCHAR),
        @Result(column="delstatus", property="delstatus", jdbcType=JdbcType.INTEGER),
        @Result(column="pwd", property="pwd", jdbcType=JdbcType.VARCHAR),
        @Result(column="phone", property="phone", jdbcType=JdbcType.VARCHAR),
        @Result(column="email", property="email", jdbcType=JdbcType.VARCHAR),
        @Result(column="qq", property="qq", jdbcType=JdbcType.VARCHAR),
        @Result(column="regtime", property="regtime", jdbcType=JdbcType.DATE),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="dept_id", property="deptId", jdbcType=JdbcType.INTEGER)
    })
    List<Sysuser> selectByExample(SysuserExample example);

    @Select({
        "select",
        "id, uname, nickname, delstatus, pwd, phone, email, qq, regtime, img, dept_id",
        "from t_sysuser",
        "where id = #{id,jdbcType=INTEGER}"
    })
    @Results({
        @Result(column="id", property="id", jdbcType=JdbcType.INTEGER, id=true),
        @Result(column="uname", property="uname", jdbcType=JdbcType.VARCHAR),
        @Result(column="nickname", property="nickname", jdbcType=JdbcType.VARCHAR),
        @Result(column="delstatus", property="delstatus", jdbcType=JdbcType.INTEGER),
        @Result(column="pwd", property="pwd", jdbcType=JdbcType.VARCHAR),
        @Result(column="phone", property="phone", jdbcType=JdbcType.VARCHAR),
        @Result(column="email", property="email", jdbcType=JdbcType.VARCHAR),
        @Result(column="qq", property="qq", jdbcType=JdbcType.VARCHAR),
        @Result(column="regtime", property="regtime", jdbcType=JdbcType.DATE),
        @Result(column="img", property="img", jdbcType=JdbcType.VARCHAR),
        @Result(column="dept_id", property="deptId", jdbcType=JdbcType.INTEGER)
    })
    Sysuser selectByPrimaryKey(Integer id);

    @UpdateProvider(type=SysuserSqlProvider.class, method="updateByExampleSelective")
    int updateByExampleSelective(@Param("record") Sysuser record, @Param("example") SysuserExample example);

    @UpdateProvider(type=SysuserSqlProvider.class, method="updateByExample")
    int updateByExample(@Param("record") Sysuser record, @Param("example") SysuserExample example);

    @UpdateProvider(type=SysuserSqlProvider.class, method="updateByPrimaryKeySelective")
    int updateByPrimaryKeySelective(Sysuser record);

    @Update({
        "update t_sysuser",
        "set uname = #{uname,jdbcType=VARCHAR},",
          "nickname = #{nickname,jdbcType=VARCHAR},",
          "delstatus = #{delstatus,jdbcType=INTEGER},",
          "pwd = #{pwd,jdbcType=VARCHAR},",
          "phone = #{phone,jdbcType=VARCHAR},",
          "email = #{email,jdbcType=VARCHAR},",
          "qq = #{qq,jdbcType=VARCHAR},",
          "regtime = #{regtime,jdbcType=DATE},",
          "img = #{img,jdbcType=VARCHAR},",
          "dept_id = #{deptId,jdbcType=INTEGER}",
        "where id = #{id,jdbcType=INTEGER}"
    })
    int updateByPrimaryKey(Sysuser record);
}