/*
 * ----------------------------------------------------------------------------
 * "THE BEER-WARE LICENSE" (Revision 42):
 * <bordel@epitech.eu> wrote this file. As long as you retain this notice you
 * can do whatever you want with this stuff. If we meet some day, and you think
 * this stuff is worth it, you can buy me a beer in return Julien Bordellier
 * ----------------------------------------------------------------------------
 */

#import "ScoreViewController.h"
#import "Config.h"
//#import "SKPSMTPMessage.h"
@interface ScoreViewController ()

@end

@implementation ScoreViewController
@synthesize answers;
@synthesize scoreBox;
@synthesize verify;
@synthesize catSizes;
@synthesize finalScore;
@synthesize canQuit;

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
    NSLog(@"verify = %@", verify);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getSectionsSizes];
    const char *yay = [answers UTF8String];
    const char *yayVerified = [verify UTF8String];
    //yay = "BACAAAABCABACCABACACACABADBCCBBDDDABCBADAAACBABBAB@BABDADC";
    int score = 0;
    for (int i = 0; i < [answers length]; ++i) {
        if (yay[i] == yayVerified[i]) {
            ++score;
        }
    }
    canQuit = NO;
    finalScore = ((990*score/[verify length]) - (990*score/[answers length])%5);
    NSLog(@"%d\n", finalScore);
    [self saveInPList];
    [self sendServer];
    [scoreBox setText:[NSString stringWithFormat:@"%d", finalScore]];
}

- (void)saveInPList
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"questions_and_answers" ofType:@"plist"];
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithContentsOfFile:path];
    NSMutableArray *sectionsArray = [dic objectForKey:@"Results"];
    NSMutableDictionary *result = [[NSMutableDictionary alloc] init];
    [result setValue:@"firstName" forKey:name];
    [result setValue:@"lastName" forKey:lastName];
    [result setValue:@"email" forKey:mail];
    [result setValue:@"score" forKey:[NSString stringWithFormat:@"%d", finalScore]];
    [sectionsArray addObject:result];
    canQuit = YES;
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

- (IBAction)goodBye:(id)sender {
    if (canQuit == YES) {
        exit(EXIT_SUCCESS);
    }
}

- (void)sendServer {
    NSMutableString *finalUrl = [[NSMutableString alloc] initWithString:RESULT_SCRIPT_LOCATION];
    [finalUrl appendString:@"?name="];
    [finalUrl appendString:name];
    [finalUrl appendString:@"&lastName="];
    [finalUrl appendString:lastName];
    [finalUrl appendString:@"&mail="];
    [finalUrl appendString:mail];
    [finalUrl appendString:@"&score="];
    [finalUrl appendString:[[NSString alloc] initWithFormat:@"%d", finalScore]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:finalUrl]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    
    [request setHTTPMethod: @"GET"];
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
}
@end
