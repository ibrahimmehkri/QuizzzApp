//
//  QuestionList.h
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-23.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionList : NSObject

@property NSMutableArray *list;

-(instancetype)initWithIdentifer:(NSString *)identifier;

-(void)prepareTechQuestions;

-(void)prepareMoviesQuestions;

-(void)prepareArtQuestions; 

@end

