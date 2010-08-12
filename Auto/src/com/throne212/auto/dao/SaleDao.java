package com.throne212.auto.dao;

import java.util.List;

import com.throne212.auto.domain.Brand;
import com.throne212.auto.domain.Car;
import com.throne212.auto.domain.Sale;
import com.throne212.auto.domain.Special;

public interface SaleDao extends BaseDao {

	public List<Sale> getSaleList(int first, int max);

	public long getSaleListCount();

	
	public List<Car> getSaleCarList(int first, int max);
	public long getSaleCarListCount();
	public List<Car> getSaleCarList(Sale sale,int first, int max);
	public List<Car> getSaleCarList(Sale sale,Brand brand,int first, int max);
	public long getSaleCarListCount(Sale sale);
	
	
	public List<Special> getSaleSpecialList(int first, int max);
	public long getSaleSpecialListCount();
	public List<Special> getSaleSpecialList(Sale sale,int first, int max);
	public long getSaleSpecialListCount(Sale sale);
}
