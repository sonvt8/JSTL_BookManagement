package com.tommy.helpers;


public class DBWorldQueries {
    public static String getWebUserByUsernameAndPassword(String username, String password) {
        return String.format("select * from WebUser where uid='%s' and password='%s'", username, password);
    }
}
