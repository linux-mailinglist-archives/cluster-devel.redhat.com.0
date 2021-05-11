Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id B737637AE9A
	for <lists+cluster-devel@lfdr.de>; Tue, 11 May 2021 20:43:57 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-Qy_xIk7NMGSLjjVV5AjfDQ-1; Tue, 11 May 2021 14:43:53 -0400
X-MC-Unique: Qy_xIk7NMGSLjjVV5AjfDQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8E8C801106;
	Tue, 11 May 2021 18:43:50 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A6F960C04;
	Tue, 11 May 2021 18:43:50 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BB32355345;
	Tue, 11 May 2021 18:43:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BIhc37025277 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 14:43:39 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3534810545B2; Tue, 11 May 2021 18:43:38 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CEE710547BC
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 18:43:35 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0DA9480D0E2
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 18:43:35 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-103-9er4XacWNjqefn8Ann4ERg-1;
	Tue, 11 May 2021 14:43:28 -0400
X-MC-Unique: 9er4XacWNjqefn8Ann4ERg-1
IronPort-SDR: ixiWqWnieBTtf53FMTac6bWWH2sjhL/xfWyUB/uKHBiQ8Wb/0CHuWmR0OXRQmBMox8EQllVQuo
	gOXEHnl2tGtA==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="220482460"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
	d="gz'50?scan'50,208,50";a="220482460"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	11 May 2021 11:43:26 -0700
IronPort-SDR: nbrJ7sPTgRODX7raIUbYGNZC7Br9Q8MjEyswSYOd29gbs5UFB95G2H6GqPKdYUkR4V060PZXI+
	hS84oBk8yFPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
	d="gz'50?scan'50,208,50";a="434723866"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
	by fmsmga008.fm.intel.com with ESMTP; 11 May 2021 11:43:24 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1lgXLo-0000pc-64; Tue, 11 May 2021 18:43:24 +0000
Date: Wed, 12 May 2021 02:42:31 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202105120221.JpCXbz0f-lkp@intel.com>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: cluster-devel@redhat.com
Cc: cluster-devel@redhat.com, kbuild-all@lists.01.org
Subject: [Cluster-devel] [gfs2:for-next 1/2] fs/gfs2/file.c:948:12: error:
 invalid storage class for function 'fallocate_chunk'
X-BeenThere: cluster-devel@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: "\[Cluster devel\]" <cluster-devel.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/cluster-devel>, 
	<mailto:cluster-devel-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/cluster-devel>
List-Post: <mailto:cluster-devel@redhat.com>
List-Help: <mailto:cluster-devel-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/cluster-devel>,
	<mailto:cluster-devel-request@redhat.com?subject=subscribe>
Sender: cluster-devel-bounces@redhat.com
Errors-To: cluster-devel-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline

--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   5bec51f9bc58e6d724fa3588b77e4c2f865dd13a
commit: a1381d36d843d4f108fe24b384a8a24694fe0bb5 [1/2] gfs2: Prevent direct-I/O write fallback errors from getting lost
config: parisc-randconfig-r002-20210511 (attached as .config)
compiler: hppa-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=a1381d36d843d4f108fe24b384a8a24694fe0bb5
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next
        git checkout a1381d36d843d4f108fe24b384a8a24694fe0bb5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=parisc 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   fs/gfs2/file.c: In function 'gfs2_file_write_iter':
