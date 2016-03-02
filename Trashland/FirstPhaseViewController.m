#import "FirstPhaseViewController.h"
#import "Player.h"
#import "DraggableView.h"
#import "UIView+Animation2.h"
#import "DraggableImageView.h"
#import "MiscellaneousAudio.h"
#import "SystemSoundIDAudio.h"
#import "PopUpViewController.h"

@interface FirstPhaseViewController () <UIScrollViewDelegate, DraggableImageViewDelegate>

@property (nonatomic, assign) BOOL pontoLuz1;
@property (nonatomic, assign) BOOL pontoLuz2;
@property (nonatomic, assign) BOOL pontoLuz3;
@property (nonatomic, assign) BOOL pontoLuz4;
@property (nonatomic, assign) BOOL pontoTV;
@property (nonatomic, assign) BOOL pontoAgua1;
@property (nonatomic, assign) BOOL pontoAgua2;
@property (nonatomic, assign) BOOL TVLigada;
@property (nonatomic, assign) BOOL podePassar;

@property (retain, nonatomic) UIDynamicAnimator *animator;
@property (retain, nonatomic) UIGravityBehavior *gravity;
@property (retain, nonatomic) UICollisionBehavior *collision;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowImgView;
@property (weak, nonatomic) IBOutlet UIImageView *showerGIF;
@property (weak, nonatomic) IBOutlet UIImageView *torneiraGIF;
@property (weak, nonatomic) IBOutlet UIImageView *tvGIF;
@property (weak, nonatomic) IBOutlet UIImageView *nuvem1Acesa;
@property (weak, nonatomic) IBOutlet UIImageView *nuvem2Acesa;
@property (weak, nonatomic) IBOutlet UIView *auxView;
@property (weak, nonatomic) IBOutlet UIView* viewFantasminha;
@property (weak, nonatomic) IBOutlet UIImageView* luz3;
@property (weak, nonatomic) IBOutlet UIImageView* luz4;
@property (weak, nonatomic) IBOutlet UIImageView *charImgView;

@property (weak, nonatomic) IBOutlet DraggableImageView* books;
@property (weak, nonatomic) IBOutlet DraggableImageView* flower;
@property (weak, nonatomic) IBOutlet DraggableImageView* plate;
@property (weak, nonatomic) IBOutlet DraggableImageView* vase2;
@property (weak, nonatomic) IBOutlet DraggableImageView *soap;
@property (weak, nonatomic) IBOutlet DraggableImageView *rubberDuck;
@property (weak, nonatomic) IBOutlet DraggableImageView *redWhiteVase;
@property (weak, nonatomic) IBOutlet DraggableImageView *weirdVase;
@property (weak, nonatomic) IBOutlet DraggableImageView *toiletStuff;
@property (weak, nonatomic) IBOutlet DraggableImageView *pinkishVase;
@property (weak, nonatomic) IBOutlet DraggableImageView *purpleVase;
@property (weak, nonatomic) IBOutlet DraggableView *fantasmaView;

@property (weak, nonatomic) IBOutlet UIImageView* medalha1fase1;
@property (weak, nonatomic) IBOutlet UIImageView* medalha2fase1;
@property (weak, nonatomic) IBOutlet UIButton* botaoVoltar;
@property (weak, nonatomic) IBOutlet UIButton* botaoPlay;
@property (weak, nonatomic) IBOutlet UIButton* botaoProx;
@property (nonatomic) float deslocIni;
@property (retain, nonatomic) UIViewController *popUpView;

@end

@implementation FirstPhaseViewController

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    
    Player *player = [Player sharedManager];
    _charImgView.image = player.gasperEscolhido;
    if(player.firstMedal){
        self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
        self.botaoProx.enabled = YES;
    }
    
    if(player.secondMedal){
        self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
        self.botaoProx.enabled = YES;
    }
    
    [self.botaoPlay tada:NULL];
    self.botaoProx.alpha = 0.5f;
    
    _TVLigada = true;
    
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(_auxView.frame.size.width, _auxView.frame.size.height);
    
    _books.delegate = self;
    _flower.delegate = self;
    _vase2.delegate = self;
    _plate.delegate = self;
    _soap.delegate = self;
    _rubberDuck.delegate = self;
    _redWhiteVase.delegate = self;
    _weirdVase.delegate = self;
    _toiletStuff.delegate = self;
    _pinkishVase.delegate = self;
    _purpleVase.delegate = self;
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    [self applyPhisicsConcepts];
    
    _showerGIF.image = [UIImage animatedImageNamed:@"chuveiro_Trashcity-2-" duration:0.5f];
    _torneiraGIF.image = [UIImage animatedImageNamed:@"aguatorneira_Trashcity-" duration:0.8f];
    _tvGIF.image = [UIImage animatedImageNamed:@"chuvisco_tv-" duration:0.8f];
    
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

