require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @salaries = salaries
        @funding = funding
        @employees = []
    end

    def valid_title?(title)
        @salaries.keys.include?(title)
    end

    def hire(name, title)
        raise "That position doesn't exist" if !valid_title?(title)
        
        @employees << Employee.new(name, title)
    end

    def size
        @employees.size
    end

    def average_salary
        @employees.sum {|emp| @salaries[emp.title]}.div(@employees.count)
    end

    def payday
        @employees.each {|e| pay_employee(e)}
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]

        raise "Not enough funding" if @funding < salary

        employee.pay(salary)
        @funding -= salary
    end

    def close
        @funding = 0
        @employees = []
    end

    def acquire(startup)
        @funding += startup.funding
        @salaries.merge!(startup.salaries) {|key, old_val, new_val| old_val}
        @employees.concat(startup.employees)
        startup.close
    end

    def >(startup)
        @funding > startup.funding
    end

end
