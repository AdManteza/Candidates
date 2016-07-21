# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
MINIMUM_REQUIRED_EXPERIENCE = 2

def print_all
  @candidates.each do |i|
    puts "----------------------------"
    puts i
  end
end

def find(id)
  @candidates.each_with_index do |candidate, index|
    candidate.each do |person|
      return @candidates[index] if candidate[:id] == id
    end
  end
  nil
end

def experienced?(candidate) # Are experienced?
  true if candidate[:years_of_experience] >= MINIMUM_REQUIRED_EXPERIENCE
end

# More methods will go below

def enough_github_points?(candidate) # Have 100 or more Github points
  true if candidate[:github_points] >= 100
end

def knows_RubyOrPython?(candidate) # Know at least Ruby or Python
  true if candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python") 
end

def applied_lately?(candidate) # Applied in the last 15 days
  true if candidate[:date_applied] >= 15.days.ago.to_date
end

def legal_age?(candidate) # Are over the age of 17 (18+)
  true if candidate[:age] > 17
end

def qualified_candidates
  output = []
  @candidates.each_with_index do |candidate, index|
    if  [  
        experienced?(@candidates[index]),
        enough_github_points?(@candidates[index]),
        knows_RubyOrPython?(@candidates[index]),
        applied_lately?(@candidates[index]),
        legal_age?(@candidates[index])
        ].all?

      output.push(candidate) 
    end
  end
  output
end

def ordered_by_qualifications
  @candidates.sort_by { |hsh| hsh[:years_of_experience] }.reverse!
end


def sort_if_equal_experience
  arr = ordered_by_qualifications
  n = arr.length

  (n-1).times do |i|
    if arr[i][:years_of_experience] == arr[i + 1][:years_of_experience]
      if arr[i][:github_points] < arr[1 + i][:github_points]
        arr[i], arr[i + 1] = arr[i + 1], arr[i]
      end
    end
  end
  
  arr
end

def display_qualified
  p sort_if_equal_experience
end







