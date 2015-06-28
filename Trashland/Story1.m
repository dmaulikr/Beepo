//
//  Story1.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Story1.h"
#import "Phase1.h"
#import "AppDelegate.h"
#import <AVFoundation/AVFoundation.h>
#import "UIView+Animation2.h"

@implementation Story1
AVAudioPlayer *_audioPlayer2;
NSString *path;

-(void) viewDidLoad{
    [super viewDidLoad];
     path = [NSString stringWithFormat:@"%@/1_pre-sala01.mp3", [[NSBundle mainBundle] resourcePath]];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipe:)];
    
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];}

- (void)dealloc{
    NSLog(@"desalocou Story1");

}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.gifDedo removeFromSuperview];
    [self.telaUm removeFromSuperview];
    [self.telaDois removeFromSuperview];
    [self.telaTres removeFromSuperview];
    self.gifDedo = nil;
    self.telaUm = nil;
    self.telaDois = nil;
    self.telaTres = nil;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    dispatch_async(dispatch_get_main_queue(), ^{
        self.telaUm.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"historinha-01@2x" ofType:@"png"]];
        self.telaDois.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"historinha-02@2x" ofType:@"png"]];
        self.telaTres.image = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"historinha-03@2x" ofType:@"png"]];
    });
    
    
//    self.gifDedo.image = [UIImage animatedImageNamed:@"maoesq-" duration:1.f];
//    self.gifDedo.alpha = 0.7;
//    [self.view bringSubviewToFront:self.gifDedo];
}

-(void)swipe:(UISwipeGestureRecognizer *)swipeRecogniser{
    if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionLeft)
    {
        switch (self.controle.currentPage) {
            case 0:
//                [self out0];
//                [self in1];
                 path = [NSString stringWithFormat:@"%@/2_pre-sala02.mp3", [[NSBundle mainBundle] resourcePath]];
                [self.buttonNarrar tada:NULL];
                [self moveLeft];
                self.controle.currentPage +=1;
                self.gifDedo.hidden = YES;
                break;
            case 1:
//                [self out1];
//                [self in2];
                 path = [NSString stringWithFormat:@"%@/3_pre-sala03.mp3", [[NSBundle mainBundle] resourcePath]];
                
                [self.buttonNarrar tada:NULL];
                [self moveLeft];
                self.controle.currentPage +=1;
                break;
            case 2:
                [self start];
                break;
            default:
                break;
        }
    }
    else if ([swipeRecogniser direction] == UISwipeGestureRecognizerDirectionRight)
    {
        switch (self.controle.currentPage) {
            case 2:
//                [self out2];
//                [self in1];
                 path = [NSString stringWithFormat:@"%@/2_pre-sala02.mp3", [[NSBundle mainBundle] resourcePath]];
                
                [self.buttonNarrar tada:NULL];
                [self moveRight];
                self.controle.currentPage -=1;
                break;
            case 1:
//                [self out1];
//                [self in0];
                  path = [NSString stringWithFormat:@"%@/1_pre-sala01.mp3", [[NSBundle mainBundle] resourcePath]];
                
                [self.buttonNarrar tada:NULL];
                [self moveRight];
                self.controle.currentPage -=1;
                break;
            default:
                break;
        }
    }
}

-(void)viewDidAppear:(BOOL)animated {

    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount:9999.0];
    [UIView setAnimationRepeatAutoreverses:YES];
    [UIView commitAnimations];
}

-(void)start{
    if (self.player.fase1) {
        Phase1 *game = [self.storyboard instantiateViewControllerWithIdentifier:@"Phase1VC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
}

- (void)moveLeft{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.02];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
//    [UIView setAnimationRepeatCount:9999.0];
    [UIView setAnimationRepeatAutoreverses:NO];
    self.telaUm.frame = CGRectMake(self.telaUm.frame.origin.x -  self.telaUm.frame.size.width
                                   , 0.0, self.telaUm.frame.size.width, self.telaUm.frame.size.height);
    self.telaDois.frame = CGRectMake(self.telaDois.frame.origin.x -  self.telaUm.frame.size.width
                                     , 0.0, self.telaDois.frame.size.width, self.telaDois.frame.size.height);
    self.telaTres.frame = CGRectMake(self.telaTres.frame.origin.x -  self.telaUm.frame.size.width
                                     , 0.0, self.telaTres.frame.size.width, self.telaTres.frame.size.height);
    
    
    [UIView commitAnimations];
}

- (void)moveRight{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.02];
    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //    [UIView setAnimationRepeatCount:9999.0];
    [UIView setAnimationRepeatAutoreverses:NO];
    self.telaUm.frame = CGRectMake(self.telaUm.frame.origin.x +  self.telaUm.frame.size.width
                                   , 0.0, self.telaUm.frame.size.width, self.telaUm.frame.size.height);
    self.telaDois.frame = CGRectMake(self.telaDois.frame.origin.x +  self.telaUm.frame.size.width
                                     , 0.0, self.telaDois.frame.size.width, self.telaDois.frame.size.height);
    self.telaTres.frame = CGRectMake(self.telaTres.frame.origin.x +  self.telaUm.frame.size.width
                                     , 0.0, self.telaTres.frame.size.width, self.telaTres.frame.size.height);
    
    
    [UIView commitAnimations];
}

