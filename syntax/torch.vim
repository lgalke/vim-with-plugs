" Pytorch syntax file
" Lanugage: pytorch
" Maintainer: Lukas Galke <vim@lpag.de>
" Author: Lukas Galke
" Date: 2018-04-09
" Remark: Desired usage is by set ft=python.torch
" For development: see syntax, and usr_44.txt, E669

" Options {{{
if !exists("g:torch_highlight_abbrevs")
  let g:torch_highlight_abbrevs = 1
endif
" }}}

" Packages {{{
" }}}

" torch {{{

" Tensors
syn keyword torchFunction is_tensor is_storage set_default_tensor_type numel set_printoptions
" Creation Ops
syn keyword torchFunction eye from_numpy linspace logspace ones ones_like arange range zeros zeros_like
" Indexing, Slicing, Joining, Mutating Ops
syn keyword torchFunction cat chunk gather index_select masked_select nonzero split squeeze stack t take transpose unbind unsqueeze 
" Random sampling
syn keyword torchFunction manual_seed initial_seed get_rng_state set_rng_state bernoulli multinomial normal rand randn randperm
" In-place random sampling
syn keyword torchFunction bernoulli_ cauchy_ exponential_ geometric_ log_normal_ normal_ uniform_
" Serialization
syn keyword torchFunction save load
" Parallelism
syn keyword torchFunction get_num_threads set_num_threads

" Math Operations
" Pointwise Ops
syn keyword torchFunction abs acos add addcdiv addcmul asin atan atan2 ceil clamp cos cosh div erf erfinv floor fmod frac lerp log log1p mul neg pow reciprocal remainder round rsqrt sigmoid sign sin sinh sqrt tan tanh trunc
" Reduction Ops
syn keyword torchFunction cumprod cumsum dist mean median mode norm prod std sum var
" Comparison Ops
syn keyword torchFunction eq equal ge gt kthvalue le lt max min ne sort topk
" Other Operations
syn keyword torchFunction cross diag histc renorm trace tril triu
" BLAS and LAPACK Operations
syn keyword torchFunction addbmm addmv addr baddbmm bmm btrifact btrisolve dot eig gels geqrf ger gesv inverse matmul mm mv orgqr ormqr potrf potri potrs pstrf qr svd symeig trtrs
" }}}

" torch.Tensor {{{
syn keyword torchType FloatTensor DoubleTensor HalfTensor ByteTensor CharTensor ShortTensor IntTensor LongTensor
if g:torch_highlight_abbrevs
  syn keyword torchType FT DT HT BT CT ST IT LT
endif
" }}]

" torch.nn {{{
syn keyword torchType Parameter

" Containers
syn keyword torchType Module
syn keyword torchFunction add_module apply children cpu cuda double eval float forward half load_state_dict modules named_children named_modules named_parameters parameters register_backward_hook register_buffer register_forward_hook register_forward_pre_hook register_parameter state_dict train type zero_grad
syn keyword torchType Sequential ModuleList ParameterList

