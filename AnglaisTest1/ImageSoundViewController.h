//
//  ImageSoundViewController.h
//  AnglaisTest1
//
//  Created by Julien Bordellier on 27/09/12.
//  Copyright (c) 2012 Epitech. All rights reserved.
//

#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>

@interface ImageSoundViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *ImageView;
@property (weak, nonatomic) IBOutlet UITextField *questionText;
@property (weak, nonatomic) IBOutlet UITextField *answerA;
@property (weak, nonatomic) IBOutlet UITextField *answerB;
@property (weak, nonatomic) IBOutlet UITextField *answerC;
@property (weak, nonatomic) IBOutlet UITextField *answerD;
@property (weak, nonatomic) IBOutlet UISegmentedControl *selectAnswer;

@property (nonatomic, strong) NSArray *section;
@property (nonatomic) NSInteger sectionNum;
@property (nonatomic) NSEnumerator *it;
@property (nonatomic, retain) AVAudioPlayer *player;
@property (nonatomic, strong) NSDictionary *dic;
@property (nonatomic, strong) NSMutableString *answers;

- (IBAction)nextQuestion:(id)sender;
@end
