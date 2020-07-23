// Auto-generated. Do not edit!

// (in-package python_turtle.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class removeturtleRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.turtle_name = null;
    }
    else {
      if (initObj.hasOwnProperty('turtle_name')) {
        this.turtle_name = initObj.turtle_name
      }
      else {
        this.turtle_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type removeturtleRequest
    // Serialize message field [turtle_name]
    bufferOffset = _serializer.string(obj.turtle_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type removeturtleRequest
    let len;
    let data = new removeturtleRequest(null);
    // Deserialize message field [turtle_name]
    data.turtle_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.turtle_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'python_turtle/removeturtleRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '48e762ec9b058c0b3f8e7717c102b90d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string turtle_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new removeturtleRequest(null);
    if (msg.turtle_name !== undefined) {
      resolved.turtle_name = msg.turtle_name;
    }
    else {
      resolved.turtle_name = ''
    }

    return resolved;
    }
};

class removeturtleResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ret = null;
    }
    else {
      if (initObj.hasOwnProperty('ret')) {
        this.ret = initObj.ret
      }
      else {
        this.ret = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type removeturtleResponse
    // Serialize message field [ret]
    bufferOffset = _serializer.int8(obj.ret, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type removeturtleResponse
    let len;
    let data = new removeturtleResponse(null);
    // Deserialize message field [ret]
    data.ret = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'python_turtle/removeturtleResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ba0ef05866f4fc5d7e82544d27e5cfbc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 ret
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new removeturtleResponse(null);
    if (msg.ret !== undefined) {
      resolved.ret = msg.ret;
    }
    else {
      resolved.ret = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: removeturtleRequest,
  Response: removeturtleResponse,
  md5sum() { return '77308e5f6594808d16ab77e3e54c717b'; },
  datatype() { return 'python_turtle/removeturtle'; }
};
