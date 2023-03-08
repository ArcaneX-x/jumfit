class AnswerResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  # Fields generated from the model
  field :body, as: :markdown
  # field :user, as: :belongs_to
  # field :user_id, as: :number
  # field :question_id, as: :text
  # field :question, as: :belongs_to, -> { query.title }
  # add fields here
end
