
package com.DAO;

import com.entity.Book_Order;
import java.util.List;

public interface BookOrderDAO
{
    boolean saveOrder(final List<Book_Order> p0);
    
    List<Book_Order> getBook(final String p0);
    
    List<Book_Order> getAllOrder();
}