module Admin
  class Admin::ArticlesController < ApplicationController
    before_action :set_admin_article, only: %i[ show edit update destroy submit approve reject ]

    # GET /admin/articles or /admin/articles.json
    def index
      if params[:status].present? && Article.statuses.keys.include?(params[:status])
        @articles = Article.where(status: params[:status])
      else
        @articles = Article.all
      end
    end

    # GET /admin/articles/1 or /admin/articles/1.json
    def show
    end

    # GET /admin/articles/new
    def new
      @article = Article.new
    end

    # GET /admin/articles/1/edit
    def edit
    end

    # POST /admin/articles or /admin/articles.json
    def create
      @article = Article.new(article_params)
      if params[:status_type] == "draft"
        @article.status = :draft
      else
        @article.status = :waiting_for_review
      end

      respond_to do |format|
        if @article.save
          format.html { redirect_to [ :admin, @article ] }
          format.json { render :show, status: :created, location: @article }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /admin/articles/1 or /admin/articles/1.json
    def update
      respond_to do |format|
        if @article.update(article_params)
          format.html { redirect_to [ :admin, @article ], status: :see_other }
          format.json { render :show, status: :ok, location: @article }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @article.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /admin/articles/1 or /admin/articles/1.json
    def destroy
      @article.destroy!

      respond_to do |format|
        format.html { redirect_to admin_articles_path, status: :see_other }
        format.json { head :no_content }
      end
    end

    def submit
      if @article.update(article_params.merge(status: "waiting_for_review"))
        redirect_to [ :admin, @article ], status: :see_other
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

    def approve
      if @article.update(article_params.merge(status: "published"))
        redirect_to [ :admin, @article ], status: :see_other
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

    def reject
      if @article.update(article_params.merge(status: "draft"))
        redirect_to [ :admin, @article ], status: :see_other
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_admin_article
        @article = Article.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def article_params
        params.require(:article).permit(:title, :description)
      end
  end
end
