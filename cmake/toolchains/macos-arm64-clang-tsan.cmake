set(CMAKE_SYSTEM_NAME Darwin)
# Setting CMAKE_SYSTEM_NAME leaves CMAKE_SYSTEM_VERSION empty, which breaks
# Corrosion's macOS version check. Use the host version for this native build.
set(CMAKE_SYSTEM_VERSION ${CMAKE_HOST_SYSTEM_VERSION})

# Native macOS build — prevent CMake from treating this as cross-compilation
set(CMAKE_CROSSCOMPILING FALSE)

# Build for Apple Silicon.
set(CMAKE_OSX_ARCHITECTURES "arm64")

# 64-bit macOS with ThreadSanitizer and debug symbols.
set(SANITIZER_FLAGS "-arch arm64 -fsanitize=thread -fno-omit-frame-pointer -g")

set(CMAKE_C_FLAGS_INIT   "${SANITIZER_FLAGS}")
set(CMAKE_CXX_FLAGS_INIT "${SANITIZER_FLAGS}")

set(CMAKE_EXE_LINKER_FLAGS_INIT "${SANITIZER_FLAGS}")
set(CMAKE_SHARED_LINKER_FLAGS_INIT "${SANITIZER_FLAGS}")
