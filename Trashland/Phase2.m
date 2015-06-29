//
//  Phase2.m
//  Trashland
//
//  Created by Bruno Muniz Azevedo Filho on 6/15/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase2.h"
#import <AudioToolbox/AudioToolbox.h>
#import "PhasesChoose.h"
#import "PopUpViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface Phase2()<UICollisionBehaviorDelegate, UIScrollViewDelegate>{
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
    SystemSoundID sound1;
    AVAudioPlayer *_audioPlayer5;
    NSString *path4;
    
    int treesCounter;
    int trashLeft;

}
@property (weak, nonatomic) IBOutlet UIView *auxView;


@end

@implementation Phase2
float deslocIni;
-(void)dealloc{
    
    NSLog(@"desalocou Phase2");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view.layer removeAllAnimations];
    _auxView = nil;
    _player = nil;
    _phaseScrollView = nil;
    _phaseBG = nil;
    _balao = nil;
    _bolinhaVermelha = nil;
    _bolinhaVerde = nil;
    _arvore1 = nil;
    _arvore2 = nil;
    _arvore3 = nil;
    _arvore4 = nil;
    _arvore5 = nil;
    _garrafaPet1 = nil;
    _lata = nil;
    _garrafaVidro = nil;
    _papel = nil;
    _garrafaPet2 = nil;
    _cascaBanana = nil;
    _zzzImage = nil;
    _charImageView = nil;
    _shadowImageView = nil;
    _fantasminhaView = nil;
    _gasperEscolhido = nil;
    _botaoProximo = nil;
    _badgeLixo = nil;
    _badgeNatureza = nil;
    _popUpView = nil;
    _lixos = nil;
}

-(void)viewDidLoad{
    [super viewDidLoad];
    _phaseScrollView.contentSize = CGSizeMake(_phaseBG.frame.size.width, _phaseBG.frame.size.height);
    _phaseScrollView.delegate = self;
    treesCounter = 5;
    trashLeft = 6;
    self.lixos = [@[@NO,@NO,@NO,@NO,@NO,@NO] mutableCopy];
    
    if(self.player.medalha1fase2){
        self.badgeLixo.image = [UIImage imageNamed:@"badge-lixo-color"];
        self.botaoProximo.enabled = YES;
    }
    
    if(self.player.medalha2fase2){
        self.badgeNatureza.image = [UIImage imageNamed:@"badge-natureza-color"];
        self.botaoProximo.enabled = YES;
    }
    
    [self beepoCustomizado];
    
    [self prepareForMovement];
    [self dealWithMovement];
    
    self.balao.image = [UIImage animatedImageNamed:@"balao-" duration:1.2f];
    self.bolinhaVermelha.image = [UIImage animatedImageNamed:@"bolinhavermelha_piscando-" duration:1.6f];//bolinhaverde_piscando-
    self.bolinhaVerde.image = [UIImage animatedImageNamed:@"bolinhaverde_piscando-" duration:1.2f];//bolinhavermelha_piscando-
    self.bolinhaVermelha.hidden = YES;
    self.bolinhaVerde.hidden = YES;
    
    
    _lookingBack = NO;
    _fantasminhaView.charImgView  = _charImageView;
    _fantasminhaView.podeX=YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self beepoAnimado];
    path4 = [NSString stringWithFormat:@"%@/6_parque.mp3", [[NSBundle mainBundle] resourcePath]];
    
}

-(void)checkObjectives{
    if (treesCounter == 0 && !self.player.medalha2fase2) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-natureza"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        self.player.medalha2fase2 = YES;
        self.badgeNatureza.image = [UIImage imageNamed:@"badge-natureza-color"];
        self.botaoProximo.enabled = YES;
        self.player.fase3 = true;
    }
}

