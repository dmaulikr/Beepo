//
//  Story4.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/19/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Story4.h"
#import "Phase4.h"
#import <AVFoundation/AVFoundation.h>

@interface Story4 ()

@end

@implementation Story4
AVAudioPlayer *_audioPlayer9;
NSString* path8;

-(void)dealloc{
    NSLog(@"desalocou story4");
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view addSubview:self.fundo];
    
    path8 = [NSString stringWithFormat:@"%@/10_pre-prefeitura.mp3", [[NSBundle mainBundle] resourcePath]];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionLeft)
    {
        Phase4 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase4VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:NO completion:nil];
    }
    else if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionRight)
    {
        
    }
    
    
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path8];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer9 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer9 play];
}
@end
