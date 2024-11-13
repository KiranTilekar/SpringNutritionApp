package com.yash.nutritionapp.Exception;

public class UserBlockedException extends Exception{

    /**
     * Create user obj without desc
     */
    public UserBlockedException () {

    }

    /**
     * Create user obj with desc
     * @param errDesc
     */
    public UserBlockedException (String errDesc) {
        super(errDesc);
    }
}
