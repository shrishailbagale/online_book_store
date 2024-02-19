
package com.DAO;

import java.util.List;
import com.entity.BookDtls;

public interface BookDAO
{
    boolean addBook(final BookDtls p0);
    
    List<BookDtls> getAllBooks();
    
    BookDtls getBookById(final int p0);
    
    boolean updateEditBooks(final BookDtls p0);
    
    boolean deleteBook(final int p0);
    
    List<BookDtls> getNewBook();
    
    List<BookDtls> getRecentBook();
    
    List<BookDtls> getOldBook();
    
    List<BookDtls> getAllRecentBook();
    
    List<BookDtls> getAllNewBook();
    
    List<BookDtls> getAllOldBook();
}