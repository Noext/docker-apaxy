#
# Disable TRACE requests
#
TraceEnable off

<VirtualHost *>
	
	DocumentRoot "${APACHE_SERVER_ROOT}"
	DirectoryIndex index.html

	Alias "${APAXY_THEME_ALIAS}" "${APAXY_THEME_PATH}"
	Alias "${APAXY_SUBFOLDER}" "${APACHE_SERVER_ROOT}"

	#
	# Allow access to the icons and stylesheets in the Apaxy
	# theme directory 
	#
	<Directory "${APAXY_THEME_PATH}">
        Options FollowSymLinks
        AllowOverride None
        Require all granted
	</Directory>

	#
	# Allow access and index viewing of the document root
	# 
	<Directory "${APACHE_SERVER_ROOT}">	
	    Options FollowSymLinks
	    AllowOverride None
	    Require all granted
	</Directory>

	#
	# Configure the Apaxy context path (whether it's the same
	# as APACHE_SERVER_ROOT or not doesn't matter) with the 
	# supplied Apaxy configurations
	#
	<Directory "${APACHE_SERVER_ROOT}${APAXY_CONTEXT_PATH}">
	    Options Indexes FollowSymLinks
		${APAXY_CONFIGURATIONS}
	</Directory>
	
	LogLevel warn
	CustomLog "${APAXY_ACCESS_LOG_FILE}" combined
	ErrorLog "${APAXY_LOG_FILE}"
        
</VirtualHost>
