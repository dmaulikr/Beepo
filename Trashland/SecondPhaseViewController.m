#import "SecondPhaseViewController.h"
#import "PopUpViewController.h"
#import "DraggableImageView.h"
#import "Player.h"
#import "SystemSoundIDAudio.h"
#import "MiscellaneousAudio.h"
#import "DraggableView.h"

@interface SecondPhaseViewController()<UICollisionBehaviorDelegate, UIScrollViewDelegate, DraggableImageViewDelegate>{
    UIDynamicAnimator* _animator;
    UIGravityBehavior* _gravity;
    UICollisionBehavior* _collision;
    NSString *path4;
    CGPoint rightEdge;
    
    int treesCounter;
    int trashLeft;

}
@property (weak, nonatomic) IBOutlet UIView *auxView;
@property (weak, nonatomic) IBOutlet UIScrollView *phaseScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *phaseBG;
@property (weak, nonatomic) IBOutlet UIImageView *balao;
@property (weak, nonatomic) IBOutlet UIImageView *bolinhaVermelha;
@property (weak, nonatomic) IBOutlet UIImageView *bolinhaVerde;
@property (retain, nonatomic) IBOutlet UIImageView *arvore1;
@property (retain, nonatomic) IBOutlet UIImageView *arvore2;
@property (retain, nonatomic) IBOutlet UIImageView *arvore3;
@property (retain, nonatomic) IBOutlet UIImageView *arvore4;
@property (retain, nonatomic) IBOutlet UIImageView *arvore5;
@property (retain, nonatomic) IBOutlet DraggableImageView *garrafaPet1;
@property (retain, nonatomic) IBOutlet DraggableImageView *lata;
@property (retain, nonatomic) IBOutlet DraggableImageView *garrafaVidro;
@property (retain, nonatomic) IBOutlet DraggableImageView *papel;
@property (retain, nonatomic) IBOutlet DraggableImageView *garrafaPet2;
@property (retain, nonatomic) IBOutlet DraggableImageView *cascaBanana;
@property (weak, nonatomic) IBOutlet UIImageView *zzzImage;
@property (weak, nonatomic) IBOutlet UIImageView *charImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowImageView;
@property (weak, nonatomic) IBOutlet UIView *fantasminhaView;
@property (nonatomic) BOOL lookingBack;
@property (weak, nonatomic) IBOutlet UIButton *botaoProximo;
@property (weak, nonatomic) IBOutlet UIImageView *badgeLixo;
@property (weak, nonatomic) IBOutlet UIImageView *badgeNatureza;
@property (retain,nonatomic) UIViewController *popUpView;
@property (retain,nonatomic) NSMutableArray *lixos;

@property (weak, nonatomic) IBOutlet UIView *barrier1;
@property (weak, nonatomic) IBOutlet UIView *barrier2;
@property (weak, nonatomic) IBOutlet UIView *barrier3;
@property (weak, nonatomic) IBOutlet UIView *barrier4;
@property (weak, nonatomic) IBOutlet UIView *barrier5;
@property (weak, nonatomic) IBOutlet UIView *barrier6;


@end

@implementation SecondPhaseViewController
float deslocIni;

-(void)viewDidLoad{
    [super viewDidLoad];
    Player *player = [Player sharedManager];
    _phaseScrollView.contentSize = CGSizeMake(_phaseBG.frame.size.width, _phaseBG.frame.size.height);
    _phaseScrollView.delegate = self;
    treesCounter = 5;
    trashLeft = 6;
    self.lixos = [@[@NO,@NO,@NO,@NO,@NO,@NO] mutableCopy];
    
    if(player.thirdMedal){
        self.badgeLixo.image = [UIImage imageNamed:@"badge-lixo-color"];
        self.botaoProximo.enabled = YES;
    }
    
    if(player.fourthMedal){
        self.badgeNatureza.image = [UIImage imageNamed:@"badge-natureza-color"];
        self.botaoProximo.enabled = YES;
    }
    
    self.garrafaPet1.delegate = self;
    self.garrafaPet2.delegate = self;
    self.garrafaVidro.delegate = self;
    self.lata.delegate = self;
    self.papel.delegate = self;
    self.cascaBanana.delegate = self;
    
    self.balao.image = [UIImage animatedImageNamed:@"balao-" duration:1.2f];
    self.bolinhaVermelha.image = [UIImage animatedImageNamed:@"bolinhavermelha_piscando-" duration:1.6f];//bolinhaverde_piscando-
    self.bolinhaVerde.image = [UIImage animatedImageNamed:@"bolinhaverde_piscando-" duration:1.2f];//bolinhavermelha_piscando-
    self.bolinhaVermelha.hidden = YES;
    self.bolinhaVerde.hidden = YES;
    
    
    _lookingBack = NO;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self beepoAnimado];
    path4 = [NSString stringWithFormat:@"%@/6_parque.mp3", [[NSBundle mainBundle] resourcePath]];
    
}

