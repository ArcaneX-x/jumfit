class UserResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :name, as: :text
  field :phone, as: :text
  field :role, as: :select, enum: ::User.roles
  field :email, as: :text
  # field :payments, as: :has_many
  # field :course_users, as: :has_many
  # field :courses, as: :has_many, through: :course_users
  # field :questions, as: :has_many
  # field :answers, as: :has_many
  # field :profile, as: :has_one
  # add fields here
end
