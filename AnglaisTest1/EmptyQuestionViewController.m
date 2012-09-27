//
//  EmptyQuestionViewController.m
//  AnglaisTest1
//
//  Created by Julien Bordellier on 27/09/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import "EmptyQuestionViewController.h"
#import "QuestionsAnswersInfoViewController.h"

@interface EmptyQuestionViewController ()

@end

@implementation EmptyQuestionViewController
@synthesize answerA;
@synthesize answerB;
@synthesize answerC;
@synthesize answerD;
@synthesize questionText;
@synthesize it;
@synthesize dic;
@synthesize section;
@synthesize answers;
@synthesize selectAnswer;

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
    NSDictionary *item = [it nextObject];
    if (item == nil)
        [self nextSection];
    [questionText setText:[item objectForKey:@"question"]];
    [answerA setText:[item objectForKey:@"A"]];
    [answerB setText:[item objectForKey:@"B"]];
    [answerC setText:[item objectForKey:@"C"]];
    [answerD setText:[item objectForKey:@"D"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *questionsArray = [section objectAtIndex:self.sectionNum];
    it = [questionsArray objectEnumerator];
    [it nextObject];
    [self showNextAnswers];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setQuestionText:nil];
    [self setAnswerA:nil];
    [self setAnswerB:nil];
    [self setAnswerC:nil];
    [self setAnswerD:nil];
    [self setSelectAnswer:nil];
    [super viewDidUnload];
}
- (IBAction)nextQuestion:(id)sender {
    [answers appendFormat:@"%c", 'A' + [selectAnswer selectedSegmentIndex]];
    NSLog(@"%c %@", 'A' + [selectAnswer selectedSegmentIndex], answers);
    [self showNextAnswers];
}

- (void)nextSection
{
    [self performSegueWithIdentifier:@"returnThree" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"returnThree"])
    {
        QuestionsAnswersInfoViewController *vc = [segue destinationViewController];
        [vc setSection:(self.sectionNum+1)];
        [vc setDic:[[NSDictionary alloc] initWithDictionary:dic]];
        [vc setAnswers:answers];
    }
}
@end
