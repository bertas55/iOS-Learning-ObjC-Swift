//
//  QuizViewController.m
//  Quiz
//
//  Created by Hubert on 17.02.2016.
//  Copyright © 2016 Hubert. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@property (nonatomic) int currrentQuestionIndex;

@property (nonatomic, copy) NSArray *questions;
@property (nonatomic, copy) NSArray *answers;


@property (nonatomic, weak) IBOutlet UILabel *questionLabel;
@property (nonatomic, weak) IBOutlet UILabel *answerLabel;

@end


@implementation QuizViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    // Call the init method implemented by the superclass
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if(self)
    {
        self.questions = @[@"From what is cognac made?", @"What is 7 + 7?", @"What is the capital of Vermont?"];
        
        self.answers = @[@"Grapes", @"14", @"Montepelier"];
    }
    
    return self;
}


- (IBAction)showQuestion:(id)sender
{
    self.currrentQuestionIndex++;
    
    if(self.currrentQuestionIndex == [self.questions count])
    {
        self.currrentQuestionIndex = 0;
    }
    
    NSString *question = self.questions[self.currrentQuestionIndex];
    
    self.questionLabel.text = question;
    
    self.answerLabel.text = @"???";
}

- (IBAction)showAnswer:(id)sender
{
    NSString *answer = self.answers[self.currrentQuestionIndex];
    
    self.answerLabel.text = answer;
    
}

@end
