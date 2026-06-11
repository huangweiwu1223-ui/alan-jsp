package com.example.demo.mapper;

import com.example.demo.model.Customer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface CustomerMapper {
    @Select("SELECT * FROM customers")
    List<Customer> findAll();

    @Select("SELECT * FROM customers WHERE id = #{id}")
    Customer findById(Long id);
}
