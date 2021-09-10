package com.tommy.dbmodels;

import java.sql.Connection;

public interface IConnectionBehavior {
	Connection getConnection();
	String getConnectionURL();
	String getConnectionDetails();
	String getTablesSchemaQuery();
}
