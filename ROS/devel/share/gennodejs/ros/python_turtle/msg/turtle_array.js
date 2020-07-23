// Auto-generated. Do not edit!

// (in-package python_turtle.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let turtle = require('./turtle.js');

//-----------------------------------------------------------

class turtle_array {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.turtles = null;
    }
    else {
      if (initObj.hasOwnProperty('turtles')) {
        this.turtles = initObj.turtles
      }
      else {
        this.turtles = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type turtle_array
    // Serialize message field [turtles]
    // Serialize the length for message field [turtles]
    bufferOffset = _serializer.uint32(obj.turtles.length, buffer, bufferOffset);
    obj.turtles.forEach((val) => {
      bufferOffset = turtle.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type turtle_array
    let len;
    let data = new turtle_array(null);
    // Deserialize message field [turtles]
    // Deserialize array length for message field [turtles]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.turtles = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.turtles[i] = turtle.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.turtles.forEach((val) => {
      length += turtle.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'python_turtle/turtle_array';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a167676d2b4e0f20402b9b02bac07167';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    turtle[] turtles
    ================================================================================
    MSG: python_turtle/turtle
    string name
    geometry_msgs/Pose turtle_pose
    string color
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new turtle_array(null);
    if (msg.turtles !== undefined) {
      resolved.turtles = new Array(msg.turtles.length);
      for (let i = 0; i < resolved.turtles.length; ++i) {
        resolved.turtles[i] = turtle.Resolve(msg.turtles[i]);
      }
    }
    else {
      resolved.turtles = []
    }

    return resolved;
    }
};

module.exports = turtle_array;
