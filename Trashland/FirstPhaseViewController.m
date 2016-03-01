#import "FirstPhaseViewController.h"
#import "Player.h"
#import "DraggableView.h"
#import "UIView+Animation2.h"
#import "DraggableImageView.h"
#import "MiscellaneousAudio.h"
#import "SystemSoundIDAudio.h"
#import "PopUpViewController.h"

@interface FirstPhaseViewController () <UIScrollViewDelegate, DraggableImageViewDelegate> {
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
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
}

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet DraggableImageView *birdImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowImgView;
@property (retain, nonatomic) UIGravityBehavior *grav;
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
@property (retain, nonatomic)  DraggableImageView* books;
@property (retain, nonatomic)  DraggableImageView* flower;
@property (retain, nonatomic)  DraggableImageView* plate;
@property (retain, nonatomic)  DraggableImageView* vase2;
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

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    Player *player = [Player sharedManager];
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
    
    TVLigada = true;
    
    _scrollView.contentSize = CGSizeMake(1024, 768);
    _scrollView.delegate = self;
    [self montarTela];
    
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

- (void)montarTela{
    self.books = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"books"]];
    self.flower = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"plant"]];
    self.plate = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"plate"]];
    self.vase2 = [[DraggableImageView alloc] initWithImage:[UIImage imageNamed:@"greenVase"]];
    
    self.books.frame = CGRectMake(580, 100, 129, 81);
    self.books.userInteractionEnabled = YES;
    [self.auxView addSubview:self.books];
    
    self.flower.frame = CGRectMake(70, 550, 78, 117);
    self.flower.userInteractionEnabled = YES;
    self.flower.delegate = self;
    [self.auxView addSubview:self.flower];
    
    self.plate.frame = CGRectMake(695, 500, 70, 36);
    self.plate.userInteractionEnabled = YES;
    [self.auxView addSubview:self.plate];

    self.vase2.frame = CGRectMake(730, 100, 59, 70);
    self.vase2.userInteractionEnabled = YES;
    [self.auxView addSubview:self.vase2];

    self.plate.delegate = self;
    self.vase2.delegate = self;
    self.books.delegate = self;
    self.soap.delegate = self;
    self.rubberDuck.delegate = self;
    self.redWhiteVase.delegate = self;
    self.weirdVase.delegate = self;
    self.toiletStuff.delegate = self;
    self.pinkishVase.delegate = self;
    self.purpleVase.delegate = self;
    
    [self.auxView bringSubviewToFront:self.tvGIF];
    [self.auxView bringSubviewToFront:self.torneiraGIF];
    [self.auxView bringSubviewToFront:self.showerGIF];
    [self.auxView bringSubviewToFront:self.nuvem1Acesa];
    [self.auxView bringSubviewToFront:self.nuvem2Acesa];
    [self.auxView bringSubviewToFront:self.luz3];
    [self.auxView bringSubviewToFront:self.luz4];
    //[self.auxView bringSubviewToFront:self.bird];
    
    [self.view bringSubviewToFront:self.botaoVoltar];
    [self.view bringSubviewToFront:self.botaoPlay];
    [self.view bringSubviewToFront:self.botaoProx];
    [self.view bringSubviewToFront:self.medalha1fase1];
    [self.view bringSubviewToFront:self.medalha2fase1];
    [self.viewFantasminha.superview bringSubviewToFront: self.viewFantasminha];    
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
   // barrier2.backgroundColor = [UIColor redColor];
    [self.auxView addSubview:barrier2];
    
    CGPoint rightEdge2 = CGPointMake(barrier2.frame.origin.x +
                                     barrier2.frame.size.width, barrier2.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"barrier2"
                                fromPoint:barrier2.frame.origin
                                  toPoint:rightEdge2];
    
    
   // (chao)
    UIView* barrier3 = [[UIView alloc] initWithFrame:CGRectMake(0, 742, 2486, 10)];
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

- (IBAction)didClickShower {
    _showerGIF.hidden = !_showerGIF.hidden;
    pontoAgua2 = !pontoAgua2;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"closeTap" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickTap {
    _torneiraGIF.hidden = !_torneiraGIF.hidden;
    pontoAgua1 = !pontoAgua1;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"closeTap" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickTv {
    _tvGIF.hidden = !_tvGIF.hidden;
    pontoTV = !pontoTV;
    TVLigada = !TVLigada;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"tvfinal" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickFirstCloud {
    _nuvem1Acesa.hidden = !_nuvem1Acesa.hidden;
    pontoLuz1 = !pontoLuz1;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"clickcut" :@"wav"];
    [self needCheckBadges];
}

- (IBAction)didClickSecondCloud {
    _nuvem2Acesa.hidden = !_nuvem2Acesa.hidden;
    pontoLuz2 = !pontoLuz2;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"clickcut" :@"wav"];
    [self needCheckBadges];
}

-(IBAction)didClickFirstBathLamp:(id)sender{
    self.luz3.hidden = !self.luz3.hidden;
    pontoLuz3 = !pontoLuz3;
    SystemSoundIDAudio *systemSoundIdAudio = [SystemSoundIDAudio sharedManager];
    [systemSoundIdAudio requestedForSystemSound:@"clickcut" :@"wav"];
    [self needCheckBadges];
}

-(IBAction)didClickSecondBathLamp:(id)sender{
    self.luz4.hidden = !self.luz4.hidden;
    pontoLuz4 = !pontoLuz4;
    
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
        [self dismissViewControllerAnimated:YES completion:^(void){
            if ([_delegate respondsToSelector:@selector(askedToDismiss)]) {
                [_delegate askedToDismiss];
            }
        }];
    }
}

-(void)needCheckBadges{
    Player *player = [Player sharedManager];
    if (!player.firstMedal && pontoAgua1 && pontoAgua2) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-agua"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        self.medalha2fase1.image = [UIImage imageNamed:@"badge-agua-color"];
        player.firstMedal = true;
        self.botaoProx.alpha = 1.0f;
        
    }
    if (!player.secondMedal && pontoLuz1 && pontoLuz2 && pontoLuz3 && pontoLuz4 && pontoTV) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-energia"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        self.medalha1fase1.image = [UIImage imageNamed:@"badge-luz-color"];
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
