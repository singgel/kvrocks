if (NOT __SNAPPY_INCLUDED)
  set(__SNAPPY_INCLUDED TRUE)
  # build directory
  set(snappy_PREFIX ${CMAKE_BINARY_DIR}/external/snappy-prefix)
  # install directory
  set(snappy_INSTALL ${CMAKE_BINARY_DIR}/external/snappy-install)

  if (UNIX)
      set(SNAPPY_EXTRA_COMPILER_FLAGS "-fPIC")
  endif()

  set(SNAPPY_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${SNAPPY_EXTRA_COMPILER_FLAGS}")
  set(SNAPPY_C_FLAGS "${CMAKE_C_FLAGS} ${SNAPPY_EXTRA_COMPILER_FLAGS}")

  ExternalProject_Add(snappy
      PREFIX ${snappy_PREFIX}
      #GIT_REPOSITORY "https://github.com/google/snappy"
      #GIT_TAG "1.1.7"
      SOURCE_DIR ${PROJECT_SOURCE_DIR}/external/snappy
      INSTALL_DIR ${snappy_INSTALL}
      CMAKE_ARGS -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
                 -DCMAKE_INSTALL_PREFIX=${snappy_INSTALL}
                 -DBUILD_SHARED_LIBS=OFF
                 -DBUILD_STATIC_LIBS=ON
                 -DBUILD_PACKAGING=OFF
                 -DBUILD_TESTING=OFF
                 -DBUILD_NC_TESTS=OFF
                 -DBUILD_CONFIG_TESTS=OFF
                 -DINSTALL_HEADERS=ON
                 -DCMAKE_C_FLAGS=${SNAPPY_C_FLAGS}
                 -DCMAKE_CXX_FLAGS=${SNAPPY_CXX_FLAGS}
                 -DSNAPPY_BUILD_TESTS=OFF
      LOG_DOWNLOAD 1
      LOG_CONFIGURE 1
      LOG_INSTALL 1
      )

  set(snappy_FOUND TRUE)
  set(snappy_INCLUDE_DIRS ${snappy_INSTALL}/include)
  set(snappy_LIBRARIES ${snappy_INSTALL}/lib/libsnappy.a)
  set(snappy_LIBRARY_DIRS ${snappy_INSTALL}/lib)
endif()

