const baseUrl = 'http://localhost:3001/api'
document.addEventListener('DOMContentLoaded', () => {
    debugger
    const studentForm = document.getElementById('studentForm');
    const studentTable = document.getElementById('studentTable');

    // Sự kiện khi form được nộp (submit)
    studentForm.addEventListener('submit', async (e) => {        
        e.preventDefault();
        debugger
        // Lấy dữ liệu từ form
        const formData = new FormData(studentForm);
        const studentData = {
            Name: formData.get('name'),
            Age: parseInt(formData.get('age')),
            Address: formData.get('address'),
            JavaScore: parseFloat(formData.get('javaScore')),
            CSharpScore: parseFloat(formData.get('cSharpScore'))
        };

        // Gửi yêu cầu POST để thêm sinh viên mới
        try {
            const response = await fetch(`${baseUrl}/students`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(studentData)
            });

            if (response.ok) {
                // Nếu thêm thành công, làm mới danh sách sinh viên
                fetchStudentList();
                studentForm.reset();
            } else {
                console.error('Thêm sinh viên mới không thành công.');
            }
        } catch (error) {
            console.error('Lỗi khi gửi yêu cầu:', error);
        }
    });

    // Sự kiện khi nút xóa được nhấn
    studentTable.addEventListener('click', async (e) => {
        debugger
        if (e.target.matches('.delete-button')) {
            if (confirm('Bạn có chắc chắn muốn xóa sinh viên này không?')) {
                const studentId = e.target.dataset.studentId;
                // Gửi yêu cầu DELETE để xóa sinh viên
                try {
                    const response = await fetch(`${baseUrl}/students/${studentId}`, {
                        method: 'DELETE'
                    });

                    if (response.ok) {
                        // Nếu xóa thành công, làm mới danh sách sinh viên
                        fetchStudentList();
                    } else {
                        console.error('Xóa sinh viên không thành công.');
                    }
                } catch (error) {
                    console.error('Lỗi khi gửi yêu cầu:', error);
                }
            }
        }
    });

    // Hàm để lấy danh sách sinh viên và hiển thị trên trang
    async function fetchStudentList() {
        try {
            debugger
            const response = await fetch(`${baseUrl}/students`);
            if (response.ok) {
                const students = await response.json();
                const tbody = studentTable.querySelector('tbody');
                tbody.innerHTML = '';

                students.forEach((student) => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${student.Id}</td>
                        <td>${student.Name}</td>
                        <td>${student.Age}</td>
                        <td>${student.Address}</td>
                        <td>${student.JavaScore}</td>
                        <td>${student.CSharpScore}</td>
                        <td>
                            <button 
                                class="delete-button" 
                                data-student-id="${student.Id}">Xóa</button>
                        </td>
                    `;
                    tbody.appendChild(row);
                });
            } else {
                console.error('Lấy danh sách sinh viên không thành công.');
            }
        } catch (error) {
            console.error('Lỗi khi gửi yêu cầu:', error);
        }
    }

    // Khi trang được tải, lấy danh sách sinh viên lần đầu
    fetchStudentList();
});