#pragma mark - scrollview delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    deslocIni = scrollView.contentOffset.x;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    UIImage *beepoImage = [self getBeepoImage];
    float diff =scrollView.contentOffset.x - deslocIni;
    if (diff > 0 && _lookingBack) {
        self.charImageView.image = beepoImage;
        _lookingBack = NO;
    } else if (diff < 0 && _lookingBack){
        
    } else if (diff > 0 && !_lookingBack){
        
    } else{
        self.charImageView.image = [UIImage imageWithCGImage:beepoImage.CGImage
                                                       scale:beepoImage.scale
                                                 orientation:UIImageOrientationUpMirrored];
        _lookingBack = YES;
    }
    
    CGRect oldframe = self.fantasminhaView.frame;
    oldframe.origin.x = oldframe.origin.x + diff;
    deslocIni = scrollView.contentOffset.x;
    self.fantasminhaView.frame = oldframe;
}

#pragma mark - customização e animação de Beepo
- (void)beepoAnimado{
    CGRect charFrame = self.charImageView.frame;
    charFrame.origin.y = charFrame.origin.y - 45.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.shadowImageView.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.charImageView.frame = charFrame;
    self.shadowImageView.frame = shadowFrame;
    
    [UIView commitAnimations];
}

- (UIImage*)getBeepoImage{
    UIImage *aux;
//    if ([self.player.gasperEscolhido isEqualToString:@"gravata"]) {
//        
//        aux = [UIImage imageNamed:@"custom15"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"bolsa"]){
//        
//        aux = [UIImage imageNamed:@"custom19"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"oculos"]){
//        
//        aux = [UIImage imageNamed:@"custom16"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"chapeu"]){
//        
//        aux = [UIImage imageNamed:@"custom18"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"vibe"]){
//        
//        aux = [UIImage imageNamed:@"custom20"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"tapaolho"]){
//        
//        aux = [UIImage imageNamed:@"custom17"];
//    }
//    else{
//        aux = [UIImage imageNamed:@"fantasminha"];
//    }
    aux = self.player.gasperEscolhido;
    
    return aux;
}

- (void)beepoCustomizado{
//    if ([self.gasperEscolhido isEqualToString:@"gravata"]) {
//        
//        self.charImageView.image = [UIImage imageNamed:@"custom15"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"bolsa"]){
//        
//        self.charImageView.image = [UIImage imageNamed:@"custom19"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"oculos"]){
//        
//        self.charImageView.image = [UIImage imageNamed:@"custom16"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"chapeu"]){
//        
//        self.charImageView.image = [UIImage imageNamed:@"custom18"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"vibe"]){
//        
//        self.charImageView.image = [UIImage imageNamed:@"custom20"];
//    }
//    else if ([self.gasperEscolhido isEqualToString:@"tapaolho"]){
//        
//        self.charImageView.image = [UIImage imageNamed:@"custom17"];
//    }
//    else{
//        self.charImageView.image = [UIImage imageNamed:@"fantasminha"];
//    }
    self.charImageView.image = self.player.gasperEscolhido;
}
#pragma mark - Gavidade e Colisões
- (void)prepareForMovement{
    self.garrafaPet1.delegate = self;
    self.garrafaPet2.delegate = self;
    self.garrafaVidro.delegate = self;
    self.lata.delegate = self;
    self.papel.delegate = self;
    self.cascaBanana.delegate = self;
}

- (void)dealWithMovement{
    [_collision removeAllBoundaries];
    [_animator removeAllBehaviors];
    
    //UIDynamics
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.garrafaPet1, self.garrafaPet2, self.garrafaVidro, self.lata, self.papel, self.cascaBanana]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.garrafaPet1, self.garrafaPet2, self.garrafaVidro, self.lata, self.papel, self.cascaBanana]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    _collision.collisionDelegate = self;
    //UIDynamics (Barreiras)
    
    UIView* barrier = [[UIView alloc] initWithFrame:CGRectMake(1977, 636, 120, 10)];
//    barrier.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier];
    
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoPapel"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
    barrier = [[UIView alloc] initWithFrame:CGRectMake(2100, 636, 120, 10)];
