### This file is automatically generated by Qt Design Studio.
### Do not change

add_subdirectory(Sneed)
add_subdirectory(SneedContent)
add_subdirectory(App)

target_link_libraries(${CMAKE_PROJECT_NAME} PRIVATE
	Sneedplugin
	SneedContentplugin)