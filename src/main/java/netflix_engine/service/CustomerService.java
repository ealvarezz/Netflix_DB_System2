package netflix_engine.service;

import java.util.List;
import netflix_engine.model.Customer;

public interface CustomerService {
   List<Customer> returnMailingList();

   List<Customer> getAllCustomers();
}
