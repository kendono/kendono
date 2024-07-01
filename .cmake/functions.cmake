
function(create_library target)
  set(target _sources/${target})
  file(GLOB_RECURSE files target/*)
  add_library(${target}_lib SHARED ${files})
endfunction()

function(create_modules_library target)
  set(target _sources/${target})
  file(GLOB_RECURSE files target/*)
  add_library(${target}_lib SHARED)
  target_sources(${target}_lib
  PUBLIC
    FILE_SET CXX_MODULES FILES ${files}
  )
endfunction()

function(create_binaries target)
  set(target _sources/${target})
  file(GLOB_RECURSE files target/*)
  foreach(file ${files})
    get_filename_component(name ${file} NAME_WLE)
    add_executable(${name} ${file})
  endforeach()
endfunction()
