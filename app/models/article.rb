class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  validates :title, presence: {message: "请输入标题!"}, length: {minimum: 5, message: "请输入5个字符以上的标题！"}
  validates :text, presence: {message: "请输入内容!"}
end
