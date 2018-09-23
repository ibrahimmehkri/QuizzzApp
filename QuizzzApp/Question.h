//
//  Question.h
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-22.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Question : NSObject

@property NSString *text;
@property NSString *correctAnswer;
@property NSArray *alternatives;

-(instancetype)initWithText:(NSString*)text correctAnswer:(NSString*)answer alternatives:(NSArray*)alt;

-(BOOL)isCorrect:(NSString*)answer; 

@end