" Convolution Layers
syn keyword torchType Conv1d Conv2d Conv3d ConvTranspose1d ConvTranspose2d ConvTranspose3d
" Pooling Layers
syn keyword torchType MaxPool1d MaxPool2d MaxPool3d MaxUnpool1d MaxUnpool2d MaxUnpool3d AvgPool1d AvgPool2d AvgPool3d FractionalMaxPool2d LPPool2d AdaptiveMaxPool1d AdaptiveMaxPool2d AdaptiveMaxPool3d AdaptiveAvgPool1d AdaptiveAvgPool2d AdaptiveAvgPool3d
" Padding Layers
syn keyword torchType ReflectionPad2d ReplicationPad2d ReplicationPad3d ZeroPad2d ConstantPad2d
" Non-linear Activations
syn keyword torchType ReLU ReLU6 ELU SELU PReLU LeakyReLU Threshold Hardtanh Sigmoid Tanh LogSigmoid Softplus Softshrink Softsign Tanhshrink Softmin Softmax Softmax2d LogSoftmax
" Normalization Layers
syn keyword torchType BatchNorm1d BatchNorm2d BatchNorm3d InstanceNorm1d InstanceNorm2d InstanceNorm3d
" Recurrent layers
syn keyword torchType RNN LSTM GRU RNNCell LSTMCell GRUCell
" Linear layers
syn keyword torchType Linear Bilinear
" Dropout layers
syn keyword torchType Dropout Dropout2d Dropout3d AlphaDropout
" Sparse layers
syn keyword torchType Embedding EmbeddingBag
" Distance functions
syn keyword torchType CosineSimilarity PairwiseDistance
" Loss functions
syn keyword torchType L1Loss MSELoss CrossEntropyLoss NLLLoss PoissonNLLLoss NLLLoss2d KLDivLoss BCEWithLogitsLoss MarginRankingLoss HingeEmbeddingLoss MultiLabelMarginLoss SmoothL1Loss SoftMarginLoss MultiLabelSoftMarginLoss CosineEmbeddingLoss MultiMarginLoss TripletMarginLoss
" Vision layers
syn keyword torchType PixelShuffle Upsample UpsamplingNearest2d UpsamplingBilinear2d

" }}}

" torch.nn.functional {{{

" Convolution functions
syn keyword torchFunction conv1d conv2d conv3d conv_transpose1d conv_transpose2d conv_transpose3d
" Pooling functions
syn keyword torchFunction avg_pool1d avg_pool2d avg_pool3d max_pool1d max_pool2d max_pool3d max_unpool1d max_unpool2d max_unpool3d lp_pool2d adaptive_max_pool1d adaptive_max_pool2d adaptive_max_pool3d adaptive_avg_pool1d adaptive_avg_pool2d adaptive_avg_pool3d
" Non-linear activation functions
syn keyword torchFunction threshold relu hardtanh relu6 elu selu leaky_relu prelu rrelu glu logsigmoid hardshrink tanhshrink softsign softplus softmin softmax softshrink log_softmax tanh sigmoid
" Normalization functions
syn keyword torchFunction batch_norm normalize
" Linear functions
syn keyword torchFunction linear
" Dropout functions
syn keyword torchFunction dropout alpha_dropout dropout2d dropout3d
" Distance functions
syn keyword torchFunction pairwise_distance cosine_similarity
" Loss functions
syn keyword torchFunction binary_cross_entropy poisson_nll_loss cosine_embedding_loss cross_entropy hinge_embedding_loss kl_div l1_loss mse_loss margin_ranking_loss multilabel_margin_loss multilabel_soft_margin_loss multi_margin_loss nll_loss binary_cross_entropy_with_logits smooth_l1_loss soft_margin_loss triplet_margin_loss
" Vision functions
syn keyword torchFunction pixel_shuffle pad upsample upsample_nearest upsample_bilinear grid_sample affine_grid

" }}}

" torch.optim {{{

syn keyword torchType Optimizer
syn keyword torchFunction add_param_group load_state_dict state_dict step zero_grad
syn keyword torchType Adadelta Adagrad Adam SparseAdam Adamax ASGD LBFGS RMSprop Rprop SGD
syn keyword torchType LambdaLR StepLR MultiStepLR ExponentialLR CosineAnnealingLR ReduceLROnPlateau

" }}}

" torch.autograd {{{

syn keyword torchFunction backward grad
syn keyword torchType Variable Function
if g:torch_highlight_abbrevs
  syn keyword torchType V
endif
syn keyword torchFunction detach detach_ register_hook retain_grad
" Profiler
syn keyword torchType profile

" }}}

" torch.cuda {{{

syn keyword torchFunction cuda

" }}}

" Linking
highlight link torchType Type
highlight link torchFunction Function
