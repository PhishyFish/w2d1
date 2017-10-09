require 'byebug'

class Employee
  attr_reader :employees, :salary
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    @employees = []
    @boss.add_employee(self) unless boss.nil?
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

  def add_employee(subemployee)
    @employees << subemployee
  end
end

class Manager < Employee
  def initialize(name, title, salary, boss, employees = [])
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    @bonus = subemployees_salaries * multiplier
  end

  def subemployees_salaries
    total = 0
    @employees.each do |subemployee|
      if subemployee.employees.empty?
        total += subemployee.salary
      else
        total += subemployee.salary + subemployee.subemployees_salaries
      end
    end

    total
  end

end
