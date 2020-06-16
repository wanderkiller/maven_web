package com.liutianfu.tools;

public class CartItem {//���ﳵ�����ÿһ��
	int productid;//��Ʒid
	int count;//���������
	double price;//�۸�
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public double getTotalPrice(){
		return price*count;
	}
}
