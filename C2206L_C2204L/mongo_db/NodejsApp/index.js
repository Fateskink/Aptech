require('dotenv').config();
const connectToDatabase = require('./database.js');
const category = require('./models/category');
const product = require('./models/product');

async function main() {
  try {
    // Kết nối đến MongoDB
    
    console.log('haha2')
    const db = await connectToDatabase();    
    // Thực hiện các truy vấn hoặc tác vụ khác tại đây

    console.log('haha')
    /*
    product.getAllProducts()
      .then(products => {
        console.log('haha1')
        console.log('All products:', products);
      })
      .catch(error => {
        debugger
        console.log('haha error')
        console.error('Error getting products:', error);
      });
      */
    debugger
    let foundProduct = await product.getProductById('649978df3c284874103032f5')
    debugger

    // const collection = db.collection('mycollection');
    // const documents = await collection.find().toArray();
    // console.log(documents);
  } catch (error) {
  	debugger
    console.error('Lỗi:', error);
  }
}



// Sử dụng các hàm CRUD của categoryModel và productModel
// Ví dụ:
/*
category.createCategory({ name: 'Electronics' })
  .then(categoryId => {
    console.log('Created category with ID:', categoryId);
  })
  .catch(error => {
    console.error('Error creating category:', error);
  });
*/
main().catch(console.error);



