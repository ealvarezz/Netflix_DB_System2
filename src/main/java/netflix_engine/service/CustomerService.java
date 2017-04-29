package netflix_engine.service;

import java.util.List;
import netflix_engine.model.Customer;
import netflix_engine.model.FuegoOrder;

public interface CustomerService {
	Customer getCustomerById(String email);
	List<FuegoOrder> getOrdersByEmail(String email);
}
