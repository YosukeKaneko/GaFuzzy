# 1つの染色体に含まれるルール数：R1 ~Rrules
RULES = 10
POPULATION_SIZE = 50

# 世代数
GENERATIONS = 100

# 目的関数
# f(x) = Ax^2 + Bx + C
A = 1
B = 0
C = 5

# 値を特定する値域
# インプットxの値域: INPUT_RANGE
# アウトプットyの値域: OUTPUT_RANGE
INPUT_RANGE = [0.0, 3.0]
OUTPUT_RANGE = [4.0, 15.0]

# 評価ポイント数：EVAL_POINTS
# 評価のpitch：EVAL_PITCH
EVAL_POINTS = 10
EVAL_PITCH = ( INPUT_RANGE[1] - INPUT_RANGE[0] )/EVAL_POINTS.to_f
# de_fuzzyの評価ポイント数:DE_FUZZY_POINTS
DE_FUZZY_POINTS = 10
DE_FUZZY_PITCH = ( OUTPUT_RANGE[1] - OUTPUT_RANGE[0] )/DE_FUZZY_POINTS.to_f

# 選択する上位のchrosomeの割合
SELECT_CHROSOME_PERCENTAGE = 0.5
# 交叉が発生する確率
CROSSOVER_RATIO = 0.3
