package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.User;
import java.util.List;

public interface UserDAO {

    void registerUser(User user);

    User findByEmail(String email);

    List<User> findAll();
}
