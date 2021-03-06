SET(INSTALL_ALL_THESE_LIBRARIES "" CACHE INTERNAL "Hack variable to collect the statically linked" )

FUNCTION( REMEMBER_TO_CALL_THIS_INSTALL_MACRO install_macro_name )
	STRING( FIND ";${INSTALL_ALL_THESE_LIBRARIES};" ";${install_macro_name};" found_macro )
	IF ( ${found_macro} EQUAL -1 )
		SET(INSTALL_ALL_THESE_LIBRARIES ${INSTALL_ALL_THESE_LIBRARIES};${install_macro_name} CACHE INTERNAL "Hack variable to collect the statically linked" )
	ENDIF()
ENDFUNCTION()

FUNCTION( INSTALL_ALL_USED_LIBRARIES )
	MESSAGE(STATUS "Install all these third party libraries = ${INSTALL_ALL_THESE_LIBRARIES}")

	SET( INSTALL_FILE_NAME ${CMAKE_BINARY_DIR}/install_all_these_libraries.cmake )
	FILE( WRITE ${INSTALL_FILE_NAME} "# Automatically generated file to install third party libs on demand\n" )
	FOREACH(INSTALL_CMD ${INSTALL_ALL_THESE_LIBRARIES})
		FILE( APPEND ${INSTALL_FILE_NAME} "${INSTALL_CMD}()\n" )
	ENDFOREACH()
	INCLUDE( ${INSTALL_FILE_NAME} )
	FILE( REMOVE ${INSTALL_FILE_NAME} )
ENDFUNCTION()
