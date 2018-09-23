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



@property int iterator;

@end

@implementation GameViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self loadInitialData];

}

-(void)loadInitialData{
    
    self.iterator = 0;

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
    
    NSMutableArray *allAnswers = [@[]mutableCopy];
    
    [allAnswers addObject:currentQuestion.correctAnswer];
    
    for (NSString *alternative in currentQuestion.alternatives) {
        [allAnswers addObject:alternative];
    }
    
    [self prepareOptions:allAnswers];
    
}

-(void)prepareOptions:(NSMutableArray *)options{
    for (NSUInteger i = (options.count - 1); i > 0; i--) {
        NSUInteger j = arc4random_uniform(i + 1);
        [options exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    
    self.a1Label.text = options[0];
    self.a2Label.text = options[1];
    self.a3Label.text = options[2];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    NSString *segueIdentifier = segue.identifier;
    
    if([segueIdentifier isEqualToString:@"Results"]){
    
        ResultViewController *destination = [segue destinationViewController];
        
        destination.result = [NSString stringWithFormat:@"hello world!"];
    }
}



@end