//    barrier.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier];
    
    rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoPlastico"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];

    barrier = [[UIView alloc] initWithFrame:CGRectMake(2223, 636, 120, 10)];
//    barrier.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier];
    
    rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoMetal"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
    barrier = [[UIView alloc] initWithFrame:CGRectMake(2346, 636, 120, 10)];
//    barrier.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier];
    
    rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoVidro"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
    barrier = [[UIView alloc] initWithFrame:CGRectMake(2469, 636, 120, 10)];
//    barrier.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier];
    
    rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoOrganico"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
    barrier = [[UIView alloc] initWithFrame:CGRectMake(0, self.auxView.frame.size.height - 26.0, self.auxView.frame.size.width, 10)];
//    barrier.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier];
    
    rightEdge = CGPointMake(barrier.frame.origin.x +
                            barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"piso"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    if (identifier &&  ![[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"piso"]) {
        if ([self.lixos[((UIImageView *)item).tag] isEqual:@0]) {
            if ((((UIImageView *)item).tag == 0 || ((UIImageView *)item).tag == 4) && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoPlastico"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                
                AudioServicesDisposeSystemSoundID (sound1);
                NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"coin" withExtension:@"wav"];
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
                AudioServicesPlaySystemSound(sound1);
                
                
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 3 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoPapel"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                
                AudioServicesDisposeSystemSoundID (sound1);
                NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"coin" withExtension:@"wav"];
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
                AudioServicesPlaySystemSound(sound1);
                
                
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 2 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoVidro"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                
                AudioServicesDisposeSystemSoundID (sound1);
                NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"coin" withExtension:@"wav"];
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
                AudioServicesPlaySystemSound(sound1);
                
                
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 1 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoMetal"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                
                AudioServicesDisposeSystemSoundID (sound1);
                NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"coin" withExtension:@"wav"];
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
                AudioServicesPlaySystemSound(sound1);
                
                
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 5 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoOrganico"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                
                AudioServicesDisposeSystemSoundID (sound1);
                NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"coin" withExtension:@"wav"];
                AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
                AudioServicesPlaySystemSound(sound1);
                
                
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            }
            if (trashLeft == 0) {
                PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
                [popUp setImageNamed: @"pop-up-lixo"];
                self.popUpView = popUp;
                [popUp showInView:self.view animated:YES];
                self.player.medalha1fase2 = YES;
                self.player.fase3 = true;
                self.badgeLixo.image = [UIImage imageNamed:@"badge-lixo-color"];
                self.botaoProximo.enabled = YES;
            }
        }
    }
}
#pragma mark - Button Actions
//Trees
- (IBAction)didClickTree1:(UIButton *)sender {
    
    treesCounter = treesCounter - 1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"arvore_nascendo" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
    
    
    
    _arvore1.image = [UIImage imageNamed:@"parque-03"];
    float yInicial = _arvore1.frame.origin.y;
    float hInicial = _arvore1.frame.size.height;
    float yFinal = yInicial - (1070/2 - hInicial);
    float xInicial = _arvore1.frame.origin.x;
    float wInicial = _arvore1.frame.size.width;
    float xFinal = xInicial - (888/2 - wInicial)/2;
    _arvore1.frame = CGRectMake(xFinal-9, yFinal, 888/2
                                , 1070/2);
    sender.userInteractionEnabled = NO;
    
    [self checkObjectives];
}
- (IBAction)didClickTree2:(UIButton *)sender {
    
    treesCounter = treesCounter - 1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"arvore_nascendo" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
    
    
    _arvore2.image = [UIImage imageNamed:@"parque-04"];
    float yInicial = _arvore2.frame.origin.y;
    float hInicial = _arvore2.frame.size.height;
    float yFinal = yInicial - (1298/2 - hInicial);
    float xInicial = _arvore2.frame.origin.x;
    float wInicial = _arvore2.frame.size.width;
    float xFinal = xInicial - (1064/2 - wInicial)/2;
    _arvore2.frame = CGRectMake(xFinal-9, yFinal, 1064/2
                                , 1298/2);
    sender.userInteractionEnabled = NO;
    [self checkObjectives];
}
- (IBAction)didClickTree3:(UIButton *)sender {
    
    treesCounter = treesCounter - 1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"arvore_nascendo" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
    
    
    _arvore3.image = [UIImage imageNamed:@"parque-05"];
    float yInicial = _arvore3.frame.origin.y;
    float hInicial = _arvore3.frame.size.height;
    float yFinal = yInicial - (1300/2 - hInicial);
    float xInicial = _arvore3.frame.origin.x;
    float wInicial = _arvore3.frame.size.width;
    float xFinal = xInicial - (1080/2 - wInicial)/2;
    _arvore3.frame = CGRectMake(xFinal-11, yFinal, 1080/2
                                , 1300/2);
    sender.userInteractionEnabled = NO;
    [self checkObjectives];
}
- (IBAction)didClickTree4:(UIButton *)sender {
    
    treesCounter = treesCounter - 1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"arvore_nascendo" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
    
    
    _arvore4.image = [UIImage imageNamed:@"parque-06"];
    float yInicial = _arvore4.frame.origin.y;
    float hInicial = _arvore4.frame.size.height;
    float yFinal = yInicial - (1068/2 - hInicial);
    float xInicial = _arvore4.frame.origin.x;
    float wInicial = _arvore4.frame.size.width;
    float xFinal = xInicial - (874/2 - wInicial)/2;
    _arvore4.frame = CGRectMake(xFinal-8, yFinal, 874/2
                                , 1068/2);
    NSLog(@"%f %f",xFinal-11,yFinal);
    sender.userInteractionEnabled = NO;
    self.bolinhaVermelha.hidden = NO;
    self.bolinhaVerde.hidden = NO;
    [self checkObjectives];
}
- (IBAction)didClickTree5:(UIButton *)sender {
    
    treesCounter = treesCounter - 1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"arvore_nascendo" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
    
    _arvore5.image = [UIImage imageNamed:@"parque-07"];
    float yInicial = _arvore5.frame.origin.y;
    float hInicial = _arvore5.frame.size.height;
    float yFinal = yInicial - (1298/2 - hInicial);
    float xInicial = _arvore5.frame.origin.x;
    float wInicial = _arvore5.frame.size.width;
    float xFinal = xInicial - (1064/2 - wInicial)/2;
    _arvore5.frame = CGRectMake(xFinal-9, yFinal, 1064/2
                                , 1298/2);
    sender.userInteractionEnabled = NO;
    [self checkObjectives];
}

