const axios = require('axios');
const {print, LOG_TYPE} = require('./LOG')

const SERVER_NAME = 'localhost'
const SERVER_PORT = 8081
const URL_EMPLOYEES = () => `http://${SERVER_NAME}:${SERVER_PORT}/api/employees`
const URL_DETAIL_EMPLOYEE = (id) => `http://${SERVER_NAME}:${SERVER_PORT}/api/employees/${id}`
const URL_INSERT_EMPLOYEE = () => `http://${SERVER_NAME}:${SERVER_PORT}/api/employees`
const URL_UPDATE_EMPLOYEE = (id) => `http://${SERVER_NAME}:${SERVER_PORT}/api/employees/${id}`
const URL_DELETE_EMPLOYEE = (id) => `http://${SERVER_NAME}:${SERVER_PORT}/api/employees/${id}`


const getAllEmployees = () => {
    axios.get(URL_EMPLOYEES())
  .then(response => {
    console.log(response.data);
  })
  .catch(error => {
    print(error.message);
  });
}
const insertEmployee = async ({name, age, address, salary}) => {
    try {
      let response = await axios.post(
        URL_INSERT_EMPLOYEE(),
        {name, age, address, salary})
    }catch(error) {
      print(error.message);
    }      
}
const getDetailEmployee = async(id) => {
  try {
    let response = await axios.get(id)
  }catch(error) {
    print(error.message);
  }      
}
const updateEmployee = async ({id, name, age, address, salary}) => {
  try {
    let response = await axios.put(id, {name, age, address, salary})
  }catch(error) {
    print(error.message);
  }        
}
const deleteEmployee = async (id) => {
  try {
    let response = await axios.delete(`${URL_DELETE_EMPLOYEE}/${id}`, )
  }catch(error) {
    print(error.message);
  }  
}
module.exports = {
    getAllEmployees,
    insertEmployee,
    updateEmployee,
    deleteEmployee
}
//node logsModules.js 
//run test
const testAll = async () => {
  await getAllEmployees()
  await insertEmployee()
  await updateEmployee()
  await deleteEmployee()
}
testAll()