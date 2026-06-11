package com.example.demo.mapper;

import com.example.demo.model.Policy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import java.util.List;

@Mapper
public interface PolicyMapper {
    @Select("SELECT * FROM policies")
    List<Policy> findAll();

    @Select("SELECT * FROM policies WHERE customer_id = #{customerId}")
    List<Policy> findByCustomerId(Long customerId);
}
