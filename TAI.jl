# Test AI: forward propagation through a small neural network
# Program-ID:   TAI.jl
# Language:     Julia
# Run:          julia TAI.jl
# Network:      2 inputs, 2 hidden neurons, 1 output neuron
# Purpose:      XOR: output class 1 when the two binary inputs differ.
# Scope:        Hand-set weights; this program does NOT train a model.
# Reference:    https://developers.google.com/machine-learning/crash-course/neural-networks/activation-functions

relu(x) = max(0.0, x)              # negative values become zero
sigmoid(x) = 1.0 / (1.0 + exp(-x)) # maps these finite inputs to scores in (0, 1)

function forward_pass(x, W1, b1, W2, b2)
    z1 = W1 * x + b1              # weighted sums plus biases: 2 values
    hidden = relu.(z1)            # . applies ReLU to each hidden neuron
    z2 = W2 * hidden + b2         # output layer: a vector with 1 value
    score = sigmoid(z2[1])
    predicted = score >= 0.5 ? 1 : 0
    return z1, hidden, z2[1], score, predicted
end

function main()
    # Each row contains the incoming weights for one neuron.
    W1 = [1.0 -1.0; -1.0 1.0]     # 2 hidden neurons x 2 inputs
    b1 = [0.0, 0.0]
    W2 = [1.0 1.0]               # 1 output neuron x 2 hidden neurons
    b2 = [-0.5]

    println("Neural network: 2 inputs -> 2 hidden neurons -> 1 output")
    println("Hand-set XOR weights; forward pass only, no training.")
    println("A score >= 0.5 selects class 1. Scores are not validated confidence.")

    inputs = [[0.0, 0.0], [0.0, 1.0], [1.0, 0.0], [1.0, 1.0]]
    targets = [0, 1, 1, 0]
    for (x, target) in zip(inputs, targets)
        z1, hidden, z2, score, predicted = forward_pass(x, W1, b1, W2, b2)
        println("\nInput = $x; expected XOR class = $target")
        println("Hidden weighted sums = $z1")
        println("After ReLU = $hidden")
        println("Output weighted sum = $z2")
        println("Sigmoid score = $(round(score; digits=4)); predicted class = $predicted")
    end
end

main()

#= Output:
Neural network: 2 inputs -> 2 hidden neurons -> 1 output
Hand-set XOR weights; forward pass only, no training.
A score >= 0.5 selects class 1. Scores are not validated confidence.

Input = [0.0, 0.0]; expected XOR class = 0
Hidden weighted sums = [0.0, 0.0]
After ReLU = [0.0, 0.0]
Output weighted sum = -0.5
Sigmoid score = 0.3775; predicted class = 0

Input = [0.0, 1.0]; expected XOR class = 1
Hidden weighted sums = [-1.0, 1.0]
After ReLU = [0.0, 1.0]
Output weighted sum = 0.5
Sigmoid score = 0.6225; predicted class = 1

Input = [1.0, 0.0]; expected XOR class = 1
Hidden weighted sums = [1.0, -1.0]
After ReLU = [1.0, 0.0]
Output weighted sum = 0.5
Sigmoid score = 0.6225; predicted class = 1

Input = [1.0, 1.0]; expected XOR class = 0
Hidden weighted sums = [0.0, 0.0]
After ReLU = [0.0, 0.0]
Output weighted sum = -0.5
Sigmoid score = 0.3775; predicted class = 0
=#
