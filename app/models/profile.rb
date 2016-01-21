class Profile < ActiveRecord::Base
  belongs_to :user

  validates :gender, inclusion: { in: ["male", "female"] }
  validate :name_validator
  validate :no_sue_validator

  def name_validator
    if first_name.nil? && last_name.nil?
      errors.add :first_name, "and Last Name cannot both be blank"
      errors.add :last_name, "and First Name cannot both be blank"
    end
  end

  def no_sue_validator
    if gender == "male" && first_name == "Sue"
      errors.add :first_name, "cannot be Sue!"
    end
  end

  def self.get_all_profiles min_year, max_year
    where("birth_year BETWEEN :min_year AND :max_year",
    min_year: min_year, max_year: max_year
    ).order :birth_year
  end
end
