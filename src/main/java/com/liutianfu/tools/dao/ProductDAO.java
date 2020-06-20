package com.liutianfu.tools.dao;

import java.util.List;

import com.liutianfu.tools.Product;

public interface ProductDAO {
	List<Product> getProducts();

	List<Product> getProducts(int pageNo, int pageSize);

	List<Product> getRecentProducts(int count);

}
