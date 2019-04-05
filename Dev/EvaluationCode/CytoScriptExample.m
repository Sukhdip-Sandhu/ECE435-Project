%% HOUSEKEEPING
clear; close all; clc;

%% SPECIFY TESTING OR TRAINING DATASET EVALUATION
[CytoGroundTruth, SegmentationResult, path_to_save_results] = eval_45training();
% [CytoGroundTruth, SegmentationResult, path_to_save_results] = eval_900testing();

%% EVALUATE
[meanDice70, ...
meanFNR70_object, ...
meanTPR70_pixel, ...
meanFPR70_pixel, ...
stdDice70, ...
stdTPR70_pixel, ...
stdFPR70_pixel, ...
stdFNo_70] ...
    = evaluateCytoSegmentation(CytoGroundTruth, SegmentationResult);

%% SAVE RESULTS
save(path_to_save_results, ...
    'meanDice70', ...
    'meanFNR70_object', ...
    'meanTPR70_pixel', ...
    'meanFPR70_pixel', ...
    'stdDice70', ...
    'stdTPR70_pixel', ...
    'stdFPR70_pixel', ...
    'stdFNo_70');

function [CytoGroundTruth, SegmentationResult, path_to_save_results] = eval_45training()
    path_to_our_segmentation = 'Segmentations_FINALtrainset.mat';
    path_to_ground_truth = 'trainset_GT.mat';
    path_to_save_results = strcat('.\Results\Segmentations_H4', path_to_our_segmentation(15:end-4), '_results');

    load(path_to_our_segmentation)
    load(path_to_ground_truth, 'train_Cytoplasm')

    SegmentationResult = master_cell;
    CytoGroundTruth = train_Cytoplasm;
end

function [CytoGroundTruth, SegmentationResult, path_to_save_results] = eval_900testing()
    path_to_our_segmentation = 'Segmentations_testset.mat';
    path_to_ground_truth = 'testset_GT.mat';
    path_to_save_results = strcat('.\Results\Segmentations_', path_to_our_segmentation(15:end-4), '_results');

    load(path_to_our_segmentation)
    load(path_to_ground_truth, 'test_Cytoplasm')

    SegmentationResult = master_cell;
    CytoGroundTruth = test_Cytoplasm;
end