#import "Phase1.h"
#import "DraggableImageView.h"
#import <AudioToolbox/AudioToolbox.h>
#import "Start.h"
#import "AppDelegate.h"
#import "PhasesChoose.h"
#import "PopUpViewController.h"
#import "PhasesChoose.h"
#import "UIView+Animation2.h"

@interface Phase1 ()<UIScrollViewDelegate>{
    int tempo;
    
    BOOL pontoLuz1;
    BOOL pontoLuz2;
    BOOL pontoLuz3;
    BOOL pontoLuz4;
    
    BOOL pontoTV;
    
    BOOL pontoAgua1;
    BOOL pontoAgua2;
    
    BOOL TVLigada;
    
    BOOL podePassar;
    
    SystemSoundID sound1;
    
    
    AVAudioPlayer *_audioPlayer3;
    NSString *path2;
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
    NSTimer* badgeCheck;
    NSTimer* tvCheck;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *contentBG;
@property (weak, nonatomic) IBOutlet DraggableImageView *birdImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowImgView;

@property (retain, nonatomic) UIGravityBehavior *grav;
@property (weak, nonatomic) IBOutlet UIImageView *showerGIF;
@property (weak, nonatomic) IBOutlet UIImageView *torneiraGIF;
@property (weak, nonatomic) IBOutlet UIImageView *tvGIF;

@property (weak, nonatomic) IBOutlet UIImageView *nuvem1Acesa;
@property (weak, nonatomic) IBOutlet UIImageView *nuvem2Acesa;

@property (weak, nonatomic) IBOutlet UIView *auxView;

@end

@implementation Phase1

- (void)viewDidLoad {
    [super viewDidLoad];
    
    path2 = [NSString stringWithFormat:@"%@/4_sala.mp3", [[NSBundle mainBundle] resourcePath]];
    [self.botaoPlay tada:NULL];
    
    self.botaoProx.alpha = 0.5f;
    
    self.charImgView.image = self.player.gasperEscolhido;
    
    if(self.player.medalha1fase1){
        self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
        self.botaoProx.enabled = YES;
    }
    
    if(self.player.medalha2fase1){
        self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
        self.botaoProx.enabled = YES;
    }
    
    pontoLuz1 = false;
    pontoLuz2 = false;
    pontoLuz3 = false;
    pontoLuz4 = false;
    pontoTV = false;
    
    TVLigada = true;
    
    pontoAgua1 = false;
    pontoAgua2 = false;
    
    podePassar = false;
    
    // Do any additional setup after loading the view.
    _scrollView.contentSize = CGSizeMake(_contentBG.frame.size.width, _contentBG.frame.size.height);
    _scrollView.delegate = self;
    [self montarTela];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    [self dealWithMovement];
    
    //gif do chuveiro
    _showerGIF.image = [UIImage animatedImageNamed:@"chuveiro_Trashcity-2-" duration:0.5f];
    _torneiraGIF.image = [UIImage animatedImageNamed:@"aguatorneira_Trashcity-" duration:0.8f];
    _tvGIF.image = [UIImage animatedImageNamed:@"chuvisco_tv-" duration:0.8f];
    
    //[self tocaTV];
    //tvCheck = [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkTV) userInfo:nil repeats:YES];
    badgeCheck = [NSTimer scheduledTimerWithTimeInterval:0.3f target:self selector:@selector(checkBadges) userInfo:nil repeats:YES];
    
}

-(void)dealloc{
    
    
    NSLog(@"desalocou Phase1");
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.view.layer removeAllAnimations]; 
    [tvCheck invalidate];
    tvCheck = nil;
    [badgeCheck invalidate];
    badgeCheck = nil;
    [_collision removeAllBoundaries];
    [_animator removeAllBehaviors];
    [_books removeFromSuperview];
    [_flower removeFromSuperview];
    [_plate removeFromSuperview];
    [_vase2 removeFromSuperview];
    [_books morre];
    [_flower morre];
    [_plate morre];
    [_vase2 morre];
    [_soap morre];
    [_rubberDuck morre];
    [_redWhiteVase morre];
    [_weirdVase morre];
    [_toiletStuff morre];
    [_pinkishVase morre];
    [_purpleVase morre];
    [_fantasmaView morre];
    _tvGIF.image = nil;
    _collision=nil;
    _animator=nil;
    _popUpView = nil;
    _books = nil;
    _flower = nil;
    _vase2 = nil;
    _plate = nil;
    _scrollView = nil;
    _contentBG = nil;
    _birdImageView = nil;
    _shadowImgView = nil;
    _grav = nil;
    _showerGIF = nil;
    _torneiraGIF = nil;
    _tvGIF = nil;
    _nuvem1Acesa = nil;
    _nuvem2Acesa = nil;
    _auxView = nil;
    _viewFantasminha = nil;
    _phase1 = nil;
    _luz3 = nil;
    _luz4 = nil;
    _charImgView = nil;
    _soap = nil;
    _rubberDuck = nil;
    _redWhiteVase = nil;
    _weirdVase = nil;
    _toiletStuff = nil;
    _pinkishVase = nil;
    _purpleVase = nil;
    _fantasmaView = nil;
    _medalha1fase1 = nil;
    _medalha2fase1 = nil;
    _bird = nil;
    _botaoVoltar = nil;
    _botaoPlay = nil;
    _botaoProx = nil;
    _contador = nil;
    _popUpView = nil;
    _player = nil;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.fantasmaView.podeX = YES;
    
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
    [UIView setAnimationRepeatCount:NSUIntegerMax];
    [UIView setAnimationRepeatAutoreverses:YES];
    
