import React, { useState } from 'react';
import {useNavigate} from 'react-router-dom'
import { insertStudent } from '../api/studentApi';
import { getStudentById } from '../api/studentApi';
import { useParams } from 'react-router-dom';
import { useEffect } from 'react';
const UpdateStudent = () => {  
  const { id } = useParams(); // Get student ID from URL
  const [student, setStudent] = useState({
    name: '',
    age: '',
    email: '',
    phone: '',
  });
  const fetchStudent = async () => {
    try {
      debugger
      const data = await getStudentById(id); // Fetch student by ID
      debugger
      setStudent(data); // Set student state with fetched data
    } catch (error) {
      console.error('Error fetching student:', error);
    }
  };
    useEffect(() => {    
        fetchStudent();
    }, [id]);

  const navigate = useNavigate();
  const handleSubmit = async (e) => {
    
  };

  return (
    <div>
      <h1>Update Student</h1>
      <form onSubmit={handleSubmit}>
        <div>
          <label>Name:</label>
          <input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
          />
        </div>
        <div>
          <label>Age:</label>
          <input
            type="number"
            value={age}
            onChange={(e) => setAge(e.target.value)}
          />
        </div>
        <div>
          <label>Email:</label>
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
          />
        </div>
        <div>
          <label>Phone:</label>
          <input
            type="text"
            value={phone}
            onChange={(e) => setPhone(e.target.value)}
          />
        </div>
        <button type="submit">Submit</button>
      </form>
    </div>
  );
};

export default UpdateStudent;
