package com.nikki.nikkimart.dao;

import com.nikki.nikkimart.model.User;

public interface UserDAO {

    void registerUser(User user);

    User findByEmail(String email);
}
