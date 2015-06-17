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

@implementation Story1

-(void) viewDidLoad{
    [super viewDidLoad];
    
    [self.view addSubview:self.background];
    [self.background addSubview:self.viewGasper];
    [self.background addSubview:self.frase1];
    [self.background addSubview:self.frase2];
    [self.background addSubview:self.frase3];
    [self.background addSubview:self.frase4];
    [self.background addSubview:self.frase5];
    [self.background addSubview:self.frase6];
    [self.background addSubview:self.frase7];
    [self.background addSubview:self.interrogacao1];
    [self.background addSubview:self.interrogacao2];
    [self.background addSubview:self.interrogacao3];
    [self.background addSubview:self.controle];
    [self.background addSubview:self.balao1];
    [self.background addSubview:self.balao2];
    [self.background addSubview:self.balao3];
    [self.background addSubview:self.balao4];
    [self.background addSubview:self.balao5];
    [self.background addSubview:self.balao6];
    
  //  [self.background addSubview:self.botaoPlay];
 //   [self.background addSubview:self.botaoVoltar];
    
    [self.interrogacao3 setAlpha:0.0f];
    [self.interrogacao2 setAlpha:0.0f];
    [self.interrogacao1 setAlpha:0.0f];
    [self.frase3 setAlpha:0.0f];
    [self.frase4 setAlpha:0.0f];
    [self.frase5 setAlpha:0.0f];
    [self.frase6 setAlpha:0.0f];
    [self.frase7 setAlpha:0.0f];
    [self.balao1 setAlpha:0.0f];
    [self.balao2 setAlpha:0.0f];
    [self.balao3 setAlpha:0.0f];
    [self.balao4 setAlpha:0.0f];
    [self.balao5 setAlpha:0.0f];
    [self.balao6 setAlpha:0.0f];
    
    
    
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
        switch (self.controle.currentPage) {
            case 0:
                [self out0];
                [self in1];
                self.controle.currentPage +=1;
                break;
            case 1:
                [self out1];
                [self in2];
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
                [self out2];
                [self in1];
                self.controle.currentPage -=1;
                break;
            case 1:
                [self out1];
                [self in0];
                self.controle.currentPage -=1;
                break;
            default:
                break;
        }
    }
}

-(void)viewDidAppear:(BOOL)animated {
    CGRect charFrame = self.gasper.frame;
    charFrame.origin.y = charFrame.origin.y - 45.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.sombra.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationRepeatCount:9999.0];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.gasper.frame = charFrame;
    self.sombra.frame = shadowFrame;
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

-(void)out0{
    [self.frase1 setAlpha:0.0f];
    [self.frase2 setAlpha:0.0f];
    [self.viewGasper setAlpha:0.0f];
}

-(void)in0{
    [self.frase1 setAlpha:1.0f];
    [self.frase2 setAlpha:1.0f];
    [self.viewGasper setAlpha:1.0f];
    
    self.frase1.text = @"Era uma vez um fantasminha chamado gasper, nao tao diferente";
    self.frase2.text = @"dos outros habitantes da sua cidade, trashland.";
    
    self.background.image = [UIImage imageNamed:@"telainicial1_semtexto"];
}

-(void)out1{
    [self.interrogacao3 setAlpha:0.0f];
    [self.interrogacao2 setAlpha:0.0f];
    [self.interrogacao1 setAlpha:0.0f];
    [self.frase1 setAlpha:0.0f];
    [self.frase2 setAlpha:0.0f];
    [self.frase3 setAlpha:0.0f];
    [self.frase4 setAlpha:0.0f];
}

-(void)in1{
    [self.interrogacao3 setAlpha:1.0f];
    [self.interrogacao2 setAlpha:1.0f];
    [self.interrogacao1 setAlpha:1.0f];
    [self.frase3 setAlpha:1.0f];
    [self.frase4 setAlpha:1.0f];
    [self.frase1 setAlpha:1.0f];
    [self.frase2 setAlpha:1.0f];
    self.frase3.text = @"Mas gasper possuia uma grande";
    self.frase1.text = @"curiosidade com tudo ao seu redor,";
    self.frase2.text = @"ainda mais na sua cidade trashland";
    self.frase4.text = @"onde tudo parecia estar fora do lugar!";
    
    
    self.background.image = [UIImage imageNamed:@"telainicial2_semtexto"];
}

-(void)out2{
    [self.frase5 setAlpha:0.0f];
    [self.frase6 setAlpha:0.0f];
    [self.frase7 setAlpha:0.0f];
    [self.balao1 setAlpha:0.0f];
    [self.balao2 setAlpha:0.0f];
    [self.balao3 setAlpha:0.0f];
    [self.balao4 setAlpha:0.0f];
    [self.balao5 setAlpha:0.0f];
    [self.balao6 setAlpha:0.0f];
}

-(void)in2{
    [self.frase5 setAlpha:1.0f];
    [self.frase6 setAlpha:1.0f];
    [self.frase7 setAlpha:1.0f];
    [self.balao1 setAlpha:1.0f];
    [self.balao2 setAlpha:1.0f];
    [self.balao3 setAlpha:1.0f];
    [self.balao4 setAlpha:1.0f];
    [self.balao5 setAlpha:1.0f];
    [self.balao6 setAlpha:1.0f];
    
    
    self.background.image = [UIImage imageNamed:@"telainicial3-3"];
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
