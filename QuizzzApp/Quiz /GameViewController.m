//
//  GameViewController.m
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-22.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "GameViewController.h"
#import "ResultViewController.h"
#import "../Question.h"

@interface GameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *qLabel;
@property (weak, nonatomic) IBOutlet UILabel *a1Label;
@property (weak, nonatomic) IBOutlet UILabel *a2Label;
@property (weak, nonatomic) IBOutlet UILabel *a3Label;

@property NSMutableArray *questions;

@property int iterator;

@end

@implementation GameViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.questions = [[NSMutableArray alloc]init];
    
    [self loadInitialData];

}

-(void)loadInitialData{
    
    self.iterator = 0;

    Question *q1 = [[Question alloc]initWithText:@"question 1"
                                   correctAnswer:@"a"
                                    alternatives:@[@"b",@"c"]];
    [self.questions addObject:q1];
    
    Question *q2 = [[Question alloc]initWithText:@"question 2"
                                   correctAnswer:@"a"
                                    alternatives:@[@"b", @"c"]];
    [self.questions addObject:q2];
    
    Question *q3 = [[Question alloc]initWithText:@"question 3 "
                                   correctAnswer:@"a"
                                    alternatives:@[@"b", @"c"]];
    [self.questions addObject:q3];
    
    [self prepareQuestion];
    
}

- (IBAction)handleClick:(id)sender {
    
    [self prepareQuestion];
    
}

-(void)prepareQuestion{
    
    if(self.iterator < 3){
        
        [self prepareNextQuestion:self.iterator];
        
        self.iterator += 1;
        
    } else {
        
        [self performSegueWithIdentifier:@"Results" sender:self];
        
    }
}

-(void)prepareNextQuestion:(int)iteratorValue{
    
    Question *currentQuestion = self.questions[iteratorValue];
    
    self.qLabel.text = currentQuestion.text;
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    NSString *segueIdentifier = segue.identifier;
    
    if([segueIdentifier isEqualToString:@"Results"]){
    
        ResultViewController *destination = [segue destinationViewController];
        
        destination.result = [NSString stringWithFormat:@"hello world!"];
    }
}



@end
