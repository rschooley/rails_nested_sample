class Task < ActiveRecord::Base
  belongs_to :project

  validates :name, presence: true
  before_destroy :check_name

  private

  def check_name
    if name == "no"
      errors.add(:base, "can't delete this task")
      throw(:abort)
    end

    return true
  end
end
