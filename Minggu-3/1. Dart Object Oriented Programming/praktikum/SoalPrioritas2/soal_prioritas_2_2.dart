/* 

Soal : 

Buatlah sebuah class Course dan Student dengan kriteria sebagai berikut:
  a. Atribut dari Course terdiri dari judul dan deskripsi.
  b. Atribut dari Student terdiri dari nama, kelas dan daftar course yang dimiliki.
  c. Student dapat menambahkan course.
  d. Student dapat menghapus course.
  e. Student dapat melihat semua course yang telah ditambahkan.

 */
class Course {
  String title;
  String description;

  Course(this.title, this.description);
}

class Student {
  String name;
  String className;
  List<Course> courses = [];

  Student(this.name, this.className);

  // Menambahkan course ke daftar course student
  void addCourse(Course course) {
    courses.add(course);
  }

  // Menghapus course dari daftar course student
  void removeCourse(Course course) {
    courses.remove(course);
  }

  // Melihat semua course yang dimiliki student
  void viewCourses() {
    print('Courses owned by $name:');
    for (var course in courses) {
      print('${course.title}: ${course.description}');
    }
  }
}

void main() {
  // Membuat objek Course
  var course1 = Course('Math', 'Basic math course');
  var course2 = Course('History', 'World history course');
  var course3 = Course('Science', 'General science course');

  // Membuat objek Student
  var student = Student('John', 'Grade 10');

  // Menambahkan course ke daftar course student
  student.addCourse(course1);
  student.addCourse(course2);
  student.addCourse(course3);

  // Menampilkan semua course yang dimiliki student
  student.viewCourses();

  // Menghapus course dari daftar course student
  student.removeCourse(course2);

  // Menampilkan kembali daftar course setelah penghapusan
  student.viewCourses();
}
