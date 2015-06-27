//
//  ViewController.m
//  Trashland
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Start.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Player.h"
#import "Skin.h"
#import "UIView+Animation2.h"
#import "AppDelegate.h"
#import "ParentsInfo.h"
#import <AVFoundation/AVFoundation.h>

@interface Start ()
@end

@implementation Start
SystemSoundID sound2;
AVAudioPlayer *_audioPlayer;

-(void)dealloc{
    NSLog(@"desalocou start");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self moveCloud1: self.cloud1];
    [self moveCloud2: self.cloud2];
    [self moveCloud3: self.cloud3];
    
    [self.fundo addSubview:self.cloud1];
    [self.fundo addSubview:self.cloud2];
    [self.fundo addSubview:self.cloud3];
    [self.view addSubview:self.fundo];
    [self.fundo addSubview:self.predios];
    [self.fundo addSubview:self.logo];
    
    [self.fundo addSubview:self.play];
    //[self.fundo addSubview:self.buttonInfo];
    [self.fundo addSubview:self.infoImage];
    
    [NSTimer scheduledTimerWithTimeInterval:3.0f target:self selector:@selector(balancarLogo) userInfo:nil repeats:YES];
    [self.play tada:NULL];
    
    
//    audio bosta curto lixo
//    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"carefreewav" withExtension:@"wav"];
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound2);
//    AudioServicesPlaySystemSound(sound2);
//
    
        // Construct URL to sound file
        NSString *path = [NSString stringWithFormat:@"%@/carefree.mp3", [[NSBundle mainBundle] resourcePath]];
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        // Create audio player object and initialize with URL to sound
        _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [_audioPlayer play];
    [_audioPlayer setVolume:0.2];
    _audioPlayer.numberOfLoops = -1;
    
    [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(trocarPredio) userInfo:nil repeats:NO];
    
}

- (void)moveCloud1:(UIImageView *)imageView{
    [UIView animateWithDuration:10.0f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.frame = CGRectMake(self.view.frame.size.width - 1000.0, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveCloud2:(UIImageView *)imageView{
    [UIView animateWithDuration:10.0f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.frame = CGRectMake(self.view.frame.size.width - 600.0, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveCloud3:(UIImageView *)imageView{
    [UIView animateWithDuration:10.0f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.frame = CGRectMake(self.view.frame.size.width - 200.0, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (IBAction)start:(id)sender{
    Skin *game = [self.storyboard instantiateViewControllerWithIdentifier:@"SkinVC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    [game setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
    Player* player = [[Player alloc] init];
    
    player.fase1 = true;
    player.fase2 = false;
    player.fase3 = false;
    player.fase4 = false;
    
    player.medalha1fase1 = false;
    player.medalha2fase1 = false;
    
    player.medalha1fase2 = false;
    player.medalha2fase2 = false;
    
    player.medalha1fase3 = false;
    player.medalha2fase3 = false;
    
    player.medalha1fase4 = false;
    player.medalha2fase4 = false;
    
    game.player = player;
    [self presentViewController:game animated:YES completion:nil];
    
    
}

-(IBAction)info:(id)sender{
    ParentsInfo *game = [self.storyboard instantiateViewControllerWithIdentifier:@"ParentsInfoVC"];
    [game setModalPresentationStyle:UIModalPresentationFullScreen];
    [game setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
     [self presentViewController:game animated:YES completion:nil];
}

-(void)trocarPredio{
    self.predios.image = [UIImage imageNamed:@"predio2"];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(trocarDeNovo) userInfo:nil repeats:NO];
}

-(void)trocarDeNovo{
    self.predios.image = [UIImage imageNamed:@"predio"];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(trocarPredio) userInfo:nil repeats:NO];
}
-(void)balancarLogo{
    [self.play bounce:NULL];
}

@end
