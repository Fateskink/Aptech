import { useState, useEffect } from 'react';
import { fetchStudents } from '../api/studentApi';

function StudentList(props) {
    const [students, setStudents] = useState([]);        
    useEffect(() => {
        const fetchData = async () => {
            try {
                const data = await fetchStudents();
                setStudents(data);
            } catch (error) {
                console.error('Error fetching students:', error);
            }
        };

        fetchData();
    }, []);

    return (
        <>
            <h1>This is Student list</h1>            
            
            <table>
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Email</th>
                        <th>Phone</th>
                    </tr>
                </thead>
                <tbody>
                {students.map((student, index) => (
                    <tr key={student.id || index}>
                        <td>{student.name}</td>
                        <td>{student.age}</td>
                        <td>{student.email}</td>
                        <td>{student.phone}</td>
                    </tr>
                ))}
                </tbody>
            </table>
        </>
    );
}

export default StudentList;
