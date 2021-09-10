package com.tommy.dbmodels;

import java.sql.Connection;
import java.sql.DriverManager;

import com.tommy.dbmodels.DBUserInfo;
import com.tommy.dbmodels.IConnectionBehavior;

public class SQLServerConnectionBehavior extends DBUserInfo implements IConnectionBehavior {

	public SQLServerConnectionBehavior(String uid, String pwd, String cat) {
		super(uid, pwd, cat);
	}

	@Override
	public Connection getConnection() {
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").getDeclaredConstructor().newInstance();
			Connection cn = DriverManager.getConnection(getConnectionURL());
			return cn;
		}
		catch (Exception ex) {
			ex.printStackTrace();
			return null;
		}

	}

	@Override
	public String getConnectionURL() {
		return String.format("jdbc:sqlserver://DESKTOP-HEPHQND\\\\SQLEXPRESS:1433;"
					+ "databaseName=%s; "
					+ "user=%s; "
					+ "password=%s;encrypt=false;trustServerCertificate=false;loginTimeout=30;"
					, getCat()
					, getUid()
					, getPwd());
	}

	@Override
	public String getConnectionDetails() {
		return "SQLServer database is connection to " + getCat();
	}

	@Override
	public String getTablesSchemaQuery() {
		return "select table_name from information_schema.tables where table_schema = " + getCat();
	}
}
