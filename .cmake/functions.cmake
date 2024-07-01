
function(create_library target)
  set(type ${target})
  set(target ${CMAKE_SOURCE_DIR}/_sources/${target})
  file(GLOB_RECURSE files ${target}/*)
  add_library(${type}_lib SHARED ${files})
endfunction()

function(create_modules_library target)
  set(type ${target})
  set(target ${CMAKE_SOURCE_DIR}/_sources/${target})
  file(GLOB_RECURSE files ${target}/*)
  add_library(${type}_lib SHARED)
  target_sources(${type}_lib
  PUBLIC
    FILE_SET CXX_MODULES FILES ${files}
  )
endfunction()

function(create_binaries target)
  set(type ${target})
  set(target ${CMAKE_SOURCE_DIR}/_binaries/${target})
  file(GLOB_RECURSE files ${target}/*)
  foreach(file ${files})
    get_filename_component(name ${file} NAME_WLE)
    if(${name} STREQUAL "_")
      set(name ${type})
    else()
      set(name ${type}_${name})
    endif()
    add_executable(${name} ${file})
  endforeach()
endfunction()
