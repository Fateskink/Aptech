import { useState, useEffect } from 'react';

function ProductList(props) {
    const [students, setStudents] = useState([]);
    const { x, y } = props;

    useEffect(() => {
        // Fetch data from API
        fetch('http://localhost:3001/students')
            .then(response => {
                debugger
                return response.json()
            })
            .then(data => {
                debugger
                setStudents(data);
            })
            .catch(error => {
                debugger
                console.error('Error fetching data:', error)
            });
        //do something1    
        //do something2    
    }, []);

    return (
        <>
            <h1>This is product list</h1>
            <h2>x = {x}, y = {y}</h2>
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
                    {students.map(student => (
                        <tr key={student.id}>
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

export default ProductList;
