class Bird < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    def create
        bird = Bird.create!(bird_params)
        render json: bird, status: :created
      rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

    def update
        bird = find_bird
        bird.update!(bird_params)
        render json: bird
      rescue ActiveRecord::RecordInvalid => invalid
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end
end
