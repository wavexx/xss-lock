cmake_minimum_required(VERSION 3.10)
project(xss-lock C)
set(PROJECT_VERSION 0.4.0)

install(FILES NEWS DESTINATION share/doc/${PROJECT_NAME})

add_subdirectory(src)
add_subdirectory(doc)
add_subdirectory(completion)
