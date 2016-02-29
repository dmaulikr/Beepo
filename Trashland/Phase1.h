#import <UIKit/UIKit.h>
#import "DraggableImageView.h"
#import "DraggableView.h"
#import "Player.h"

@interface Phase1 : UIViewController
@property (weak, nonatomic) IBOutlet UIView* viewFantasminha;

@property (weak, nonatomic) IBOutlet UIImageView* phase1;
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

@property (weak, nonatomic) IBOutlet UIButton* bird;
@property (weak, nonatomic) IBOutlet UIButton* botaoVoltar;
@property (weak, nonatomic) IBOutlet UIButton* botaoPlay;
@property (weak, nonatomic) IBOutlet UIButton* botaoProx;

@property (weak, nonatomic) IBOutlet UILabel* contador;

@property (retain, nonatomic) Player* player;
@property (nonatomic) float deslocIni;
@property (nonatomic) BOOL lookingBack;
@property (retain, nonatomic) UIViewController *popUpView;


- (void)dealWithMovement;
@end
