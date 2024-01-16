package com.kafka.demo.repositories;
import com.kafka.demo.models.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.elasticsearch.annotations.Query;
import org.springframework.data.elasticsearch.repository.ElasticsearchRepository;
import org.springframework.data.elasticsearch.repository.config.EnableElasticsearchRepositories;

@EnableElasticsearchRepositories()
public interface ProductRepository extends ElasticsearchRepository<Product, Long> {
    @Query("{\"bool\": {\"must\": [{\"match\": {\"productName\": \"?0\"}}, {\"match\": {\"description\": \"?0\"}}]}}")
    Page<Product> findByProductNameAndDescription(String query, Pageable pageable);
}