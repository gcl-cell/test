package com.example.controller;

import com.example.entity.User;
import com.example.util.ResponseServer;
import com.example.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.Date;
@RestController
@RequestMapping("/users")
public class UserController {
    @Autowired
    private UserService userService;


    @GetMapping("/user")
    @CrossOrigin(maxAge = 3600, origins = "http://localhost:8083")
    public ResponseServer queryUserList(User user) {
        user.setCreateTime(new Date());
        userService.addUser(user);
        return ResponseServer.success();
    }
}
