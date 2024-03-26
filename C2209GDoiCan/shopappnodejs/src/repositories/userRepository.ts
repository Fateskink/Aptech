import { getClient } from '../db/db';

export async function getUsers() {
  try {
    const client = getClient();
    const db = client.db('shopapp');
    const collection = db.collection('users');
    const users = await collection.find().toArray();
    return users;
  } catch (error) {
    console.error('Error fetching users:', error);
    return [];
  }
}
export default {
    getUsers
}

