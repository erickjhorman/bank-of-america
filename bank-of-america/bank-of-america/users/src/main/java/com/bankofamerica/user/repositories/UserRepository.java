package com.bankofamerica.user.repositories;

import com.bankofamerica.user.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("SELECT e FROM User e WHERE e.email = ?1")
    Optional<User> findUserByEmail(String email);

    @Query("SELECT n FROM User n WHERE n.fullName = ?1")
    Optional<User> findUserByFullName(String fullName);

    @Query("SELECT d FROM User d WHERE d.dob = ?1")
    Optional<User> findUserByAge(LocalDate dob);
}
