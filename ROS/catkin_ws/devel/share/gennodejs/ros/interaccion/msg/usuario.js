// Auto-generated. Do not edit!

// (in-package interaccion.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let pos_usuario = require('./pos_usuario.js');
let inf_personal_usuario = require('./inf_personal_usuario.js');

//-----------------------------------------------------------

class usuario {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.emocion = null;
      this.posicion = null;
      this.infPersonal = null;
    }
    else {
      if (initObj.hasOwnProperty('emocion')) {
        this.emocion = initObj.emocion
      }
      else {
        this.emocion = '';
      }
      if (initObj.hasOwnProperty('posicion')) {
        this.posicion = initObj.posicion
      }
      else {
        this.posicion = new pos_usuario();
      }
      if (initObj.hasOwnProperty('infPersonal')) {
        this.infPersonal = initObj.infPersonal
      }
      else {
        this.infPersonal = new inf_personal_usuario();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type usuario
    // Serialize message field [emocion]
    bufferOffset = _serializer.string(obj.emocion, buffer, bufferOffset);
    // Serialize message field [posicion]
    bufferOffset = pos_usuario.serialize(obj.posicion, buffer, bufferOffset);
    // Serialize message field [infPersonal]
    bufferOffset = inf_personal_usuario.serialize(obj.infPersonal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type usuario
    let len;
    let data = new usuario(null);
    // Deserialize message field [emocion]
    data.emocion = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [posicion]
    data.posicion = pos_usuario.deserialize(buffer, bufferOffset);
    // Deserialize message field [infPersonal]
    data.infPersonal = inf_personal_usuario.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.emocion.length;
    length += inf_personal_usuario.getMessageSize(object.infPersonal);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'interaccion/usuario';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7116d7ee7ed4b4fab7670a37626d063';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string emocion
    pos_usuario posicion
    inf_personal_usuario infPersonal
    
    ================================================================================
    MSG: interaccion/pos_usuario
    int32 x
    int32 y
    int32 z
    
    ================================================================================
    MSG: interaccion/inf_personal_usuario
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
    const resolved = new usuario(null);
    if (msg.emocion !== undefined) {
      resolved.emocion = msg.emocion;
    }
    else {
      resolved.emocion = ''
    }

    if (msg.posicion !== undefined) {
      resolved.posicion = pos_usuario.Resolve(msg.posicion)
    }
    else {
      resolved.posicion = new pos_usuario()
    }

    if (msg.infPersonal !== undefined) {
      resolved.infPersonal = inf_personal_usuario.Resolve(msg.infPersonal)
    }
    else {
      resolved.infPersonal = new inf_personal_usuario()
    }

    return resolved;
    }
};

module.exports = usuario;
