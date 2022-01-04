cmake_minimum_required(VERSION 3.18)

project(onednn_demo VERSION 1.0.1)


#基于c++11的库
set(CMAKE_CXX_STANDARD 11)

# 指定源文件
set(src_file 
	${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp
)

# 创建可执行程序项目
add_executable(onednn_demo ${src_file} )
# 指定头文件路径
target_include_directories(onednn_demo PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/include/)
# 指定lib文件路径
# target_link_libraries(	onednn_demo PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)



set(ONETBB_URL https://github.com/oneapi-src/oneTBB/archive/refs/tags/v2021.5.0.tar.gz)
set(ONETBB_MD5 5e5f2ee22a0d19c0abbe7478f1c7ccf6)

set(ONEDNN_URL https://github.com/oneapi-src/oneDNN/archive/refs/tags/v2.4.3.tar.gz)
set(ONEDNN_MD5 c60ea96acbaccec053be7e3fa81c6184)
# -------------------------------------------------------------------------------------
# 下面开始引入第三方库
# -------------------------------------------------------------------------------------
# set cmake file'dir： to/path/serial_port/cmake/
# -------------------------------------------------------------------------------------
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake;${CMAKE_MODULE_PATH}")

# 引入tbb.cmake, 
include(tbb)	# 填写文件名
include(dnnl)	# 填写文件名

# 使用tbb
target_link_libraries(onednn_demo PRIVATE tbb)
target_link_libraries(onednn_demo PRIVATE dnnl)
# --------------------------------------------------------------