- (void)applyPhisicsConcepts{
    [_collision removeAllBoundaries];
    [_animator removeAllBehaviors];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.books, self.flower, self.vase2, self.plate, self.soap, self.rubberDuck, self.redWhiteVase, self.weirdVase, self.toiletStuff, self.pinkishVase, self.purpleVase]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.books, self.flower, self.vase2, self.plate, self.soap, self.rubberDuck, self.redWhiteVase, self.weirdVase, self.toiletStuff, self.pinkishVase, self.purpleVase]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    
    //(Prateleira meio)
    UIView* barrier2 = [[UIView alloc] initWithFrame:CGRectMake(580, 180, 260, 10)];
    [self.auxView addSubview:barrier2];
    
    CGPoint rightEdge2 = CGPointMake(barrier2.frame.origin.x +
                                     barrier2.frame.size.width, barrier2.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier2"
                                fromPoint:barrier2.frame.origin
                                  toPoint:rightEdge2];
    
    
   // (chao)
    UIView* barrier3 = [[UIView alloc] initWithFrame:CGRectMake(0, 742, 2486, 10)];
    [self.auxView addSubview:barrier3];
    
    CGPoint rightEdge3 = CGPointMake(barrier3.frame.origin.x +
                                    barrier3.frame.size.width, barrier3.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier3"
                                fromPoint:barrier3.frame.origin
                                  toPoint:rightEdge3];
    
    //(Mesa esquerda sofá)
    UIView* barrier4 = [[UIView alloc] initWithFrame:CGRectMake(70, 626, 100, 10)];
    [self.auxView addSubview:barrier4];
    
    CGPoint rightEdge4 = CGPointMake(barrier4.frame.origin.x +
                                     barrier4.frame.size.width, barrier4.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier"
                                fromPoint:barrier4.frame.origin
                                  toPoint:rightEdge4];
    
    
    //(Mesa TV)
    UIView* barrier5 = [[UIView alloc] initWithFrame:CGRectMake(670, 544, 320, 10)];
    [self.auxView addSubview:barrier5];
    
    CGPoint rightEdge5 = CGPointMake(barrier5.frame.origin.x +
                                     barrier5.frame.size.width, barrier5.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier5"
                                fromPoint:barrier5.frame.origin
                                  toPoint:rightEdge5];
    
    //(Estante banheiro)
    UIView* barrier6 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50+ 6, 405, 179, 10)];
    [self.auxView addSubview:barrier6];
    
    CGPoint rightEdgeAux = CGPointMake(barrier6.frame.origin.x +
                                     barrier6.frame.size.width, barrier6.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier6"
                                fromPoint:barrier6.frame.origin
                                  toPoint:rightEdgeAux];
    
    UIView* barrier7 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50+ 6, 486, 179, 10)];
    [self.auxView addSubview:barrier7];
    
    rightEdgeAux = CGPointMake(barrier7.frame.origin.x +
                                     barrier7.frame.size.width, barrier7.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier7"
                                fromPoint:barrier7.frame.origin
                                  toPoint:rightEdgeAux];
   
    UIView* barrier8 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50+ 6, 435 + 51 + 81, 179, 10)];
    [self.auxView addSubview:barrier8];
    
    rightEdgeAux = CGPointMake(barrier8.frame.origin.x +
                                     barrier8.frame.size.width, barrier8.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier8"
                                fromPoint:barrier8.frame.origin
                                  toPoint:rightEdgeAux];
    
    UIView* barrier9 = [[UIView alloc] initWithFrame:CGRectMake(1407 - 50 + 6, 435 + 51 + 81 + 81, 179, 10)];
    [self.auxView addSubview:barrier9];
    
    rightEdgeAux = CGPointMake(barrier9.frame.origin.x +
                                     barrier9.frame.size.width, barrier9.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier9"
                                fromPoint:barrier9.frame.origin
                                  toPoint:rightEdgeAux];
    //(Mesa TV)
    UIView* barrier10 = [[UIView alloc] initWithFrame:CGRectMake(1820 , 479 + 46, 145, 10)];
    [self.auxView addSubview:barrier10];
    
    rightEdgeAux = CGPointMake(barrier10.frame.origin.x +
                                     barrier10.frame.size.width, barrier10.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier10"
                                fromPoint:barrier10.frame.origin
                                  toPoint:rightEdgeAux];
}

