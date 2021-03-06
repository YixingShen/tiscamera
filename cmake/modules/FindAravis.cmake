#
# On successfull identification the following variables will be defined
#
# ARAVIS_FOUND       - system has aravis
# ARAVIS_INCLUDE_DIR - include directories
# ARAVIS_LIBRARIES   - linker flags
# ARAVIS_DEFINITIONS - Compiler flags required by aravis
#

include(LibFindMacros)

# Use pkg-config to get hints about paths
libfind_pkg_check_modules(aravis_PKGCONF aravis-0.4)

# Include dir
find_path(aravis_INCLUDE_DIR
	NAMES
	arv.h
	PATHS
	${aravis_PKGCONF_INCLUDE_DIRS}
	/usr/local/include
	/usr/local/include/aravis-0.4
	/usr/local/include/aravis-0.6
	/usr/include
	/usr/include/aravis-0.4
	/usr/include/aravis-0.6
)

# Finally the library itself
find_library(aravis_LIBRARY
	NAMES
	libaravis-0.4
	libaravis-0.6
	aravis
	aravis-0.4
	aravis-0.6
	libaravis
	PATHS
	${aravis_PKGCONF_LIBRARY_DIRS}
	/usr/local/lib
	/usr/lib
)

# # Set the include dir variables and the libraries and let libfind_process do the rest.
# # NOTE: Singular variables for this library, plural for libraries this this lib depends on.
set(aravis_PROCESS_INCLUDES aravis_INCLUDE_DIR aravis_INCLUDE_DIRS)
set(aravis_PROCESS_LIBS aravis_LIBRARY aravis_LIBRARIES)
libfind_process(aravis)
