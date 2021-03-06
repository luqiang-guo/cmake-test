include(FetchContent) 
set(FETCHCONTENT_QUIET off)

FetchContent_Declare(	dnnl	#库名字
						URL ${ONEDNN_URL}
						URL_HASH MD5=${ONEDNN_MD5}
)

# -DDNNL_LIBRARY_TYPE:STRING=${DNNL_LIBRARY_TYPE}
set(DNNL_BUILD_EXAMPLES OFF CACHE BOOL "")
set(DNNL_CPU_RUNTIME "TBB" CACHE STRING "")
# 需要提前设置TBBROOT 路径
# set(TBBROOT ${****} CACHE STRING "")
set(DNNL_BUILD_EXAMPLES OFF CACHE BOOL "")
set(DNNL_BUILD_TESTS OFF CACHE BOOL "")
# set(BUILD_SHARED_LIBS OFF CACHE BOOL "")
# set(CMAKE_POLICY_DEFAULT_CMP0079 NEW)
FetchContent_GetProperties(dnnl)

fetchcontent_makeavailable(dnnl)
