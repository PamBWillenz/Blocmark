# == Schema Information
#
# Table name: topics
#
#  id         :integer          not null, primary key
#  title      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Topic < ActiveRecord::Base
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
end
