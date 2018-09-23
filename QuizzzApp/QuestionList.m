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
    Question *q1 = [[Question alloc]initWithText:@"Who founded the company Next?" correctAnswer:@"Steve Jobs" alternatives:@[@"Dan Abramov", @"Aditya Punjiani"]];
    [self.list addObject:q1];
    Question *q2 = [[Question alloc]initWithText:@"React library was created by which company?" correctAnswer:@"Facebook" alternatives:@[@"Google", @"Amazon"]];
    [self.list addObject:q2];
    Question *q3 = [[Question alloc]initWithText:@"Who invented the mouse?" correctAnswer:@"Douglas Engelbart" alternatives:@[@"Steve Wozniak", @"Steve Jobs"]];
    [self.list addObject:q3];
}

-(void)prepareMoviesQuestions{
    Question *q1 = [[Question alloc]initWithText:@"The movie John Wick is written by? " correctAnswer:@"Derek Kolstad" alternatives:@[@"Quentin Tarantino", @"Woody Allen"]];
    [self.list addObject:q1];
    Question *q2 = [[Question alloc]initWithText:@"The movie John Wick is directed by?" correctAnswer:@"Chad Stahelski" alternatives:@[@"Martin Scorsese", @"Denis Villeneuve"]];
    [self.list addObject:q2];
    Question *q3 = [[Question alloc]initWithText:@"The movie Blade Runner 2049 is directed by?" correctAnswer:@"Denis Villeneuve" alternatives:@[@"Stanley Kubrick", @"Christopher Nolan"]];
    [self.list addObject:q3];
}

-(void)prepareArtQuestions{
    Question *q1 = [[Question alloc]initWithText:@"The painting 'A Bar at the Folies Bergere' was made by?" correctAnswer:@"Edouard Manet" alternatives:@[@"Rembrandt", @"Claude Monet"]];
    [self.list addObject:q1];
    Question *q2 = [[Question alloc]initWithText:@"The painting 'Mona Lisa' was made by?" correctAnswer:@"Leonardo da Vinci" alternatives:@[@"Sandro Botticelli", @"Caravaggio"]];
    [self.list addObject:q2];
    Question *q3 = [[Question alloc]initWithText:@"The painting 'Le Comte de Belamy' was made by?" correctAnswer:@"Artificial Intelligence" alternatives:@[@"Vincent Van Gogh", @"Marcel Duchamp"]];
    [self.list addObject:q3];
}

@end
