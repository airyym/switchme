dataSource {
    pooled = true
	dbCreate = "update"
    driverClassName = "com.mysql.jdbc.Driver"
	dialect = org.hibernate.dialect.MySQL5InnoDBDialect
	
	
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            //dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            username = "root"
		    password = "imgood84"
			url="jdbc:mysql://1.234.36.234/switchme?tcpKeepAlive=true&useUnicode=true&characterEncoding=UTF8"  
        }
    } 
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            username = "root"
		    password = "imgood84"
			url="jdbc:mysql://1.234.36.234/switchme?tcpKeepAlive=true&useUnicode=true&characterEncoding=UTF8" 
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
