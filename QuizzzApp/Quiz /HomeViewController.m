//
//  HomeViewController.m
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-22.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "HomeViewController.h"
#import "GameViewController.h"
#import "../Question.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UIButton *techButton;

@property (weak, nonatomic) IBOutlet UIButton *moviesButton;

@property (weak, nonatomic) IBOutlet UIButton *artButton;

@end

@implementation HomeViewController

- (void)viewDidLoad {

    [super viewDidLoad];

}

- (IBAction)toGame:(id)sender {
   
    [self performSegueWithIdentifier:@"GameSegue" sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
   
    if([segue.identifier isEqualToString:@"GameSegue"]){
       
        GameViewController *destination = [segue destinationViewController];
        destination.questions = [[NSMutableArray alloc]init];
       
        Question *q1 = [[Question alloc]initWithText:@"question 1" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
        Question *q2 = [[Question alloc]initWithText:@"question 2" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
        Question *q3 = [[Question alloc]initWithText:@"question 3" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
        
        [destination.questions addObject:q1];
        [destination.questions addObject:q2];
        [destination.questions addObject:q3]; 
    }
    
}



-(IBAction)unwindToHomeScreen:(UIStoryboardSegue *)segue{
    
}



@end
