//
//  Question.m
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-22.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "Question.h"

@implementation Question

-(instancetype)initWithText:(NSString *)text correctAnswer:(NSString *)answer alternatives:(NSArray *)alt{
    self = [super init];
    if(self){
        self.text = text;
        self.correctAnswer = answer;
        self.alternatives = alt;
    }
    return self; 
}

@end
