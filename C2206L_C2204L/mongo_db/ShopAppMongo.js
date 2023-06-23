db.createCollection("roles");
db.roles.createIndex({ name: 1 }, { unique: true });
db.createCollection("users", {
  validator: {
    $jsonSchema: {
      bsonType: "object",
      required: ["id", "phone_number", "password"],
      properties: {        
        fullname: {
          bsonType: "string",
          maxLength: 100
        },
        phone_number: {
          bsonType: "string",
          minLength: 1,
          maxLength: 20
        },
        address: {
          bsonType: "string",
          maxLength: 200
        },
        password: {
          bsonType: "string",
          minLength: 1,
          maxLength: 32
        },
        role_id: {
          bsonType: "objectId"
        },
        created_at: {
          bsonType: "date"
        },
        updated_at: {
          bsonType: "date"
        },
        deleted: {
          bsonType: "int"
        }
      }
    }
  }
});
