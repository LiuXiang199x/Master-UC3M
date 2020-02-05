// Auto-generated. Do not edit!

// (in-package interaccion.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class multiplicadorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.entrada = null;
    }
    else {
      if (initObj.hasOwnProperty('entrada')) {
        this.entrada = initObj.entrada
      }
      else {
        this.entrada = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type multiplicadorRequest
    // Serialize message field [entrada]
    bufferOffset = _serializer.int64(obj.entrada, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type multiplicadorRequest
    let len;
    let data = new multiplicadorRequest(null);
    // Deserialize message field [entrada]
    data.entrada = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'interaccion/multiplicadorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f84bc19c332ccbd56a70d59a2121c58f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 entrada
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new multiplicadorRequest(null);
    if (msg.entrada !== undefined) {
      resolved.entrada = msg.entrada;
    }
    else {
      resolved.entrada = 0
    }

    return resolved;
    }
};

class multiplicadorResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.resultado = null;
    }
    else {
      if (initObj.hasOwnProperty('resultado')) {
        this.resultado = initObj.resultado
      }
      else {
        this.resultado = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type multiplicadorResponse
    // Serialize message field [resultado]
    bufferOffset = _serializer.int64(obj.resultado, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type multiplicadorResponse
    let len;
    let data = new multiplicadorResponse(null);
    // Deserialize message field [resultado]
    data.resultado = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'interaccion/multiplicadorResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b1106c38e6193ae8ef172f60a94e0e0c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 resultado
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new multiplicadorResponse(null);
    if (msg.resultado !== undefined) {
      resolved.resultado = msg.resultado;
    }
    else {
      resolved.resultado = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: multiplicadorRequest,
  Response: multiplicadorResponse,
  md5sum() { return 'd1d48bd1a6a0e98317f90b1d6ea7b6fa'; },
  datatype() { return 'interaccion/multiplicador'; }
};