>> fs/gfs2/file.c:948:12: error: invalid storage class for function 'fallocate_chunk'
     948 | static int fallocate_chunk(struct inode *inode, loff_t offset, loff_t len,
         |            ^~~~~~~~~~~~~~~
>> fs/gfs2/file.c:948:1: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
     948 | static int fallocate_chunk(struct inode *inode, loff_t offset, loff_t len,
         | ^~~~~~
>> fs/gfs2/file.c:1002:13: error: invalid storage class for function 'calc_max_reserv'
    1002 | static void calc_max_reserv(struct gfs2_inode *ip, loff_t *len,
         |             ^~~~~~~~~~~~~~~
>> fs/gfs2/file.c:1024:13: error: invalid storage class for function '__gfs2_fallocate'
    1024 | static long __gfs2_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
         |             ^~~~~~~~~~~~~~~~
>> fs/gfs2/file.c:1140:13: error: invalid storage class for function 'gfs2_fallocate'
    1140 | static long gfs2_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
         |             ^~~~~~~~~~~~~~
>> fs/gfs2/file.c:1189:16: error: invalid storage class for function 'gfs2_file_splice_write'
    1189 | static ssize_t gfs2_file_splice_write(struct pipe_inode_info *pipe,
         |                ^~~~~~~~~~~~~~~~~~~~~~
>> fs/gfs2/file.c:1393:1: error: expected declaration or statement at end of input
    1393 | };
         | ^
   fs/gfs2/file.c:1385:30: warning: unused variable 'gfs2_dir_fops_nolock' [-Wunused-variable]
    1385 | const struct file_operations gfs2_dir_fops_nolock = {
         |                              ^~~~~~~~~~~~~~~~~~~~
   fs/gfs2/file.c:1368:30: warning: unused variable 'gfs2_file_fops_nolock' [-Wunused-variable]
    1368 | const struct file_operations gfs2_file_fops_nolock = {
         |                              ^~~~~~~~~~~~~~~~~~~~~
   At top level:
   fs/gfs2/file.c:872:16: warning: 'gfs2_file_write_iter' defined but not used [-Wunused-function]
     872 | static ssize_t gfs2_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
         |                ^~~~~~~~~~~~~~~~~~~~


vim +/fallocate_chunk +948 fs/gfs2/file.c

56aa616a03feca Steven Whitehouse   2009-12-08   947  
2fe17c1075836b Christoph Hellwig   2011-01-14  @948  static int fallocate_chunk(struct inode *inode, loff_t offset, loff_t len,
2fe17c1075836b Christoph Hellwig   2011-01-14   949  			   int mode)
2fe17c1075836b Christoph Hellwig   2011-01-14   950  {
fffb64127adc3e Andreas Gruenbacher 2018-03-29   951  	struct super_block *sb = inode->i_sb;
2fe17c1075836b Christoph Hellwig   2011-01-14   952  	struct gfs2_inode *ip = GFS2_I(inode);
fffb64127adc3e Andreas Gruenbacher 2018-03-29   953  	loff_t end = offset + len;
2fe17c1075836b Christoph Hellwig   2011-01-14   954  	struct buffer_head *dibh;
2fe17c1075836b Christoph Hellwig   2011-01-14   955  	int error;
2fe17c1075836b Christoph Hellwig   2011-01-14   956  
2fe17c1075836b Christoph Hellwig   2011-01-14   957  	error = gfs2_meta_inode_buffer(ip, &dibh);
2fe17c1075836b Christoph Hellwig   2011-01-14   958  	if (unlikely(error))
64dd153c83743a Benjamin Marzinski  2011-09-12   959  		return error;
2fe17c1075836b Christoph Hellwig   2011-01-14   960  
350a9b0a7269c6 Steven Whitehouse   2012-12-14   961  	gfs2_trans_add_meta(ip->i_gl, dibh);
2fe17c1075836b Christoph Hellwig   2011-01-14   962  
2fe17c1075836b Christoph Hellwig   2011-01-14   963  	if (gfs2_is_stuffed(ip)) {
2fe17c1075836b Christoph Hellwig   2011-01-14   964  		error = gfs2_unstuff_dinode(ip, NULL);
2fe17c1075836b Christoph Hellwig   2011-01-14   965  		if (unlikely(error))
2fe17c1075836b Christoph Hellwig   2011-01-14   966  			goto out;
2fe17c1075836b Christoph Hellwig   2011-01-14   967  	}
2fe17c1075836b Christoph Hellwig   2011-01-14   968  
fffb64127adc3e Andreas Gruenbacher 2018-03-29   969  	while (offset < end) {
c25892827c7996 Andreas Gruenbacher 2018-07-06   970  		struct iomap iomap = { };
c25892827c7996 Andreas Gruenbacher 2018-07-06   971  
54992257fe4bb9 Andreas Gruenbacher 2021-03-27   972  		error = gfs2_iomap_alloc(inode, offset, end - offset, &iomap);
fffb64127adc3e Andreas Gruenbacher 2018-03-29   973  		if (error)
64dd153c83743a Benjamin Marzinski  2011-09-12   974  			goto out;
fffb64127adc3e Andreas Gruenbacher 2018-03-29   975  		offset = iomap.offset + iomap.length;
d505a96a3b16f4 Andreas Gruenbacher 2018-06-24   976  		if (!(iomap.flags & IOMAP_F_NEW))
64dd153c83743a Benjamin Marzinski  2011-09-12   977  			continue;
fffb64127adc3e Andreas Gruenbacher 2018-03-29   978  		error = sb_issue_zeroout(sb, iomap.addr >> inode->i_blkbits,
fffb64127adc3e Andreas Gruenbacher 2018-03-29   979  					 iomap.length >> inode->i_blkbits,
fffb64127adc3e Andreas Gruenbacher 2018-03-29   980  					 GFP_NOFS);
fffb64127adc3e Andreas Gruenbacher 2018-03-29   981  		if (error) {
fffb64127adc3e Andreas Gruenbacher 2018-03-29   982  			fs_err(GFS2_SB(inode), "Failed to zero data buffers\n");
2fe17c1075836b Christoph Hellwig   2011-01-14   983  			goto out;
2fe17c1075836b Christoph Hellwig   2011-01-14   984  		}
64dd153c83743a Benjamin Marzinski  2011-09-12   985  	}
2fe17c1075836b Christoph Hellwig   2011-01-14   986  out:
64dd153c83743a Benjamin Marzinski  2011-09-12   987  	brelse(dibh);
2fe17c1075836b Christoph Hellwig   2011-01-14   988  	return error;
2fe17c1075836b Christoph Hellwig   2011-01-14   989  }
f3b64b57c044fe Andreas Gruenbacher 2019-08-31   990  
d9be0cda774e7f Abhi Das            2015-03-18   991  /**
d9be0cda774e7f Abhi Das            2015-03-18   992   * calc_max_reserv() - Reverse of write_calc_reserv. Given a number of
d9be0cda774e7f Abhi Das            2015-03-18   993   *                     blocks, determine how many bytes can be written.
d9be0cda774e7f Abhi Das            2015-03-18   994   * @ip:          The inode in question.
d9be0cda774e7f Abhi Das            2015-03-18   995   * @len:         Max cap of bytes. What we return in *len must be <= this.
d9be0cda774e7f Abhi Das            2015-03-18   996   * @data_blocks: Compute and return the number of data blocks needed
d9be0cda774e7f Abhi Das            2015-03-18   997   * @ind_blocks:  Compute and return the number of indirect blocks needed
d9be0cda774e7f Abhi Das            2015-03-18   998   * @max_blocks:  The total blocks available to work with.
d9be0cda774e7f Abhi Das            2015-03-18   999   *
d9be0cda774e7f Abhi Das            2015-03-18  1000   * Returns: void, but @len, @data_blocks and @ind_blocks are filled in.
d9be0cda774e7f Abhi Das            2015-03-18  1001   */
d9be0cda774e7f Abhi Das            2015-03-18 @1002  static void calc_max_reserv(struct gfs2_inode *ip, loff_t *len,
d9be0cda774e7f Abhi Das            2015-03-18  1003  			    unsigned int *data_blocks, unsigned int *ind_blocks,
d9be0cda774e7f Abhi Das            2015-03-18  1004  			    unsigned int max_blocks)
2fe17c1075836b Christoph Hellwig   2011-01-14  1005  {
d9be0cda774e7f Abhi Das            2015-03-18  1006  	loff_t max = *len;
2fe17c1075836b Christoph Hellwig   2011-01-14  1007  	const struct gfs2_sbd *sdp = GFS2_SB(&ip->i_inode);
2fe17c1075836b Christoph Hellwig   2011-01-14  1008  	unsigned int tmp, max_data = max_blocks - 3 * (sdp->sd_max_height - 1);
2fe17c1075836b Christoph Hellwig   2011-01-14  1009  
2fe17c1075836b Christoph Hellwig   2011-01-14  1010  	for (tmp = max_data; tmp > sdp->sd_diptrs;) {
2fe17c1075836b Christoph Hellwig   2011-01-14  1011  		tmp = DIV_ROUND_UP(tmp, sdp->sd_inptrs);
2fe17c1075836b Christoph Hellwig   2011-01-14  1012  		max_data -= tmp;
2fe17c1075836b Christoph Hellwig   2011-01-14  1013  	}
d9be0cda774e7f Abhi Das            2015-03-18  1014  
2fe17c1075836b Christoph Hellwig   2011-01-14  1015  	*data_blocks = max_data;
2fe17c1075836b Christoph Hellwig   2011-01-14  1016  	*ind_blocks = max_blocks - max_data;
2fe17c1075836b Christoph Hellwig   2011-01-14  1017  	*len = ((loff_t)max_data - 3) << sdp->sd_sb.sb_bsize_shift;
2fe17c1075836b Christoph Hellwig   2011-01-14  1018  	if (*len > max) {
2fe17c1075836b Christoph Hellwig   2011-01-14  1019  		*len = max;
2fe17c1075836b Christoph Hellwig   2011-01-14  1020  		gfs2_write_calc_reserv(ip, max, data_blocks, ind_blocks);
2fe17c1075836b Christoph Hellwig   2011-01-14  1021  	}
2fe17c1075836b Christoph Hellwig   2011-01-14  1022  }
2fe17c1075836b Christoph Hellwig   2011-01-14  1023  
9c9f1159a54c61 Andrew Price        2014-11-12 @1024  static long __gfs2_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
2fe17c1075836b Christoph Hellwig   2011-01-14  1025  {
496ad9aa8ef448 Al Viro             2013-01-23  1026  	struct inode *inode = file_inode(file);
2fe17c1075836b Christoph Hellwig   2011-01-14  1027  	struct gfs2_sbd *sdp = GFS2_SB(inode);
2fe17c1075836b Christoph Hellwig   2011-01-14  1028  	struct gfs2_inode *ip = GFS2_I(inode);
7b9cff467144c8 Steven Whitehouse   2013-10-02  1029  	struct gfs2_alloc_parms ap = { .aflags = 0, };
2fe17c1075836b Christoph Hellwig   2011-01-14  1030  	unsigned int data_blocks = 0, ind_blocks = 0, rblocks;
174d1232ebc84f Andreas Gruenbacher 2018-02-20  1031  	loff_t bytes, max_bytes, max_blks;
2fe17c1075836b Christoph Hellwig   2011-01-14  1032  	int error;
4442f2e03ed964 Steven Whitehouse   2011-11-21  1033  	const loff_t pos = offset;
4442f2e03ed964 Steven Whitehouse   2011-11-21  1034  	const loff_t count = len;
6905d9e4dda611 Benjamin Marzinski  2011-04-26  1035  	loff_t bsize_mask = ~((loff_t)sdp->sd_sb.sb_bsize - 1);
2fe17c1075836b Christoph Hellwig   2011-01-14  1036  	loff_t next = (offset + len - 1) >> sdp->sd_sb.sb_bsize_shift;
64dd153c83743a Benjamin Marzinski  2011-09-12  1037  	loff_t max_chunk_size = UINT_MAX & bsize_mask;
a0846a534c5fbc Bob Peterson        2014-02-06  1038  
2fe17c1075836b Christoph Hellwig   2011-01-14  1039  	next = (next + 1) << sdp->sd_sb.sb_bsize_shift;
2fe17c1075836b Christoph Hellwig   2011-01-14  1040  
6905d9e4dda611 Benjamin Marzinski  2011-04-26  1041  	offset &= bsize_mask;
2fe17c1075836b Christoph Hellwig   2011-01-14  1042  
2fe17c1075836b Christoph Hellwig   2011-01-14  1043  	len = next - offset;
2fe17c1075836b Christoph Hellwig   2011-01-14  1044  	bytes = sdp->sd_max_rg_data * sdp->sd_sb.sb_bsize / 2;
2fe17c1075836b Christoph Hellwig   2011-01-14  1045  	if (!bytes)
2fe17c1075836b Christoph Hellwig   2011-01-14  1046  		bytes = UINT_MAX;
6905d9e4dda611 Benjamin Marzinski  2011-04-26  1047  	bytes &= bsize_mask;
6905d9e4dda611 Benjamin Marzinski  2011-04-26  1048  	if (bytes == 0)
6905d9e4dda611 Benjamin Marzinski  2011-04-26  1049  		bytes = sdp->sd_sb.sb_bsize;
2fe17c1075836b Christoph Hellwig   2011-01-14  1050  
da1dfb6af849cb Steven Whitehouse   2012-07-26  1051  	gfs2_size_hint(file, offset, len);
8e2e00473598dd Bob Peterson        2012-07-19  1052  
d9be0cda774e7f Abhi Das            2015-03-18  1053  	gfs2_write_calc_reserv(ip, PAGE_SIZE, &data_blocks, &ind_blocks);
d9be0cda774e7f Abhi Das            2015-03-18  1054  	ap.min_target = data_blocks + ind_blocks;
d9be0cda774e7f Abhi Das            2015-03-18  1055  
2fe17c1075836b Christoph Hellwig   2011-01-14  1056  	while (len > 0) {
2fe17c1075836b Christoph Hellwig   2011-01-14  1057  		if (len < bytes)
2fe17c1075836b Christoph Hellwig   2011-01-14  1058  			bytes = len;
58a7d5fb8e3127 Benjamin Marzinski  2012-03-08  1059  		if (!gfs2_write_alloc_required(ip, offset, bytes)) {
58a7d5fb8e3127 Benjamin Marzinski  2012-03-08  1060  			len -= bytes;
58a7d5fb8e3127 Benjamin Marzinski  2012-03-08  1061  			offset += bytes;
58a7d5fb8e3127 Benjamin Marzinski  2012-03-08  1062  			continue;
58a7d5fb8e3127 Benjamin Marzinski  2012-03-08  1063  		}
d9be0cda774e7f Abhi Das            2015-03-18  1064  
d9be0cda774e7f Abhi Das            2015-03-18  1065  		/* We need to determine how many bytes we can actually
d9be0cda774e7f Abhi Das            2015-03-18  1066  		 * fallocate without exceeding quota or going over the
d9be0cda774e7f Abhi Das            2015-03-18  1067  		 * end of the fs. We start off optimistically by assuming
d9be0cda774e7f Abhi Das            2015-03-18  1068  		 * we can write max_bytes */
d9be0cda774e7f Abhi Das            2015-03-18  1069  		max_bytes = (len > max_chunk_size) ? max_chunk_size : len;
d9be0cda774e7f Abhi Das            2015-03-18  1070  
d9be0cda774e7f Abhi Das            2015-03-18  1071  		/* Since max_bytes is most likely a theoretical max, we
d9be0cda774e7f Abhi Das            2015-03-18  1072  		 * calculate a more realistic 'bytes' to serve as a good
d9be0cda774e7f Abhi Das            2015-03-18  1073  		 * starting point for the number of bytes we may be able
d9be0cda774e7f Abhi Das            2015-03-18  1074  		 * to write */
2fe17c1075836b Christoph Hellwig   2011-01-14  1075  		gfs2_write_calc_reserv(ip, bytes, &data_blocks, &ind_blocks);
7b9cff467144c8 Steven Whitehouse   2013-10-02  1076  		ap.target = data_blocks + ind_blocks;
b8fbf471edb3db Abhi Das            2015-03-18  1077  
b8fbf471edb3db Abhi Das            2015-03-18  1078  		error = gfs2_quota_lock_check(ip, &ap);
2fe17c1075836b Christoph Hellwig   2011-01-14  1079  		if (error)
9c9f1159a54c61 Andrew Price        2014-11-12  1080  			return error;
d9be0cda774e7f Abhi Das            2015-03-18  1081  		/* ap.allowed tells us how many blocks quota will allow
d9be0cda774e7f Abhi Das            2015-03-18  1082  		 * us to write. Check if this reduces max_blks */
174d1232ebc84f Andreas Gruenbacher 2018-02-20  1083  		max_blks = UINT_MAX;
174d1232ebc84f Andreas Gruenbacher 2018-02-20  1084  		if (ap.allowed)
d9be0cda774e7f Abhi Das            2015-03-18  1085  			max_blks = ap.allowed;
2fe17c1075836b Christoph Hellwig   2011-01-14  1086  
7b9cff467144c8 Steven Whitehouse   2013-10-02  1087  		error = gfs2_inplace_reserve(ip, &ap);
d9be0cda774e7f Abhi Das            2015-03-18  1088  		if (error)
2fe17c1075836b Christoph Hellwig   2011-01-14  1089  			goto out_qunlock;
d9be0cda774e7f Abhi Das            2015-03-18  1090  
d9be0cda774e7f Abhi Das            2015-03-18  1091  		/* check if the selected rgrp limits our max_blks further */
725d0e9d464d56 Andreas Gruenbacher 2018-10-02  1092  		if (ip->i_res.rs_reserved < max_blks)
725d0e9d464d56 Andreas Gruenbacher 2018-10-02  1093  			max_blks = ip->i_res.rs_reserved;
d9be0cda774e7f Abhi Das            2015-03-18  1094  
d9be0cda774e7f Abhi Das            2015-03-18  1095  		/* Almost done. Calculate bytes that can be written using
d9be0cda774e7f Abhi Das            2015-03-18  1096  		 * max_blks. We also recompute max_bytes, data_blocks and
d9be0cda774e7f Abhi Das            2015-03-18  1097  		 * ind_blocks */
d9be0cda774e7f Abhi Das            2015-03-18  1098  		calc_max_reserv(ip, &max_bytes, &data_blocks,
d9be0cda774e7f Abhi Das            2015-03-18  1099  				&ind_blocks, max_blks);
2fe17c1075836b Christoph Hellwig   2011-01-14  1100  
2fe17c1075836b Christoph Hellwig   2011-01-14  1101  		rblocks = RES_DINODE + ind_blocks + RES_STATFS + RES_QUOTA +
71f890f7f758f3 Steven Whitehouse   2012-07-30  1102  			  RES_RG_HDR + gfs2_rg_blocks(ip, data_blocks + ind_blocks);
2fe17c1075836b Christoph Hellwig   2011-01-14  1103  		if (gfs2_is_jdata(ip))
2fe17c1075836b Christoph Hellwig   2011-01-14  1104  			rblocks += data_blocks ? data_blocks : 1;
2fe17c1075836b Christoph Hellwig   2011-01-14  1105  
2fe17c1075836b Christoph Hellwig   2011-01-14  1106  		error = gfs2_trans_begin(sdp, rblocks,
45eb05042d5667 Andreas Gruenbacher 2019-09-02  1107  					 PAGE_SIZE >> inode->i_blkbits);
2fe17c1075836b Christoph Hellwig   2011-01-14  1108  		if (error)
2fe17c1075836b Christoph Hellwig   2011-01-14  1109  			goto out_trans_fail;
2fe17c1075836b Christoph Hellwig   2011-01-14  1110  
2fe17c1075836b Christoph Hellwig   2011-01-14  1111  		error = fallocate_chunk(inode, offset, max_bytes, mode);
2fe17c1075836b Christoph Hellwig   2011-01-14  1112  		gfs2_trans_end(sdp);
2fe17c1075836b Christoph Hellwig   2011-01-14  1113  
2fe17c1075836b Christoph Hellwig   2011-01-14  1114  		if (error)
2fe17c1075836b Christoph Hellwig   2011-01-14  1115  			goto out_trans_fail;
2fe17c1075836b Christoph Hellwig   2011-01-14  1116  
2fe17c1075836b Christoph Hellwig   2011-01-14  1117  		len -= max_bytes;
2fe17c1075836b Christoph Hellwig   2011-01-14  1118  		offset += max_bytes;
2fe17c1075836b Christoph Hellwig   2011-01-14  1119  		gfs2_inplace_release(ip);
2fe17c1075836b Christoph Hellwig   2011-01-14  1120  		gfs2_quota_unlock(ip);
2fe17c1075836b Christoph Hellwig   2011-01-14  1121  	}
4442f2e03ed964 Steven Whitehouse   2011-11-21  1122  
0a6a4abc84668d Andreas Gruenbacher 2019-08-08  1123  	if (!(mode & FALLOC_FL_KEEP_SIZE) && (pos + count) > inode->i_size)
1885867b84d58e Andrew Price        2014-11-12  1124  		i_size_write(inode, pos + count);
98f1a696a1b2f6 Andrew Price        2014-11-12  1125  	file_update_time(file);
4b813f09405823 Andrew Price        2015-09-22  1126  	mark_inode_dirty(inode);
1885867b84d58e Andrew Price        2014-11-12  1127  
dde0c2e7984829 Christoph Hellwig   2016-04-07  1128  	if ((file->f_flags & O_DSYNC) || IS_SYNC(file->f_mapping->host))
dde0c2e7984829 Christoph Hellwig   2016-04-07  1129  		return vfs_fsync_range(file, pos, pos + count - 1,
dde0c2e7984829 Christoph Hellwig   2016-04-07  1130  			       (file->f_flags & __O_SYNC) ? 0 : 1);
dde0c2e7984829 Christoph Hellwig   2016-04-07  1131  	return 0;
2fe17c1075836b Christoph Hellwig   2011-01-14  1132  
2fe17c1075836b Christoph Hellwig   2011-01-14  1133  out_trans_fail:
2fe17c1075836b Christoph Hellwig   2011-01-14  1134  	gfs2_inplace_release(ip);
2fe17c1075836b Christoph Hellwig   2011-01-14  1135  out_qunlock:
2fe17c1075836b Christoph Hellwig   2011-01-14  1136  	gfs2_quota_unlock(ip);
9c9f1159a54c61 Andrew Price        2014-11-12  1137  	return error;
9c9f1159a54c61 Andrew Price        2014-11-12  1138  }
9c9f1159a54c61 Andrew Price        2014-11-12  1139  
9c9f1159a54c61 Andrew Price        2014-11-12 @1140  static long gfs2_fallocate(struct file *file, int mode, loff_t offset, loff_t len)
9c9f1159a54c61 Andrew Price        2014-11-12  1141  {
9c9f1159a54c61 Andrew Price        2014-11-12  1142  	struct inode *inode = file_inode(file);
d4d7fc12b642a1 Andrew Price        2017-04-05  1143  	struct gfs2_sbd *sdp = GFS2_SB(inode);
9c9f1159a54c61 Andrew Price        2014-11-12  1144  	struct gfs2_inode *ip = GFS2_I(inode);
9c9f1159a54c61 Andrew Price        2014-11-12  1145  	struct gfs2_holder gh;
9c9f1159a54c61 Andrew Price        2014-11-12  1146  	int ret;
9c9f1159a54c61 Andrew Price        2014-11-12  1147  
4e56a6411fbce6 Andreas Gruenbacher 2017-12-14  1148  	if (mode & ~(FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE))
d4d7fc12b642a1 Andrew Price        2017-04-05  1149  		return -EOPNOTSUPP;
d4d7fc12b642a1 Andrew Price        2017-04-05  1150  	/* fallocate is needed by gfs2_grow to reserve space in the rindex */
d4d7fc12b642a1 Andrew Price        2017-04-05  1151  	if (gfs2_is_jdata(ip) && inode != sdp->sd_rindex)
9c9f1159a54c61 Andrew Price        2014-11-12  1152  		return -EOPNOTSUPP;
9c9f1159a54c61 Andrew Price        2014-11-12  1153  
5955102c9984fa Al Viro             2016-01-22  1154  	inode_lock(inode);
9c9f1159a54c61 Andrew Price        2014-11-12  1155  
9c9f1159a54c61 Andrew Price        2014-11-12  1156  	gfs2_holder_init(ip->i_gl, LM_ST_EXCLUSIVE, 0, &gh);
9c9f1159a54c61 Andrew Price        2014-11-12  1157  	ret = gfs2_glock_nq(&gh);
9c9f1159a54c61 Andrew Price        2014-11-12  1158  	if (ret)
9c9f1159a54c61 Andrew Price        2014-11-12  1159  		goto out_uninit;
9c9f1159a54c61 Andrew Price        2014-11-12  1160  
9c9f1159a54c61 Andrew Price        2014-11-12  1161  	if (!(mode & FALLOC_FL_KEEP_SIZE) &&
9c9f1159a54c61 Andrew Price        2014-11-12  1162  	    (offset + len) > inode->i_size) {
9c9f1159a54c61 Andrew Price        2014-11-12  1163  		ret = inode_newsize_ok(inode, offset + len);
9c9f1159a54c61 Andrew Price        2014-11-12  1164  		if (ret)
9c9f1159a54c61 Andrew Price        2014-11-12  1165  			goto out_unlock;
9c9f1159a54c61 Andrew Price        2014-11-12  1166  	}
9c9f1159a54c61 Andrew Price        2014-11-12  1167  
9c9f1159a54c61 Andrew Price        2014-11-12  1168  	ret = get_write_access(inode);
9c9f1159a54c61 Andrew Price        2014-11-12  1169  	if (ret)
9c9f1159a54c61 Andrew Price        2014-11-12  1170  		goto out_unlock;
9c9f1159a54c61 Andrew Price        2014-11-12  1171  
4e56a6411fbce6 Andreas Gruenbacher 2017-12-14  1172  	if (mode & FALLOC_FL_PUNCH_HOLE) {
4e56a6411fbce6 Andreas Gruenbacher 2017-12-14  1173  		ret = __gfs2_punch_hole(file, offset, len);
4e56a6411fbce6 Andreas Gruenbacher 2017-12-14  1174  	} else {
9c9f1159a54c61 Andrew Price        2014-11-12  1175  		ret = __gfs2_fallocate(file, mode, offset, len);
9c9f1159a54c61 Andrew Price        2014-11-12  1176  		if (ret)
a097dc7e24cba7 Bob Peterson        2015-07-16  1177  			gfs2_rs_deltree(&ip->i_res);
4e56a6411fbce6 Andreas Gruenbacher 2017-12-14  1178  	}
a097dc7e24cba7 Bob Peterson        2015-07-16  1179  
9c9f1159a54c61 Andrew Price        2014-11-12  1180  	put_write_access(inode);
2fe17c1075836b Christoph Hellwig   2011-01-14  1181  out_unlock:
a0846a534c5fbc Bob Peterson        2014-02-06  1182  	gfs2_glock_dq(&gh);
2fe17c1075836b Christoph Hellwig   2011-01-14  1183  out_uninit:
a0846a534c5fbc Bob Peterson        2014-02-06  1184  	gfs2_holder_uninit(&gh);
5955102c9984fa Al Viro             2016-01-22  1185  	inode_unlock(inode);
9c9f1159a54c61 Andrew Price        2014-11-12  1186  	return ret;
2fe17c1075836b Christoph Hellwig   2011-01-14  1187  }
2fe17c1075836b Christoph Hellwig   2011-01-14  1188  

:::::: The code at line 948 was first introduced by commit
:::::: 2fe17c1075836b66678ed2a305fd09b6773883aa fallocate should be a file operation

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--T4sUOijqQbZv57TR
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
LpeWnjU46/4PUm1ypHVeAgA=
--T4sUOijqQbZv57TR--

