//
//  firstPhaseViewController.m
//  Trashland
//
//  Created by Thiago Borges Jordani on 10/06/15.
//  Copyright (c) 2015 Thiago Borges Jordani. All rights reserved.
//

#import "Phase1.h"
#import "DraggableImageView.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Start.h"
#import "AppDelegate.h"
#import "PhasesChoose.h"

@interface Phase1 (){
    int tempo;
    
    BOOL pontoLuz1;
    BOOL pontoLuz2;
    BOOL pontoLuz3;
    BOOL pontoLuz4;
    
    BOOL pontoTV;
    
    BOOL pontoAgua1;
    BOOL pontoAgua2;
    
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *contentBG;
@property (weak, nonatomic) IBOutlet DraggableImageView *birdImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowImgView;

@property (strong, nonatomic) UIGravityBehavior *grav;
@property (weak, nonatomic) IBOutlet UIImageView *showerGIF;
@property (weak, nonatomic) IBOutlet UIImageView *torneiraGIF;
@property (weak, nonatomic) IBOutlet UIImageView *tvGIF;

@property (weak, nonatomic) IBOutlet UIImageView *nuvem1Acesa;
@property (weak, nonatomic) IBOutlet UIImageView *nuvem2Acesa;

@property (weak, nonatomic) IBOutlet UIView *auxView;

@end

@implementation Phase1
UIDynamicAnimator* _animator;
UIGravityBehavior* _gravity;
UICollisionBehavior* _collision;
SystemSoundID sound1;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self.gasperEscolhido isEqualToString:@"gravata"]) {
        
        self.charImgView.image = [UIImage imageNamed:@"custom15"];
    }
    else if ([self.gasperEscolhido isEqualToString:@"bolsa"]){
        
        self.charImgView.image = [UIImage imageNamed:@"custom19"];
    }
    else if ([self.gasperEscolhido isEqualToString:@"oculos"]){
        
        self.charImgView.image = [UIImage imageNamed:@"custom16"];
    }
    else if ([self.gasperEscolhido isEqualToString:@"chapeu"]){
        
        self.charImgView.image = [UIImage imageNamed:@"custom18"];
    }
    else if ([self.gasperEscolhido isEqualToString:@"vibe"]){
        
        self.charImgView.image = [UIImage imageNamed:@"custom20"];
    }
    else if ([self.gasperEscolhido isEqualToString:@"tapaolho"]){
        
        self.charImgView.image = [UIImage imageNamed:@"custom17"];
    }
    else{
        self.charImgView.image = [UIImage imageNamed:@"fantasminha"];
    }

    
    if(self.player.medalha1fase1){
        self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
    }
    
    if(self.player.medalha2fase1){
        self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
    }
    
    pontoLuz1 = false;
    pontoLuz2 = false;
    pontoLuz3 = false;
    pontoLuz4 = false;
    pontoTV = false;
    
    pontoAgua1 = false;
    pontoAgua2 = false;
    
    tempo = 15;
    
    [self partiu];
    
    // Do any additional setup after loading the view.
    _scrollView.contentSize = CGSizeMake(_contentBG.frame.size.width, _contentBG.frame.size.height);
    
    [self montarTela];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    [self dealWithMovement];
    
    //gif do chuveiro
    _showerGIF.image = [UIImage animatedImageNamed:@"chuveiro_Trashcity-2-" duration:0.5f];
    _torneiraGIF.image = [UIImage animatedImageNamed:@"aguatorneira_Trashcity-" duration:0.8f];
    _tvGIF.image = [UIImage animatedImageNamed:@"chuvisco_tv-" duration:0.8f];
}

- (void)viewDidAppear:(BOOL)animated {
    CGRect charFrame = self.charImgView.frame;
    charFrame.origin.y = charFrame.origin.y - 45.0;
    charFrame.size.height = charFrame.size.height + 15.0;
    
    CGRect shadowFrame = self.shadowImgView.frame;
    shadowFrame.size.width = shadowFrame.size.width/2.0;
    shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.6];//0.05
    [UIView setAnimationDelay:0.2];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationRepeatCount:9999.0];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.charImgView.frame = charFrame;
    self.shadowImgView.frame = shadowFrame;
    //    self.charImgView.alpha = 0.50;
    //    self.shadowImgView.alpha = 0.50;
    [UIView commitAnimations];
    
}

