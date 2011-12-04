package com.throne212.wz.dao;
// default package

import java.sql.Timestamp;
import java.util.List;
import org.hibernate.LockMode;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.throne212.wz.domain.User;

/**
 	* A data access object (DAO) providing persistence and search support for User entities.
 			* Transaction control of the save(), update() and delete() operations 
		can directly support Spring container-managed transactions or they can be augmented	to handle user-managed Spring transactions. 
		Each of these methods provides additional information for how to configure it for the desired type of transaction control. 	
	 * @see .User
  * @author MyEclipse Persistence Tools 
 */

public class UserDAO extends HibernateDaoSupport  {
	     private static final Logger log = LoggerFactory.getLogger(UserDAO.class);
		//property constants
	public static final String USER_ID = "userId";
	public static final String USER_EMAIL = "userEmail";
	public static final String USER_CONTACT = "userContact";
	public static final String USER_ISCHECK = "userIscheck";
	public static final String USER_PASSWORD = "userPassword";
	public static final String USER_IPADDR = "userIpaddr";
	public static final String USER_NAME = "userName";
	public static final String USER_SEX = "userSex";
	public static final String USER_BRIEF = "userBrief";
	public static final String USER_DIGREE = "userDigree";
	public static final String USER_COMPANY_NAME = "userCompanyName";
	public static final String USER_KIND = "userKind";
	public static final String USER_ISLOCK = "userIslock";
	public static final String USER_CITY_ID = "userCityId";
	public static final String USER_CITY_NAME = "userCityName";
	public static final String USER_ADDRESS = "userAddress";
	public static final String USER_QQ = "userQq";
	public static final String USER_PHONE = "userPhone";
	public static final String USER_MOBILE = "userMobile";
	public static final String USER_ACCOUNT = "userAccount";
	public static final String USER_ISYZ = "userIsyz";
	public static final String USER_SCORE = "userScore";
	public static final String USER_FILE_NAME = "userFileName";
	public static final String USER_ISVIP = "userIsvip";
	public static final String USER_SUCCESS = "userSuccess";
	public static final String USER_FAILURE = "userFailure";



	protected void initDao() {
		//do nothing
	}
    
    public void save(User transientInstance) {
        log.debug("saving User instance");
        try {
            getHibernateTemplate().save(transientInstance);
            log.debug("save successful");
        } catch (RuntimeException re) {
            log.error("save failed", re);
            throw re;
        }
    }
    
	public void delete(User persistentInstance) {
        log.debug("deleting User instance");
        try {
            getHibernateTemplate().delete(persistentInstance);
            log.debug("delete successful");
        } catch (RuntimeException re) {
            log.error("delete failed", re);
            throw re;
        }
    }
    
    public User findById( java.lang.Integer id) {
        log.debug("getting User instance with id: " + id);
        try {
            User instance = (User) getHibernateTemplate()
                    .get("User", id);
            return instance;
        } catch (RuntimeException re) {
            log.error("get failed", re);
            throw re;
        }
    }
    
    
    public List findByExample(User instance) {
        log.debug("finding User instance by example");
        try {
            List results = getHibernateTemplate().findByExample(instance);
            log.debug("find by example successful, result size: " + results.size());
            return results;
        } catch (RuntimeException re) {
            log.error("find by example failed", re);
            throw re;
        }
    }    
    
    public List findByProperty(String propertyName, Object value) {
      log.debug("finding User instance with property: " + propertyName
            + ", value: " + value);
      try {
         String queryString = "from User as model where model." 
         						+ propertyName + "= ?";
		 return getHibernateTemplate().find(queryString, value);
      } catch (RuntimeException re) {
         log.error("find by property name failed", re);
         throw re;
      }
	}

	public List findByUserId(Object userId
	) {
		return findByProperty(USER_ID, userId
		);
	}
	
	public List findByUserEmail(Object userEmail
	) {
		return findByProperty(USER_EMAIL, userEmail
		);
	}
	
	public List findByUserContact(Object userContact
	) {
		return findByProperty(USER_CONTACT, userContact
		);
	}
	
