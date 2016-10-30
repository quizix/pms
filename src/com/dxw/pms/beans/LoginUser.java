package com.dxw.pms.beans;

import com.dxw.pms.models.User;

public class LoginUser {
	private Result result;

    private User user;

    public LoginUser(Result result, User user){
    	this.result = result;
    	this.user = user;
    }
    
    public Result getResult() {
        return result;
    }

    public void setResult(Result result) {
        this.result = result;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
