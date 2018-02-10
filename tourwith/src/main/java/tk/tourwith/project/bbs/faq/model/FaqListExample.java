package tk.tourwith.project.bbs.faq.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class FaqListExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public FaqListExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andFaq_noIsNull() {
            addCriterion("FAQ_NO is null");
            return (Criteria) this;
        }

        public Criteria andFaq_noIsNotNull() {
            addCriterion("FAQ_NO is not null");
            return (Criteria) this;
        }

        public Criteria andFaq_noEqualTo(String value) {
            addCriterion("FAQ_NO =", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noNotEqualTo(String value) {
            addCriterion("FAQ_NO <>", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noGreaterThan(String value) {
            addCriterion("FAQ_NO >", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noGreaterThanOrEqualTo(String value) {
            addCriterion("FAQ_NO >=", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noLessThan(String value) {
            addCriterion("FAQ_NO <", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noLessThanOrEqualTo(String value) {
            addCriterion("FAQ_NO <=", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noLike(String value) {
            addCriterion("FAQ_NO like", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noNotLike(String value) {
            addCriterion("FAQ_NO not like", value, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noIn(List<String> values) {
            addCriterion("FAQ_NO in", values, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noNotIn(List<String> values) {
            addCriterion("FAQ_NO not in", values, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noBetween(String value1, String value2) {
            addCriterion("FAQ_NO between", value1, value2, "faq_no");
            return (Criteria) this;
        }

        public Criteria andFaq_noNotBetween(String value1, String value2) {
            addCriterion("FAQ_NO not between", value1, value2, "faq_no");
            return (Criteria) this;
        }

        public Criteria andSjIsNull() {
            addCriterion("SJ is null");
            return (Criteria) this;
        }

        public Criteria andSjIsNotNull() {
            addCriterion("SJ is not null");
            return (Criteria) this;
        }

        public Criteria andSjEqualTo(String value) {
            addCriterion("SJ =", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotEqualTo(String value) {
            addCriterion("SJ <>", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjGreaterThan(String value) {
            addCriterion("SJ >", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjGreaterThanOrEqualTo(String value) {
            addCriterion("SJ >=", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjLessThan(String value) {
            addCriterion("SJ <", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjLessThanOrEqualTo(String value) {
            addCriterion("SJ <=", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjLike(String value) {
            addCriterion("SJ like", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotLike(String value) {
            addCriterion("SJ not like", value, "sj");
            return (Criteria) this;
        }

        public Criteria andSjIn(List<String> values) {
            addCriterion("SJ in", values, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotIn(List<String> values) {
            addCriterion("SJ not in", values, "sj");
            return (Criteria) this;
        }

        public Criteria andSjBetween(String value1, String value2) {
            addCriterion("SJ between", value1, value2, "sj");
            return (Criteria) this;
        }

        public Criteria andSjNotBetween(String value1, String value2) {
            addCriterion("SJ not between", value1, value2, "sj");
            return (Criteria) this;
        }

        public Criteria andReq_deIsNull() {
            addCriterion("REG_DE is null");
            return (Criteria) this;
        }

        public Criteria andReq_deIsNotNull() {
            addCriterion("REG_DE is not null");
            return (Criteria) this;
        }

        public Criteria andReq_deEqualTo(Date value) {
            addCriterion("REG_DE =", value, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deNotEqualTo(Date value) {
            addCriterion("REG_DE <>", value, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deGreaterThan(Date value) {
            addCriterion("REG_DE >", value, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deGreaterThanOrEqualTo(Date value) {
            addCriterion("REG_DE >=", value, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deLessThan(Date value) {
            addCriterion("REG_DE <", value, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deLessThanOrEqualTo(Date value) {
            addCriterion("REG_DE <=", value, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deIn(List<Date> values) {
            addCriterion("REG_DE in", values, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deNotIn(List<Date> values) {
            addCriterion("REG_DE not in", values, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deBetween(Date value1, Date value2) {
            addCriterion("REG_DE between", value1, value2, "req_de");
            return (Criteria) this;
        }

        public Criteria andReq_deNotBetween(Date value1, Date value2) {
            addCriterion("REG_DE not between", value1, value2, "req_de");
            return (Criteria) this;
        }

        public Criteria andHitcntIsNull() {
            addCriterion("HITCNT is null");
            return (Criteria) this;
        }

        public Criteria andHitcntIsNotNull() {
            addCriterion("HITCNT is not null");
            return (Criteria) this;
        }

        public Criteria andHitcntEqualTo(Integer value) {
            addCriterion("HITCNT =", value, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntNotEqualTo(Integer value) {
            addCriterion("HITCNT <>", value, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntGreaterThan(Integer value) {
            addCriterion("HITCNT >", value, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntGreaterThanOrEqualTo(Integer value) {
            addCriterion("HITCNT >=", value, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntLessThan(Integer value) {
            addCriterion("HITCNT <", value, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntLessThanOrEqualTo(Integer value) {
            addCriterion("HITCNT <=", value, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntIn(List<Integer> values) {
            addCriterion("HITCNT in", values, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntNotIn(List<Integer> values) {
            addCriterion("HITCNT not in", values, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntBetween(Integer value1, Integer value2) {
            addCriterion("HITCNT between", value1, value2, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andHitcntNotBetween(Integer value1, Integer value2) {
            addCriterion("HITCNT not between", value1, value2, "hitcnt");
            return (Criteria) this;
        }

        public Criteria andUpd_deIsNull() {
            addCriterion("UPD_DE is null");
            return (Criteria) this;
        }

        public Criteria andUpd_deIsNotNull() {
            addCriterion("UPD_DE is not null");
            return (Criteria) this;
        }

        public Criteria andUpd_deEqualTo(Date value) {
            addCriterionForJDBCDate("UPD_DE =", value, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deNotEqualTo(Date value) {
            addCriterionForJDBCDate("UPD_DE <>", value, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deGreaterThan(Date value) {
            addCriterionForJDBCDate("UPD_DE >", value, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("UPD_DE >=", value, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deLessThan(Date value) {
            addCriterionForJDBCDate("UPD_DE <", value, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("UPD_DE <=", value, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deIn(List<Date> values) {
            addCriterionForJDBCDate("UPD_DE in", values, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deNotIn(List<Date> values) {
            addCriterionForJDBCDate("UPD_DE not in", values, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("UPD_DE between", value1, value2, "upd_de");
            return (Criteria) this;
        }

        public Criteria andUpd_deNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("UPD_DE not between", value1, value2, "upd_de");
            return (Criteria) this;
        }

        public Criteria andDel_ynIsNull() {
            addCriterion("DEL_YN is null");
            return (Criteria) this;
        }

        public Criteria andDel_ynIsNotNull() {
            addCriterion("DEL_YN is not null");
            return (Criteria) this;
        }

        public Criteria andDel_ynEqualTo(String value) {
            addCriterion("DEL_YN =", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynNotEqualTo(String value) {
            addCriterion("DEL_YN <>", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynGreaterThan(String value) {
            addCriterion("DEL_YN >", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynGreaterThanOrEqualTo(String value) {
            addCriterion("DEL_YN >=", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynLessThan(String value) {
            addCriterion("DEL_YN <", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynLessThanOrEqualTo(String value) {
            addCriterion("DEL_YN <=", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynLike(String value) {
            addCriterion("DEL_YN like", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynNotLike(String value) {
            addCriterion("DEL_YN not like", value, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynIn(List<String> values) {
            addCriterion("DEL_YN in", values, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynNotIn(List<String> values) {
            addCriterion("DEL_YN not in", values, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynBetween(String value1, String value2) {
            addCriterion("DEL_YN between", value1, value2, "del_yn");
            return (Criteria) this;
        }

        public Criteria andDel_ynNotBetween(String value1, String value2) {
            addCriterion("DEL_YN not between", value1, value2, "del_yn");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noIsNull() {
            addCriterion("REG_MB_NO is null");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noIsNotNull() {
            addCriterion("REG_MB_NO is not null");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noEqualTo(String value) {
            addCriterion("REG_MB_NO =", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noNotEqualTo(String value) {
            addCriterion("REG_MB_NO <>", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noGreaterThan(String value) {
            addCriterion("REG_MB_NO >", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noGreaterThanOrEqualTo(String value) {
            addCriterion("REG_MB_NO >=", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noLessThan(String value) {
            addCriterion("REG_MB_NO <", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noLessThanOrEqualTo(String value) {
            addCriterion("REG_MB_NO <=", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noLike(String value) {
            addCriterion("REG_MB_NO like", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noNotLike(String value) {
            addCriterion("REG_MB_NO not like", value, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noIn(List<String> values) {
            addCriterion("REG_MB_NO in", values, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noNotIn(List<String> values) {
            addCriterion("REG_MB_NO not in", values, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noBetween(String value1, String value2) {
            addCriterion("REG_MB_NO between", value1, value2, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andReg_mb_noNotBetween(String value1, String value2) {
            addCriterion("REG_MB_NO not between", value1, value2, "reg_mb_no");
            return (Criteria) this;
        }

        public Criteria andWrterIsNull() {
            addCriterion("WRTER is null");
            return (Criteria) this;
        }

        public Criteria andWrterIsNotNull() {
            addCriterion("WRTER is not null");
            return (Criteria) this;
        }

        public Criteria andWrterEqualTo(String value) {
            addCriterion("WRTER =", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterNotEqualTo(String value) {
            addCriterion("WRTER <>", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterGreaterThan(String value) {
            addCriterion("WRTER >", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterGreaterThanOrEqualTo(String value) {
            addCriterion("WRTER >=", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterLessThan(String value) {
            addCriterion("WRTER <", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterLessThanOrEqualTo(String value) {
            addCriterion("WRTER <=", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterLike(String value) {
            addCriterion("WRTER like", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterNotLike(String value) {
            addCriterion("WRTER not like", value, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterIn(List<String> values) {
            addCriterion("WRTER in", values, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterNotIn(List<String> values) {
            addCriterion("WRTER not in", values, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterBetween(String value1, String value2) {
            addCriterion("WRTER between", value1, value2, "wrter");
            return (Criteria) this;
        }

        public Criteria andWrterNotBetween(String value1, String value2) {
            addCriterion("WRTER not between", value1, value2, "wrter");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table FAQ_LIST
     *
     * @mbg.generated do_not_delete_during_merge Sat Feb 10 13:14:35 KST 2018
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table FAQ_LIST
     *
     * @mbg.generated Sat Feb 10 13:14:35 KST 2018
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}