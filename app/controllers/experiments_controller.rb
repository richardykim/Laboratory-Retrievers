class ExperimentsController < ApplicationController

  def index
    @experiments = Experiment.all
  end

  def new
    @experiment = Experiment.new
  end

  def create
    @experiment = Experiment.new(params[:experiment])

    if experiment.save
      redirect_to experiments_path
    else
      render 'experiments#new'
    end
  end

  def show
    @experiment = Experiment.find(params[:id])
  end

  def edit
    @experiment = Experiment.find(params[:id])
  end

  def update
    @experiment = Experiment.find(params[:id])
    if @experiment.update
      redirect_to @experiment
    else
      render 'edit'
    end
  end

  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy

    redirect_to experiments_path
  end

end
