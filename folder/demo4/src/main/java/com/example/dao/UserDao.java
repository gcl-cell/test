package com.example.dao;

import com.example.entity.User;

public interface UserDao {
    User getUserNameById(String name);

    void addUser(User user);
}
