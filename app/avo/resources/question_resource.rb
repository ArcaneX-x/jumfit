class QuestionResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end
 self.default_view_type = :grid

  field :id, as: :id
  # Fields generated from the model
  field :title, as: :text
  field :body, as: :textarea
  # field :user_id, as: :number
  # field :user, as: :belongs_to
  field :answers, as: :has_many
  # add fields here

  grid do 
    title :title, as: :text
    body :body, as: :text
    # cover :image, as: :file, link_to_resource: true
  end
end