    self.charImgView.frame = charFrame;
    self.shadowImgView.frame = shadowFrame;
    [UIView commitAnimations];
    
}

- (void)montarTela{
    //Declaring objects that will be affected from gravity (UIDynamics)
    
    self.books = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"books"]];
    self.books.frame = CGRectMake(580, 100, 129, 81);
    self.books.userInteractionEnabled = YES;
    self.books.delegate = self;
    [self.auxView addSubview:self.books];
    
    
    self.flower = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"plant"]];
    self.flower.frame = CGRectMake(70, 550, 78, 117);
    self.flower.userInteractionEnabled = YES;
    self.flower.delegate = self;
    [self.auxView addSubview:self.flower];
    
//    self.vase = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"vase"]];
//    self.vase.frame = CGRectMake(300, 10, 63, 44);
//    self.vase.userInteractionEnabled = YES;
//    self.vase.delegate = self;
//    [self.auxView addSubview:self.vase];
    
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
    
    [self.auxView bringSubviewToFront:self.tvGIF];
    [self.auxView bringSubviewToFront:self.torneiraGIF];
    [self.auxView bringSubviewToFront:self.showerGIF];
//    
//    [self.auxView addSubview:self.viewFantasminha];
//    [self.viewFantasminha addSubview:self.charImgView];
//    [self.viewFantasminha addSubview:self.shadowImgView];
    
    [self.auxView bringSubviewToFront:self.nuvem1Acesa];
    [self.auxView bringSubviewToFront:self.nuvem2Acesa];
    [self.auxView bringSubviewToFront:self.luz3];
    [self.auxView bringSubviewToFront:self.luz4];
    [self.auxView bringSubviewToFront:self.bird];
    
//    [self.view bringSubviewToFront:self.contador];
    [self.view bringSubviewToFront:self.botaoVoltar];
    [self.view bringSubviewToFront:self.botaoPlay];
    [self.view bringSubviewToFront:self.botaoProx];
    [self.view bringSubviewToFront:self.medalha1fase1];
    [self.view bringSubviewToFront:self.medalha2fase1];
    [self.viewFantasminha.superview bringSubviewToFront: self.viewFantasminha];
    
    
    
    self.books.podeY = YES;
    self.vase2.podeY = YES;
    self.weirdVase.podeY = YES;
    self.flower.podeY = YES;
    self.pinkishVase.podeY = YES;
    self.plate.podeY = YES;
    self.purpleVase.podeY = YES;
    self.redWhiteVase.podeY = YES;
    self.rubberDuck.podeY = YES;
    self.soap.podeY = YES;
    self.toiletStuff.podeY = YES;
    
    self.books.podeX = YES;
    self.vase2.podeX = YES;
    self.weirdVase.podeX = YES;
    self.flower.podeX = YES;
    self.pinkishVase.podeX = YES;
    self.plate.podeX = YES;
    self.purpleVase.podeX = YES;
    self.redWhiteVase.podeX = YES;
    self.rubberDuck.podeX = YES;
    self.soap.podeX = YES;
    self.toiletStuff.podeX = YES;
}

