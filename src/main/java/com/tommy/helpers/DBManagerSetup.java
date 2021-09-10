package com.tommy.helpers;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import com.tommy.dbmodels.DBManager;
import com.tommy.dbmodels.IConnectionBehavior;
import com.tommy.dbmodels.SQLServerConnectionBehavior;

@WebListener
public class DBManagerSetup implements ServletContextListener, HttpSessionListener, HttpSessionAttributeListener {

    private DBManager dbm = null;

    public DBManagerSetup() {
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        String uid = sce.getServletContext().getInitParameter("dbuserid");
        String pwd = sce.getServletContext().getInitParameter("dbuserpwd");
        String cat = sce.getServletContext().getInitParameter("dbinitcat");

        // Option 1: Connect to MySQL
        IConnectionBehavior icb = new SQLServerConnectionBehavior(uid,pwd,cat);

        // Option 2: Connect to MS SQLServer
        //IConnectionBehavior icb = new MssqlConnectionBehavior(uid,pwd,cat);

        dbm = new DBManager(icb);
        sce.getServletContext().setAttribute("BookDBManager", dbm);
        System.out.println("BookDBManager has been created!");
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        if (dbm != null)
        {
            if (dbm.isConnected())
                dbm.closeConnection(false);
        }
        dbm = null;
    }

	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}
}
