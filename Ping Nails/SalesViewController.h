//
//  SalesViewController.h
//  Ping Nails
//
//  Created by Taya technologies on 03/05/14.
//  Copyright (c) 2014 Taya technologies. All rights reserved.
//
#import <sqlite3.h>
#import "DBAccess.h"
#import <UIKit/UIKit.h>
#import "leftTableCell.h"
#import "leftTableCell2.h"
#import "SupplementaryView.h"
#import "orderpannelCell.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#import "Product.h"
@interface SalesViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate,UITableViewDataSource,UITableViewDelegate,UICollectionViewDelegateFlowLayout,UITextFieldDelegate,UIActionSheetDelegate>{
    //editing
    UIActionSheet *actionSheet;
    NSMutableArray *array1 ;
    NSMutableArray *employeesArr2;
    
    
    IBOutlet UICollectionView *collectionViewPack;
   
    UILabel *serviceNameOfCollctionCell,*servicePriceOfCollctionCell,*serviceNameOfCollctionCellAddSer,*servicePriceOfCollctionCellAddSer;
    
    UIImageView *servieImage,*servieImageForAdditionalSer,*cellBottomImgView;
    
    UICollectionViewFlowLayout *flowLayout;
    
    NSString *comparestr;
    //database
    NSMutableArray *employeesArr,*categoryArr,*productArr;
   
    NSMutableArray   *productArr2;
    
    DBAccess *dbAccess;
    
    NSString *string$,*leftTableString$;
   
    Product *pro, *pro2;
   
    // cell text field purpose
    int giftcardNo,giftcardValue;
    int prepurchasedValue;
    NSMutableArray *textfieldValueArr,*giftcardTextfieldValue;
    NSMutableArray *subTotalArr;
    int subTotalDisplay;
    NSMutableString *prepurchasedGiftcardValue;
    NSMutableString *tempString;
    NSMutableArray *nailSerSeletedArr,*maniSerSelectedArr,*nailEnhanceSerSeletedArr,*kidServicesSelectedArr,*additionalSerSelectedArr;
    NSMutableArray *textfielTagArr;
    int empTagIndex;
    //textfield edit & delete modepurpose
    int textfieldEditDeletValue;
    int textfieldEditTagValMore;
    int abc,bcd,cde;
}
@property NSMutableArray *array1;
@property (strong, nonatomic) NSMutableArray *employeeIconArray;

@property (strong, nonatomic) IBOutlet UILabel *doller;
@property (strong, nonatomic) NSMutableArray *selectedIndexPathsArr;
@property (strong, nonatomic) NSMutableArray *selectedIndexPathsArr2;
@property (strong, nonatomic) NSMutableArray *selectedIndexPathsArr3;
@property (strong, nonatomic) NSMutableArray *selectedIndexPathsArr4;
@property (strong, nonatomic) NSMutableArray *selectedIndexPathsArr5;
@property (nonatomic, strong) IBOutlet UITableView *leftTable;
@property (nonatomic, retain) IBOutlet UICollectionView *collectionViewPack;
@property (strong, nonatomic) IBOutlet UILabel *Total;
@property (strong, nonatomic) IBOutlet UITextField *giftCard;
@property (strong, nonatomic) IBOutlet UILabel *subTotal;
@property (strong, nonatomic) IBOutlet UITableView *finalizeOrderTable;
@property (strong, nonatomic) IBOutlet UIImageView *imgviewSubtotal;
@property (strong, nonatomic) IBOutlet UIImageView *imgviewTotal;
@property (strong, nonatomic) IBOutlet UILabel *subtotalheading;
@property (strong, nonatomic) IBOutlet UILabel *giftcareHeading;
@property (strong, nonatomic) IBOutlet UILabel *totahHeading;
@property (strong, nonatomic) IBOutlet UILabel *orderHeading;
@property (strong, nonatomic) IBOutlet UILabel *labelLineHead;
@property (strong, nonatomic) IBOutlet UIButton *finalizeOrderBtn;
@property (strong, nonatomic) IBOutlet UIButton *okbtn;
@property (strong, nonatomic) IBOutlet UIButton *cancelbtn;
@property (strong, nonatomic) IBOutlet UILabel *finalTotal;
@property (strong, nonatomic) IBOutlet UIView *SubView;
@property (strong, nonatomic) IBOutlet UIImageView *leftBgView;

-(void)employeeIcon;
- (IBAction)okayAction:(id)sender;
- (IBAction)cancelAction:(id)sender;
- (IBAction)FinalizeOrder:(id)sender;

@end
