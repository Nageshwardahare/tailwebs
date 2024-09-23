# spec/models/student_spec.rb
RSpec.describe Student, type: :model do
  it 'creates a valid student' do
    student = FactoryBot.create(:student)  # This will create and persist a Student record
    expect(student).to be_valid
  end
end
