class Admin::ProposalsController < ApplicationController
  include Secured
  include Logging
  include LogoutHelper

  before_action :is_admin?, :set_conference

  def index
    @proposals = @conference.proposals
    respond_to do |format|
      format.html
    end
  end

  def update_proposals
    params[:proposal].each do |proposal_id, value|
      proposal = Proposal.find(proposal_id)
      proposal[:status] = value[:status].to_i
      proposal.save
    end
    redirect_to admin_proposals_url, notice: "配信設定を更新しました"
  end

  private

  def is_admin?
    raise Forbidden unless admin?
  end
end