//Bolotas
- (IBAction)didClickDormidor:(UIButton *)sender {
    [CATransaction begin];
    self.zzzImage.hidden = NO;
    sender.userInteractionEnabled = NO;
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    [anim setToValue:[NSNumber numberWithFloat:0.0f]];
    [anim setFromValue:[NSNumber numberWithDouble:M_PI/16]]; // rotation angle
    [anim setDuration:0.1];
    [anim setRepeatCount:5.0];
    [anim setAutoreverses:YES];
    [CATransaction setCompletionBlock:^{
        self.zzzImage.hidden = YES;
        sender.userInteractionEnabled = YES;
    }];
    [[self.zzzImage layer] addAnimation:anim forKey:@"iconShake"];
    [CATransaction commit];
}
- (IBAction)didClickPolice:(UIButton *)sender {
}

//Controle
- (IBAction)didClickBackButton:(id)sender {
    [self.player dismissToPhaseSelect];
}
- (IBAction)didClickReadButton:(id)sender {
}
- (IBAction)didClickNextButton:(id)sender {
//    PhasesChoose *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PhasesChooseVC"];
//    [game setModalPresentationStyle:UIModalPresentationFullScreen];
//    self.player.fase3 = true;
//    game.player = self.player;
//    [self presentViewController:game animated:YES completion:nil];
    
    [self.player dismissToPhaseSelect];
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path4];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer5 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer5 play];
}

@end
