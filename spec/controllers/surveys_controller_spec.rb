require 'spec_helper'

describe SurveysController do
  let!(:survey) { FactoryGirl.create(:survey) }

  describe "GET #index" do
    it "it assigns @surveys" do
      get :index
      expect(assigns(:surveys)).to eq([survey])
    end
  end

  describe "GET #show" do
    it "should know which survey was selected" do
      get :show, id: survey
      expect(assigns(:survey)).to eq(survey)
    end
  end

  describe "GET #new" do
    it "renders the :new template" do
      get :new
      response.should render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new survey in the database" do
        expect {post :create, survey: FactoryGirl.attributes_for(:survey)}.to change(Survey, :count)
      end

      it "redirects to the show page" do
        expect {post :create, survey: FactoryGirl.attributes_for(:survey)}.to change(Survey, :count)
        expect(response).to redirect_to(assigns(:survey))
      end
    end
    
    context "with invalid attributes" do
      it "does not save the new survey in the database if title is nil" do
        expect {post :create, survey: FactoryGirl.attributes_for(:invalid_survey_title)}.to_not change(Survey, :count)
      end

      it "does not save the new survey in the database if description is nil" do
        expect {post :create, survey: FactoryGirl.attributes_for(:invalid_survey_desc)}.to_not change(Survey, :count)
      end

      it "re-renders the :new template" do
        post :create, survey: FactoryGirl.attributes_for(:invalid_survey_desc)
        expect(response).to render_template(:new)
      end

      it "collects errors, duh" do
        post :create, survey: FactoryGirl.attributes_for(:invalid_survey_desc)
        assigns(:survey).errors.empty?.should_not be_true
      end
    end


  end


end
