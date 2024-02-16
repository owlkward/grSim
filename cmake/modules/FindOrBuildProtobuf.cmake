# sanitize environment before find_package, because otherwise it also looks in the directory created for the ExternalProject
include(EnvHelper)
sanitize_env()
set(CMAKE_PREFIX_PATH "<vcpkg path>/vcpkg_installed/x64-windows/share/protobuf")
find_package(Protobuf 3.3.0)
restore_env()

# protobuf versions >= 3.21 are incompatible with how the project is setup and cause weird errors
# so we build protobuf ourselves
if(NOT Protobuf_FOUND OR Protobuf_VERSION VERSION_GREATER_EQUAL 3.21)
  include(BuildProtobuf)
endif()
