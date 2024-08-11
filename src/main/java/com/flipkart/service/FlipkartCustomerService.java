package com.flipkart.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.flipkart.model.flipkartModel;
import com.flipkart.repository.flipkartRepository;

@Service
public class FlipkartCustomerService {

	@Autowired
	private flipkartRepository customerRepository;

	public void saveCustomer(flipkartModel customer) {
		customerRepository.save(customer);
	}

	public List<flipkartModel> getAllCustomers() {
		return customerRepository.findAll();
	}

	public void deleteCustomerById(int customerId) {
		customerRepository.deleteById(customerId);
	}

	public flipkartModel getCustomerById(int customerId) {
		return customerRepository.findById(customerId).orElse(null);
	}

	public byte[] downloadCustomerData() {
		List<flipkartModel> customers = customerRepository.findAll();
		String csvData = convertCustomersToCsv(customers);
		return csvData.getBytes();
	}

	private String convertCustomersToCsv(List<flipkartModel> customers) {
		int maxIdLength = 10;
		int maxNameLength = 20;
		int maxEmailLength = 30;
		int maxProductNameLength = 20;
		int maxProductOrderedForLength = 30;

		for (flipkartModel customer : customers) {
			maxIdLength = Math.max(maxIdLength, String.valueOf(customer.getId()).length());
			maxNameLength = Math.max(maxNameLength, customer.getName().length());
			maxEmailLength = Math.max(maxEmailLength, customer.getEmail().length());
			maxProductNameLength = Math.max(maxProductNameLength, customer.getPRODUCT_NAME().length());
			maxProductOrderedForLength = Math.max(maxProductOrderedForLength,
					customer.getPRODUCT_ORDERED_FOR().length());
		}

		StringBuilder csvBuilder = new StringBuilder();
		csvBuilder.append("\ufeff");

		csvBuilder.append(String.format(
				"%-" + maxIdLength + "s, %-" + maxNameLength + "s, %-" + maxEmailLength + "s, %-" + maxProductNameLength
						+ "s, %-" + maxProductOrderedForLength + "s\n",
				"ID", "Name", "Email", "Product Name", "Product Ordered For"));

		for (flipkartModel customer : customers) {
			csvBuilder.append(String.format(
					"%-" + maxIdLength + "s, %-" + maxNameLength + "s, %-" + maxEmailLength + "s, %-"
							+ maxProductNameLength + "s, %-" + maxProductOrderedForLength + "s\n",
					customer.getId(), customer.getName(), customer.getEmail(), customer.getPRODUCT_NAME(),
					customer.getPRODUCT_ORDERED_FOR()));
		}

		return csvBuilder.toString();
	}

	public String testing() {
		String testMessage = "This is a test message";
		return testMessage;
	}
	

}
