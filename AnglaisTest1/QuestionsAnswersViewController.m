/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "QuestionsAnswersViewController.h"
#import "QuestionsAnswersInfoViewController.h"
#import "ScoreViewController.h"

@implementation QuestionsAnswersViewController
@synthesize answerA;
@synthesize answerB;
@synthesize answerC;
@synthesize it;
@synthesize dic;
@synthesize player;
@synthesize section;
@synthesize sectionNum;
@synthesize answers;
@synthesize selectAnswer;
@synthesize startDate;

@synthesize name;
@synthesize lastName;
@synthesize mail;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)playQuestionSound:(NSString*)nameSound
{
    if (player != nil){
        [player stop];
    }
    NSString        *path = [[NSBundle mainBundle]
                             pathForResource:nameSound ofType:nil];
    NSURL           *url = [[NSURL alloc] initFileURLWithPath:path];
    AVAudioPlayer   *sound = [[AVAudioPlayer alloc]
                              initWithContentsOfURL:url error:nil];
    player = sound;
    [player prepareToPlay];
    [player play];
}

- (void)showNextAnswers
{
    NSDictionary *item = [it nextObject];
    if (item == nil)
        [self nextSection];
    [self playQuestionSound:[item objectForKey:@"sound"]];
    [answerA setText:[item objectForKey:@"A"]];
    [answerB setText:[item objectForKey:@"B"]];
    [answerC setText:[item objectForKey:@"C"]];
    [selectAnswer setSelectedSegmentIndex:-1];
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

- (void)viewDidUnload
{
    [self setAnswerA:nil];
    [self setAnswerB:nil];
    [self setAnswerC:nil];
    [self setSelectAnswer:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)replaySound:(id)sender {
    [player play];
}

- (IBAction)nextQuestion:(id)sender {
    [answers appendFormat:@"%c", 'A' + [selectAnswer selectedSegmentIndex]];
    //NSLog(@"%c %@", 'A' + [selectAnswer selectedSegmentIndex], answers);
    if (([startDate timeIntervalSinceNow]*-1) > MAX_TIME*60) {
        [self performSegueWithIdentifier:@"returnScore2" sender:self];
    }
    [self showNextAnswers];
}

- (void)nextSection
{
    [self performSegueWithIdentifier:@"returnTwo" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"returnTwo"])
    {
        QuestionsAnswersInfoViewController *vc = [segue destinationViewController];
        [vc setSection:(self.sectionNum+1)];
        [vc setDic:[[NSDictionary alloc] initWithDictionary:dic]];
        [vc setAnswers:answers];
        [vc setName:[[NSString alloc] initWithString:name]];
        [vc setLastName:[[NSString alloc] initWithString:lastName]];
        [vc setMail:[[NSString alloc] initWithString:mail]];
        [vc setStartDate:startDate];
    } else if ([[segue identifier] isEqualToString:@"returnScore2"]) {
        ScoreViewController *vc = [segue destinationViewController];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
        [vc setName:[[NSString alloc] initWithString:name]];
        [vc setLastName:[[NSString alloc] initWithString:lastName]];
        [vc setMail:[[NSString alloc] initWithString:mail]];
    }
}
@end
