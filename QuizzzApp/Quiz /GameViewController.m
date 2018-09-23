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
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


@property Question *activeQuestion;
@property int numberOfCorrectAnswers;

@property int iterator;

@end

@implementation GameViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setUpLabel:self.a1Label];
    [self setUpLabel:self.a2Label];
    [self setUpLabel:self.a3Label];
    
    [self loadInitialData];

}

-(void)setUpLabel:(UILabel*)option{
    
    UITapGestureRecognizer *gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
    
    [option setUserInteractionEnabled:YES];
    [option addGestureRecognizer:gestureRecognizer];
    
}

-(void)loadInitialData{
    
    self.numberOfCorrectAnswers = 0;
    
    self.iterator = 0;

    [self prepareQuestion];
    
}

- (IBAction)handleClick:(id)sender {
    [self refreshLabelInteractivity]; 
    
    self.resultLabel.text = @""; 
    
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
    
    self.activeQuestion = self.questions[iteratorValue];
    
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
        
        destination.result = [NSString stringWithFormat:@"Result: %i/3", self.numberOfCorrectAnswers];
    }
}

-(void)stopFurtherSelection{
    [self.a1Label setUserInteractionEnabled:NO];
    [self.a2Label setUserInteractionEnabled:NO];
    [self.a3Label setUserInteractionEnabled:NO];
}

-(void)refreshLabelInteractivity{
    [self.a1Label setUserInteractionEnabled:YES];
    [self.a2Label setUserInteractionEnabled:YES];
    [self.a3Label setUserInteractionEnabled:YES];
}

-(void)tapAction:(UITapGestureRecognizer*)sender{
    UILabel *label = sender.view;
   
    if([self.activeQuestion isCorrect:label.text]){
    
        self.resultLabel.text = @"Correct!";
        
        self.numberOfCorrectAnswers++;
        
        NSLog(@"%i", self.numberOfCorrectAnswers);
        
        [self stopFurtherSelection];
    
    } else {
    
        self.resultLabel.text = @"Wrong!";
    
    }
}

@end
