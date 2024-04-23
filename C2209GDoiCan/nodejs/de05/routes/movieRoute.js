const express = require('express');
const router = express.Router();
const movieController = require('../controllers/movieController');

router.get('/', movieController.getMovies);//no validation
router.get('/:id', movieController.getMovieById);

router.get('/:id/students', (req, res) => {
    //curl -i http://localhost:3001/movies
  debugger
  return movieController.getMovies();  
});
router.post('/',     
    nameValidation,      
    (req, res) => {      
      const result = validationResult(req);
      if (result.isEmpty()) {        
       //if validation is ok, call controller's function
       return movieController.createMovie(req, res);       
      }    
      res.send({ errors: result.array() });                  
});

router.put('/:id', movieController.updateMovie); 
router.delete('/', movieController.deleteMovie);

module.exports = router;