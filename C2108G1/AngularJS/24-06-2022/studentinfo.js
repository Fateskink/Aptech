const app = angular.module('myApp', [
    //list of modules                    
])   
function convertDateTimeToString(date) {    
    let month = date.getMonth() + 1
    month = month < 10 ? `0${month}` : month
    let day = date.getDate() < 10 ? `0${date.getDate()}`: `${date.getDate()}`
    let year = date.getFullYear()
    return `${day}/${month}/${year} `
}
app.controller('StudentController', function($scope){                                
    $scope.languages = [
        {
            name: "English",
            checked: false
        }, 
        {
            name: "Vietnamese",
            checked: true
        }, 
        {
            name: "French",
            checked: false
        }, 
        {
            name: "Japanese", //field 
            checked: false,            
        }, 
        {
            name: "German",
            checked: true
        }]
    $scope.genders = [
        {name: "Male", checked: false},
        {name: "Female", checked: false},
        {name: "Undefined", checked: true},
    ]
    $scope.students = []

    $scope.studentClasses = ["C1908G", "C2012A", "C1105"]
    $scope.changeLanguage = function(index) {
        console.log(`index = ${index}`)     
        $scope.languages[index].checked = !$scope.languages[index].checked                             
    }
    $scope.changeGender = function(index) {        
        for(let i = 0; i < $scope.genders.length; i++) {            
            $scope.genders[i].checked = (i == index);            
        }        
    }
    $scope.btnAddStudent = function() {
        //alert(JSON.stringify($scope.languages))
        //alert(JSON.stringify($scope.selectedClass))
        //alert(JSON.stringify($scope.genders))
        
        const selectedGender = $scope.genders.filter(item => item.checked == true)[0]
        const selectedLanguages = $scope.languages.filter(item => item.checked == true)
        console.log(`name: ${$scope.studentName}, dob = ${$scope.dateOfBirth}, 
                gender: ${JSON.stringify(selectedGender)},
                selected languages: ${JSON.stringify(selectedLanguages)})}
                selectedClass = ${JSON.stringify($scope.selectedClass)}`)        
        let student = {
            id: `${Date.now() / 1000}`, 
            name: $scope.studentName,
            class: $scope.selectedClass,
            //dob: $scope.dateOfBirth,
            //dob: $scope.dateOfBirth.toISOString().substring(0, 10) //acceptable
            dob: convertDateTimeToString($scope.dateOfBirth),
            language: selectedLanguages.map(item => item.name)?.join(', '),
            gender: selectedGender.name
        }                        
        $scope.students.push(student)
    }
    $scope.btnAddClass = function() {
        
    }
    $scope.btnDeleteStudent = function(studentId) {
        debugger
        $scope.students = $scope.students.filter(item => item.id != studentId)
        debugger
    }
})
