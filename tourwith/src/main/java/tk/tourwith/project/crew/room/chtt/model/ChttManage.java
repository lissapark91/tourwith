package tk.tourwith.project.crew.room.chtt.model;

import java.util.Date;

public class ChttManage {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CHTT_MANAGE.CHTT_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    private String sj;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CHTT_MANAGE.REG_DE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    private Date con;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CHTT_MANAGE.CR_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    private String reg_de;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CHTT_MANAGE.DSPTCHMAN_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    private String upd_de;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column CHTT_MANAGE.CON
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    private String hitcnt;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CHTT_MANAGE.CHTT_NO
     *
     * @return the value of CHTT_MANAGE.CHTT_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public String getSj() {
        return sj;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CHTT_MANAGE.CHTT_NO
     *
     * @param sj the value for CHTT_MANAGE.CHTT_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public void setSj(String sj) {
        this.sj = sj == null ? null : sj.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CHTT_MANAGE.REG_DE
     *
     * @return the value of CHTT_MANAGE.REG_DE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public Date getCon() {
        return con;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CHTT_MANAGE.REG_DE
     *
     * @param con the value for CHTT_MANAGE.REG_DE
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public void setCon(Date con) {
        this.con = con;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CHTT_MANAGE.CR_NO
     *
     * @return the value of CHTT_MANAGE.CR_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public String getReg_de() {
        return reg_de;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CHTT_MANAGE.CR_NO
     *
     * @param reg_de the value for CHTT_MANAGE.CR_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public void setReg_de(String reg_de) {
        this.reg_de = reg_de == null ? null : reg_de.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CHTT_MANAGE.DSPTCHMAN_NO
     *
     * @return the value of CHTT_MANAGE.DSPTCHMAN_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public String getUpd_de() {
        return upd_de;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CHTT_MANAGE.DSPTCHMAN_NO
     *
     * @param upd_de the value for CHTT_MANAGE.DSPTCHMAN_NO
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public void setUpd_de(String upd_de) {
        this.upd_de = upd_de == null ? null : upd_de.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column CHTT_MANAGE.CON
     *
     * @return the value of CHTT_MANAGE.CON
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public String getHitcnt() {
        return hitcnt;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column CHTT_MANAGE.CON
     *
     * @param hitcnt the value for CHTT_MANAGE.CON
     *
     * @mbg.generated Sat Feb 10 14:10:51 KST 2018
     */
    public void setHitcnt(String hitcnt) {
        this.hitcnt = hitcnt == null ? null : hitcnt.trim();
    }
}