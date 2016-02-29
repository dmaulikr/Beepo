#import <UIKit/UIKit.h>
#import "Player.h"
#import "DraggableView.h"

@interface Phase3Parte2 : UIViewController

@property (nonatomic) Player* player;
@property (nonatomic) IBOutlet UIImageView* fundo;
@property (nonatomic) IBOutlet UIImageView* imageViewPuzzle;
@property (nonatomic) IBOutlet DraggableView* viewCarro1;
@property (nonatomic) IBOutlet DraggableView* viewCarro2;
@property (nonatomic) IBOutlet UIImageView* ambulancia;
@property (nonatomic) IBOutlet UIImageView* badgeTransito;
@property (nonatomic) IBOutlet UIImageView* badgeIdoso;
@property (nonatomic) IBOutlet UIButton* botaoVoltar;
@property (nonatomic) IBOutlet UIButton* botaoSom;
@property (strong, nonatomic) UIViewController *popUpView;

@end
