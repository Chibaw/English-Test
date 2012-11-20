/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "FinalQuestionsViewController.h"
#import "QuestionsAnswersInfoViewController.h"
#import "ScoreViewController.h"

@interface FinalQuestionsViewController ()

@end

@implementation FinalQuestionsViewController
@synthesize answerA;
@synthesize answerB;
@synthesize answerC;
@synthesize answerD;
@synthesize questionText;
@synthesize it;
@synthesize dic;
@synthesize section;
@synthesize player;
@synthesize selectAnswer;
@synthesize startDate;

@synthesize answers;
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

- (void)playQuestionSound:(NSString*)filename
{
    if (player != nil){
        [player stop];
    }
    NSString        *path = [[NSBundle mainBundle]
                             pathForResource:filename ofType:nil];
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
    [questionText setText:[item objectForKey:@"question"]];
    [self playQuestionSound:[item objectForKey:@"sound"]];
    [answerA setText:[item objectForKey:@"A"]];
    [answerB setText:[item objectForKey:@"B"]];
    [answerC setText:[item objectForKey:@"C"]];
    [answerD setText:[item objectForKey:@"D"]];
    [selectAnswer setSelectedSegmentIndex:-1];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.sectionNum == 4)
        [self nextSection];
    NSArray *questionsArray = [section objectAtIndex:self.sectionNum];
    it = [questionsArray objectEnumerator];
    [it nextObject];
    [self showNextAnswers];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
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
    [self sendServer:'A' + [selectAnswer selectedSegmentIndex]];
    //NSLog(@"LOL %c %@", 'A' + [selectAnswer selectedSegmentIndex], answers);
    if (([startDate timeIntervalSinceNow]*-1) > MAX_TIME*60) {
        [self performSegueWithIdentifier:@"returnFinal" sender:self];
    }
    [self showNextAnswers];
}

- (IBAction)replaySound:(id)sender {
    [player play];
}

- (void)nextSection
{
    if (self.sectionNum == 3)
        [self performSegueWithIdentifier:@"returnFour" sender:self];
    else if (self.sectionNum == 4)
        [self performSegueWithIdentifier:@"returnFinal" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"returnFour"])
    {
        QuestionsAnswersInfoViewController *vc = [segue destinationViewController];
        [vc setSection:(self.sectionNum+1)];
        [vc setDic:[[NSDictionary alloc] initWithDictionary:dic]];
        [vc setAnswers:answers];
        [vc setName:[[NSString alloc] initWithString:name]];
        [vc setLastName:[[NSString alloc] initWithString:lastName]];
        [vc setMail:[[NSString alloc] initWithString:mail]];
        [vc setStartDate:startDate];
    }
    if ([[segue identifier] isEqualToString:@"returnFinal"])
    {
        ScoreViewController *vc = [segue destinationViewController];
        [vc setAnswers:[[NSMutableString alloc] initWithString:answers]];
        [vc setName:[[NSString alloc] initWithString:name]];
        [vc setLastName:[[NSString alloc] initWithString:lastName]];
        [vc setMail:[[NSString alloc] initWithString:mail]];
    }
}

- (void)sendServer:(char)rep {
    NSMutableString *finalUrl = [[NSMutableString alloc] initWithString:FOLLOW_SCRIPT_LOCATION];
    [finalUrl appendString:@"?rep="];
    [finalUrl appendFormat:@"%c", rep];
    NSLog(@"%c", rep);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    [request setHTTPMethod: @"GET"];
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
}
@end
