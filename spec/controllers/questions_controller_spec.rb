require 'spec_helper'

describe QuestionsController do
  let!(:question) { FactoryGirl.create(:question) }
  let!(:survey) { FactoryGirl.create(:survey) }

  describe "POST #create" do
    #breaking here
    #POST :create, {:survey_id => survey.id, :question_id => question.id}
  end



end
