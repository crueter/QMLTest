cmake_minimum_required(VERSION 3.25)
include(FetchContent)

set(CMAKE_POLICY_DEFAULT_CMP0077 NEW)
set(CMAKE_POLICY_DEFAULT_CMP0074 NEW)

# OFP
FetchContent_Declare(
        OFPLib
        GIT_REPOSITORY https://github.com/crueter/OFPLib.git
        GIT_TAG        60c8422ae67119f46b1cb90b5ebbdc0223383e55
        OVERRIDE_FIND_PACKAGE
)
FetchContent_MakeAvailable(OFPLib)
