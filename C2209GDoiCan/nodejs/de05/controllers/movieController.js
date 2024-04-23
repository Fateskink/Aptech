const Movie = require('../models/Movie');
const errorHandler = require('./errorHandler');
import connection from '../db/db';

const createMovie = async (req, res) => {
    debugger
    const { title, year, time, release_date, country } = req.body;
    debugger
    const xx= await connection.execute(
        'INSERT INTO movies(title, year, time, release_date, country) VALUES(?, ?, ?, ?, ?)',        
        [title, year, time, release_date, country]
      );
    //res.status(201).json(Movie);
};

// Controller functions
const getMovies = async (req, res) => {
    
};

const getMovieById = async (req, res) => {
  const { id } = req.params;
  //return res.status(404).json({ error: 'Movie not found' });
};


  
const updateMovie = async (req, res) => {
    const { id } = req.params;
    const { name, description } = req.body;
    
  };
const deleteMovie = async (req, res) => {
    const { id } = req.params;
    
  };

  module.exports = { 
    getMovies, 
    getMovieById, 
    createMovie,  
    updateMovie, 
    deleteMovie, 
 };
