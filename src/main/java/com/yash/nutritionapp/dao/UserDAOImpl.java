package com.yash.nutritionapp.dao;

import com.sun.media.jfxmediaimpl.HostUtils;
import com.yash.nutritionapp.domain.User;
import com.yash.nutritionapp.rm.UserRowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class UserDAOImpl extends BaseDAO implements UserDAO{

    @Override
    public void save(User u) {
        String sql = "INSERT INTO USER(name, email, password, loginName, height, weight, BMI, role)"
                + "VALUES(:name, :email, :password, :loginName, :height, :weight, :BMI, :role)";

        Map m = new HashMap();
        m.put("name", u.getName());
        m.put("email", u.getEmail());
        m.put("password", u.getPassword());
        m.put("loginName", u.getLoginName());
        m.put("height", u.getHeight());
        m.put("weight", u.getWeight());
        m.put("BMI",(u.getWeight()/(u.getHeight() * u.getHeight())));
        m.put("role", u.getRole());

        KeyHolder kh = new GeneratedKeyHolder(); // bind auto-incremented value
        SqlParameterSource ps = new MapSqlParameterSource(m);
        super.getNamedParameterJdbcTemplate().update(sql, ps, kh);
        Integer userId = kh.getKey().intValue();
        u.setUserId(userId);
    }

    @Override
    public void update(User u) {
        String sql = "UPDATE user" +
                " set name=:name," +
                " phone=:phone," +
                " email=:email," +
                " address=:address," +
                " role=:role," +
                " loginStatus=:loginStatus" +
                " where userId=:userId";

        Map m = new HashMap();
        m.put("name", u.getName());
//        m.put("phone", u.getPhone());
        m.put("email", u.getEmail());
//        m.put("address", u.getAddress());
        m.put("role", u.getRole());
//        m.put("loginStatus", u.getLoginStatus());
        m.put("userId", u.getUserId());

        getNamedParameterJdbcTemplate().update(sql, m);
    }

    @Override
    public void delete(User u) {
        this.delete(u.getUserId());
    }

    @Override
    public void delete(Integer userId) {
        String sql = "delete from user where userId=?";
        getJdbcTemplate().update(sql, userId);
    }

    @Override
    public User findById(Integer userId) {
        String sql = "select userId, name, phone, email, address, loginName, role, loginStatus" +
                " from user where userId=?";
        User u = getJdbcTemplate().queryForObject(sql, new UserRowMapper(), userId);
        return u;
    }

    @Override
    public List<User> findAll() {
        String sql = "select userId, name, phone, email, address, loginName, role, loginStatus" +
                " from user where userId";
        List<User> users = getJdbcTemplate().query(sql, new UserRowMapper());
        return users;
    }

    @Override
    public List<User> findByProperty(String propName, Object propValue) {

        System.out.println("propname" + propName);
        System.out.println("propvalue" + propValue);
        String sql = "select userId, name, email, password, loginName, height, weight, BMI, role" +
                " from user where " + propName + "=?";
        return getJdbcTemplate().query(sql, new UserRowMapper(), propValue);
    }
}
