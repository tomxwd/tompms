package top.tomxwd.pms.mapper.sysuser;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.jdbc.SQL;

import top.tomxwd.pms.pojo.sysuser.Sysuser;
import top.tomxwd.pms.pojo.sysuser.SysuserExample;
import top.tomxwd.pms.pojo.sysuser.SysuserExample.Criteria;
import top.tomxwd.pms.pojo.sysuser.SysuserExample.Criterion;

public class SysuserSqlProvider {

    public String countByExample(SysuserExample example) {
        SQL sql = new SQL();
        sql.SELECT("count(*)").FROM("t_sysuser");
        applyWhere(sql, example, false);
        return sql.toString();
    }

    public String deleteByExample(SysuserExample example) {
        SQL sql = new SQL();
        sql.DELETE_FROM("t_sysuser");
        applyWhere(sql, example, false);
        return sql.toString();
    }

    public String insertSelective(Sysuser record) {
        SQL sql = new SQL();
        sql.INSERT_INTO("t_sysuser");
        
        if (record.getId() != null) {
            sql.VALUES("id", "#{id,jdbcType=INTEGER}");
        }
        
        if (record.getUname() != null) {
            sql.VALUES("uname", "#{uname,jdbcType=VARCHAR}");
        }
        
        if (record.getNickname() != null) {
            sql.VALUES("nickname", "#{nickname,jdbcType=VARCHAR}");
        }
        
        if (record.getDelstatus() != null) {
            sql.VALUES("delstatus", "#{delstatus,jdbcType=INTEGER}");
        }
        
        if (record.getPwd() != null) {
            sql.VALUES("pwd", "#{pwd,jdbcType=VARCHAR}");
        }
        
        if (record.getPhone() != null) {
            sql.VALUES("phone", "#{phone,jdbcType=VARCHAR}");
        }
        
        if (record.getEmail() != null) {
            sql.VALUES("email", "#{email,jdbcType=VARCHAR}");
        }
        
        if (record.getQq() != null) {
            sql.VALUES("qq", "#{qq,jdbcType=VARCHAR}");
        }
        
        if (record.getRegtime() != null) {
            sql.VALUES("regtime", "#{regtime,jdbcType=DATE}");
        }
        
        if (record.getImg() != null) {
            sql.VALUES("img", "#{img,jdbcType=VARCHAR}");
        }
        
        if (record.getDeptId() != null) {
            sql.VALUES("dept_id", "#{deptId,jdbcType=INTEGER}");
        }
        
        return sql.toString();
    }

    public String selectByExample(SysuserExample example) {
        SQL sql = new SQL();
        if (example != null && example.isDistinct()) {
            sql.SELECT_DISTINCT("id");
        } else {
            sql.SELECT("id");
        }
        sql.SELECT("uname");
        sql.SELECT("nickname");
        sql.SELECT("delstatus");
        sql.SELECT("pwd");
        sql.SELECT("phone");
        sql.SELECT("email");
        sql.SELECT("qq");
        sql.SELECT("regtime");
        sql.SELECT("img");
        sql.SELECT("dept_id");
        sql.FROM("t_sysuser");
        applyWhere(sql, example, false);
        
        if (example != null && example.getOrderByClause() != null) {
            sql.ORDER_BY(example.getOrderByClause());
        }
        
        return sql.toString();
    }

