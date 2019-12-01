package com.example.service;

import com.example.entity.User;

public interface UserService {
    User getUserNameById(String name);

    void addUser(User user);
}
