package com.flipkart.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import com.flipkart.model.flipkartModel;
import com.flipkart.service.FlipkartCustomerService;

@RestController
public class MyController {

	@Autowired
	private FlipkartCustomerService customerService;

	@RequestMapping("/")
	public ModelAndView flipkartPage() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("flipkartPage"); // jsp file name
		return mv;
	}

	@RequestMapping("flipkartLogin")
	public ModelAndView flipkartLogin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("flipkartLogin"); // jsp file name
		return mv;
	}

	@RequestMapping("/submitFlipkartCustomer")
	public ModelAndView submitFlipkartCustomer(@RequestParam("customerId") int customerId,
			@RequestParam("customerName") String customerName, @RequestParam("email") String email,
			@RequestParam("productName") String productName,
			@RequestParam("productOrderedFor") String productOrderedFor) {
		flipkartModel customer = new flipkartModel();
		customer.setCUSTOMER_ID(customerId);
		customer.setCUSTOMER_NAME(customerName);
		customer.setEMAIL(email);
		customer.setPRODUCT_NAME(productName);
		customer.setPRODUCT_ORDERED_FOR(productOrderedFor);

		customerService.saveCustomer(customer);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewAllCustomers"); // Name of the new JSP file to display all customer details
		List<flipkartModel> allCustomers = customerService.getAllCustomers();
		mv.addObject("allCustomers", allCustomers); // Pass the list of customers to the new JSP file
		return mv;
	}

	@RequestMapping("/deleteCustomer")
	public ModelAndView deleteCustomer(@RequestParam("customerId") int customerId) {
		customerService.deleteCustomerById(customerId);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewAllCustomers"); // Name of the JSP file to display all customer details
		List<flipkartModel> allCustomers = customerService.getAllCustomers();
		mv.addObject("allCustomers", allCustomers); // Pass the updated list of customers to the JSP file
		return mv;
	}

	@RequestMapping("/updateCustomer")
	public ModelAndView updateCustomer(@RequestParam("customerId") int customerId,
			@RequestParam("customerName") String customerName, @RequestParam("email") String email,
			@RequestParam("productName") String productName,
			@RequestParam("productOrderedFor") String productOrderedFor) {
		// Retrieve the customer object to update
		flipkartModel customer = customerService.getCustomerById(customerId);

		// Update customer details
		customer.setCUSTOMER_NAME(customerName);
		customer.setEMAIL(email);
		customer.setPRODUCT_NAME(productName);
		customer.setPRODUCT_ORDERED_FOR(productOrderedFor);

		// Save the updated customer
		customerService.saveCustomer(customer);

		// Redirect to view all customers
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewAllCustomers");
		List<flipkartModel> allCustomers = customerService.getAllCustomers();
		mv.addObject("allCustomers", allCustomers);
		return mv;
	}

	@RequestMapping("/downloadCustomerData")
	public void downloadCustomerData(HttpServletResponse response) {
		try {
			byte[] customerData = customerService.downloadCustomerData();

			// Set the content type and headers for the response
			response.setContentType("text/csv");
			response.setHeader("Content-Disposition", "attachment; filename=FLIPKART_CUSTOMER_DATA.csv");

			// Write the BOM character and customer data to the response output stream
			response.getOutputStream().write("\ufeff".getBytes()); // BOM character
			response.getOutputStream().write(customerData);
			response.getOutputStream().flush();
		} catch (Exception e) {
			// Handle exceptions here
		}
	}

	@RequestMapping("/test")
	public ModelAndView test() {
		String testMessage = customerService.testing();
		ModelAndView mv = new ModelAndView();
		mv.setViewName("testPage"); // Name of the JSP file to display the test message
		mv.addObject("message", testMessage);
		return mv;
	}

}
