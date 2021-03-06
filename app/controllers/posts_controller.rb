class PostsController < ApplicationController

  before_filter :authenticate, :except => [:index, :show]
  # GET /posts
  # GET /posts.xml
  #def index
  #  @posts = Post.all
  #end
  def index
    @posts = Post.paginate(:per_page => 6, :page => params[:page], :order => 'created_at DESC')
  end

  def monthlyarchive
    monthyear = params[:format]

    @firstdate = DateTime.parse(monthyear)
    logger.debug(@firstdate)
    @lastdate = DateTime.new(@firstdate.year, @firstdate.month, @firstdate.day).next_month-1
    logger.debug(@lastdate)
    @posts_by_month = Post.paginate(:per_page => 6 , :page => params[:page], :conditions => ["created_at between ? and ?", @firstdate, @lastdate])
    @month = monthyear
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    @post = Post.find(params[:id])
    @title = @post.title
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.xml
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.xml
  def create
    @post = Post.new(params[:post])
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(@post, :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.xml
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to(@post, :notice => 'Post was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(posts_url) }
      format.xml  { head :ok }
    end
  end

  def search_tags
    # Find a user with matching all tags, not just one
    @searchedTag = params[:tag]
    @posts = Post.tagged_with(@searchedTag).by_date.paginate(:page => params[:page], :per_page => 6)

  end

  def tag_cloud
    @tags = Post.tag_counts_on(:tags)
  end
end
