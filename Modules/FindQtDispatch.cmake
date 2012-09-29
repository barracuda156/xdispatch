FIND_PATH(
	QTDISPATCH_INCLUDE_DIRS
	NAMES
	QtDispatch/dispatch.h
	HINTS
	/Library/Frameworks
	$ENV{HOME}/include
	/usr/local/include
	/usr/include
	/opt/local/include
	$ENV{SystemDrive}/QtDispatch/include
	$ENV{ProgramFiles}/QtDispatch/include
)

set(CMAKE_FIND_FRAMEWORK LAST)

FIND_LIBRARY(
	QTDISPATCH_LIBRARY_DEBUG
	NAMES
	QtDispatchD libQtDispatchD
	HINTS
	/Library/Frameworks
	$ENV{HOME}/lib
	/usr/local/lib
	/usr/lib
	/opt/local/lib	
	$ENV{SystemDrive}/QtDispatch/lib
	$ENV{ProgramFiles}/QtDispatch/lib
)

FIND_LIBRARY(
	QTDISPATCH_LIBRARY_RELEASE
	NAMES
	QtDispatch libQtDispatch
	HINTS
	/Library/Frameworks
	$ENV{HOME}/lib
	/usr/local/lib
	/usr/lib
	/opt/local/lib	
	$ENV{SystemDrive}/QtDispatch/lib
	$ENV{ProgramFiles}/QtDispatch/lib
)

IF (QTDISPATCH_LIBRARY_DEBUG AND NOT QTDISPATCH_LIBRARY_RELEASE)
	SET(QTDISPATCH_LIBRARIES ${QTDISPATCH_LIBRARY_DEBUG})
ENDIF ()

IF (QTDISPATCH_LIBRARY_RELEASE AND NOT QTDISPATCH_LIBRARY_DEBUG)
	SET(QTDISPATCH_LIBRARIES ${QTDISPATCH_LIBRARY_RELEASE})
ENDIF ()

IF (QTDISPATCH_LIBRARY_DEBUG AND QTDISPATCH_LIBRARY_RELEASE)
	SET(QTDISPATCH_LIBRARIES debug ${QTDISPATCH_LIBRARY_DEBUG} optimized ${QTDISPATCH_LIBRARY_RELEASE})
ENDIF ()

FIND_PACKAGE_HANDLE_STANDARD_ARGS(
	QtDispatch
	DEFAULT_MSG
	QTDISPATCH_INCLUDE_DIRS
	QTDISPATCH_LIBRARIES
)

MARK_AS_ADVANCED(
	QTDISPATCH_INCLUDE_DIRS
	QTDISPATCH_LIBRARIES
	QTDISPATCH_LIBRARY_DEBUG
	QTDISPATCH_LIBRARY_RELEASE
) 