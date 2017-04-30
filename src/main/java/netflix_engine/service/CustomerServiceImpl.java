package netflix_engine.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import netflix_engine.mappers.CustomerMapper;
import netflix_engine.model.Customer;
import netflix_engine.model.FuegoOrder;
import netflix_engine.model.Movie;

@Service("customerService")
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerMapper customerMapper;
    
    public Customer getCustomerById(String email) {
		
		return customerMapper.getCustomerById(email);
	}

	public List<FuegoOrder> getOrdersByEmail(String email) {
		
		System.out.println("NOW WERE CALLING THE SERVICE METHOD!");
		return customerMapper.getCustomerOrders(email);
	}

	public List<Movie> getCustomerWishList(Integer id) {
		
		return customerMapper.getWishList(id);
	}


}
