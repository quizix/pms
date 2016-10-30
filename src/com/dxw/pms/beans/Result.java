package com.dxw.pms.beans;

public class Result {
	private String errorMessage;

    private int errorCode;

    public Result(int errorCode, String errorMessage){
    	this.errorCode = errorCode;
    	this.errorMessage = errorMessage;
    }
    
    public String getErrorMessage() {
        return errorMessage;
    }

    public void setErrorMessage(String errorMessage) {
        this.errorMessage = errorMessage;
    }

    public void setErrorCode(int errorCode) {
        this.errorCode = errorCode;
    }

    public int getErrorCode(){
        return this.errorCode;
    }
}
