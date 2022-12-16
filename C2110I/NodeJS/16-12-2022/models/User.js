import { ObjectId } from "mongoose"
import { isEmail } from 'validator'
const User = mongoose.model('User', 
    new Schema({
        id: {type: ObjectId},
        name: { 
            type: String, 
            required: true,
            //model validation
            validate: {
                validator: () => this.name.length > 3,
                message: 'UserName must be at least 3 characters'
            }        
        },
        email: {
            type: String, 
            validate: {
                validator: () => isEmail,
                message: 'Email is incorrect format'
            }
        },
        password: { 
            //hashed/encrypted password
            type: String, 
            required: true,            
            //validate ??            
        },        
        
        phoneNumber: { 
            type: String, 
            required: true,        
        },
        address: { 
            type: String, 
            required: false,        
        },
    }, { 
        autoCreate: false, 
        autoIndex: true 
    })
)
export default User