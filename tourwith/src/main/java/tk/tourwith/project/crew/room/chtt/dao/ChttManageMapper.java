package tk.tourwith.project.crew.room.chtt.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import tk.tourwith.project.crew.room.chtt.model.ChttManage;
import tk.tourwith.project.crew.room.chtt.model.ChttManageExample;

public interface ChttManageMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    long countByExample(ChttManageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    int deleteByExample(ChttManageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    int insert(ChttManage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    int insertSelective(ChttManage record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    List<ChttManage> selectByExampleWithBLOBs(ChttManageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    List<ChttManage> selectByExample(ChttManageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    int updateByExampleSelective(@Param("record") ChttManage record, @Param("example") ChttManageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    int updateByExampleWithBLOBs(@Param("record") ChttManage record, @Param("example") ChttManageExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CHTT_MANAGE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    int updateByExample(@Param("record") ChttManage record, @Param("example") ChttManageExample example);
}