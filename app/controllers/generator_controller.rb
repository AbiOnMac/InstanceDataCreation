class GeneratorController < ApplicationController
  def show
    render :json => data(params[:id])
  end

  def data(id)
    result = chat_gpt_result(id)

    create_data_instance(result)
    result[:relationships]
  end

  def create_data_instance(result)
    result[:factory_bot].each do |factory_name|
      pp "FactoryBot.create_list(:#{factory_name[:name]}, #{factory_name[:count]})"
    end
  end

  def chat_gpt_result(id)
    case(id.to_i)
    when 1
      data1
    when 2
      data2
    when 3
      data3
    when 4
      data4
    end
  end

  def data1
    {
      relationships: [
        { source: "Jobseekers [20]", target: "Vacancies [20]" },
        { source: "Vacancies [20]", target: "Sites [5]" },
      ],
      factory_bot: [
        {
          name: 'jobseeker',
          count: 20
        },
        { 
          name: 'vacancies',
          count: 20},
        { 
          name: 'site',
          count: 5
      }
      ]
    }
  end


  def data2
    {
      relationships: [
        { source: "Users [50]", target: "Students [50]" },
        { source: "Students [50]", target: "Enrollments [10]" },
        { source: "Users [50]", target: "Enrollments [10]" },
        { source: "Enrollments [10]", target: "Courses [20]" },
      ],
      factory_bot: [
        {
          name: 'users',
          count: 50
        },
        { 
          name: 'students',
          count: 50},
        { 
          name: 'enrollments',
          count: 10
        },
        {
          name: 'courses',
          count: 20
        }
      ]
    }
  end

  def data3
    {
      relationships: [
        { source: "Users [60]", target: "Teachers [10]" },
        { source: "Users [60]", target: "Students [50]" },
        { source: "Teachers [10]", target: "Courses [20]" },
        { source: "Students [50]", target: "Enrollments [10]" },
        { source: "Courses [20]", target: "Enrollments [10]" },
      ],
      factory_bot: [
        {
          name: 'users',
          count: 60
        },
        { 
          name: 'teachers',
          count: 10},
        { 
          name: 'students',
          count: 50
        },
        {
          name: 'courses',
          count: 20
        },
        {
          name: 'enrollments',
          count: 10
        }
      ]
    }
  end

  def data4
    {
      relationships: [
        { source: "Users [50]", target: "Enrollments [10]" },
        { source: "Users [60]", target: "Students [50]" },
        { source: "Users [60]", target: "Students [50]" },
        { source: "Jobseekers [40]", target: "Sites [17]" },
        { source: "Courses [20]", target: "Announcements [150]" },
        { source: "Courses [20]", target: "Assignments [32]" },
        { source: "Grade [50]", target: "Assignments [32]" },
        { source: "Courses [20]", target: "Attendances [94]" },
        { source: "Students [50]", target: "Attendances [94]" },
        { source: "Courses [20]", target: "Materials [68]" },
        { source: "Courses [20]", target: "Enrollments [10]" },
        { source: "Students [50]", target: "Enrollments [10]" },
        { source: "Teachers [10]", target: "Courses [20]" },
        { source: "Vacancies [49]", target: "Sites [17]" },
        { source: "Jobseekers [40]", target: "Sites [17]" },
      ],
      factory_bot: [
        {
          name: 'users',
          count: 60
        },
        { 
          name: 'students',
          count: 50
        },
        { 
          name: 'teachers',
          count: 10
        },
        {
          name: 'jobeekers',
          count: 40,
        },
        {
          name: 'courses',
          count: 20
        },
        {
          name: 'announcements',
          count: 150,
        },
        {
          name: 'assignments',
          count: 32,
        },
        {
          name: 'attendances',
          count: 94,
        },
        {
          name: 'enrollments',
          count: 10
        },
        {
          name: 'grades',
          count: 50,
        },
        {
          name: 'materials',
          count: 68,
        },
        {
          name: 'vacancies',
          count: 49,
        },
        {
          name: 'sites',
          count: 17,
        }
      ]
    }
  end
end
