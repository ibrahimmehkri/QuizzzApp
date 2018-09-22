//
//  ResultViewController.m
//  QuizzzApp
//
//  Created by Ibrahim Mehkri on 2018-09-22.
//  Copyright © 2018 Ibrahim Mehkri. All rights reserved.
//

#import "ResultViewController.h"

@interface ResultViewController ()

@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultLabel.text = self.result;
}

@end
