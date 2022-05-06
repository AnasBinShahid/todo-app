# frozen_string_literal: true

# == Schema Information
#
# Table name: tasks
#
#  id         :bigint           not null, primary key
#  content    :text             not null
#  completed  :boolean          default(FALSE), not null
#  remind_at  :datetime
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Task < ApplicationRecord
  acts_as_paranoid

  validates :content, :completed, presence: true
end
