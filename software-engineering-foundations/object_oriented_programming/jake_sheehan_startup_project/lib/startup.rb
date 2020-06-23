require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def >(startup)
        if @funding > startup.funding
            return true
        else
            return false
        end
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "error: not a valid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = salaries[employee.title]

        if @funding > salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "error: insufficient funds"
        end
    end

    def payday
        @employees.each { |employee| pay_employee(employee) }
    end

    def average_salary
        total_salaries = 0

        @employees.each do |employee|
            total_salaries += salaries[employee.title]
        end

        total_salaries / employees.length
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding

        startup.salaries.each do |title, salary|
            @salaries[title] = salary if !@salaries.include?(title)
        end

        startup.employees.each do |employee|
            @employees << employee
        end

        startup.close
    end

end
