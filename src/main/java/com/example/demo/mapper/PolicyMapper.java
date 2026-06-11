package com.example.demo.mapper;

import com.example.demo.model.Policy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Param;
import java.util.List;

@Mapper
public interface PolicyMapper {
    @Select("SELECT * FROM policies")
    List<Policy> findAll();

    @Select("SELECT * FROM policies WHERE customer_id = #{customerId}")
    List<Policy> findByCustomerId(Long customerId);

    /**
     * 根據動態條件查詢保單總筆數
     */
    @Select("<script>" +
            "SELECT COUNT(*) FROM policies " +
            "<where>" +
            "  <if test='policyNumber != null and policyNumber != \"\"'>" +
            "    AND policy_number LIKE CONCAT('%', #{policyNumber}, '%')" +
            "  </if>" +
            "  <if test='type != null and type != \"\"'>" +
            "    AND type = #{type}" +
            "  </if>" +
            "  <if test='startDate != null and startDate != \"\"'>" +
            "    AND start_date &gt;= #{startDate}" +
            "  </if>" +
            "  <if test='endDate != null and endDate != \"\"'>" +
            "    AND end_date &lt;= #{endDate}" +
            "  </if>" +
            "</where>" +
            "</script>")
    long countByConditions(
            @Param("policyNumber") String policyNumber,
            @Param("type") String type,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate);

    /**
     * 動態分頁查詢保單
     */
    @Select("<script>" +
            "SELECT * FROM policies " +
            "<where>" +
            "  <if test='policyNumber != null and policyNumber != \"\"'>" +
            "    AND policy_number LIKE CONCAT('%', #{policyNumber}, '%')" +
            "  </if>" +
            "  <if test='type != null and type != \"\"'>" +
            "    AND type = #{type}" +
            "  </if>" +
            "  <if test='startDate != null and startDate != \"\"'>" +
            "    AND start_date &gt;= #{startDate}" +
            "  </if>" +
            "  <if test='endDate != null and endDate != \"\"'>" +
            "    AND end_date &lt;= #{endDate}" +
            "  </if>" +
            "</where>" +
            "ORDER BY id DESC " +
            "LIMIT #{limit} OFFSET #{offset}" +
            "</script>")
    List<Policy> findByConditionsPaged(
            @Param("policyNumber") String policyNumber,
            @Param("type") String type,
            @Param("startDate") String startDate,
            @Param("endDate") String endDate,
            @Param("limit") int limit,
            @Param("offset") int offset);
}
