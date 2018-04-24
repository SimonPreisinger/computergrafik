# Install script for directory: C:/projects/computergrafik

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/projects/computergrafik/Abgabe")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE DIRECTORY FILES "C:/projects/computergrafik/Texturen")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/." TYPE DIRECTORY FILES "C:/projects/computergrafik/Modelle")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/projects/computergrafik/build/Dependencies/cmake_install.cmake")
  include("C:/projects/computergrafik/build/ObjLoader/cmake_install.cmake")
  include("C:/projects/computergrafik/build/ImageLoader/cmake_install.cmake")
  include("C:/projects/computergrafik/build/Utils/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A1_Versuch1a/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A1_Versuch1b/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A1_Versuch1c/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A1_FraktaleSzene/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A3_Normalenvektoren/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A4_CubeMapping/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A5_BumpMapping/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A5_GeometryShader/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A5_PercentageCloserSoftShadows/cmake_install.cmake")
  include("C:/projects/computergrafik/build/A5_DisplacementMapping/cmake_install.cmake")

endif()

if(CMAKE_INSTALL_COMPONENT)
  set(CMAKE_INSTALL_MANIFEST "install_manifest_${CMAKE_INSTALL_COMPONENT}.txt")
else()
  set(CMAKE_INSTALL_MANIFEST "install_manifest.txt")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
file(WRITE "C:/projects/computergrafik/build/${CMAKE_INSTALL_MANIFEST}"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
