require "test_helper"

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "create" do
    assert_difference "Employee.count", 1 do
      post "/employees.json", params: {first_name: "test", last_name: "test", email: "email", phone:"34232322", title:"test", department_id: Department.first.id}
      assert_response 200
    end
    assert_difference "Employee.count", 0 do
      post "/employees.json", params: {first_name: "test", last_name: "test", email: "email", phone:"34232322", title:"test", department_id: Department.first.id}
      assert_response 422
    end
  end

  test "index" do
    get "/employees.json"
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal Employee.count, data.length
  end

  test "show" do
    employee = Employee.first
    get "/employees/#{Employee.first.id}.json"
    assert_response 200
    data = JSON.parse(response.body)
    assert_equal employee.first_name, data["first_name"]
  end

  test "destroy" do
    assert_difference "Employee.count", -1 do
      delete "/employees/#{Employee.first.id}.json"
      assert_response 200
    end
  end

  test "update" do
    employee = Employee.first
    patch "/employees/#{employee.id}.json", params: {email: "Bob"}
    assert_response 200
    updated_employee = Employee.find(employee.id)
    assert_equal "Bob" , updated_employee.email
  end
end
