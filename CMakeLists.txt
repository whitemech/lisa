cmake_minimum_required(VERSION 3.17)
project(lisa)

set(CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_STANDARD_REQUIRED ON)


set(CMAKE_MODULE_PATH
        "${CMAKE_MODULE_PATH}"
        "${CMAKE_ROOT_DIR}/cmake/Modules"
        "${CMAKE_CURRENT_SOURCE_DIR}/CMakeModules")

find_package(CUDD REQUIRED)
find_package(Buddy REQUIRED)
find_package(SPOT REQUIRED)
find_package(Syft REQUIRED)

#configure directories
set (LIBRARY_MODULE_PATH "${PROJECT_SOURCE_DIR}/src")
set (LIBRARY_SRC_PATH  "${LIBRARY_MODULE_PATH}" )
set (LIBRARY_INCLUDE_PATH  "${LIBRARY_MODULE_PATH}")

#set includes
include_directories (${LIBRARY_INCLUDE_PATH})
include_directories (${CMAKE_CURRENT_BINARY_DIR} ${CMAKE_CURRENT_SOURCE_DIR})

#set sources
file (GLOB_RECURSE LIB_HEADER_FILES dfwavar.hh dfwa.hh spotutil.hh ltlf2fol.hh mona.hh dfwamin.hh synt.hh strategy.hh dfwamin2.hh)
file (GLOB_RECURSE LIB_SOURCE_FILES lisa.cc dfwavar.cc dfwa.cc spotutil.cc ltlf2fol.cc mona.cc dfwamin.cc synt.cc strategy.cc dfwamin2.cc)


add_executable(lisa ${LIB_SOURCE_FILES})

target_link_libraries(lisa ${CUDD_LIBRARIES} ${BUDDY_LIBRARIES} ${SPOT_LIBRARIES} ${SYFT_LIBRARIES})
set_target_properties(lisa PROPERTIES LINKER_LANGUAGE C)