-(void)checkObjectives{
    Player *player = [Player sharedManager];
    if (treesCounter == 0 && !player.fourthMedal) {
        PopUpViewController *popUp = [self.storyboard instantiateViewControllerWithIdentifier:@"PopUpVC"];
        [popUp setImageNamed: @"pop-up-natureza"];
        self.popUpView = popUp;
        [popUp showInView:self.view animated:YES];
        player.fourthMedal = YES;
        self.badgeNatureza.image = [UIImage imageNamed:@"badge-natureza-color"];
        self.botaoProximo.enabled = YES;
    }
}

#pragma mark - scrollview delegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    deslocIni = scrollView.contentOffset.x;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    Player *player = [Player sharedManager];
    float diff =scrollView.contentOffset.x - deslocIni;
    if (diff > 0 && _lookingBack) {
        self.charImageView.image = player.gasperEscolhido;
        _lookingBack = NO;
    } else if (diff < 0 && _lookingBack){
        
    } else if (diff > 0 && !_lookingBack){
        
    } else{
        self.charImageView.image = [UIImage imageWithCGImage:player.gasperEscolhido.CGImage
                                                       scale:player.gasperEscolhido.scale
                                                 orientation:UIImageOrientationUpMirrored];
        _lookingBack = YES;
    }
    
//    CGRect oldframe = self.fantasminhaView.frame;
//    oldframe.origin.x = oldframe.origin.x + diff;
//    deslocIni = scrollView.contentOffset.x;
//    self.fantasminhaView.frame = oldframe;
}

- (void)beepoAnimado{
    
    [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [UIView setAnimationRepeatCount:NSUIntegerMax];
        [UIView setAnimationRepeatAutoreverses:YES];
        
        CGRect charFrame = self.charImageView.frame;
        charFrame.origin.y = charFrame.origin.y - 45.0;
        charFrame.size.height = charFrame.size.height + 15.0;
        
        CGRect shadowFrame = self.shadowImageView.frame;
        shadowFrame.size.width = shadowFrame.size.width/2.0;
        shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
    
        self.charImageView.frame = charFrame;
        self.shadowImageView.frame = shadowFrame;
    } completion:nil];
}

