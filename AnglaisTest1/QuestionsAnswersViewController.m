/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "QuestionsAnswersViewController.h"

@implementation QuestionsAnswersViewController
@synthesize answerA;
@synthesize answerB;
@synthesize answerC;
@synthesize it;
@synthesize questionsArray;
@synthesize dic;
@synthesize player;
@synthesize sectionsArray;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)playQuestionSound:(NSString*)name
{
    if (player != nil){
        [player stop];
    }
    NSString        *path = [[NSBundle mainBundle]
                             pathForResource:name ofType:nil];
    NSURL           *url = [[NSURL alloc] initFileURLWithPath:path];
    AVAudioPlayer   *sound = [[AVAudioPlayer alloc]
                              initWithContentsOfURL:url error:nil];
    player = sound;
    [player prepareToPlay];
    [player play];
}

- (void)showNextAnswers
{
    if (questionsArray == nil)
        NSLog(@"fail load question array");
    NSDictionary *item = [it nextObject];
    if (item == nil)
        NSLog(@"failure");
    [self playQuestionSound:[item objectForKey:@"sound"]];
    [answerA setText:[item objectForKey:@"A"]];
    [answerB setText:[item objectForKey:@"B"]];
    [answerC setText:[item objectForKey:@"C"]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
    
    dic = [[NSDictionary alloc] initWithContentsOfFile:path];
    sectionsArray = [[NSArray alloc] initWithArray:[dic objectForKey:@"QuestionsAndAnswers"]];
    questionsArray = [sectionsArray objectAtIndex:1];
    it = [questionsArray objectEnumerator];
    [it nextObject];
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
