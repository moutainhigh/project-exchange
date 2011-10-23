package com.throne212.fupin.dao.impl;

import java.util.List;

import org.hibernate.Session;

import com.throne212.fupin.common.PageBean;
import com.throne212.fupin.common.WebConstants;
import com.throne212.fupin.dao.BaoSongDao;
import com.throne212.fupin.domain.Admin;
import com.throne212.fupin.domain.AreaWorkOrg;
import com.throne212.fupin.domain.BaoSong;
import com.throne212.fupin.domain.Org;
import com.throne212.fupin.domain.User;
import com.throne212.fupin.domain.ZhenWorkOrg;

public class BaoSongDaoImpl extends BaseDaoImpl implements BaoSongDao {

	public PageBean<BaoSong> getBaoSongList(int pageIndex, User user, String status) {
		if (pageIndex == 0) {
			pageIndex = 1;
		}
		PageBean<BaoSong> page = new PageBean<BaoSong>();
		int startIndex = (pageIndex - 1) * WebConstants.PAGE_SIZE;
		String hql = "from BaoSong t where 1=1";
		if (user instanceof Org || user instanceof ZhenWorkOrg) {
			hql += " and user.id=" + user.getId();
			// 状态
			if ("待办".equals(status)) {
				hql += " and (status=1 or status=4)";
			} else if ("已办".equals(status)) {
				hql += " and (status=2)";
			} else
				hql += " and (status=1 or status=2 or status=4)";
		} else if (user instanceof AreaWorkOrg) {
			hql += " and (status=2 or status=3)";
		} else if (user instanceof Admin) {

		}

		hql += " order by id desc";

		Long count = (Long) this.getHibernateTemplate().find("select count(*) " + hql).get(0);
		logger.debug("查询总数为：" + count);
		page.setTotalRow(count.intValue());// 总记录数目
		Session s = this.getHibernateTemplate().getSessionFactory().getCurrentSession();
		List<BaoSong> list = s.createQuery(hql).setMaxResults(WebConstants.PAGE_SIZE).setFirstResult(startIndex).list();
		page.setResultList(list);// 数据列表
		page.setRowPerPage(WebConstants.PAGE_SIZE);// 每页记录数目
		page.setPageIndex(pageIndex);// 当前页码
		return page;

	}

}
