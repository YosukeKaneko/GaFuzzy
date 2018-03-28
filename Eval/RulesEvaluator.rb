class RulesEvaluator
    attr_reader :chrosome, :rules, :fitness_array, :eval_input

    def initialize rules
        @rules = rules
    end

    def reset_evaluator chrosome, eval_input
        @chrosome = chrosome
        @fitness_array = calc_fitness_array chrosome, rules, eval_input
        @eval_input = eval_input
    end

    def evaluate eval_point
        output_at_eval_point = 0
        @rules.times do |rule_index|
            chrosome_index = rule_index * 3 + 3*@rules
            tmp = calc_ruleset_output chrosome[chrosome_index..(chrosome_index+2)], eval_point, @fitness_array[rule_index]
            # p tmp
            output_at_eval_point = tmp > output_at_eval_point ? tmp : output_at_eval_point
        end
        # p "#{eval_point} : #{output_at_eval_point}"
        output_at_eval_point
    end

    # メンバシップ関数の出力の算出
    def calc_fitness membership_array, eval_input
        return 0 if eval_input <= membership_array[0] || membership_array[2] <= eval_input
        if eval_input <= membership_array[1]
            ( 1 - 0 ) / ( membership_array[1] - membership_array[0] ).to_f * ( eval_input - membership_array[0] )
        else
            1 + ( 0 - 1 ) / ( membership_array[2] - membership_array[1] ).to_f * ( eval_input - membership_array[1] )
        end
    end

    # 前件部の適合度を計算
    def calc_fitness_array chrosome, rules, eval_input
        fitness_array = Array.new
        rules.times do |rule_index|
            chrosome_index = rule_index*3
            fitness_array[rule_index] = calc_fitness chrosome[chrosome_index..(chrosome_index+2)], eval_input
        end
        fitness_array
    end

    # ルールセットの出力を算出
    def calc_ruleset_output membership_array, eval_point, fitness
        [calc_fitness(membership_array, eval_point), fitness].min
    end
end
