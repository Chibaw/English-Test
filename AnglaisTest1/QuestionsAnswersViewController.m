//
//  QuestionsAnswersViewController.m
//  AnglaisTest1
//
//  Created by Franck Lavisse on 24/07/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import "QuestionsAnswersViewController.h"

@implementation QuestionsAnswersViewController
@synthesize answerA;
@synthesize answerB;
@synthesize answerC;
@synthesize it;
@synthesize questionsArray;
@synthesize dic;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)showNextAnswers
{
    if (questionsArray == nil)
        NSLog(@"fail");
    NSDictionary *item = [it nextObject];
    if (item == nil)
        NSLog(@"failure");
    [answerA setText:[item objectForKey:@"A"]];
    [answerB setText:[item objectForKey:@"B"]];
    [answerC setText:[item objectForKey:@"C"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
    dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    questionsArray = [dic objectForKey:@"QuestionsAndAnswers"];
    it = [questionsArray objectEnumerator];
    [self showNextAnswers];
    // Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setAnswerA:nil];
    [self setAnswerB:nil];
    [self setAnswerC:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


- (IBAction)nextQuestion:(id)sender {
    [self showNextAnswers];
}
@end
