import axios from 'axios';

export const fetchStudents = async () => {
    const url = `${import.meta.env.VITE_APP_API_BASE_URL}/students`;
    const response = await axios.get(url);
    
    if (response.status !== 200) {
        throw new Error('Failed to fetch students');
    }

    return response.data;
};
