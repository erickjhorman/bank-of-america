package com.bankofamerica.user.controller;

import com.bankofamerica.user.model.User;
import com.bankofamerica.user.services.UserServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path="/")
public class UserControllers {
    private final UserServices USER_SERVICES;

    @Autowired
    public UserControllers(UserServices user_services) {
        this.USER_SERVICES = user_services;
    }

    @GetMapping
    public List<User> getUsers(){
        return USER_SERVICES.getUsers();
    }

    @PostMapping
    public void registerNewUser(@RequestBody User user){
        USER_SERVICES.addNewUser(user);
    }

    @DeleteMapping(path = "{userId}")
    public void deleteUser(@PathVariable("userId") int userId){
        USER_SERVICES.deleteUserAccount(userId);
    }

    @PostMapping(path = "{userId}/changename")
    public void updateUser(){

    }


}
