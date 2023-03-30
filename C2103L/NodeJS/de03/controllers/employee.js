const connection = require('../connection.js')
function getEmployees(callback) {
    debugger
    connection.query('SELECT * FROM employee', (err, results, fields) => {
        debugger
        callback(err, results)
    })  
}
function insertEmployee(parameters, callback) {
    const sql = "INSERT INTO employee("+              
    "FirstName,"+         
    "Code,"+                
    "LastName,"+            
    "Address,"+             
    "Phone,"+               
    "Mobile,"+              
    "Email ,"+              
    "Photo,"+               
    "CurriculumVitaeType,"+ 
    "CurriculumVitae,"+     
    "OrganizationID,"+      
    "DateofBirth,"+         
    "IndentifyNumber,"+     
    "IssuedPlace,"+         
    "IssuedDate,"+          
    "PresentResidence,"+    
    "RecruitedDate,"+       
    "DateOfEnteringOffice,"+
    "NominatedDate,"+       
    "SexID,"+               
    "PositionID,"+          
    "Status"+
    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)"
    debugger
    const {
        FirstName,         
        Code,                
        LastName,            
        Address,             
        Phone,               
        Mobile,              
        Email,              
        Photo,               
        CurriculumVitaeType, 
        CurriculumVitae,     
        OrganizationID,      
        DateofBirth,         
        IndentifyNumber,     
        IssuedPlace,         
        IssuedDate,          
        PresentResidence,    
        RecruitedDate,       
        DateOfEnteringOffice,
        NominatedDate,       
        SexID,               
        PositionID,          
        Status
    } = parameters    
    const values = [        
        FirstName,         
        Code,                
        LastName,            
        Address,             
        Phone,               
        Mobile,              
        Email,              
        Photo,               
        CurriculumVitaeType, 
        CurriculumVitae,     
        OrganizationID,      
        DateofBirth,         
        IndentifyNumber,     
        IssuedPlace,         
        IssuedDate,          
        PresentResidence,    
        RecruitedDate,       
        DateOfEnteringOffice,
        NominatedDate,       
        SexID,               
        PositionID,          
        Status]  
    debugger
    connection.execute(sql, values, (err, result) => {
        debugger
        if (err) {
            callback(err, null)
            return
        }   
        connection.query(
            'SELECT * FROM employee WHERE EmployeeID = ? LIMIT 1',
            [result.insertId], 
            (err, results, fields) => {
                debugger
                callback(err, results.length > 0 ? results[0] : {})            
            }
        )      
    })
}
module.exports = {
    getEmployees,
    insertEmployee
}