    public String updateByExampleSelective(Map<String, Object> parameter) {
        Sysuser record = (Sysuser) parameter.get("record");
        SysuserExample example = (SysuserExample) parameter.get("example");
        
        SQL sql = new SQL();
        sql.UPDATE("t_sysuser");
        
        if (record.getId() != null) {
            sql.SET("id = #{record.id,jdbcType=INTEGER}");
        }
        
        if (record.getUname() != null) {
            sql.SET("uname = #{record.uname,jdbcType=VARCHAR}");
        }
        
        if (record.getNickname() != null) {
            sql.SET("nickname = #{record.nickname,jdbcType=VARCHAR}");
        }
        
        if (record.getDelstatus() != null) {
            sql.SET("delstatus = #{record.delstatus,jdbcType=INTEGER}");
        }
        
        if (record.getPwd() != null) {
            sql.SET("pwd = #{record.pwd,jdbcType=VARCHAR}");
        }
        
        if (record.getPhone() != null) {
            sql.SET("phone = #{record.phone,jdbcType=VARCHAR}");
        }
        
        if (record.getEmail() != null) {
            sql.SET("email = #{record.email,jdbcType=VARCHAR}");
        }
        
        if (record.getQq() != null) {
            sql.SET("qq = #{record.qq,jdbcType=VARCHAR}");
        }
        
        if (record.getRegtime() != null) {
            sql.SET("regtime = #{record.regtime,jdbcType=DATE}");
        }
        
        if (record.getImg() != null) {
            sql.SET("img = #{record.img,jdbcType=VARCHAR}");
        }
        
        if (record.getDeptId() != null) {
            sql.SET("dept_id = #{record.deptId,jdbcType=INTEGER}");
        }
        
        applyWhere(sql, example, true);
        return sql.toString();
    }

    public String updateByExample(Map<String, Object> parameter) {
        SQL sql = new SQL();
        sql.UPDATE("t_sysuser");
        
        sql.SET("id = #{record.id,jdbcType=INTEGER}");
        sql.SET("uname = #{record.uname,jdbcType=VARCHAR}");
        sql.SET("nickname = #{record.nickname,jdbcType=VARCHAR}");
        sql.SET("delstatus = #{record.delstatus,jdbcType=INTEGER}");
        sql.SET("pwd = #{record.pwd,jdbcType=VARCHAR}");
        sql.SET("phone = #{record.phone,jdbcType=VARCHAR}");
        sql.SET("email = #{record.email,jdbcType=VARCHAR}");
        sql.SET("qq = #{record.qq,jdbcType=VARCHAR}");
        sql.SET("regtime = #{record.regtime,jdbcType=DATE}");
        sql.SET("img = #{record.img,jdbcType=VARCHAR}");
        sql.SET("dept_id = #{record.deptId,jdbcType=INTEGER}");
        
        SysuserExample example = (SysuserExample) parameter.get("example");
        applyWhere(sql, example, true);
        return sql.toString();
    }

    public String updateByPrimaryKeySelective(Sysuser record) {
        SQL sql = new SQL();
        sql.UPDATE("t_sysuser");
        
        if (record.getUname() != null) {
            sql.SET("uname = #{uname,jdbcType=VARCHAR}");
        }
        
        if (record.getNickname() != null) {
            sql.SET("nickname = #{nickname,jdbcType=VARCHAR}");
        }
        
        if (record.getDelstatus() != null) {
            sql.SET("delstatus = #{delstatus,jdbcType=INTEGER}");
        }
        
        if (record.getPwd() != null) {
            sql.SET("pwd = #{pwd,jdbcType=VARCHAR}");
        }
        
        if (record.getPhone() != null) {
            sql.SET("phone = #{phone,jdbcType=VARCHAR}");
        }
        
        if (record.getEmail() != null) {
            sql.SET("email = #{email,jdbcType=VARCHAR}");
        }
        
        if (record.getQq() != null) {
            sql.SET("qq = #{qq,jdbcType=VARCHAR}");
        }
        
        if (record.getRegtime() != null) {
            sql.SET("regtime = #{regtime,jdbcType=DATE}");
        }
        
        if (record.getImg() != null) {
            sql.SET("img = #{img,jdbcType=VARCHAR}");
        }
        
        if (record.getDeptId() != null) {
            sql.SET("dept_id = #{deptId,jdbcType=INTEGER}");
        }
        
        sql.WHERE("id = #{id,jdbcType=INTEGER}");
        
        return sql.toString();
    }

