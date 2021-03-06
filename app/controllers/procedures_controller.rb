class ProceduresController < ApplicationController
  def new
    unauthorized
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @procedure = Procedure.new
    @used_steps = []
    @unused_steps = (1..10).to_a
    @experiment.procedures.each do |p|
      @used_steps << p.step
    end
    @unused_steps -= @used_steps

  end

  def create
    unauthorized
    @experiment = Experiment.find(params[:experiment_id])
    @experiment_proposal = @experiment.experiment_proposal
    @procedure = @experiment.procedures.new(procedure_params)
    if @procedure.save
      redirect_to "/experiment_proposals/#{@experiment_proposal.id}/experiments/#{@experiment.id}"
    else
      @errors = @procedure.errors.full_messages
      render 'new'
    end
  end

  private
  def procedure_params
    params.require(:procedure).permit(:body, :step, :experiment_id)
  end
end
