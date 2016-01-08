class NewsController < ApplicationController
  before_action :set_news, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /news
  # GET /news.json
  def index
@user_id=current_user.id

@present_user=User.find(@user_id)

@User_categories=@present_user.categories







    @news = News.all

  end

  # GET /news/1
  # GET /news/1.json
  def show
  end

  # GET /news/new
  def new
    @news = News.new
    @all_categories= Category.all
    @news_category=@news.categories.build
  end

  # GET /news/1/edit
  def edit
    @all_categories= Category.all
  end

  # POST /news
  # POST /news.json
  def create
    @news = News.new(news_params)

    params[:category][:id].each do |e|

      if !e.empty?

        a=Category.find(e)
        @news.categories << a
      end
    end

    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
     if  @news.update(news_params)




        params[:category][:id].each do |e|

          if !e.empty?

            a=Category.find(e)
            @news.categories << a
          end
        end



        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def Home


  end


  def signout

    sign_out :user
  end

  def header


  end

  def category
@category=Category.new
  end

  def cat

  end

  def subscribe

    @category=Category.new(:name=>params[:name],:description=>params[:description])

    redirect_to 'news/Success'

  end

  def Success


  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:title,:subject,:content)
    end
end
