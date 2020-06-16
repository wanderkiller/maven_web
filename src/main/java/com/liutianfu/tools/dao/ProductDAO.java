package com.liutianfu.tools.dao;

import java.util.Date;
import java.util.List;

import com.liutianfu.tools.Product;

public interface ProductDAO {
	public List<Product> getProducts();
	
	public List<Product> getProducts(int pageNo, int pageSize);
	public int findProducts(List<Product> list, int[] categoryId, String keyword,
                            double lowNormalPrice, double highNormalPrice,
                            double lowMemberPrice, double highMemberPrice,
                            Date startDate, Date endDate,
                            int pageNo, int pageSize);

	
	public List<Product> findProducts(String name);
	
	public boolean deleteProductByCategoryId(int categoryId);
	
	public boolean updateProduct(Product p);
	
	public boolean addProduct(Product p);

	public int getProducts(List<Product> list, int pageNo, int pageSize);

	public List<Product> getRecentProducts(int count);

	public Product loadById(int id);


	
	
}
