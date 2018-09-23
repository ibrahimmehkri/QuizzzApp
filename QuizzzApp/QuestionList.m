//
//  QuestionList.m
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-23.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "QuestionList.h"
#import "Question.h"

@implementation QuestionList

-(instancetype)initWithIdentifer:(NSString *)identifier{
    self = [super init];
    if(self){
        self.list = [[NSMutableArray alloc]init];
        if([identifier isEqualToString:@"Tech"]){
            [self prepareTechQuestions];
        } else if([identifier isEqualToString:@"Movies"]){
            [self prepareMoviesQuestions];
        } else if([identifier isEqualToString:@"Art"]){
            [self prepareArtQuestions]; 
        }
    }
    return self; 
}

-(void)prepareTechQuestions{
    Question *q1 = [[Question alloc]initWithText:@"tech question 1" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q1];
    Question *q2 = [[Question alloc]initWithText:@"tech question 2" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q2];
    Question *q3 = [[Question alloc]initWithText:@"tech question 3" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q3];
}

-(void)prepareMoviesQuestions{
    Question *q1 = [[Question alloc]initWithText:@"movies question 1" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q1];
    Question *q2 = [[Question alloc]initWithText:@"movies question 2" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q2];
    Question *q3 = [[Question alloc]initWithText:@"movies question 3" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q3];
}

-(void)prepareArtQuestions{
    Question *q1 = [[Question alloc]initWithText:@"art question 1" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q1];
    Question *q2 = [[Question alloc]initWithText:@"art question 2" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q2];
    Question *q3 = [[Question alloc]initWithText:@"art question 3" correctAnswer:@"a" alternatives:@[@"b", @"c"]];
    [self.list addObject:q3];
}

@end
