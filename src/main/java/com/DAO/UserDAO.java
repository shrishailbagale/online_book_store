
package com.DAO;

import com.entity.User;

public interface UserDAO
{
    boolean userRegister(final User p0);
    
    User login(final String p0, final String p1);
    
    public boolean checkPassword(final int id, final String ps);
    
    public boolean updateProfile(final User p0);
}