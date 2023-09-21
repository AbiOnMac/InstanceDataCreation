Entities and Attributes:

- User (name, email)
- Student (user_id, date_of_birth)
- Teacher (user_id, qualification)
- Jobseeker (full_name, email, site_id)
- Course (name, description)
- Announcement (title, content, course_id)
- Assignment (title, description, course_id)
- Attendance (date, student_id, course_id)
- Enrollment (user_id, student_id, course_id)
- Grade (score, student_id, assignment_id)
- Material (title, file_url, course_id)
- Vacancy (title, site_id)
- Site (name, location)

Relationships:

- User has_many Enrollments
- Student has_one User
- Teacher has_one User
- Jobseeker belongs_to Site
- Course has_many Announcements, Assignments, Attendances, Materials, Enrollments
- Announcement belongs_to Course
- Assignment belongs_to Course
- Attendance belongs_to Course, Student
- Enrollment belongs_to User, Student, Course
- Grade belongs_to Student, Assignment
- Material belongs_to Course
- Vacancy belongs_to Site
- Site has_many Jobseekers, Vacancies
