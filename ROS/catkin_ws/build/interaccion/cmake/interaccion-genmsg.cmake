# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "interaccion: 3 messages, 1 services")

set(MSG_I_FLAGS "-Iinteraccion:/home/xiang/catkin_ws/src/interaccion/msg;-Istd_msgs:/opt/ros/kinetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(interaccion_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg" NAME_WE)
add_custom_target(_interaccion_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaccion" "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg" ""
)

get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg" NAME_WE)
add_custom_target(_interaccion_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaccion" "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg" ""
)

get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg" NAME_WE)
add_custom_target(_interaccion_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaccion" "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg" "interaccion/pos_usuario:interaccion/inf_personal_usuario"
)

get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv" NAME_WE)
add_custom_target(_interaccion_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "interaccion" "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaccion
)
_generate_msg_cpp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaccion
)
_generate_msg_cpp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg"
  "${MSG_I_FLAGS}"
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg;/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaccion
)

### Generating Services
_generate_srv_cpp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaccion
)

### Generating Module File
_generate_module_cpp(interaccion
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaccion
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(interaccion_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(interaccion_generate_messages interaccion_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_cpp _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_cpp _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_cpp _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv" NAME_WE)
add_dependencies(interaccion_generate_messages_cpp _interaccion_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaccion_gencpp)
add_dependencies(interaccion_gencpp interaccion_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaccion_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaccion
)
_generate_msg_eus(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaccion
)
_generate_msg_eus(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg"
  "${MSG_I_FLAGS}"
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg;/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaccion
)

### Generating Services
_generate_srv_eus(interaccion
  "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaccion
)

### Generating Module File
_generate_module_eus(interaccion
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaccion
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(interaccion_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(interaccion_generate_messages interaccion_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_eus _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_eus _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_eus _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv" NAME_WE)
add_dependencies(interaccion_generate_messages_eus _interaccion_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaccion_geneus)
add_dependencies(interaccion_geneus interaccion_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaccion_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaccion
)
_generate_msg_lisp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaccion
)
_generate_msg_lisp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg"
  "${MSG_I_FLAGS}"
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg;/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaccion
)

### Generating Services
_generate_srv_lisp(interaccion
  "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaccion
)

### Generating Module File
_generate_module_lisp(interaccion
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaccion
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(interaccion_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(interaccion_generate_messages interaccion_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_lisp _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_lisp _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_lisp _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv" NAME_WE)
add_dependencies(interaccion_generate_messages_lisp _interaccion_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaccion_genlisp)
add_dependencies(interaccion_genlisp interaccion_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaccion_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaccion
)
_generate_msg_nodejs(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaccion
)
_generate_msg_nodejs(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg"
  "${MSG_I_FLAGS}"
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg;/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaccion
)

### Generating Services
_generate_srv_nodejs(interaccion
  "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaccion
)

### Generating Module File
_generate_module_nodejs(interaccion
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaccion
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(interaccion_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(interaccion_generate_messages interaccion_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_nodejs _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_nodejs _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_nodejs _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv" NAME_WE)
add_dependencies(interaccion_generate_messages_nodejs _interaccion_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaccion_gennodejs)
add_dependencies(interaccion_gennodejs interaccion_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaccion_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion
)
_generate_msg_py(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion
)
_generate_msg_py(interaccion
  "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg"
  "${MSG_I_FLAGS}"
  "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg;/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion
)

### Generating Services
_generate_srv_py(interaccion
  "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion
)

### Generating Module File
_generate_module_py(interaccion
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(interaccion_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(interaccion_generate_messages interaccion_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/inf_personal_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_py _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/pos_usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_py _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/msg/usuario.msg" NAME_WE)
add_dependencies(interaccion_generate_messages_py _interaccion_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/xiang/catkin_ws/src/interaccion/srv/multiplicador.srv" NAME_WE)
add_dependencies(interaccion_generate_messages_py _interaccion_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(interaccion_genpy)
add_dependencies(interaccion_genpy interaccion_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS interaccion_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaccion)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/interaccion
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(interaccion_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaccion)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/interaccion
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(interaccion_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaccion)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/interaccion
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(interaccion_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaccion)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/interaccion
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(interaccion_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/interaccion
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(interaccion_generate_messages_py std_msgs_generate_messages_py)
endif()
