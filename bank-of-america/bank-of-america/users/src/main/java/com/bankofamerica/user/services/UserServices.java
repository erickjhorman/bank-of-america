package com.bankofamerica.user.services;

import com.bankofamerica.user.model.User;
import com.bankofamerica.user.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;
import java.util.Optional;

@Service
public class UserServices {
    private final UserRepository userRepository;

    @Autowired
    public UserServices(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getUsers(){
            return userRepository.findAll();
        }

    public void addNewUser(User user) {
        Optional<User> userByEmail = userRepository.findUserByEmail(user.getEmail());
        Optional<User> userByFullName = userRepository.findUserByFullName(user.getFullName());
        Optional<User> userByAge = userRepository.findUserByAge(user.getDob());

        if(userByEmail.isPresent() && userByFullName.isPresent() && userByAge.isPresent()){
            throw new IllegalStateException("User already exists");
        }
        userRepository.save(user);
    }

    public void deleteUserAccount(int userId){
        if(!userRepository.existsById(userId)){
            throw new IllegalStateException("User with Id "+ userId + " doesn't exists");
        }else
            userRepository.deleteById(userId);
    }

    @Transactional
    public void updateUser(){

    }
}
