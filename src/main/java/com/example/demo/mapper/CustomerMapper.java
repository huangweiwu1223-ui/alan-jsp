package com.example.demo.mapper;

import com.example.demo.model.Customer;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface CustomerMapper {
    @Select("SELECT * FROM customers")
    List<Customer> findAll();

    @Select("SELECT * FROM customers WHERE id = #{id}")
    Customer findById(Long id);

    /**
     * 根據名稱模糊查詢總筆數
     */
    @Select("SELECT COUNT(*) FROM customers WHERE name LIKE CONCAT('%', #{name}, '%')")
    long countByName(@Param("name") String name);

    /**
     * 分頁模糊查詢
     * @param name 查詢關鍵字
     * @param limit 每頁幾筆
     * @param offset 從第幾筆開始 ( (page-1) * limit )
     */
    @Select("SELECT * FROM customers WHERE name LIKE CONCAT('%', #{name}, '%') LIMIT #{limit} OFFSET #{offset}")
    List<Customer> findByNamePaged(@Param("name") String name, @Param("limit") int limit, @Param("offset") int offset);
}