- (void)montarTela{
    //Declaring objects that will be affected from gravity (UIDynamics)
    
    self.books = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"books"]];
    self.books.frame = CGRectMake(580, 100, 129, 81);
    self.books.userInteractionEnabled = YES;
    self.books.delegate = self;
    [self.auxView addSubview:self.books];
    [self.auxView bringSubviewToFront:self.books];
    
    
    self.flower = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"plant"]];
    self.flower.frame = CGRectMake(70, 550, 78, 117);
    self.flower.userInteractionEnabled = YES;
    self.flower.delegate = self;
    [self.auxView addSubview:self.flower];
    
    self.vase = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"vase"]];
    self.vase.frame = CGRectMake(300, 10, 63, 44);
    self.vase.userInteractionEnabled = YES;
    self.vase.delegate = self;
    [self.auxView addSubview:self.vase];
    
    self.plate = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"plate"]];
    self.plate.frame = CGRectMake(695, 500, 70, 36);
    self.plate.userInteractionEnabled = YES;
    self.plate.delegate = self;
    [self.auxView addSubview:self.plate];
    
    self.vase2 = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"greenVase"]];
    self.vase2.frame = CGRectMake(730, 100, 59, 70);
    self.vase2.userInteractionEnabled = YES;
    self.vase2.delegate = self;
    [self.auxView addSubview:self.vase2];
    
    self.soap.delegate=self;
    self.rubberDuck.delegate=self;
    self.redWhiteVase.delegate=self;
    self.weirdVase.delegate=self;
    self.toiletStuff.delegate=self;
    self.pinkishVase.delegate=self;
    self.purpleVase.delegate=self;
    
    [self.scrollView addSubview:self.tvGIF];
    [self.scrollView addSubview:self.torneiraGIF];
    [self.scrollView addSubview:self.showerGIF];
//    
//    [self.auxView addSubview:self.viewFantasminha];
//    [self.viewFantasminha addSubview:self.charImgView];
//    [self.viewFantasminha addSubview:self.shadowImgView];
    
    [self.scrollView addSubview:self.nuvem1Acesa];
    [self.scrollView addSubview:self.nuvem2Acesa];
    [self.scrollView addSubview:self.luz3];
    [self.scrollView addSubview:self.luz4];
    [self.scrollView addSubview:self.bird];
    
    [self.view addSubview:self.contador];
    [self.view addSubview:self.botaoVoltar];
    [self.view addSubview:self.botaoPlay];
    [self.view addSubview:self.medalha1fase1];
    [self.view addSubview:self.medalha2fase1];
    [self.viewFantasminha.superview bringSubviewToFront: self.viewFantasminha];
}
#pragma mark - gravidade e colisoes
- (void)dealWithMovement{
    [_animator removeAllBehaviors];

    
    
    //UIDynamics
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.books, self.flower, self.vase2, self.vase, self.plate, self.soap, self.rubberDuck, self.redWhiteVase, self.weirdVase, self.toiletStuff, self.pinkishVase, self.purpleVase]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.books, self.flower, self.vase, self.vase2, self.plate, self.soap, self.rubberDuck, self.redWhiteVase, self.weirdVase, self.toiletStuff, self.pinkishVase, self.purpleVase]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    //UIDynamics (Barreiras)
    //Gaiola do pássaro
    UIView* barrier = [[UIView alloc] initWithFrame:CGRectMake(111, 300, 50, 10)];
    //barrier.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier];
    
    CGPoint rightEdge = CGPointMake(barrier.frame.origin.x +
                                    barrier.frame.size.width, barrier.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier.frame.origin
                                  toPoint:rightEdge];
    
    //(Prateleira meio)
    UIView* barrier2 = [[UIView alloc] initWithFrame:CGRectMake(580, 185, 260, 10)];
    //barrier2.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier2];
    
    CGPoint rightEdge2 = CGPointMake(barrier2.frame.origin.x +
                                     barrier2.frame.size.width, barrier2.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier2"
                                fromPoint:barrier2.frame.origin
                                  toPoint:rightEdge2];
    
    
    //(Prateleira direita)
    UIView* barrier3 = [[UIView alloc] initWithFrame:CGRectMake(870, 275, 270, 10)];
    //barrier3.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier3];
    
    CGPoint rightEdge3 = CGPointMake(barrier3.frame.origin.x +
                                     barrier3.frame.size.width, barrier3.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier3"
                                fromPoint:barrier3.frame.origin
                                  toPoint:rightEdge3];
    
    //(Mesa esquerda sofá)
    UIView* barrier4 = [[UIView alloc] initWithFrame:CGRectMake(70, 628, 100, 10)];
    //barrier4.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier4];
    
    CGPoint rightEdge4 = CGPointMake(barrier4.frame.origin.x +
                                     barrier4.frame.size.width, barrier4.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier4.frame.origin
                                  toPoint:rightEdge4];
    
    
    //(Mesa TV)
    UIView* barrier5 = [[UIView alloc] initWithFrame:CGRectMake(670, 550, 320, 10)];
    //barrier5.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier5];
    
    CGPoint rightEdge5 = CGPointMake(barrier5.frame.origin.x +
                                     barrier5.frame.size.width, barrier5.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier5"
                                fromPoint:barrier5.frame.origin
                                  toPoint:rightEdge5];
    
    //(Estante banheiro)
    UIView* barrier6 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50+ 6, 405, 179, 10)];
//    barrier6.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier6];
    
    CGPoint rightEdgeAux = CGPointMake(barrier6.frame.origin.x +
                                     barrier6.frame.size.width, barrier6.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier6"
                                fromPoint:barrier6.frame.origin
                                  toPoint:rightEdgeAux];
    
    UIView* barrier7 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50+ 6, 486, 179, 10)];
