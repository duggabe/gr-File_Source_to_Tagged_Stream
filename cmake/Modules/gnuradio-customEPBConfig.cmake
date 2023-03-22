find_package(PkgConfig)

PKG_CHECK_MODULES(PC_GR_CUSTOMEPB gnuradio-customEPB)

FIND_PATH(
    GR_CUSTOMEPB_INCLUDE_DIRS
    NAMES gnuradio/customEPB/api.h
    HINTS $ENV{CUSTOMEPB_DIR}/include
        ${PC_CUSTOMEPB_INCLUDEDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/include
          /usr/local/include
          /usr/include
)

FIND_LIBRARY(
    GR_CUSTOMEPB_LIBRARIES
    NAMES gnuradio-customEPB
    HINTS $ENV{CUSTOMEPB_DIR}/lib
        ${PC_CUSTOMEPB_LIBDIR}
    PATHS ${CMAKE_INSTALL_PREFIX}/lib
          ${CMAKE_INSTALL_PREFIX}/lib64
          /usr/local/lib
          /usr/local/lib64
          /usr/lib
          /usr/lib64
          )

include("${CMAKE_CURRENT_LIST_DIR}/gnuradio-customEPBTarget.cmake")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(GR_CUSTOMEPB DEFAULT_MSG GR_CUSTOMEPB_LIBRARIES GR_CUSTOMEPB_INCLUDE_DIRS)
MARK_AS_ADVANCED(GR_CUSTOMEPB_LIBRARIES GR_CUSTOMEPB_INCLUDE_DIRS)
