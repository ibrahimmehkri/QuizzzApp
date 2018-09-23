//
//  HomeViewController.m
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-22.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "HomeViewController.h"
#import "GameViewController.h"
#import "../QuestionList.h"


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
    NSLog(@"%@", sender);
    [self performSegueWithIdentifier:@"GameSegue" sender:sender];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.identifier isEqualToString:@"GameSegue"]){
       
        GameViewController *destination = [segue destinationViewController];
        
        QuestionList *listObj;
        
        if(sender == self.techButton){
            listObj = [[QuestionList alloc]initWithIdentifer:@"Tech"];
        } else if(sender == self.moviesButton){
            listObj = [[QuestionList alloc]initWithIdentifer:@"Movies"];
        } else if(sender == self.artButton){
            listObj = [[QuestionList alloc]initWithIdentifer:@"Art"]; 
        }
        
        destination.questions = listObj.list;
        
        
    }
    
}



-(IBAction)unwindToHomeScreen:(UIStoryboardSegue *)segue{
    
}



@end
