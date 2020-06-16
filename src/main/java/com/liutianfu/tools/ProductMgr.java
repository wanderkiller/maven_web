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
		
		//��ȡ��Ʒ����ҳ
		public List<Product> getProducts(int pageNo,int pageSize){
			return dao.getProducts(pageNo, pageSize);
		}
		
		//��ȡ��Ʒ��ҳ���õ�������ҳ��
		public int getProducts(List<Product> list,int pageNo,int pageSize){
			return dao.getProducts(list,pageNo,pageSize);
		}
		
		//��Ʒ�Ĳ�ѯ
		public int findProducts(List<Product> list,int []categoryId,
											String keyword,
											double lowNormalPrice,
											double highNormalPrice,
											double lowMemberPrice,
											double highMemberPrice,
											Date startDate,
											Date endDate,
											int pageNo,
											int pageSize){
			return dao.findProducts(list,categoryId, keyword, lowNormalPrice, 
									highNormalPrice, lowMemberPrice, highMemberPrice,
									startDate, endDate,pageNo,pageSize);
		}
		
		public List<Product> findProducts(String name){
			return null;
		}
		//���� id������Ʒ
		public Product loadById(int id){
			return dao.loadById(id);
		}
		//ɾ����Ʒ
		public boolean deleteProductByCategoryId(int categoryId){
			return false;
		}
		
		//���²�Ʒ
		public boolean updateProduct(Product p){
			return false;
		}

		public ProductDAO getDao() {
			return dao;
		}

		public void setDao(ProductDAO dao) {
			this.dao = dao;
		}
		
		public boolean addProduct(Product p){
			return dao.addProduct(p);
		}
}