- (void)applyPhisicsConcepts{
    [_collision removeAllBoundaries];
    [_animator removeAllBehaviors];
    
    _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.auxView];
    _gravity = [[UIGravityBehavior alloc] initWithItems:@[self.garrafaPet1, self.garrafaPet2, self.garrafaVidro, self.lata, self.papel, self.cascaBanana]];
    [_animator addBehavior:_gravity];
    
    _collision = [[UICollisionBehavior alloc] initWithItems:@[self.garrafaPet1, self.garrafaPet2, self.garrafaVidro, self.lata, self.papel, self.cascaBanana]];
    _collision.translatesReferenceBoundsIntoBoundary = YES;
    [_animator addBehavior:_collision];
    _collision.collisionDelegate = self;
    
    rightEdge = CGPointMake(_barrier1.frame.origin.x + _barrier1.frame.size.width, _barrier1.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoPapel" fromPoint:_barrier1.frame.origin toPoint:rightEdge];
    
    rightEdge = CGPointMake(_barrier2.frame.origin.x + _barrier2.frame.size.width, _barrier2.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoPlastico" fromPoint:_barrier2.frame.origin toPoint:rightEdge];

    rightEdge = CGPointMake(_barrier3.frame.origin.x + _barrier3.frame.size.width, _barrier3.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoMetal" fromPoint:_barrier3.frame.origin toPoint:rightEdge];
    
    rightEdge = CGPointMake(_barrier4.frame.origin.x + _barrier4.frame.size.width, _barrier4.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoVidro" fromPoint:_barrier4.frame.origin toPoint:rightEdge];
    
    rightEdge = CGPointMake(_barrier5.frame.origin.x + _barrier5.frame.size.width, _barrier5.frame.origin.y);
    [_collision addBoundaryWithIdentifier:@"lixoOrganico" fromPoint:_barrier5.frame.origin toPoint:rightEdge];
}

-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{
    Player *player = [Player sharedManager];
    SystemSoundIDAudio *sysAudio = [SystemSoundIDAudio sharedManager];
    if (identifier &&  ![[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"piso"]) {
        if ([self.lixos[((UIImageView *)item).tag] isEqual:@0]) {
            if ((((UIImageView *)item).tag == 0 || ((UIImageView *)item).tag == 4) && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoPlastico"]) {
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                [sysAudio requestedForSystemSound:@"coin" :@"wav"];
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 3 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoPapel"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                [sysAudio requestedForSystemSound:@"coin" :@"wav"];
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 2 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoVidro"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                [sysAudio requestedForSystemSound:@"coin" :@"wav"];
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 1 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoMetal"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                [sysAudio requestedForSystemSound:@"coin" :@"wav"];
                trashLeft = trashLeft - 1;
                ((UIImageView *)item).userInteractionEnabled = NO;
                ((UIImageView *)item).hidden = YES;
                ((UIImageView *)item).frame = CGRectMake(-50, -50, 1, 1);
            } else if (((UIImageView *)item).tag == 5 && [[NSString stringWithFormat:@"%@",identifier]isEqualToString:@"lixoOrganico"]) {
                
                self.lixos[((UIImageView *)item).tag] = @YES;
                NSLog(@"%ld", (long)((UIImageView *)item).tag);
                [sysAudio requestedForSystemSound:@"coin" :@"wav"];
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
                player.thirdMedal = YES;
                self.badgeLixo.image = [UIImage imageNamed:@"badge-lixo-color"];
                self.botaoProximo.enabled = YES;
            }
        }
    }
}
#pragma mark - Button Actions
- (IBAction)didClickTree1:(UIButton *)sender {
    if (![_arvore1.image isEqual:[UIImage imageNamed:@"parque-03"]]) {
        treesCounter = treesCounter - 1;
        SystemSoundIDAudio *sysAudio = [SystemSoundIDAudio sharedManager];
        [sysAudio requestedForSystemSound:@"arvore_nascendo" :@"wav"];
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
}
- (IBAction)didClickTree2:(UIButton *)sender {
    if (![_arvore2.image isEqual:[UIImage imageNamed:@"parque-04"]]) {
        treesCounter = treesCounter - 1;
        SystemSoundIDAudio *sysAudio = [SystemSoundIDAudio sharedManager];
        [sysAudio requestedForSystemSound:@"arvore_nascendo" :@"wav"];
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
}
- (IBAction)didClickTree3:(UIButton *)sender {
    if (![_arvore3.image isEqual:[UIImage imageNamed:@"parque-05"]]) {
        treesCounter = treesCounter - 1;
        SystemSoundIDAudio *sysAudio = [SystemSoundIDAudio sharedManager];
        [sysAudio requestedForSystemSound:@"arvore_nascendo" :@"wav"];
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
}
- (IBAction)didClickTree4:(UIButton *)sender {
    if (![_arvore4.image isEqual:[UIImage imageNamed:@"parque-07"]]) {
        treesCounter = treesCounter - 1;
        SystemSoundIDAudio *sysAudio = [SystemSoundIDAudio sharedManager];
        [sysAudio requestedForSystemSound:@"arvore_nascendo" :@"wav"];
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
}
- (IBAction)didClickTree5:(UIButton *)sender {
    if (![_arvore5.image isEqual:[UIImage imageNamed:@"parque-07"]]) {
        treesCounter = treesCounter - 1;
        SystemSoundIDAudio *sysAudio = [SystemSoundIDAudio sharedManager];
        [sysAudio requestedForSystemSound:@"arvore_nascendo" :@"wav"];
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
}

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

- (IBAction)didClickBackButton:(id)sender {
    if([_delegate respondsToSelector:@selector(askedToDismissSecondPhase)]){
        [_delegate askedToDismissSecondPhase];
    }
}

- (IBAction)didClickNextButton:(id)sender {
    if([_delegate respondsToSelector:@selector(askedToDismissSecondPhase)]){
        [_delegate askedToDismissSecondPhase];
    }
}

-(IBAction)didTappedForVoiceStory:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:path4];
}

@end