#pragma mark - gravidade e colisoes
- (void)dealWithMovement{
    [_collision removeAllBoundaries];
    [_animator removeAllBehaviors];

    
    
    //UIDynamics
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.books, self.flower, self.vase2, self.plate, self.soap, self.rubberDuck, self.redWhiteVase, self.weirdVase, self.toiletStuff, self.pinkishVase, self.purpleVase]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.books, self.flower, self.vase2, self.plate, self.soap, self.rubberDuck, self.redWhiteVase, self.weirdVase, self.toiletStuff, self.pinkishVase, self.purpleVase]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    //(Prateleira meio)
    UIView* barrier2 = [[UIView alloc] initWithFrame:CGRectMake(580, 180, 260, 10)];
   // barrier2.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier2];
    
    CGPoint rightEdge2 = CGPointMake(barrier2.frame.origin.x +
                                     barrier2.frame.size.width, barrier2.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier2"
                                fromPoint:barrier2.frame.origin
                                  toPoint:rightEdge2];
    
    
    //(chao)
    UIView* barrier3 = [[UIView alloc] initWithFrame:CGRectMake(0, 742, _contentBG.frame.size.width, 10)];
   // barrier3.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier3];
    
    CGPoint rightEdge3 = CGPointMake(barrier3.frame.origin.x +
                                    barrier3.frame.size.width, barrier3.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier3"
                                fromPoint:barrier3.frame.origin
                                  toPoint:rightEdge3];
    
    //(Mesa esquerda sofá)
    UIView* barrier4 = [[UIView alloc] initWithFrame:CGRectMake(70, 626, 100, 10)];
    //barrier4.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier4];
    
    CGPoint rightEdge4 = CGPointMake(barrier4.frame.origin.x +
                                     barrier4.frame.size.width, barrier4.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier4.frame.origin
                                  toPoint:rightEdge4];
    
    
    //(Mesa TV)
    UIView* barrier5 = [[UIView alloc] initWithFrame:CGRectMake(670, 544, 320, 10)];
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
   
    UIView* barrier8 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50+ 6, 435 + 51 + 81, 179, 10)];
//    barrier8.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier8];
    
    rightEdgeAux = CGPointMake(barrier8.frame.origin.x +
                                     barrier8.frame.size.width, barrier8.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier8"
                                fromPoint:barrier8.frame.origin
                                  toPoint:rightEdgeAux];
    
    UIView* barrier9 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50 + 6, 435 + 51 + 81 + 81, 179, 10)];
//    barrier9.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier9];
    
    rightEdgeAux = CGPointMake(barrier9.frame.origin.x +
                                     barrier9.frame.size.width, barrier9.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier9"
                                fromPoint:barrier9.frame.origin
                                  toPoint:rightEdgeAux];
    //(Mesa TV)
    UIView* barrier10 = [[UIView alloc] initWithFrame:CGRectMake(1820 , 479 + 46, 145, 10)];
//    barrier10.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier10];
    
    rightEdgeAux = CGPointMake(barrier10.frame.origin.x +
                                     barrier10.frame.size.width, barrier10.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier10"
                                fromPoint:barrier10.frame.origin
                                  toPoint:rightEdgeAux];
    
    
}

