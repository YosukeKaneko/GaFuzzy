require './Gene/Select'
require './Gene/Crossover'

class Population
    include Select
    include Crossover

    attr_accessor :population_array, :score_hash, :evaluation_array, :eval_array
    attr :rules, :population

    def initialize population_size, rules
        @population_array = Array.new(population_size).map{ Array.new 2*rules*3, 0 }
        @score_hash = {}
        @evaluation_array = Array.new(population_size, 0).map{ Array.new 2, 0 }
        @eval_array = Array.new(population_size, 0).map{ Array.new 2, 0 }
        @population_size = population_size
        @rules = rules
    end

    def reset_score
        @score_hash.clear
        @evaluation_array.map! {|element| element = Array.new 2, 0}
    end

    def set_random_gene_array input, output
        random  = Random.new
        temp_membership_array = Array.new
        @population_array.each_with_index do |chrosome, chrosome_index|
            @rules.times do |rule_index|
                temp_membership_array[0] = random.rand input[0]..input[1]
                temp_membership_array[1] = random.rand input[0]..input[1]
                temp_membership_array[2] = random.rand input[0]..input[1]
                temp_membership_array.sort!
                chrosome_index_1 = rule_index*3
                @population_array[chrosome_index][chrosome_index_1..(chrosome_index_1+2)] =  temp_membership_array[0..2]

                temp_membership_array[0] = random.rand output[0]..output[1]
                temp_membership_array[1] = random.rand output[0]..output[1]
                temp_membership_array[2] = random.rand output[0]..output[1]
                temp_membership_array.sort!
                chrosome_index_2 = 3*@rules + rule_index*3
                @population_array[chrosome_index][chrosome_index_2..(chrosome_index_2+2)] = temp_membership_array[0..2]
            end
        end
    end

    def set_score chrosome_index, eval_input, eval_func
        output = if (@evaluation_array[chrosome_index][1] == 0)
                    0
                else
                    @evaluation_array[chrosome_index][0] / @evaluation_array[chrosome_index][1]
                end
        calc_score eval_input, output, eval_func
    end

    def reorder_score_hash
        @score_hash = Hash[ @score_hash.sort_by{ |_, v| v } ]
    end

    def calc_score eval_input, output, eval_func
        (eval_func.calc(eval_input) - output).abs
    end

    def mutate
    end

end
