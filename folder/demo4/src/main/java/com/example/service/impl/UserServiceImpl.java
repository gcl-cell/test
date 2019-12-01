package com.example.service.impl;

import com.example.dao.UserDao;
import com.example.entity.User;
import com.example.service.UserService;
import com.example.dao.UserDao;
import com.example.entity.User;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User getUserNameById(String name) {
        return userDao.getUserNameById(name);
    }

    @Override
    public void addUser(User user) {
        userDao.addUser(user);
    }
}
