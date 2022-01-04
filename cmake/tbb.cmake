# find_package(Threads REQUIRED)
include(FetchContent) 
set(FETCHCONTENT_QUIET off)

FetchContent_Declare(	tbbbb	#库名字
						URL ${ONETBB_URL}
						URL_HASH MD5=${ONETBB_MD5}
						# SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/ext/tbb # 指定库下载地址
						# INSTALL_DIR ${CMAKE_CURRENT_SOURCE_DIR}/build/tbb_install
)
set(TBB_EXAMPLES OFF CACHE BOOL "")
set(TBB_TEST OFF CACHE BOOL "")
# set(BUILD_SHARED_LIBS OFF CACHE BOOL "")
FetchContent_GetProperties(tbbbb)
# set(CMAKE_POLICY_DEFAULT_CMP0079 NEW)

if(NOT tbbbb)
  FetchContent_Populate(tbbbb)
  add_subdirectory(${tbbbb_SOURCE_DIR} ${tbbbb_BINARY_DIR})
endif()

fetchcontent_makeavailable(tbbbb)
