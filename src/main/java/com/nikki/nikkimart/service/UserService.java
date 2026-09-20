package com.nikki.nikkimart.service;

import com.nikki.nikkimart.dao.UserDAO;
import com.nikki.nikkimart.model.User;
import com.nikki.nikkimart.util.PasswordUtil;

public class UserService {

    private final UserDAO userDAO;

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public boolean register(String name,
                            String email,
                            String password) {

        return register(name, email, password, "BUYER");
    }

    public boolean register(String name,
                            String email,
                            String password,
                            String role) {

        if (name == null || name.isBlank()) {
            return false;
        }

        if (email == null || email.isBlank()) {
            return false;
        }

        if (password == null || password.length() < 6) {
            return false;
        }

        if (!"BUYER".equals(role) &&
                !"SELLER".equals(role)) {

            return false;
        }

        email = email.trim().toLowerCase();

        if (userDAO.findByEmail(email) != null) {
            return false;
        }

        String hashedPassword =
                PasswordUtil.hashPassword(password);

        User user = new User(
                0,
                name.trim(),
                email,
                hashedPassword,
                role
        );

        userDAO.registerUser(user);

        return true;
    }

    public User login(String email, String password) {

        User user = userDAO.findByEmail(email);

        if (user != null &&
                PasswordUtil.checkPassword(
                        password,
                        user.getPasswordHash())) {

            return user;
        }

        return null;
    }
}