package com.bankofamerica.user.model;
import lombok.*;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.Period;


@Data
@Entity
@Table
public class User {
    public User(String fullName, String email, String address,
                LocalDate dob, LocalDate accountDateCreated, double INITIAL_DEPOSITE) {
        this.fullName = fullName;
        this.email = email;
        this.address = address;
        this.dob = dob;
        this.accountDateCreated = accountDateCreated;
        this.balance = INITIAL_DEPOSITE;
    }

    public User() {
    }
    @Id
    @SequenceGenerator(
            name = "user_sequence",
            sequenceName = "user_sequence",
            allocationSize = 1
    )
    @GeneratedValue(
            strategy = GenerationType.SEQUENCE,
            generator = "user_sequence"
    )
    private int id;
    private double INITIAL_DEPOSITE;
    private String fullName;
    private String email;
    private String address;
    @Transient
    private int age;
    private LocalDate accountDateCreated;
    private LocalDate dob   ;
    private double balance;

    public Integer getAge(){
        return Period.between(this.dob, LocalDate.now()).getYears();
    }



}
