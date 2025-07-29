# CSE-316 Assembly Language Programming

This repository contains assembly language programming assignments and solutions for the CSE-316 course, focusing on x86 assembly programming using 8086 processor architecture.

## Course Information
- **Course**: CSE-316 Assembly Language Programming


## Repository Structure

```
📁 Offline1/
├── 2005102_Problem_1.asm          # Character classification program
├── 2005102_Problem_2.asm          # Three lowercase letters comparison
└── July_2023_CSE_316_Assembly_Offline_1.pdf

📁 Offline2/
├── 2005102_problem_1.asm          # Chocolate distribution problem (N & K values)
├── 2005102_problem_2.asm          # Second offline problem solution
└── July_2023_CSE_316_Assembly_Offline_2.pdf

📁 Online/
├── 2005102.asm                    # String vowel and consonant counter
└── July_2023_CSE_316_Assembly_Online_B1+B2.pdf
```

## Assignment Descriptions

### Offline Assignment 1
1. **Problem 1** (`2005102_Problem_1.asm`): Character Classification
   - Takes a single character input from user
   - Classifies the character as:
     - Uppercase letter (A-Z)
     - Lowercase letter (a-z)
     - Number (0-9)
     - Not alphanumeric
   - Uses ASCII value comparison for classification

2. **Problem 2** (`2005102_Problem_2.asm`): Three Lowercase Letters Comparison
   - Accepts three lowercase letters from user
   - Validates input to ensure only lowercase letters
   - Compares the three letters and determines relationships

### Offline Assignment 2
1. **Problem 1** (`2005102_problem_1.asm`): Chocolate Distribution
   - Takes two input values N and K separated by space
   - Calculates total number of chocolates based on given algorithm
   - Validates that K should be greater than 1
   - Implements mathematical computation in assembly

### Online Assignment
**String Analysis** (`2005102.asm`): Vowel and Consonant Counter
- Takes a string input from user
- Counts the number of vowels (both uppercase and lowercase)
- Counts the number of consonants
- Supports both cases: A, E, I, O, U and a, e, i, o, u