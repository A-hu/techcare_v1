FactoryGirl.define do
  factory :caregiver do
    introduction "I'm A caregiver."
    experience "I'm a CAREGIVER"
    skill "caregiving"
    licence_number "123123123"
    licence_offdate Time.now
    training "CARE"
  end
end
