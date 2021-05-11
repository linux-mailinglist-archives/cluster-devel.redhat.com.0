Return-Path: <cluster-devel-bounces@redhat.com>
X-Original-To: lists+cluster-devel@lfdr.de
Delivered-To: lists+cluster-devel@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0F50537AEA2
	for <lists+cluster-devel@lfdr.de>; Tue, 11 May 2021 20:47:56 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-xESLyz_uMACCA8Janf41pQ-1; Tue, 11 May 2021 14:47:53 -0400
X-MC-Unique: xESLyz_uMACCA8Janf41pQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCCFE800D55;
	Tue, 11 May 2021 18:47:51 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3C0FF1E6;
	Tue, 11 May 2021 18:47:51 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 161F75534D;
	Tue, 11 May 2021 18:47:51 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14BIlmNO026174 for <cluster-devel@listman.util.phx.redhat.com>;
	Tue, 11 May 2021 14:47:48 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 37A122028785; Tue, 11 May 2021 18:47:48 +0000 (UTC)
Delivered-To: cluster-devel@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 320B820287CA
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 18:47:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E72B185A79C
	for <cluster-devel@redhat.com>; Tue, 11 May 2021 18:47:45 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65]) (Using
	TLS) by relay.mimecast.com with ESMTP id
	us-mta-420-buD_e8z1OieyhzGrUIkfXw-1; Tue, 11 May 2021 14:47:31 -0400
X-MC-Unique: buD_e8z1OieyhzGrUIkfXw-1
IronPort-SDR: HjezHCR98ZnzNkrsVfJWrPjVL1roT/gadEgBxrXKZr+RWP+jP3NzQWCgS+RTQTxTQaCgogYZTd
	cCInT/mfoWng==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="199571436"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
	d="gz'50?scan'50,208,50";a="199571436"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
	11 May 2021 11:47:28 -0700
IronPort-SDR: jsxDNri4wPGX+BAmXDkxOBntVVUdxRgLYfaw1oqii8wJcUr1oKwfqhfGoferXLXDMrGfTS28IA
	TA9JxUOC6m7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; 
	d="gz'50?scan'50,208,50";a="537140351"
Received: from lkp-server01.sh.intel.com (HELO f375d57c4ed4) ([10.239.97.150])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2021 11:47:25 -0700
Received: from kbuild by f375d57c4ed4 with local (Exim 4.92)
	(envelope-from <lkp@intel.com>)
	id 1lgXPg-0000pi-Gb; Tue, 11 May 2021 18:47:24 +0000
Date: Wed, 12 May 2021 02:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <202105120235.kIBxbUA3-lkp@intel.com>
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cluster-devel-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="5mCyUwZo2JvN/JJP"
Content-Disposition: inline

--5mCyUwZo2JvN/JJP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git for-next
head:   5bec51f9bc58e6d724fa3588b77e4c2f865dd13a
commit: a1381d36d843d4f108fe24b384a8a24694fe0bb5 [1/2] gfs2: Prevent direct-I/O write fallback errors from getting lost
config: m68k-randconfig-r016-20210511 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git/commit/?id=a1381d36d843d4f108fe24b384a8a24694fe0bb5
        git remote add gfs2 https://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
        git fetch --no-tags gfs2 for-next
        git checkout a1381d36d843d4f108fe24b384a8a24694fe0bb5
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross W=1 ARCH=m68k 

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

--5mCyUwZo2JvN/JJP
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
--5mCyUwZo2JvN/JJP--

