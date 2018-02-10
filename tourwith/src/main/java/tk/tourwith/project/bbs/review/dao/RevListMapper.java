package tk.tourwith.project.bbs.review.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import tk.tourwith.project.bbs.review.model.RevList;
import tk.tourwith.project.bbs.review.model.RevListExample;

public interface RevListMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    long countByExample(RevListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    int deleteByExample(RevListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    int insert(RevList record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    int insertSelective(RevList record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    List<RevList> selectByExampleWithBLOBs(RevListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    List<RevList> selectByExample(RevListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    int updateByExampleSelective(@Param("record") RevList record, @Param("example") RevListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    int updateByExampleWithBLOBs(@Param("record") RevList record, @Param("example") RevListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table REV_LIST
     *
     * @mbg.generated Sat Feb 10 13:25:04 KST 2018
     */
    int updateByExample(@Param("record") RevList record, @Param("example") RevListExample example);
}