//    barrier7.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier7];
    
    rightEdgeAux = CGPointMake(barrier7.frame.origin.x +
                                     barrier7.frame.size.width, barrier7.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier7"
                                fromPoint:barrier7.frame.origin
                                  toPoint:rightEdgeAux];
    //(Mesa TV)
    UIView* barrier8 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50+ 6, 435 + 51 + 81, 179, 10)];
//    barrier8.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier8];
    
    rightEdgeAux = CGPointMake(barrier8.frame.origin.x +
                                     barrier8.frame.size.width, barrier8.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier8"
                                fromPoint:barrier8.frame.origin
                                  toPoint:rightEdgeAux];
    //(Mesa TV)
    UIView* barrier9 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50 + 6, 435 + 51 + 81 + 81, 179, 10)];
//    barrier9.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier9];
    
    rightEdgeAux = CGPointMake(barrier9.frame.origin.x +
                                     barrier9.frame.size.width, barrier9.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier9"
                                fromPoint:barrier9.frame.origin
                                  toPoint:rightEdgeAux];
//    //(Mesa TV)
//    UIView* barrier5 = [[UIView alloc] initWithFrame:CGRectMake(670, 550, 320, 10)];
//    barrier5.backgroundColor = [UIColor redColor];
//    [self.auxView addSubview:barrier5];
//    
//    rightEdgeAux = CGPointMake(barrier5.frame.origin.x +
//                                     barrier5.frame.size.width, barrier5.frame.origin.y);
//    [_collision addBoundaryWithIdentifier:@"barrier5"
//                                fromPoint:barrier5.frame.origin
//                                  toPoint:rightEdgeAux];
//    //(Mesa TV)
//    UIView* barrier5 = [[UIView alloc] initWithFrame:CGRectMake(670, 550, 320, 10)];
//    barrier5.backgroundColor = [UIColor redColor];
//    [self.auxView addSubview:barrier5];
//    
//    rightEdgeAux = CGPointMake(barrier5.frame.origin.x +
//                                     barrier5.frame.size.width, barrier5.frame.origin.y);
//    [_collision addBoundaryWithIdentifier:@"barrier5"
//                                fromPoint:barrier5.frame.origin
//                                  toPoint:rightEdgeAux];
    
    
    
}

#pragma mark - Button Action
- (IBAction)didClickShower {
    _showerGIF.hidden = !_showerGIF.hidden;
    pontoAgua2 = !pontoAgua2;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"shower" withExtension:@"mp3"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
 //   AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)didClickTap {
    _torneiraGIF.hidden = !_torneiraGIF.hidden;
    pontoAgua1 = !pontoAgua1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"drop" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
  //  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)didClickTv {
    _tvGIF.hidden = !_tvGIF.hidden;
    pontoTV = !pontoTV;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"TV" withExtension:@"aiff"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
    //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)didClickFirstCloud {
    _nuvem1Acesa.hidden = !_nuvem1Acesa.hidden;
    pontoLuz1 = !pontoLuz1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"click" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
   // AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)didClickSecondCloud {
    _nuvem2Acesa.hidden = !_nuvem2Acesa.hidden;
    pontoLuz2 = !pontoLuz2;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"click" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
   // AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

-(IBAction)didClickFirstBathLamp:(id)sender{
    self.luz3.hidden = !self.luz3.hidden;
    pontoLuz3 = !pontoLuz3;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"click" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
}

-(IBAction)didClickSecondBathLamp:(id)sender{
    self.luz4.hidden = !self.luz4.hidden;
    pontoLuz4 = !pontoLuz4;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"click" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
}

-(IBAction)didClickBird:(id)sender{
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"bird" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
}

-(void)partiu{
    if (tempo >= 0){
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(partiu) userInfo:nil repeats:NO];
        NSString* time = [[NSString alloc] initWithFormat:@"%i", tempo];
        self.contador.text = time;
        
        if (tempo > 15){}
        if (15 >= tempo && tempo > 10) {}
        if (10 >= tempo && tempo > 5) {}
        if (5 > tempo) {}
        NSLog(@"%i", tempo);
    }
    else{
        if (pontoLuz1 && pontoLuz2 && pontoLuz3 && pontoLuz4 && pontoTV) {
            self.player.medalha1fase1 = true;
        }
        if (pontoAgua1 && pontoAgua2) {
            self.player.medalha2fase1 = true;
        }
        if (self.player.medalha1fase1 && self.player.medalha2fase1) {
            self.player.fase2 = true;
        }
        PhasesChoose *game = [self.storyboard instantiateViewControllerWithIdentifier:@"PhasesChooseVC"];
        [game setModalPresentationStyle:UIModalPresentationFullScreen];
        game.player = self.player;
        [self presentViewController:game animated:YES completion:nil];
    }
    tempo--;
}

-(IBAction)voltar:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
