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
@synthesize verify;
@synthesize catSizes;

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
    NSDictionary *dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    NSArray *sectionsArray = [[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]];
    verify = [[NSMutableString alloc] initWithString:@""];
    catSizes = [[NSMutableArray alloc] init];
    for (int i = 0; i < [sectionsArray count]; ++i) {
        [catSizes addObject:[NSNumber numberWithInteger:[sectionsArray[i] count]]];
        for (int j = 0; j < [sectionsArray[i] count]; ++j) {
            NSDictionary *lol = sectionsArray[i][j];
            [verify appendString:[lol valueForKey:@"answer"]];
        }
    }
//    NSLog(@"%@", answers);
//    NSLog(@"%@", verify);
//    NSLog(@"%@", catSizes);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getSectionsSizes];
    const char *yay = [answers UTF8String];
    const char *yayVerified = [verify UTF8String];
    int score = 0;
    for (int i = 0; i < [answers length]; ++i) {
        if (yay[i] == yayVerified[i]) {
            ++score;
        }
    }
    int finalScore = ((990*score/[answers length]) - (990*score/[answers length])%5);
    [scoreBox setText:[NSString stringWithFormat:@"%d", finalScore]];
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