//-(void)out0{
//   //   [UIView animateWithDuration:.6f animations:^{
//    [self.frase1 setAlpha:0.0f];
//    [self.frase2 setAlpha:0.0f];
//    [self.viewGasper setAlpha:0.0f];
//  //  } completion:^(BOOL finished) {}];
//}
//
//-(void)in0{
//   //       [UIView animateWithDuration:.6f animations:^{
//    [self.frase1 setAlpha:1.0f];
//    [self.frase2 setAlpha:1.0f];
//    [self.viewGasper setAlpha:1.0f];
//    self.frase1.text = @"Era uma vez um fantasminha chamado Beepo, nao tao diferente";
//    self.frase2.text = @"dos outros habitantes da sua cidade, trashland.";
//    
//    self.background.image = [UIImage imageNamed:@"telainicial1_semtexto"];
//   //               } completion:^(BOOL finished) {}];
//}
//
//-(void)out1{
//        //      [UIView animateWithDuration:.6f animations:^{
//    [self.interrogacao3 setAlpha:0.0f];
//    [self.interrogacao2 setAlpha:0.0f];
//    [self.interrogacao1 setAlpha:0.0f];
//    [self.frase1 setAlpha:0.0f];
//    [self.frase2 setAlpha:0.0f];
//    [self.frase3 setAlpha:0.0f];
//    [self.frase4 setAlpha:0.0f];
//       //               } completion:^(BOOL finished) {}];
//}
//
//-(void)in1{
//   // [UIView animateWithDuration:.6f animations:^{
//       
//     //   [UIView animateWithDuration:.6f animations:^{
//            [self.interrogacao3 setAlpha:1.0f];
//            
//     //   } completion:^(BOOL finished) {
//      //      [UIView animateWithDuration:.6f animations:^{
//                [self.interrogacao1 setAlpha:1.0f];
//      //      } completion:^(BOOL finished) {
//              //  [UIView animateWithDuration:.6f animations:^{
//                  [self.interrogacao2 setAlpha:1.0f];
//     //           } completion:^(BOOL finished) {}];
//     //       }];
//     //   }];
//     //
//        
//        
//        [self.frase3 setAlpha:1.0f];
//        [self.frase4 setAlpha:1.0f];
//        [self.frase1 setAlpha:1.0f];
//        [self.frase2 setAlpha:1.0f];
//        self.frase3.text = @"Mas Beepo possuía uma grande";
//        self.frase1.text = @"curiosidade com tudo ao seu redor,";
//        self.frase2.text = @"ainda mais na sua cidade trashland";
//        self.frase4.text = @"onde tudo parecia estar fora do lugar!";
//        self.background.image = [UIImage imageNamed:@"historinha2_"];
//    
//    
//    [self.interrogacao1 bounce:NULL];
//    [self.interrogacao2 bounce:NULL];
//    [self.interrogacao3 bounce:NULL];
//
//   // } completion:^(BOOL finished) {}];
//    
//}
//
//-(void)out2{
//  //   [UIView animateWithDuration:.6f animations:^{
//    [self.viewGasperTriste setAlpha:0.0f];
//  //  } completion:^(BOOL finished) {}];
//}
//
//-(void)in2{
//  //     [UIView animateWithDuration:.6f animations:^{
//    [self.viewGasperTriste setAlpha:1.0f];
//    self.background.image = [UIImage imageNamed:@"telainicial3-1"];
//  //             } completion:^(BOOL finished) {}];
//}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer2 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer2 play];
}

@end
