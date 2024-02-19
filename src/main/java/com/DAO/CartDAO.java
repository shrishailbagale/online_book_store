
package com.DAO;

import java.util.List;
import com.entity.Cart;

public interface CartDAO
{
    boolean addCart(final Cart p0);
    
    List<Cart> getBookByUser(final int p0);
    
    boolean deleteBook(final int p0, final int p1);
}