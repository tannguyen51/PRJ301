/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;

/**
 *
 * @author Administrator
 */
public interface IDAO<T, K> {

    boolean create(T entity);

    List<T> readAll();

    T readbyID(K id);

    boolean update(T entity);

    List<T> search(String searchTerm);
}
