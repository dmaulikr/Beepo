#import "SecondStoryViewController.h"
#import "SecondPhaseViewController.h"
#import "MiscellaneousAudio.h"

@interface SecondStoryViewController () <SecondPhaseViewControllerDelegate>

@property (nonatomic) CGRect ghostStarterFrame;
@property (nonatomic) CGRect shadowStarterFrame;
@property (weak, nonatomic) IBOutlet UIImageView *imgFantasminha;
@property (weak, nonatomic) IBOutlet UIImageView *imgSombra;
@property (weak, nonatomic) IBOutlet UIView *moveBeepoView;
@property (strong, nonatomic) NSString *path;

@property (weak, nonatomic) SecondPhaseViewController *secondPhaseViewController;

@end

@implementation SecondStoryViewController

- (void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    _path = [NSString stringWithFormat:@"%@/5_pre-parque.mp3", [[NSBundle mainBundle] resourcePath]];
    
    [UIView animateWithDuration:0.6 delay:0.2 options:UIViewAnimationOptionCurveEaseInOut animations:^(void){
        [UIView setAnimationRepeatCount:NSUIntegerMax];
        [UIView setAnimationRepeatAutoreverses:YES];
        
        CGRect charFrame = self.imgFantasminha.frame;
        charFrame.origin.y = charFrame.origin.y - 25.0;
        charFrame.size.height = charFrame.size.height + 15.0;
        
        CGRect shadowFrame = self.imgSombra.frame;
        shadowFrame.size.width = shadowFrame.size.width/2.0;
        shadowFrame.origin.x = shadowFrame.origin.x + shadowFrame.size.width/2;
        
        self.imgFantasminha.frame = charFrame;
        self.imgSombra.frame = shadowFrame;
    } completion:nil];
    
    [self moveBeepo:self.moveBeepoView];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipped:)];
    [swipe setDirection:UISwipeGestureRecognizerDirectionLeft];
    [self.view addGestureRecognizer:swipe];
}

-(void)didSwipped:(UISwipeGestureRecognizer *)swipeRecogniser{
    [self performSegueWithIdentifier:@"phase2Segue" sender:self];
}

- (void)moveBeepo:(UIView *)imageView{
    [UIView animateWithDuration:4 delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        imageView.frame = CGRectMake(337.f, imageView.frame.origin.y, imageView.frame.size.width, imageView.frame.size.height); } completion:nil];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"phase2Segue"]) {
        _secondPhaseViewController = segue.destinationViewController;
        _secondPhaseViewController.delegate = self;
    }
}

-(IBAction)didTappedVoiceStoryButton:(id)sender{
    MiscellaneousAudio *miscAudio = [MiscellaneousAudio sharedManager];
    [miscAudio playSongFromPath:_path];
}

- (void) askedToDismissSecondPhase{
    [_secondPhaseViewController dismissViewControllerAnimated:YES completion:^void{
        if ([_delegate respondsToSelector:@selector(askedToDismissSecondStory)]) {
            [_delegate askedToDismissSecondStory];
        }
    }];
}

@end
