// Auto-generated. Do not edit!

// (in-package python_turtle.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class setposeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.turtle_pose = null;
    }
    else {
      if (initObj.hasOwnProperty('turtle_pose')) {
        this.turtle_pose = initObj.turtle_pose
      }
      else {
        this.turtle_pose = new geometry_msgs.msg.PoseStamped();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type setposeRequest
    // Serialize message field [turtle_pose]
    bufferOffset = geometry_msgs.msg.PoseStamped.serialize(obj.turtle_pose, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setposeRequest
    let len;
    let data = new setposeRequest(null);
    // Deserialize message field [turtle_pose]
    data.turtle_pose = geometry_msgs.msg.PoseStamped.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += geometry_msgs.msg.PoseStamped.getMessageSize(object.turtle_pose);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'python_turtle/setposeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '91edf5f7b15029459831b436799cd78a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/PoseStamped turtle_pose
    
    ================================================================================
    MSG: geometry_msgs/PoseStamped
    # A Pose with reference coordinate frame and timestamp
    Header header
    Pose pose
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
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
    const resolved = new setposeRequest(null);
    if (msg.turtle_pose !== undefined) {
      resolved.turtle_pose = geometry_msgs.msg.PoseStamped.Resolve(msg.turtle_pose)
    }
    else {
      resolved.turtle_pose = new geometry_msgs.msg.PoseStamped()
    }

    return resolved;
    }
};

class setposeResponse {
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
    // Serializes a message object of type setposeResponse
    // Serialize message field [ret]
    bufferOffset = _serializer.int8(obj.ret, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type setposeResponse
    let len;
    let data = new setposeResponse(null);
    // Deserialize message field [ret]
    data.ret = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'python_turtle/setposeResponse';
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
    const resolved = new setposeResponse(null);
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
  Request: setposeRequest,
  Response: setposeResponse,
  md5sum() { return 'c7286894f126aa93e3ce655b0b322988'; },
  datatype() { return 'python_turtle/setpose'; }
};
