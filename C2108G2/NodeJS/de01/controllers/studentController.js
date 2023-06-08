const db = require('../db')
// C - Create
exports.createStudent = (req, res) => {
    let { name, age, address, javascore, csharpscore } = req.body;
    let sql = 'INSERT INTO student (name, age, address, javascore, csharpscore) VALUES (?, ?, ?, ?, ?)';
    let data = [name, age, address, javascore, csharpscore];

    db.query(sql, data, (error, result) => {
        if (error) throw error;
        res.send('Student created successfully!');
    });
};

// R - Read
exports.getAllStudents = (req, res) => {
    let sql = 'SELECT * FROM student';    
    debugger
    db.query(sql, (error, results) => {
        debugger
        if (error) throw error;
        res.json(results);
    });
};

exports.getStudentById = (req, res) => {
    let id = req.params.id;
    let sql = 'SELECT * FROM student WHERE id = ?';

    db.query(sql, id, (error, result) => {
        if (error) throw error;
        res.json(result[0]);
    });
};

// U - Update
exports.updateStudent = (req, res) => {
    let id = req.params.id;
    let { name, age, address, javascore, csharpscore } = req.body;
    //remove SQL injection
    let sql = 'UPDATE student SET name = ?, age = ?, address = ?, javascore = ?, csharpscore = ? WHERE id = ?';
    let data = [name, age, address, javascore, csharpscore, id];

    db.query(sql, data, (error, result) => {
        if (error) throw error;
        res.send('Student updated successfully!');
    });
};

// D - Delete
exports.deleteStudent = (req, res) => {
    let id = req.params.id;
    let sql = 'DELETE FROM student WHERE id = ?';

    db.query(sql, id, (error, result) => {
        if (error) throw error;
        res.send('Student deleted successfully!');
    });
};
