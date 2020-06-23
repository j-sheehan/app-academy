# Jake Sheehan

class Bootcamp
    # Init method
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |hash, k| hash[k] = [] }
    end

    ### Get methods ###
    
    def name
        @name
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    ### Set methods ###

    # Adds teacher to teachers array
    def hire(teacher)
        @teachers << teacher
    end

    # Adds student to student array if not at capacity; returns bool
    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return true
        else
            return false
        end
    end

    # Adds a grade to a students grades; returns bool
    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true
        else
            return false
        end
    end

    ### Instance methods ###

    # Checks if student is part of students array
    def enrolled?(student)
        @students.any? { |s| s.casecmp?(student) }
    end

    # Returns integer, rounded down, of student/teacher ratio
    def student_to_teacher_ratio
        (@students.length / @teachers.length).floor
    end

    # Returns the number of grades a student has
    def num_grades(student)
        @grades[student].length
    end

    # Returns the average grade or nil
    def average_grade(student)
        if enrolled?(student) && num_grades(student) > 0
            @grades[student].sum / num_grades(student)
        else
            return nil
        end
    end

end
