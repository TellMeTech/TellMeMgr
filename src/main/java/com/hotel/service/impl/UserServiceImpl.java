package com.hotel.service.impl;

import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.common.ReturnResult;
import com.hotel.common.shiro.ShiroUsernamePasswordToken;
import com.hotel.dao.UserMapper;
import com.hotel.model.User;
import com.hotel.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	@Override
	public int deleteUser(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(id);
	}


	@Override
	public ReturnResult<User> login(String loginName, String passwd,boolean rememberMe)
			throws Exception {

		Subject subject = SecurityUtils.getSubject();
		ReturnResult<User> res = new ReturnResult<User>();
		try {
			User u = userMapper.getUserByName(loginName);
			if (null == u) {
				res.setCode(ReturnResult.FAILURE);
				res.setMessage("用户[" + loginName + "]不存在！");
			} else {
				ShiroUsernamePasswordToken token  = new ShiroUsernamePasswordToken(loginName, passwd, u.getPsd(), u.getSalt(),null);
				token.setRememberMe(rememberMe);
				subject.login(token);
				if (subject.isAuthenticated()) {
					res.setCode(ReturnResult.SUCCESS);
					res.setMessage("登录成功！");
					res.setResultObject(u);
				} else {
					res.setCode(ReturnResult.FAILURE);
					res.setMessage("登录失败，密码错误。");
				}
			}
		} catch (ExcessiveAttemptsException ex) {
			res.setCode(ReturnResult.FAILURE);
			res.setMessage("登录失败，未知错误。");
		} catch (AuthenticationException ex) {
			res.setCode(ReturnResult.FAILURE);
			res.setMessage("登录失败，密码错误。");
		}
		return res;
	}


	@Override
	public int saveUser(User record) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public int updateUser(User record) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public User getUserById(Integer id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<User> getUsers(User record) {
		// TODO Auto-generated method stub
		return userMapper.getUsers(record);
	}

	@Override
	public int countUsers(User record) {
		// TODO Auto-generated method stub
		return userMapper.countUsers(record);
	}
}
