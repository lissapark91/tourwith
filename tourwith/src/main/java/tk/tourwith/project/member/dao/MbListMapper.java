package tk.tourwith.project.member.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import tk.tourwith.project.member.model.MbList;
import tk.tourwith.project.member.model.MbListExample;

public interface MbListMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table MB_LIST
     *
     * @mbg.generated Mon Feb 12 09:25:53 KST 2018
     */
    long countByExample(MbListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table MB_LIST
     *
     * @mbg.generated Mon Feb 12 09:25:53 KST 2018
     */
    int deleteByExample(MbListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table MB_LIST
     *
     * @mbg.generated Mon Feb 12 09:25:53 KST 2018
     */
    int insert(MbList record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table MB_LIST
     *
     * @mbg.generated Mon Feb 12 09:25:53 KST 2018
     */
    int insertSelective(MbList record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table MB_LIST
     *
     * @mbg.generated Mon Feb 12 09:25:53 KST 2018
     */
    List<MbList> selectByExample(MbListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table MB_LIST
     *
     * @mbg.generated Mon Feb 12 09:25:53 KST 2018
     */
    int updateByExampleSelective(@Param("record") MbList record, @Param("example") MbListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table MB_LIST
     *
     * @mbg.generated Mon Feb 12 09:25:53 KST 2018
     */
    int updateByExample(@Param("record") MbList record, @Param("example") MbListExample example);
}