	public List findByUserIscheck(Object userIscheck
	) {
		return findByProperty(USER_ISCHECK, userIscheck
		);
	}
	
	public List findByUserPassword(Object userPassword
	) {
		return findByProperty(USER_PASSWORD, userPassword
		);
	}
	
	public List findByUserIpaddr(Object userIpaddr
	) {
		return findByProperty(USER_IPADDR, userIpaddr
		);
	}
	
	public List findByUserName(Object userName
	) {
		return findByProperty(USER_NAME, userName
		);
	}
	
	public List findByUserSex(Object userSex
	) {
		return findByProperty(USER_SEX, userSex
		);
	}
	
	public List findByUserBrief(Object userBrief
	) {
		return findByProperty(USER_BRIEF, userBrief
		);
	}
	
	public List findByUserDigree(Object userDigree
	) {
		return findByProperty(USER_DIGREE, userDigree
		);
	}
	
	public List findByUserCompanyName(Object userCompanyName
	) {
		return findByProperty(USER_COMPANY_NAME, userCompanyName
		);
	}
	
	public List findByUserKind(Object userKind
	) {
		return findByProperty(USER_KIND, userKind
		);
	}
	
	public List findByUserIslock(Object userIslock
	) {
		return findByProperty(USER_ISLOCK, userIslock
		);
	}
	
	public List findByUserCityId(Object userCityId
	) {
		return findByProperty(USER_CITY_ID, userCityId
		);
	}
	
	public List findByUserCityName(Object userCityName
	) {
		return findByProperty(USER_CITY_NAME, userCityName
		);
	}
	
	public List findByUserAddress(Object userAddress
	) {
		return findByProperty(USER_ADDRESS, userAddress
		);
	}
	
	public List findByUserQq(Object userQq
	) {
		return findByProperty(USER_QQ, userQq
		);
	}
	
	public List findByUserPhone(Object userPhone
	) {
		return findByProperty(USER_PHONE, userPhone
		);
	}
	
	public List findByUserMobile(Object userMobile
	) {
		return findByProperty(USER_MOBILE, userMobile
		);
	}
	
	public List findByUserAccount(Object userAccount
	) {
		return findByProperty(USER_ACCOUNT, userAccount
		);
	}
	
	public List findByUserIsyz(Object userIsyz
	) {
		return findByProperty(USER_ISYZ, userIsyz
		);
	}
	
	public List findByUserScore(Object userScore
	) {
		return findByProperty(USER_SCORE, userScore
		);
	}
	
	public List findByUserFileName(Object userFileName
	) {
		return findByProperty(USER_FILE_NAME, userFileName
		);
	}
	
	public List findByUserIsvip(Object userIsvip
	) {
		return findByProperty(USER_ISVIP, userIsvip
		);
	}
	
	public List findByUserSuccess(Object userSuccess
	) {
		return findByProperty(USER_SUCCESS, userSuccess
		);
	}
	
	public List findByUserFailure(Object userFailure
	) {
		return findByProperty(USER_FAILURE, userFailure
		);
	}
	

	public List findAll() {
		log.debug("finding all User instances");
		try {
			String queryString = "from User";
		 	return getHibernateTemplate().find(queryString);
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		}
	}
	
    public User merge(User detachedInstance) {
        log.debug("merging User instance");
        try {
            User result = (User) getHibernateTemplate()
                    .merge(detachedInstance);
            log.debug("merge successful");
            return result;
        } catch (RuntimeException re) {
            log.error("merge failed", re);
            throw re;
        }
    }

    public void attachDirty(User instance) {
        log.debug("attaching dirty User instance");
        try {
            getHibernateTemplate().saveOrUpdate(instance);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }
    
    public void attachClean(User instance) {
        log.debug("attaching clean User instance");
        try {
            getHibernateTemplate().lock(instance, LockMode.NONE);
            log.debug("attach successful");
        } catch (RuntimeException re) {
            log.error("attach failed", re);
            throw re;
        }
    }

	public static UserDAO getFromApplicationContext(ApplicationContext ctx) {
    	return (UserDAO) ctx.getBean("UserDAO");
	}
}