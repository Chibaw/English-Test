//
//  ScoreViewController.m
//  AnglaisTest1
//
//  Created by Julien Bordellier on 27/09/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import "ScoreViewController.h"

@interface ScoreViewController ()

@end

@implementation ScoreViewController
@synthesize answers;
@synthesize scoreBox;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)getSectionsSizes
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
    //sectionsArray = [[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]];
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [scoreBox setText:answers];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setScoreBox:nil];
    [super viewDidUnload];
}
@end
