package netflix_engine.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import netflix_engine.model.Customer;
import netflix_engine.model.FuegoOrder;

public interface CustomerMapper {
	public Customer getCustomerById(@Param("email") String email);
	public List<FuegoOrder> getCustomerOrders(@Param("email") String email);
}
