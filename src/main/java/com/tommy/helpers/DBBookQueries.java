package com.tommy.helpers;

import com.tommy.models.Book;

public class DBBookQueries {
    public static String getWebUserByUsernameAndPassword(String username, String password) {
        return String.format("select * from WebUser where uid='%s' and password='%s'", username, password);
    }
    
    public static String getBooks() {
        return "select * from Books order by id DESC";
    }
    
    public static String getCategoryName() {
        return "select name from Categories";
    }
    
    public static String insertData(Book b) {
    	return String.format("INSERT INTO Books(Title,Author,Price,Released,Quantity,ImageUrl,Description,CategoryId)"
    			+ " VALUES ('%s','%s','%s','%s','%d','%s','%s',%d)"
                , b.getTitle()
                , b.getAuthor()
                , b.getPrice()
                , b.getReleased()
                , b.getQuantity()
                , b.getImageUrl()
                , b.getDescription()
                , b.getCateId()
    			);
    }
}
