set USER_VERSION=18

rem ���������牺��K���ɘM���Ď����D�݂̐ݒ�ɂ��Ă���������

rem ��ʃA�J�E���g�p�G���R�[�h�Ŗڎw�����r�b�g���[�g�ikbps�j
rem �r�b�g���[�g�I�[�o�[�ɂȂ�Ƃ��́A���̐��l��������(�����l��600)
set I_TARGET_BITRATE=600
rem ��ʃA�J�E���g�p�̌��E���r�b�g���[�g�ikbps�j
set I_MAX_BITRATE=654

rem �G�R�m�~�[���[�h���p�G���R�[�h�Ŗڎw�����r�b�g���[�g�ikbps�j
rem �r�b�g���[�g�I�[�o�[�ɂȂ�Ƃ��́A���̐��l��������(�����l��420)
rem 12/2/8�̎d�l�ύX��ɕϐ�����_NEW��ǉ�
set E_TARGET_BITRATE_NEW=420
rem �G�R�m�~�[���[�h���p�̌��E���r�b�g���[�g�ikbps�j
set E_MAX_BITRATE_NEW=445

rem ��ʃA�J�E���g�̉𑜓x�̏���̐ݒ�
rem ���̃f�t�H���g��800pixels�A�����̃f�t�H���g��600pixels
set I_MAX_WIDTH=800
set I_MAX_HEIGHT=600

rem ���T�C�Y�̎��⎞��y�𓚂����Ƃ��̕��ƍ����̐ݒ�
rem ���̃f�t�H���g��640pixels�B�ς������Ƃ��́uDEFAULT_WIDTH=768�v�Ȃǂ̂悤�ɂ���
rem �����́A�󗓂̂Ƃ��͎����v�Z�i����t�@�C���̃A�X�y�N�g����ێ��j
rem �w�肵�����ꍇ�́uDEFAULT_HEIGHT=432�v�Ȃǂ̂悤�ɂ���
set DEFAULT_WIDTH=640
set DEFAULT_HEIGHT=

rem FPS���w�肵�����Ƃ��́A�uDEFAULT_FPS=24�v�Ȃǂ̂悤�ɂ���
rem ���̓���Ɠ����̂܂܂Ȃ�󗓂̂܂܂ɂ��Ă���
set DEFAULT_FPS=

rem AAC�G���R�[�_�̑I���iNeroAacEnc��QuickTime���j
rem nero��qt�iQuickTime���C���X�g�[������Ă�K�v������܂��j����I��
set AAC_ENCODER=nero

rem AAC�G���R�[�h�̃v���t�@�C���I��(hev2��AAC_ENCODER=nero�̎��̂ݗL��)
rem auto�Alc�Ahe�Ahev2����I��(�f�t�H���g��auto�𐄏�)
set AAC_PROFILE=auto

rem �����̃T���v�����[�g���w�肵�����Ƃ��́uSAMPLERATE=48000�v�Ȃǂ̂悤�ɂ���
rem �f�t�H���g��44100
rem ���܂荂�������(192000�Ƃ�)�����G���R�[�h�Ɏ��s���܂�
rem ���̉����̃T���v�����[�g�Ɠ����܂܂ɂ������Ȃ�uSAMPLERATE=0�v�ɂ���(�񐄏�)
set SAMPLERATE=44100

rem �f�R�[�_�̑I��
rem auto�Aavi�Affmpeg�Adirectshow�Aqt����I��(�f�t�H���g��auto�𐄏�)
rem auto�͎����I���Aavi��AVISource�Affmpeg��FFMpegSource�Adirectshow��DirectShowSource
rem qt��QuickTime(QuickTime7�ȍ~���K�v�ł��A�ꕔ�R�[�f�b�N�ł͔��ɒx���ł�)
rem qt�̓t�@�C�����E�t�H���_���Ȃǂɓ��{�ꓙ���܂܂�Ă���Ǝ��s����̂�
rem �A���t�@�x�b�g�݂̂ɂ���AC�h���C�u�����ɒu�������đΏ����Ă���g�p���Ă�������
rem �f�R�[�h����肭�����Ȃ��ꍇ�Adirectshow��ffmpeg���w�肷��Ƃ��܂��s���ꍇ��
set DECODER=auto

rem �J���[�}�g���N�X
rem �悭������Ȃ��ꍇ�͘M��Ȃ��̂��g
rem BT.601��BT.709��I������
set COLORMATRIX=BT.601

rem �t�������W��L���ɂ������ꍇ��on�ɂ���
rem �t�������W�ɂ����ꍇ�̃f�����b�g(�v���C���[�݊���)��F�����Ă���l�̂ݎg�p���Ă�������
rem ������ƐF��Ԃ��l�����Ȃ��ƁAAvisynth�ŃG���[�ɂȂ�܂�
rem ���ɗ��R���Ȃ���΁A�f�t�H���g��off�𐄏�
set FULL_RANGE=off

rem MP4�̗e�ʂ̐ݒ�
rem �G���R�[�h��̗e�ʂ�100MB�i�v���A�J�j��40MB�i��ʃA�J�j�𒴂��Ă��܂��Ƃ�
rem ���̒l�����������Ă݂�Ƃ�������
rem DEFAULT_SIZE_PREMIUM���v���A�J�p�̐ݒ�ADEFAULT_SIZE_NOMAL����ʃA�J�p�̐ݒ�
rem �����ݒ�́uDEFAULT_SIZE_PREMIUM=98.5�v�A�uDEFAULT_SIZE_NOMAL=39�v
rem �e�ʃI�[�o�[����Ƃ��́uDEFAULT_SIZE_PREMIUM=98�v�A�uDEFAULT_SIZE_NOMAL=38�v�Ȃǂɂ��Ă݂�
set DEFAULT_SIZE_PREMIUM=98.5
set DEFAULT_SIZE_NORMAL=39
rem YouTube�p�̐ݒ�
rem �����20480MB�iYouTube�p�[�g�i�[�j��2024MB�iYouTube��ʁj
set DEFAULT_SIZE_YOUTUBE_PARTNER=20000
set DEFAULT_SIZE_YOUTUBE_NORMAL=2000

rem �����o�[�W�����`�F�b�N�@�\�̐ݒ�
rem �I���ɂ���ꍇ�́uDEFAULT_VERSION_CHECK=true�v�ɂ���i�f�t�H���g�������������j
rem �I�t�ɂ���ꍇ�́uDEFAULT_VERSION_CHECK=false�v�ɂ���i�������u��v�����j
set DEFAULT_VERSION_CHECK=true

rem �p�X���̐ݒ�i�摜�������̓���D&D�̂Ƃ��͂��̐ݒ�͖����ł��j
rem �����I��1pass��2pass��3pass�ɂ������Ƃ��͂�����M��
rem �uDEFAULT_PASS_**=1�v�uDEFAULT_PASS_**=2�v�uDEFAULT_PASS_**=3�v�ł��ꂼ��1pass�A2pass�A3pass����������
rem �uDEFAULT_PASS_**=0�v�i�f�t�H���g�j���Ǝ�������i2pass��̃r�b�g���[�g����3pass���K�v���𔻒f�j
rem ���x�d���A�o�����X�A�掿�d���̊e�v���Z�b�g���Ƃɐݒ肵�Ă�������
rem SPEED�ABALANCE�AQUALITY�����ꂼ�ꑬ�x�d���A�o�����X�A�掿�d����I�񂾎��̃p�X���ݒ�ɂȂ�܂�
set DEFAULT_PASS_SPEED=1
set DEFAULT_PASS_BALANCE=0
set DEFAULT_PASS_QUALITY=0

rem �G���R�[�h��Ƀv���C���[���J�����ǂ����i�J���ꍇ��y�A�J���Ȃ��ꍇ��n�j
rem �ق��̃v���C���[�Ō���ƁA�j�R�j�R�����Ō���Ƃ��ƌ��������Ⴄ�ꍇ������̂�
rem �f�t�H���g��y�������߂��܂�
set MOVIE_CHECK=y

rem �t�@�C���̏o�͐�̎w��i�f�t�H���g�����j
rem �w�肵���t�H���_�ɓ�����mp4������ꍇ�͈ȑO�̃t�@�C����old.mp4�ɕς��Ă��܂��܂�
rem �܂��p�X�A�t�@�C�����ɓ��{�ꂪ����ꍇ�͕s����N����ꍇ������܂�
set MP4_DIR=..\MP4

rem �G���R�[�h�I����̋����i�f�t�H���g��n�����j
rem n���Ƃ��̂܂�(MP4�t�H���_���J���ɍs���܂�)�Ay����120�b�ҋ@��ɃV���b�g�_�E��
rem �����y�ɕς������Ƃő��̃A�v���P�[�V�����̖��ۑ��̃f�[�^�������Ă��ӔC�͎��܂���
set SHUTDOWN=n


rem ����ւ̕ԓ������炩���ߓ��͂��Ă����ƃh���b�O���h���b�v�̌ア����������ɓ����Ȃ��Ă��悭�Ȃ�܂�
rem ���ꂼ��C�R�[���̌��Ɏ���̓����������Ă��������i��F�uset ACTYPE=y�v�uset TEMP_BITRATE=160�v�j
rem ����`�����ێ��������ꍇ�̓C�R�[���̌��͋󗓂̂܂܂ɂ��Ă����Ă��������i�X�y�[�X�����ꂿ�Ⴞ�߁I�j

rem �v���Z�b�g�I���il�`q����I���j
rem �A�j���E�A�C�}�X�EMMD�Ȃǂ�lmn����I��
rem ���ʁEPC�Q�[���Ȃǂ�opq����I��
rem ���ꂼ�ꍶ���瑬�x�d���E�o�����X�E�掿�d��
set PRETYPE=

rem �v���~�A���A�J�E���g�̏ꍇ�͉����uset ACTYPE=y�v�ɁA��ʃA�J�E���g�̏ꍇ�͉����uset ACTYPE=n�v�ɕς��Ă�������
set ACTYPE=

rem YouTube�p�̃G���R�[�h�̏ꍇ�A�p�[�g�i�[�v���O�����ɓo�^���Ă���ꍇ�͉����uset YTTYPE=y�v�ɁA
rem ���Ă��Ȃ��ꍇ�͉����uset YTTYPE=n�v�ɕς��Ă�������
set YTTYPE=

rem �v���~�A���A�J�E���g�̏ꍇ�̖ڕW�r�b�g���[�g�i�P�ʂ�kbps�A���͗�Fset T_BITRATE=1000�j
set T_BITRATE=

rem �G�R�������ꍇ�͉����uset ENCTYPE=y�v�ɁA�G�R������Ȃ��ꍇ�͉����uset ENCTYPE=n�v�ɕς��Ă�������
set ENCTYPE=

rem ��Đ����׃G���R�ɂ���ꍇ�͉����uset DECTYPE=y�v�ɁA��Đ����׃G���R���Ȃ��ꍇ�͉����uset DECTYPE=n�v�ɕς��Ă�������
set DECTYPE=

rem ���T�C�Y����ꍇ�͉����uset RESIZE=y�v�ɁA���T�C�Y���Ȃ��ꍇ�͉����uset RESIZE=n�v�ɕς��Ă�������
set RESIZE=

rem �����̃r�b�g���[�g���uset TEMP_BITRATE=160�v�̂悤�ɓ��͂��Ă�������
rem �����Ȃ��ŃG���R�[�h����ꍇ�́uset TEMP_BITRATE=0�v�Ɠ��͂��Ă�������
set TEMP_BITRATE=

rem ���Y������
rem y��I������Ǝ����ŏ����An��I������Ə������Ȃ�
rem �蓮�Ŏw�肷��Ƃ��́uAUDIO_SYNC=20�v�̂悤�ɐ����������Ă��������i�P�ʂ̓~���b�j
rem �i���Ȃ�`���ɖ�����ǉ��A���Ȃ特���̖`�����J�b�g�j
set A_SYNC=

rem ����ɍŌ�̊m�F��ʂ��X�L�b�v�������ꍇ�͉����uset SKIP_MODE=true�v�ɕς��Ă�������
set SKIP_MODE=
