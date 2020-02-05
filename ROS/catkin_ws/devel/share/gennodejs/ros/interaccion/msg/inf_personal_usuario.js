// Auto-generated. Do not edit!

// (in-package interaccion.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class inf_personal_usuario {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nombre = null;
      this.edad = null;
      this.idiomas = null;
    }
    else {
      if (initObj.hasOwnProperty('nombre')) {
        this.nombre = initObj.nombre
      }
      else {
        this.nombre = '';
      }
      if (initObj.hasOwnProperty('edad')) {
        this.edad = initObj.edad
      }
      else {
        this.edad = 0;
      }
      if (initObj.hasOwnProperty('idiomas')) {
        this.idiomas = initObj.idiomas
      }
      else {
        this.idiomas = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type inf_personal_usuario
    // Serialize message field [nombre]
    bufferOffset = _serializer.string(obj.nombre, buffer, bufferOffset);
    // Serialize message field [edad]
    bufferOffset = _serializer.int32(obj.edad, buffer, bufferOffset);
    // Serialize message field [idiomas]
    bufferOffset = _serializer.string(obj.idiomas, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type inf_personal_usuario
    let len;
    let data = new inf_personal_usuario(null);
    // Deserialize message field [nombre]
    data.nombre = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [edad]
    data.edad = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [idiomas]
    data.idiomas = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.nombre.length;
    length += object.idiomas.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interaccion/inf_personal_usuario';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d63e3fb247d30364a089bf55aee435e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string nombre
    int32 edad
    string idiomas
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new inf_personal_usuario(null);
    if (msg.nombre !== undefined) {
      resolved.nombre = msg.nombre;
    }
    else {
      resolved.nombre = ''
    }

    if (msg.edad !== undefined) {
      resolved.edad = msg.edad;
    }
    else {
      resolved.edad = 0
    }

    if (msg.idiomas !== undefined) {
      resolved.idiomas = msg.idiomas;
    }
    else {
      resolved.idiomas = ''
    }

    return resolved;
    }
};

module.exports = inf_personal_usuario;
