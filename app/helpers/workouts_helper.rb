module WorkoutsHelper
  
  def list_of_exercises_for_workout(exercises)
    output = ''
    exercises.each_with_index do |exercise,i|
      output += exercise.name
      output += ', ' unless i+1 == exercises.size   # don't add a comma to the last item
    end
    return output
  end
  
end