    protected void applyWhere(SQL sql, SysuserExample example, boolean includeExamplePhrase) {
        if (example == null) {
            return;
        }
        
        String parmPhrase1;
        String parmPhrase1_th;
        String parmPhrase2;
        String parmPhrase2_th;
        String parmPhrase3;
        String parmPhrase3_th;
        if (includeExamplePhrase) {
            parmPhrase1 = "%s #{example.oredCriteria[%d].allCriteria[%d].value}";
            parmPhrase1_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
            parmPhrase2 = "%s #{example.oredCriteria[%d].allCriteria[%d].value} and #{example.oredCriteria[%d].criteria[%d].secondValue}";
            parmPhrase2_th = "%s #{example.oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{example.oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
            parmPhrase3 = "#{example.oredCriteria[%d].allCriteria[%d].value[%d]}";
            parmPhrase3_th = "#{example.oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
        } else {
            parmPhrase1 = "%s #{oredCriteria[%d].allCriteria[%d].value}";
            parmPhrase1_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s}";
            parmPhrase2 = "%s #{oredCriteria[%d].allCriteria[%d].value} and #{oredCriteria[%d].criteria[%d].secondValue}";
            parmPhrase2_th = "%s #{oredCriteria[%d].allCriteria[%d].value,typeHandler=%s} and #{oredCriteria[%d].criteria[%d].secondValue,typeHandler=%s}";
            parmPhrase3 = "#{oredCriteria[%d].allCriteria[%d].value[%d]}";
            parmPhrase3_th = "#{oredCriteria[%d].allCriteria[%d].value[%d],typeHandler=%s}";
        }
        
        StringBuilder sb = new StringBuilder();
        List<Criteria> oredCriteria = example.getOredCriteria();
        boolean firstCriteria = true;
        for (int i = 0; i < oredCriteria.size(); i++) {
            Criteria criteria = oredCriteria.get(i);
            if (criteria.isValid()) {
                if (firstCriteria) {
                    firstCriteria = false;
                } else {
                    sb.append(" or ");
                }
                
                sb.append('(');
                List<Criterion> criterions = criteria.getAllCriteria();
                boolean firstCriterion = true;
                for (int j = 0; j < criterions.size(); j++) {
                    Criterion criterion = criterions.get(j);
                    if (firstCriterion) {
                        firstCriterion = false;
                    } else {
                        sb.append(" and ");
                    }
                    
                    if (criterion.isNoValue()) {
                        sb.append(criterion.getCondition());
                    } else if (criterion.isSingleValue()) {
                        if (criterion.getTypeHandler() == null) {
                            sb.append(String.format(parmPhrase1, criterion.getCondition(), i, j));
                        } else {
                            sb.append(String.format(parmPhrase1_th, criterion.getCondition(), i, j,criterion.getTypeHandler()));
                        }
                    } else if (criterion.isBetweenValue()) {
                        if (criterion.getTypeHandler() == null) {
                            sb.append(String.format(parmPhrase2, criterion.getCondition(), i, j, i, j));
                        } else {
                            sb.append(String.format(parmPhrase2_th, criterion.getCondition(), i, j, criterion.getTypeHandler(), i, j, criterion.getTypeHandler()));
                        }
                    } else if (criterion.isListValue()) {
                        sb.append(criterion.getCondition());
                        sb.append(" (");
                        List<?> listItems = (List<?>) criterion.getValue();
                        boolean comma = false;
                        for (int k = 0; k < listItems.size(); k++) {
                            if (comma) {
                                sb.append(", ");
                            } else {
                                comma = true;
                            }
                            if (criterion.getTypeHandler() == null) {
                                sb.append(String.format(parmPhrase3, i, j, k));
                            } else {
                                sb.append(String.format(parmPhrase3_th, i, j, k, criterion.getTypeHandler()));
                            }
                        }
                        sb.append(')');
                    }
                }
                sb.append(')');
            }
        }
        
        if (sb.length() > 0) {
            sql.WHERE(sb.toString());
        }
    }
}