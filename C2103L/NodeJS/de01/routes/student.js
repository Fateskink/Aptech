
const express = require('express')
const router = express.Router();
const connection = require('../connection')

router.get('/', async (req, res) => {
  connection.query('SELECT * FROM student', (err, results, fields) => {
    if (err) throw err;
    res.json(results)  
  })  
});
router.get('/:id', async (req, res) => {
  res.send('return with id');
});
router.post('/', async (req, res) => {
  const {name, age, address, javaScore,csharpScore} = req.body
  const sql = 'INSERT INTO student(name, age, address, javaScore,csharpScore) VALUES (?,?,?,?,?)';
  const values = [name, age, address, javaScore,csharpScore];  
  connection.execute(sql, values, (err, result) => {
    debugger
    if (err) throw err;    
    connection.query(
      'SELECT * FROM student WHERE id = ? LIMIT 1',
      [result.insertId], 
      (err, results, fields) => {
        debugger
        if (err) throw err;
        res.json(results.length > 0 ? results[0] : {})  
      })
    console.log(`Inserted ${result.affectedRows} rows.`);
  });
  
});
router.put('/:id', async (req, res) => {
  const {id} = req.params;
  const {name, age, address, javaScore,csharpScore} = req.body
  const updates = {};
  if (name !== undefined) updates.name = name;
  if (age !== undefined) updates.age = age;
  if (address !== undefined) updates.address = address;
  if (javaScore !== undefined) updates.javaScore = javaScore;
  if (csharpScore !== undefined) updates.csharpScore = csharpScore;

  if (Object.keys(updates).length === 0) {
    res.status(400).json({ error: 'No fields to update' });
    return;
  }

  const sql = 'UPDATE student SET '              
  const values = [];  
  Object.keys(updates).forEach((key, index) => {
    sql += `${key} = ?, `;
    values.push(updates[key]);
  });
  sql = sql.slice(0, -2);  
  sql += ' WHERE id = ?';
  values.push(userId);

  connection.execute(sql, values, (err, result) => {
    debugger
    if (err) throw err;    
    connection.query(
      'SELECT * FROM student WHERE id = ? LIMIT 1',
      [id], 
      (err, results, fields) => {
        debugger
        if (err) throw err;
        res.json(results.length > 0 ? results[0] : {})  
      })
  });
});
router.delete('/:id', async (req, res) => {
  const {name, age, address, javaScore,csharpScore} = req.body
  const sql = 'DELETE FROM student WHERE id = ?';
  const values = [req.params.id];  
  connection.execute(sql, values, (err, result) => {
    debugger
    if (err) throw err;    
    res.json({
      message: 'Delete student successfully'
    })    
  });
});
module.exports = router;