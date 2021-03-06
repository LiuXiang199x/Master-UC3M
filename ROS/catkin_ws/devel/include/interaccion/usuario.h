// Generated by gencpp from file interaccion/usuario.msg
// DO NOT EDIT!


#ifndef INTERACCION_MESSAGE_USUARIO_H
#define INTERACCION_MESSAGE_USUARIO_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <interaccion/pos_usuario.h>
#include <interaccion/inf_personal_usuario.h>

namespace interaccion
{
template <class ContainerAllocator>
struct usuario_
{
  typedef usuario_<ContainerAllocator> Type;

  usuario_()
    : emocion()
    , posicion()
    , infPersonal()  {
    }
  usuario_(const ContainerAllocator& _alloc)
    : emocion(_alloc)
    , posicion(_alloc)
    , infPersonal(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _emocion_type;
  _emocion_type emocion;

   typedef  ::interaccion::pos_usuario_<ContainerAllocator>  _posicion_type;
  _posicion_type posicion;

   typedef  ::interaccion::inf_personal_usuario_<ContainerAllocator>  _infPersonal_type;
  _infPersonal_type infPersonal;





  typedef boost::shared_ptr< ::interaccion::usuario_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::interaccion::usuario_<ContainerAllocator> const> ConstPtr;

}; // struct usuario_

typedef ::interaccion::usuario_<std::allocator<void> > usuario;

typedef boost::shared_ptr< ::interaccion::usuario > usuarioPtr;
typedef boost::shared_ptr< ::interaccion::usuario const> usuarioConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::interaccion::usuario_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::interaccion::usuario_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace interaccion

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'interaccion': ['/home/xiang/catkin_wsros/src/interaccion/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::interaccion::usuario_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::interaccion::usuario_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::interaccion::usuario_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::interaccion::usuario_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaccion::usuario_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::interaccion::usuario_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::interaccion::usuario_<ContainerAllocator> >
{
  static const char* value()
  {
    return "a7116d7ee7ed4b4fab7670a37626d063";
  }

  static const char* value(const ::interaccion::usuario_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xa7116d7ee7ed4b4fULL;
  static const uint64_t static_value2 = 0xab7670a37626d063ULL;
};

template<class ContainerAllocator>
struct DataType< ::interaccion::usuario_<ContainerAllocator> >
{
  static const char* value()
  {
    return "interaccion/usuario";
  }

  static const char* value(const ::interaccion::usuario_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::interaccion::usuario_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string emocion\n\
pos_usuario posicion\n\
inf_personal_usuario infPersonal\n\
\n\
================================================================================\n\
MSG: interaccion/pos_usuario\n\
int32 x\n\
int32 y\n\
int32 z\n\
\n\
================================================================================\n\
MSG: interaccion/inf_personal_usuario\n\
string nombre\n\
int32 edad\n\
string idiomas\n\
";
  }

  static const char* value(const ::interaccion::usuario_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::interaccion::usuario_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.emocion);
      stream.next(m.posicion);
      stream.next(m.infPersonal);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct usuario_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::interaccion::usuario_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::interaccion::usuario_<ContainerAllocator>& v)
  {
    s << indent << "emocion: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.emocion);
    s << indent << "posicion: ";
    s << std::endl;
    Printer< ::interaccion::pos_usuario_<ContainerAllocator> >::stream(s, indent + "  ", v.posicion);
    s << indent << "infPersonal: ";
    s << std::endl;
    Printer< ::interaccion::inf_personal_usuario_<ContainerAllocator> >::stream(s, indent + "  ", v.infPersonal);
  }
};

} // namespace message_operations
} // namespace ros

#endif // INTERACCION_MESSAGE_USUARIO_H
