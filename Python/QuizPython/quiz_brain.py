class QuizBrain():
    def __init__(self,questions_list):
        self.question_number = 0
        self.questions_list = questions_list
        self.score = 0
    
    def stillHasQuestions(self):
        return self.question_number < len(self.questions_list)
        
    def nextQuestion(self):
        ans = input(f"Q.{self.question_number + 1}:{self.questions_list[self.question_number].text}(True/False)?:\n> ")
        self.check_answer(ans,self.questions_list[self.question_number].answer)
        self.question_number += 1
        print(f"Score: {self.score}\n")
        
    def check_answer(self,ans,correctAns):
        if ans.lower() == correctAns.lower():
            print("\nYou got it right!")
            self.score += 1
        else:
            print("\nNuh uh")
            print(f"Correct Answer: {correctAns}")
