from question_model import Question
from data import question_data
from quiz_brain import QuizBrain

question_bank = [Question(i["question"], i["correct_answer"]) for i in question_data]
quiz = QuizBrain(question_bank)


while (quiz.stillHasQuestions()):
    quiz.nextQuestion()
    
print(f"Quiz finished!! Final Score: {quiz.score}")