#pragma mark - Button Action
- (IBAction)didClickShower {
    _showerGIF.hidden = !_showerGIF.hidden;
    pontoAgua2 = !pontoAgua2;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"closeTap" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
 //   AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)didClickTap {
    _torneiraGIF.hidden = !_torneiraGIF.hidden;
    pontoAgua1 = !pontoAgua1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"closeTap" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
  //  AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)didClickTv {
    _tvGIF.hidden = !_tvGIF.hidden;
    pontoTV = !pontoTV;
    TVLigada = !TVLigada;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"tvfinal" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);

   }

- (IBAction)didClickFirstCloud {
    _nuvem1Acesa.hidden = !_nuvem1Acesa.hidden;
    pontoLuz1 = !pontoLuz1;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"clickcut" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
   // AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)didClickSecondCloud {
    _nuvem2Acesa.hidden = !_nuvem2Acesa.hidden;
    pontoLuz2 = !pontoLuz2;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"clickcut" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
   // AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

-(IBAction)didClickFirstBathLamp:(id)sender{
    self.luz3.hidden = !self.luz3.hidden;
    pontoLuz3 = !pontoLuz3;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"clickcut" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
}

-(IBAction)didClickSecondBathLamp:(id)sender{
    self.luz4.hidden = !self.luz4.hidden;
    pontoLuz4 = !pontoLuz4;
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"clickcut" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
}

-(IBAction)didClickBird:(id)sender{
    AudioServicesDisposeSystemSoundID (sound1);
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"birdcut" withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlaySystemSound(sound1);
}

-(IBAction)proxima:(id)sender{
    if (self.player.medalha1fase1 || self.player.medalha2fase1) {
        [self.player dismissToPhaseSelect];
    }
}

-(IBAction)voltar:(id)sender{
    
    [self.player dismissToPhaseSelect];
    _player = nil;
}

-(void)tocaTV{
//    AudioServicesDisposeSystemSoundID (sound1);
//    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"tv1s" withExtension:@"wav"];
//    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
//    AudioServicesPlaySystemSound(sound1);
    //AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

-(void)checkTV{
    if (TVLigada) {
        [self tocaTV];
    }
    else{
        AudioServicesDisposeSystemSoundID(sound1);
    }
}

-(void)checkBadges{
    if (!self.player.medalha1fase1 && pontoAgua1 && pontoAgua2) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-agua"];
        self.popUpView = popUp;
        self.player.fase2 = true;
        [popUp showInView:self.view animated:YES];
        self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
        self.player.medalha1fase1 = true;
        self.botaoProx.alpha = 1.0f;
        
    }
    if (!self.player.medalha2fase1 && pontoLuz1 && pontoLuz2 && pontoLuz3 && pontoLuz4 && pontoTV) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-energia"];
        self.popUpView = popUp;
        self.player.fase2 = true;
        [popUp showInView:self.view animated:YES];
        self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
        self.player.medalha2fase1 = true;
        self.botaoProx.alpha = 1.0f;
    }
}

#pragma mark - scrollview delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _deslocIni = scrollView.contentOffset.x;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [[_fantasmaView superview]bringSubviewToFront:_fantasmaView];
    UIImage *beepoImage = self.player.gasperEscolhido;
    float diff =scrollView.contentOffset.x - _deslocIni;
    if (diff > 0 && _lookingBack) {
        self.charImgView.image = beepoImage;
        _lookingBack = NO;
    } else if (diff < 0 && _lookingBack){
        
    } else if (diff > 0 && !_lookingBack){
        
    } else{
        self.charImgView.image = [UIImage imageWithCGImage:beepoImage.CGImage
                                                       scale:beepoImage.scale
                                                 orientation:UIImageOrientationUpMirrored];
        _lookingBack = YES;
    }
    
    CGRect oldframe = self.fantasmaView.frame;
    oldframe.origin.x = oldframe.origin.x + diff;
    _deslocIni = scrollView.contentOffset.x;
    self.fantasmaView.frame = oldframe;
}

-(IBAction)falaQueEuTeEstupro:(id)sender{
    NSURL *soundUrl = [NSURL fileURLWithPath:path2];
    
    // Create audio player object and initialize with URL to sound
    _audioPlayer3 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [_audioPlayer3 play];
}

-(void) didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}
@end
