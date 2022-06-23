package com.bankofamerica.user.services;

import com.bankofamerica.user.model.User;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class UserServices {
        public List<User> getUsers(){
            return List.of(
                    new User( "Adekola Farouq",
                            "adekolafarouq@gmail.com",
                            "22, Kano road, Akure Ondo state nigeria",
                            23,
                            LocalDate.of(2006, 2, 1),
                            12000)
            );
        }
}
