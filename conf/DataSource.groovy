dataSource {
	pooled = false
	driverClassName = "com.mysql.jdbc.Driver"
	username = "grails"
	password = "server"
}
hibernate {
    cache.use_second_level_cache=true
    cache.use_query_cache=true
    cache.provider_class='org.hibernate.cache.EhCacheProvider'
}
// environment specific settings
environments {
	development {
		dataSource {
			dbCreate = "update" // one of 'create', 'create-drop','update'
			url = "jdbc:mysql://localhost:3306/trip?autoreconnect=true"
		}
	}
	test {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost:3306/trip?autoreconnect=true"
		}
	}
	production {
		dataSource {
			dbCreate = "update"
			url = "jdbc:mysql://localhost:3306/trip?autoreconnect=true"
		}
	}
}