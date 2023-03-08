class CourseResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
   self.default_view_type = :grid

  # field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :description, as: :textarea
  field :price, as: :number
  # field :course_users, as: :has_many
  # field :users, as: :has_many, through: :course_users
  field :lessons, as: :has_many
  # field :payments, as: :has_many
  # add fields here

  grid do 
    title :title, as: :text
    body :description, as: :text
    # cover :image, as: :file, link_to_resource: true
  end
end
