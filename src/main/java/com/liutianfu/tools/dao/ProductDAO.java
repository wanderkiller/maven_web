package com.liutianfu.tools.dao;

import java.util.Date;
import java.util.List;

import com.liutianfu.tools.Product;

public interface ProductDAO {
	public List<Product> getProducts();

	public List<Product> getProducts(int pageNo, int pageSize);
//	public int findProducts(List<Product> list, int[] categoryId, String keyword,
//                            double lowNormalPrice, double highNormalPrice,
//                            double lowMemberPrice, double highMemberPrice,
//                            Date startDate, Date endDate,
//                            int pageNo, int pageSize);

	public int getProducts(List<Product> list, int pageNo, int pageSize);

	public List<Product> getRecentProducts(int count);

}
