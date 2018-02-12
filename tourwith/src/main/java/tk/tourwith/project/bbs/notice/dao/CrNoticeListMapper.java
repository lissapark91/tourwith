package tk.tourwith.project.bbs.notice.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import tk.tourwith.project.bbs.notice.model.CrNoticeList;
import tk.tourwith.project.bbs.notice.model.CrNoticeListExample;

public interface CrNoticeListMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    long countByExample(CrNoticeListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    int deleteByExample(CrNoticeListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    int insert(CrNoticeList record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    int insertSelective(CrNoticeList record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    List<CrNoticeList> selectByExampleWithBLOBs(CrNoticeListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    List<CrNoticeList> selectByExample(CrNoticeListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    int updateByExampleSelective(@Param("record") CrNoticeList record, @Param("example") CrNoticeListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    int updateByExampleWithBLOBs(@Param("record") CrNoticeList record, @Param("example") CrNoticeListExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table CR_NOTICE_LIST
     *
     * @mbg.generated Sat Feb 10 13:59:28 KST 2018
     */
    int updateByExample(@Param("record") CrNoticeList record, @Param("example") CrNoticeListExample example);
}