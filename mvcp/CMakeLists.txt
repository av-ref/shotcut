

ADD_DEFINITIONS(-DMVCP_EMBEDDED)


SET(sources
        mvcp.c
mvcp_util.c
mvcp_tokeniser.c
mvcp_status.c
mvcp_response.c
mvcp_remote.c
mvcp_parser.c
mvcp_notifier.c
        )

SET(includes
        mvcp.h
mvcp_util.h
mvcp_tokeniser.h
mvcp_status.h
mvcp_socket.h
mvcp_response.h
mvcp_remote.h
mvcp_parser.h
mvcp_notifier.h
        )


SET(library_target mvcp)

ADD_LIBRARY(mvcp STATIC ${sources} ${includes})
#TARGET_LINK_LIBRARIES(${library_target} )
#INSTALL(TARGETS ${library_target} DESTINATION lib)
#install(TARGETS mvcp EXPORT shotcut #install target: dll lib exe etc
#  LIBRARY DESTINATION lib
#  ARCHIVE DESTINATION lib
#  RUNTIME DESTINATION bin
#  INCLUDES DESTINATION include
#)
