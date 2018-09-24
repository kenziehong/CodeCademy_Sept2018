//create a class
class Surgeon {
   constructor(name, department) {
    this._name = name;
    this._department = department;
    this._remainingVacationDays = 20;
  }
  
  get name() {
    return this._name;
  }
  
  get department() {
    return this._department;
  }
  
  get remainingVacationDays() {
    return this._remainingVacationDays;
  }
  
  takeVacationDays(daysOff) {
    this._remainingVacationDays -= daysOff;
  }
}


/* create an instance and save it to a variable named 
-create a new variable named surgeonCurry that will store an instance of Surgeon class
-use new keyword to generate a new instance of Surgeon class. The new keyword calls the constructor(), run the code inside of it, and then return the new instance
-pass'Curry','Cardiovascular' string to the Surgeon constructor, which sets the name property to 'Curry', the department property to 'Cardiovascular'
*/
const surgeonCurry = new Surgeon ('Curry','Cardiovascular');

const surgeonDurant = new Surgeon('Durant','Orthopedics');

console.log(surgeonCurry.name);
surgeonCurry.takeVacationDays(3);
console.log(surgeonCurry.remainingVacationDays);



-------------------------------------------------------------------------

class HospitalEmployee {
  constructor(name) {
    this._name = name;
    this._remainingVacationDays = 20;
  }
  
  get name() {
    return this._name;
  }
  
  get remainingVacationDays() {
    return this._remainingVacationDays;
  }
  
  takeVacationDays(daysOff) {
    this._remainingVacationDays -= daysOff;
  }


  //create a static method 
  static generatePassword(){
    return Math.floor(Math.random()*10000);
  }
}

class Nurse extends HospitalEmployee{
  constructor(name,certifications){
    super(name);
    this._certifications = certifications;
  }

  get certifications(){
    return this._certifications;
  }
  addCertification(newCertification){
    this._certifications.push(newCertification);
  }
  
}
// create new Nurse named nurseOlynyk, pass the values for each property
const nurseOlynyk = new Nurse ('Olynyk',['Trauma', 'Pediatrics'])

//Call .takeVacationDays() with an input of 5 on your nurseOlynyk instance.
nurseOlynyk.takeVacationDays(5);

//log the value saved to the remainingVacationDays property in nurseOlynyk
console.log(nurseOlynyk.remainingVacationDays);

//call the .addCertification() method on nurseOlynyk with a parameter of 'Genetics'
nurseOlynyk.addCertification('Genetics');

//Log the value saved to the certifications property of nurseOlynyk
console.log(nurseOlynyk.certifications);