// Description:
// List of QA devices
//
// Commands:
// Paulbot devices - Get list of devices
// Paulbot qa - Get list of devices
//
// Author:
// Robbins Cleozier

module.exports = function(robot) {

    var devices = [
      {
        'name' : 'Apple Iphone 5',
        'specs' : 'Fast!',
        'type' : 'Phone'
      },
      {
        'name' : 'Apple Iphone 6',
        'specs' : 'Fast!',
        'type' : 'Phone'
      },
      {
        'name' : 'Samsung Galaxy S4',
        'specs' : 'Fast!',
        'type' : 'Phone'
      },
      {
        'name' : 'Moto X',
        'specs' : 'Fast!',
        'type' : 'Phone'
      },
      {
        'name' : 'Galaxy Tab',
        'specs' : 'Fast!',
        'type' : 'Tablet'
      },
      {
        'name' : 'Lenevo Thinkpad',
        'specs' : 'Fast!',
        'type' : 'Laptop'
      },
    ];

    robot.respond(/(devices|qa)/i, function(msg) {
      devices.forEach(function(device){
        msg.send(device.name + " - Device Type: " + device.type);
      });
    });
}