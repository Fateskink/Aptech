package com.aptech.demo.services.product;

import com.aptech.demo.dtos.requests.UpdateProductRequest;
import com.aptech.demo.exceptions.DataNotfoundException;
import org.springframework.stereotype.Service;

public interface ProductService {
    void updateProduct(String productId, UpdateProductRequest productRequest) throws DataNotfoundException;
}
