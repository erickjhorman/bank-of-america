package com.bankofamerica.user.model;
import lombok.*;
import java.time.LocalDate;


@Data
public class User {
    private int id;
    private double INITIAL_DEPOSITE;

    public User(String fullName, String email, String address,
                int age, LocalDate accountDateCreated, double INITIAL_DEPOSITE) {
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.age = age;
        this.accountDateCreated = accountDateCreated;
        this.balance = INITIAL_DEPOSITE;
    }

    private String fullName;
    private String email;
    private String address;
    private int age;
    private LocalDate accountDateCreated;
    private double balance;




}