- (IBAction)didClickShower {
    _showerGIF.hidden = !_showerGIF.hidden;
    _pontoAgua2 = !_pontoAgua2;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"closeTap" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickTap {
    _torneiraGIF.hidden = !_torneiraGIF.hidden;
    _pontoAgua1 = !_pontoAgua1;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"closeTap" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickTv {
    _tvGIF.hidden = !_tvGIF.hidden;
    _pontoTV = !_pontoTV;
    _TVLigada = !_TVLigada;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"tvfinal" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickFirstCloud {
    _nuvem1Acesa.hidden = !_nuvem1Acesa.hidden;
    _pontoLuz1 = !_pontoLuz1;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"clickcut" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickSecondCloud {
    _nuvem2Acesa.hidden = !_nuvem2Acesa.hidden;
    _pontoLuz2 = !_pontoLuz2;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"clickcut" :@"wav"];
    [self needCheckBadges];
}

-(IBAction)didClickFirstBathLamp:(id)sender{
    self.luz3.hidden = !self.luz3.hidden;
    _pontoLuz3 = !_pontoLuz3;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"clickcut" :@"wav"];
    [self needCheckBadges];
}

-(IBAction)didClickSecondBathLamp:(id)sender{
    self.luz4.hidden = !self.luz4.hidden;
    _pontoLuz4 = !_pontoLuz4;
    
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"clickcut" :@"wav"];
    [self needCheckBadges];
}

-(IBAction)didClickBird:(id)sender{
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"birdcut" :@"wav"];
}

-(IBAction)didTappedToContinue:(id)sender{
    Player *player = [Player sharedManager];
    if (player.firstMedal || player.secondMedal) {
        if ([_delegate respondsToSelector:@selector(askedToDismiss)]) {
            [_delegate askedToDismiss];
        }
    }
}

-(void)needCheckBadges{
    Player *player = [Player sharedManager];
    if (!player.firstMedal && _pontoLuz1 && _pontoLuz2 && _pontoLuz3 && _pontoLuz4 && _pontoTV) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-energia"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
        player.firstMedal = true;
        self.botaoProx.alpha = 1.0f;
    }
    
    if (!player.secondMedal && _pontoAgua1 && _pontoAgua2) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-agua"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
        player.secondMedal = true;
        self.botaoProx.alpha = 1.0f;
        
    }
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    _deslocIni = scrollView.contentOffset.x;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    Player *player = [Player sharedManager];
    [[_fantasmaView superview]bringSubviewToFront:_fantasmaView];
    UIImage *beepoImage = player.gasperEscolhido;
    float diff =scrollView.contentOffset.x - _deslocIni;
//    if (diff > 0 && _lookingBack) {
//        self.charImgView.image = beepoImage;
//        _lookingBack = NO;
//    } else if (diff < 0 && _lookingBack){
//        
//    } else if (diff > 0 && !_lookingBack){
//        
//    } else{
//        self.charImgView.image = [UIImage imageWithCGImage:beepoImage.CGImage
//                                                       scale:beepoImage.scale
//                                                 orientation:UIImageOrientationUpMirrored];
//        _lookingBack = YES;
//    }
    
    CGRect oldframe = self.fantasmaView.frame;
    oldframe.origin.x = oldframe.origin.x + diff;
    _deslocIni = scrollView.contentOffset.x;
    self.fantasmaView.frame = oldframe;
}

-(IBAction)didTappedForVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:[NSString stringWithFormat:@"%@/4_sala.mp3", [[NSBundle mainBundle] resourcePath]]];
}

-(IBAction)didTappedBackButton:(id)sender{
    if ([_delegate respondsToSelector:@selector(askedToDismiss)]) {
        [_delegate askedToDismiss];
    }
}

@end
