//
//  Story2.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Story2.h"
#import "Phase2.h"
#import <AVFoundation/AVFoundation.h>

@interface Story2(){
    AVAudioPlayer *_audioPlayer4;
    NSString *path3;
}

@property (nonatomic) CGRect ghostStarterFrame;
@property (nonatomic) CGRect shadowStarterFrame;

@end

@implementation Story2

-(void)dealloc{
    
    NSLog(@"desalocou Story2");
}

-(void)viewDidLoad{
    [super viewDidLoad];
    path3 = [NSString stringWithFormat:@"%@/5_pre-parque.mp3", [[NSBundle mainBundle] resourcePath]];
    
    
    [self moveBeepo:self.moveBeepoView];
    _ghostStarterFrame = self.imgFantasminha.frame;
    _shadowStarterFrame = self.imgSombra.frame;
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    Phase2 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase2VC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    game.player = self.player;
    [self presentViewController:game animated:YES completion:nil];
}

- (void)moveBeepo:(UIView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.frame = CGRectMake(337.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.imgFantasminha.frame = _ghostStarterFrame;
    self.imgSombra.frame = _shadowStarterFrame;
    [super viewDidAppear:animated];
    CGRect charFrame = self.imgFantasminha.frame;
    charFrame.origin.y = charFrame.origin.y - 25.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.imgSombra.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.imgFantasminha.frame = charFrame;
    self.imgSombra.frame = shadowFrame;
    
    
    [UIView commitAnimations];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path3];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer4 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer4 play];
}

-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
