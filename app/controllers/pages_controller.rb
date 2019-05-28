class PagesController < ApplicationController
  helper TopicsHelper
  before_action :set_sidebar_topics
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end

  private

  def set_sidebar_topics
    @side_bar_topics = Topic.with_blogs
  end
end
