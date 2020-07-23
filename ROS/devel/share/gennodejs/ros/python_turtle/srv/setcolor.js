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

class setcolorRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.turtle_name = null;
      this.color = null;
    }
    else {
      if (initObj.hasOwnProperty('turtle_name')) {
        this.turtle_name = initObj.turtle_name
      }
      else {
        this.turtle_name = '';
      }
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type setcolorRequest
    // Serialize message field [turtle_name]
    bufferOffset = _serializer.string(obj.turtle_name, buffer, bufferOffset);
    // Serialize message field [color]
    bufferOffset = _serializer.string(obj.color, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setcolorRequest
    let len;
    let data = new setcolorRequest(null);
    // Deserialize message field [turtle_name]
    data.turtle_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [color]
    data.color = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.turtle_name.length;
    length += object.color.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'python_turtle/setcolorRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '781e74da0d60a55b2bbef1601ceb3a3d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string turtle_name
    string color
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new setcolorRequest(null);
    if (msg.turtle_name !== undefined) {
      resolved.turtle_name = msg.turtle_name;
    }
    else {
      resolved.turtle_name = ''
    }

    if (msg.color !== undefined) {
      resolved.color = msg.color;
    }
    else {
      resolved.color = ''
    }

    return resolved;
    }
};

class setcolorResponse {
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
    // Serializes a message object of type setcolorResponse
    // Serialize message field [ret]
    bufferOffset = _serializer.int8(obj.ret, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setcolorResponse
    let len;
    let data = new setcolorResponse(null);
    // Deserialize message field [ret]
    data.ret = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'python_turtle/setcolorResponse';
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
    const resolved = new setcolorResponse(null);
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
  Request: setcolorRequest,
  Response: setcolorResponse,
  md5sum() { return '4e5c5e738507cfbcc1070c9c1e8f412e'; },
  datatype() { return 'python_turtle/setcolor'; }
};
