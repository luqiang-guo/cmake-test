# find_package(Threads REQUIRED)
include(FetchContent) 
set(FETCHCONTENT_QUIET off)

FetchContent_Declare(	dnnl	#库名字
						URL ${ONEDNN_URL}
						URL_HASH MD5=${ONEDNN_MD5}
)

# -DDNNL_LIBRARY_TYPE:STRING=${DNNL_LIBRARY_TYPE}
set(DNNL_BUILD_EXAMPLES OFF CACHE BOOL "")
set(DNNL_CPU_RUNTIME "TBB" CACHE STRING "")
set(DNNL_BUILD_EXAMPLES OFF CACHE BOOL "")
set(DNNL_BUILD_TESTS OFF CACHE BOOL "")
# set(BUILD_SHARED_LIBS OFF CACHE BOOL "")
FetchContent_GetProperties(dnnl)
# set(CMAKE_POLICY_DEFAULT_CMP0079 NEW)

# if(NOT dnnl)
#   FetchContent_Populate(tbbbb)
#   add_subdirectory(${tbbbb_SOURCE_DIR} ${tbbbb_BINARY_DIR})
# endif()

fetchcontent_makeavailable(dnnl)

add_dependencies(dnnl tbb)

install(TARGETS test_tblgen LLVMTableGen LLVMDemangle LLVMSupport COMPONENT OneFlowTableGen)
add_custom_target(install-oneflow-tblgen
  DEPENDS test_tblgen
  COMMAND
      "${CMAKE_COMMAND}" -DCMAKE_INSTALL_COMPONENT=OneFlowTableGen
      -P "${CMAKE_BINARY_DIR}/cmake_install.cmake"
)

