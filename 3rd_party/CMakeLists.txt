cmake_minimum_required(VERSION 3.25)
include(FetchContent)

set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)
set(CMAKE_POLICY_DEFAULT_CMP0074 NEW)

# OFP
FetchContent_Declare(
        OFPLib
        GIT_REPOSITORY https://github.com/crueter/OFPLib.git
        GIT_TAG        063d60ffef99f5e27a3c6e67e3d9a5b64e5295ee
        OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(OFPLib)
