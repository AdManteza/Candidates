# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program
MINIMUM_REQUIRED_EXPERIENCE = 2
DAYS_AGO = 15
GITHUB_POINTS = 100

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
  true if candidate[:github_points] >= GITHUB_POINTS
end

def knows_RubyOrPython?(candidate) # Know at least Ruby or Python
  true if candidate[:languages].include?("Ruby") || candidate[:languages].include?("Python") 
end

def applied_lately?(candidate) # Applied in the last 15 days
  true if candidate[:date_applied] >= DAYS_AGO.days.ago.to_date
end

def legal_age?(candidate) # Are over the age of 17 (18+)
  true if candidate[:age] > 17
end

def match_requirements?(index)
  experienced?(@candidates[index]) && 
  enough_github_points?(@candidates[index]) &&
  knows_RubyOrPython?(@candidates[index]) &&
  applied_lately?(@candidates[index]) &&
  legal_age?(@candidates[index])
end

def qualified_candidates
  output = []
  @candidates.each_with_index do |candidate, index|
    output.push(candidate) if match_requirements?(index)
  end
  output
end

def final_list_of_candidates
  @candidates.sort_by { |hash| [hash[:years_of_experience], hash[:github_points]] }.reverse!
end








