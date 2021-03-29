//create a variable with const called Airplane and set it equal to the value of the require () function
//'./1-airplane.js' is the argument we pass to the require() function
const Airplane = require('./1-airplane.js');

//define a function displayAirplane(). In the function, log the value of the module and its property to the console.
function displayAirplane(){
  console.log(Airplane.myAirplane);
}

//Call the displayAirplane() function. In the console, you should see the name of the airplane you defined in the module.
displayAirplane();

---------------------------------------------------------------
INTERMEDIATE JAVASCRIPT MODULES
module.exports II

//file 2-airplane.js

// 1.create an object named Airplane
const Airplane = {};

//2.set module.exports equal to an empty object
module.exports = {
  
  //3.within the object, create a key called myAirplane and set it to a value "CloudJet"
  myAirplane: "CloudJet",
  
  //4.create another key displayAirplane and set it to anonymous function. The function should use the this statement to return myAirplane
   displayAirplane: function() {
    return this.myAirplane;
  } 
  
};
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

//file 2-missionControl.js

//5. in 2-missionControl.js use the require() function to import the Airplane module

const Airplane = require('./2-airplane.js');

//6.in 2-missionControl.js log the displayAirplane() to the console, noting that it is a method of Airplane object
console.log(Airplane.displayAirplane());



-----------------------------------------------------------------------
INTERMEDIATE JAVASCRIPT MODULES
export default

//file airplane.js

//1. create an object to represent the module called Airplane
const Airplane = { 
  
};

//2.add data in the form of properties and values to the Airplane module
//create an availableAirplanes variable and set it equal to an empty array. 
Airplane.availableAirplanes = [
  {name: 'AeroJet', fuelCapacity: 800},
  {name: 'SkyJet', fuelCapacity: 500}
];

//4.Use export default to export the Airplane module
export default Airplane;

//file missionControl.js

//1. use the import keyword to import the Airplane module
import Airplane from './airplane';

//2. define a function displayFuelCapacity()
function displayFuelCapacity(){
  
  //3.use forEach() to iterate over the Airplane.availableAirplanes array
  Airplane.availableAirplanes.forEach(function(element){
    console.log('Fuel Capacity of ' + element.name + ': ' + element.fuelCapacity);
  });
}



----------------------------------------------------------------------------
INTERMEDIATE JAVASCRIPT MODULES
Named Exports

//file airplane.js

let availableAirplanes = [{
 name: 'AeroJet',
 fuelCapacity: 800,
  
  //3.add a property availableStaff, and set it equal to an array with the elements 
 availableStaff: ['pilots', 'flightAttendants', 'engineers', 'medicalAssistance', 'sensorOperators'],
}, 
{name: 'SkyJet',
 fuelCapacity: 500,
 availableStaff: ['pilots', 'flightAttendants']
}];

//4.Define a new variable with let named flightRequirements, and set it equal to an empty object
let flightRequirements = {
  
  //5.Within the flightRequirements object, add a property requiredStaff, and set this equal to 4
  requiredStaff: 4,
};

//6.Define a function with the name meetsStaffRequirements() that takes availableStaff and requiredStaff as parameters.
function meetsStaffRequirements(availableStaff, requiredStaff) {
  
  //7.write logic to check if the length of the availableStaff array is greater than or equal to requiredStaff
  if (availableStaff.length >= requiredStaff) {
    return true;
  } else {
    return false;
  }
};


//8.Using the export keyword, export the variables availableAirplanes, flightRequirements and meetsStaffRequirements
export { availableAirplanes, flightRequirements, meetsStaffRequirements};
//6.call the displayFuelCapacity function
displayFuelCapacity();


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INTERMEDIATE JAVASCRIPT MODULES
Named Imports

//file missionControl.js

import {availableAirplanes, flightRequirements, meetsStaffRequirements} from './airplane';

function displayFuelCapacity() {
  availableAirplanes.forEach(function(element) {
    console.log('Fuel Capacity of ' + element.name + ': ' + element.fuelCapacity);
  });
}

displayFuelCapacity();


//3.Define a function displayStaffStatus()
function displayStaffStatus() {
  
  //4 Within the body of the displayStaffStatus() function, use the forEach to iterate over the availableAirplanes array. Specifically, the forEach() should take a function as a parameter. The function should in turn take element as a parameter
  availableAirplanes.forEach(function(element) {
   
    
    //6....call the meetsStaffRequirements method, passing in two parameters element.availableStaff and flightRequirements.requiredStaff
    console.log(element.name + ' meets staff requirements: ' + meetsStaffRequirements(element.availableStaff, flightRequirements.requiredStaff) );
  });
}


//7.Call the displayStaffStatus() function.
displayStaffStatus();