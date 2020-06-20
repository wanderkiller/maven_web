package com.liutianfu.tools;

import java.util.Date;
import java.util.List;

import com.liutianfu.tools.dao.ProductDAO;
import com.liutianfu.tools.dao.ProductMySQLDAO;

public class ProductMgr {

		private static ProductMgr pm = null;

		static{
			if(pm == null){
				pm = new ProductMgr();
				pm.setDao(new ProductMySQLDAO());
			}
		}
		private ProductMgr(){}

		public static ProductMgr getInstance(){
			return pm;
		}

		ProductDAO dao = null;

		public List<Product> getProducts(){
			return dao.getProducts();
		}

		public List<Product> getRecentProducts(int count){
			return dao.getRecentProducts(count);
		}

		public List<Product> getProducts(int pageNo,int pageSize){
			return dao.getProducts(pageNo, pageSize);
		}
//
//		public int getProducts(List<Product> list,int pageNo,int pageSize){
//			return dao.getProducts(list,pageNo,pageSize);
//		}
//
		public List<Product> findProducts(String name){
			return null;
		}

		public ProductDAO getDao() {
			return dao;
		}

		public void setDao(ProductDAO dao) {
			this.dao = dao;
		}

}
