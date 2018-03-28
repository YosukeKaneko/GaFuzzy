require './CONSTANTS'
require './Gene/Population'
require './Eval/EvalFunction'
require './Eval/RulesEvaluator'


population = Population.new POPULATION_SIZE, RULES
population.set_random_gene_array INPUT_RANGE, OUTPUT_RANGE
rules_evaluator = RulesEvaluator.new RULES
eval_func = EvalFunction.new A, B, C

GENERATIONS.times do |generation|

    population.reset_score
    EVAL_POINTS.times do |eval_step|
        eval_input = INPUT_RANGE[0] + EVAL_PITCH * eval_step
        POPULATION_SIZE.times do |chrosome_index|
            rules_evaluator.reset_evaluator(population.population_array[chrosome_index], eval_input)
            DE_FUZZY_POINTS.times do |defuzzy_step|
                defuzzy_input = OUTPUT_RANGE[0] + DE_FUZZY_PITCH * defuzzy_step
                population.evaluation_array[chrosome_index][0] += (rules_evaluator.evaluate defuzzy_input) * defuzzy_input
                population.evaluation_array[chrosome_index][1] += rules_evaluator.evaluate defuzzy_input
            end
            population.score_hash[chrosome_index] = 0 if population.score_hash[chrosome_index].nil?
            population.score_hash[chrosome_index] += population.set_score chrosome_index, eval_input, eval_func
        end
    end

    population.reorder_score_hash
    p population.score_hash.first[1]
    if generation < GENERATIONS - 1
        population.select_chrosome SELECT_CHROSOME_PERCENTAGE
        population.crossover CROSSOVER_RATIO
    end

end
