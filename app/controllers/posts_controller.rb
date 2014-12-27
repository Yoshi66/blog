class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json



  #def options_for_elements
    #@elements = Array(1..18).split(',')
   # list = "H,He,Li,Be,B,C,N,O,F,Ne,Na,Mg,Al,Si,P,S,Cl,Ar,K,Ca,Sc,Ti,V,Cr,Mn,Fe,Co,Ni,Cu,Zn,Ga,Ge,As,Se,Br,Kr,Rb,Sr,Y,Zr,Nb,Mo,Tc,Ru,Rh,Pd,Ag,Cd,In,Sn,Sb,Te,I,Xe,,Cs,Ba,Hf,Ta,W,Re,Os,Ir,Pt,Au,Hg,Tl,Pb,Bi,Po,At,Rn,Fr,Ra,Rf,Db,Sg,Bh,Hs,Mt,Ds,Rg,Cn,Uut,Fl,Uup,Lv,Uus,Uuo,La,Ce,Pr,Nd,Pm,Sm,Eu,Gd,Tb,Dy,Ho,Er,Tm,Yb,Lu,Ac,Th,Pa,U,Np,Pu,Am,Cm,Bk,Cf,Es,Fm,Md,No,Lr".split(',')
    #total = Array.new
    #list.each do |a|
     # total << [a]
      #logger.debug total
    #end
  #end

  def index
    @numbers = Array(1..18)
    @line1 = ['H', 'He']
    @line2_1 = ['Li','Be']
    @line2_2 = ['B','C','N','O','F','Ne']
    @line3_1 = ['Na', 'Mg']
    @line3_2 = "Al,Si,P,S,Cl,Ar".split(',')
    @line4 = "K,Ca,Sc,Ti,V,Cr,Mn,Fe,Co,Ni,Cu,Zn,Ga,Ge,As,Se,Br,Kr".split(',')
    logger.debug @line4
    @line5 = 'Rb,Sr,Y,Zr,Nb,Mo,Tc,Ru,Rh,Pd,Ag,Cd,In,Sn,Sb,Te,I,Xe'.split(',')
    @line6 = 'Cs,Ba,*,Hf,Ta,W,Re,Os,Ir,Pt,Au,Hg,Tl,Pb,Bi,Po,At,Rn'.split(',')
    @line7 = 'Fr,Ra,**,Rf,Db,Sg,Bh,Hs,Mt,Ds,Rg,Cn,Uut,Fl,Uup,Lv,Uus,Uuo'.split(',')
    @line8 = ' ,*,La,Ce,Pr,Nd,Pm,Sm,Eu,Gd,Tb,Dy,Ho,Er,Tm,Yb,Lu, ,'.split(',')
    @line9 = ' ,**,Ac,Th,Pa,U,Np,Pu,Am,Cm,Bk,Cf,Es,Fm,Md,No,Lr, ,'.split(',')
    @posts = Post.all
  end


  #def MakeLink(a)
   # if Post.exists?(:position => a)
    #  <span class='grid1 first'><%= link_to @line2_1.first, Post.find_by(position: @line2_1.first)%></span>
   # else
    #  <span class='grid1 first'><%= link_to @line2_1.first, '#' %>
    #end
  #end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @article = Article.new
  end


  def hbr(str)
    h(str).gsub(/(\r\n?)|(\n)/, "<br />")
  end

  # GET /posts/new
  def new
    @post = Post.new
    @article = Article.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    logger.debug '/////////////////////'
    logger.debug params[:article][:pass]
    if params[:article][:pass] == 'apple'
      @post = Post.new(post_params)
      @article = @post.articles.build(article_params)
      respond_to do |format|
        if @post.save
          format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
          format.json { render action: 'show', status: :created, location: @post }
        else
          format.html { render action: 'new' }
          format.json { render json: @post.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to posts_path
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:position)
    end

    def article_params
      params.require(:article).permit(:title, :subtitle,:content,:pass)
    end
end
