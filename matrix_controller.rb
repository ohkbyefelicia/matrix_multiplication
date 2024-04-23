class MatrixController < ApplicationController
  def index
  end

  def multiply_matrices
    
    rows1 = params[:rows1].to_i
    cols1 = params[:cols1].to_i
    matrix1 = params[:matrix1].split("\n").map { |row| row.split.map(&:to_i) }

    rows2 = params[:rows2].to_i
    cols2 = params[:cols2].to_i
    matrix2 = params[:matrix2].split("\n").map { |row| row.split.map(&:to_i) }

    unless cols1 == rows2
      flash[:error] = "Matrix dimensions are not compatible for multiplication!"
      redirect_to root_path and return
    end

  
    result = Array.new(rows1) { Array.new(cols2, 0) }
    rows1.times do |i|
      cols2.times do |j|
        rows2.times do |k|
          result[i][j] += matrix1[i][k] * matrix2[k][j]
        end
      end
    end

   
    session[:matrix_result] = result

  
    redirect_to root_path
  end
end

