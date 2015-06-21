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
#import "AppDelegate.h"

@interface Start ()
@end

@implementation Start
SystemSoundID sound2;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self moveCloudsEvenFar: _cloud1];
    [self moveCloudsEvenFar: _cloud2];
    [self moveCloudsEvenFar: _cloud3];
    [self moveCloudsEvenFar: _cloud4];
    [self moveCloudsEvenFar: _cloud5];
    [self moveCloudsEvenFar: _cloud6];
    [self moveCloudsEvenFar: _cloud7];
    
    [self moveCloudsFar: _cloud8];
    [self moveCloudsFar: _cloud9];
    [self moveClouds: _cloud10];
    [self moveClouds: _cloud11];
    [self moveCloudsFar: _cloud12];
    [self moveClouds: _cloud13];
    [self moveClouds: _cloud14];
    
    [self.view addSubview:self.fundo];
    [self.fundo addSubview:self.logo];
    [self.fundo addSubview:self.predios];
    [self.fundo addSubview:self.cloud1];
    [self.fundo addSubview:self.cloud2];
    [self.fundo addSubview:self.cloud3];
    [self.fundo addSubview:self.cloud4];
    [self.fundo addSubview:self.cloud5];
    [self.fundo addSubview:self.cloud6];
    [self.fundo addSubview:self.cloud7];
    [self.fundo addSubview:self.cloud8];
    [self.fundo addSubview:self.cloud9];
    [self.fundo addSubview:self.cloud10];
    [self.fundo addSubview:self.cloud11];
    [self.fundo addSubview:self.cloud12];
    [self.fundo addSubview:self.cloud13];
    [self.fundo addSubview:self.cloud14];
    
    [self.fundo addSubview:self.playImage];
    
    
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"carefreewav" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound2);
    AudioServicesPlaySystemSound(sound2);
    
    
    [NSTimer scheduledTimerWithTimeInterval:2.5f target:self selector:@selector(trocarPredio) userInfo:nil repeats:NO];
    
}

- (void)moveCloudsEvenFar:(UIImageView *)imageView{
    [UIView animateWithDuration:50.0f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.frame = CGRectMake(-self.view.frame.size.width + 100.0, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveClouds:(UIImageView *)imageView{
    [UIView animateWithDuration:30.0f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.frame = CGRectMake(-self.view.frame.size.width + 100.0, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void)moveCloudsFar:(UIImageView *)imageView{
    [UIView animateWithDuration:40.f delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
        imageView.frame = CGRectMake(-self.view.frame.size.width + 100.0, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
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

-(void)trocarPredio{
    self.predios.image = [UIImage imageNamed:@"predio2"];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(trocarDeNovo) userInfo:nil repeats:NO];
}

-(void)trocarDeNovo{
    self.predios.image = [UIImage imageNamed:@"predio"];
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(trocarPredio) userInfo:nil repeats:NO];
}

@end
