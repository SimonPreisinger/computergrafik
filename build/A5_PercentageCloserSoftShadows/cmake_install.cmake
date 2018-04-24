# Install script for directory: C:/projects/computergrafik/A5_PercentageCloserSoftShadows

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
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/A5_PercentageCloserSoftShadows" TYPE EXECUTABLE FILES "C:/projects/computergrafik/build/A5_PercentageCloserSoftShadows/Debug/A5_PercentageCloserSoftShadows.exe")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xUnspecifiedx" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/A5_PercentageCloserSoftShadows" TYPE EXECUTABLE FILES "C:/projects/computergrafik/build/A5_PercentageCloserSoftShadows/Release/A5_PercentageCloserSoftShadows.exe")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xA5_PercentageCloserSoftShadowsx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/A5_PercentageCloserSoftShadows" TYPE FILE FILES
    "C:/projects/computergrafik/A5_PercentageCloserSoftShadows/PercentageCloserSoftShadows.cpp"
    "C:/projects/computergrafik/A5_PercentageCloserSoftShadows/RenderShadowMapVS.glsl"
    "C:/projects/computergrafik/A5_PercentageCloserSoftShadows/RenderShadowMapFS.glsl"
    "C:/projects/computergrafik/A5_PercentageCloserSoftShadows/DisplayShadowsFS.glsl"
    "C:/projects/computergrafik/A5_PercentageCloserSoftShadows/DisplayShadowsVS.glsl"
    )
endif()

